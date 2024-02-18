import 'dart:collection';
import 'dart:math';

import 'package:dartx/dartx.dart';
import 'package:drift/drift.dart';
import 'package:flutteryomi/source/local/local_source.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:flutteryomi/data/chapter/chapter_sanitizer.dart';
import 'package:flutteryomi/domain/chapter/interactor/get_chapters_by_manga_id.dart';
import 'package:flutteryomi/domain/chapter/interactor/should_update_db_chapter.dart';
import 'package:flutteryomi/domain/chapter/interactor/update_chapter.dart';
import 'package:flutteryomi/domain/chapter/model/chapter.dart';
import 'package:flutteryomi/domain/chapter/model/chapter_update.dart';
import 'package:flutteryomi/domain/chapter/model/no_chapters_exception.dart';
import 'package:flutteryomi/domain/chapter/repository/chapter_repository.dart';
import 'package:flutteryomi/domain/chapter/service/chapter_recognition.dart';
import 'package:flutteryomi/domain/download/download_manager.dart';
import 'package:flutteryomi/domain/download/service/download_preferences.dart';
import 'package:flutteryomi/domain/manga/interactor/get_excluded_scanlators.dart';
import 'package:flutteryomi/domain/manga/interactor/update_manga.dart';
import 'package:flutteryomi/domain/manga/model/manga.dart';
import 'package:flutteryomi/domain/source/model/schapter.dart';
import 'package:flutteryomi/source/api/source.dart';

part 'sync_chapters_with_source.g.dart';

//TODO
class SyncChaptersWithSource {
  final DownloadManager downloadManager;
  final DownloadPreferences downloadPreferences;
  //final DownloadProvider downloadProvider;
  final ChapterRepository chapterRepository;
  final ShouldUpdateDbChapter shouldUpdateDbChapter;
  final UpdateManga updateManga;
  final UpdateChapter updateChapter;
  final GetChaptersByMangaId getChaptersByMangaId;
  final GetExcludedScanlators getExcludedScanlators;

  SyncChaptersWithSource(
    this.downloadManager,
    this.downloadPreferences,
    //this.downloadProvider,
    this.chapterRepository,
    this.shouldUpdateDbChapter,
    this.updateManga,
    this.updateChapter,
    this.getChaptersByMangaId,
    this.getExcludedScanlators,
  );

  /// Method to synchronize db chapters in [manga] with [source] ones.
  ///
  /// [rawSourceChapters] are the chapters from the source.
  ///
  /// Returns newly added chapters.
  Future<List<Chapter>> await_(
    List<SChapter> rawSourceChapters,
    Manga manga,
    Source source, [
    bool manualFetch = false,
    Pair<int, int> fetchWindow = const Pair(0, 0),
  ]) async {
    if (rawSourceChapters.isEmpty && !source.isLocal()) {
      throw NoChaptersException;
    }

    final now = DateTime.now();
    final nowMillis = now.millisecondsSinceEpoch;

    final sourceChapters = rawSourceChapters //
        .distinctBy((it) => it.url)
        .mapIndexed((i, sChapter) =>
            ChapterUtils.create().copyFromSChapter(sChapter).copyWith(
                  name: sChapter.name.sanitize(manga.title),
                  mangaId: manga.id,
                  sourceOrder: i,
                ));

    final dbChapters = await getChaptersByMangaId.await_(manga.id);

    final newChapters = <Chapter>[];
    final updatedChapters = <Chapter>[];
    final removedChapters = dbChapters.whereNot(
      (dbChapter) => sourceChapters.any(
        (sourceChapter) => dbChapter.url == sourceChapter.url,
      ),
    );

    // Used to not set upload date of older chapters
    // to a higher value than newer chapters
    var maxSeenUploadDate = 0;

    for (final sourceChapter in sourceChapters) {
      var chapter = sourceChapter;

      // Update metadata from source if necessary.
      //  if (source is HttpSource) {
      //    final sChapter = chapter.toSChapter();
      //    source.prepareNewChapter(sChapter, manga.toSManga());
      //    chapter = chapter.copyFromSChapter(sChapter);
      //  }

      // Recognize chapter number for the chapter.
      final chapterNumber = ChapterRecognition.parseChapterNumber(
          manga.title, chapter.name, chapter.chapterNumber);
      chapter = chapter.copyWith(chapterNumber: chapterNumber);

      final dbChapter = dbChapters.firstOrNullWhere(
        (it) => it.url == chapter.url,
      );

      if (dbChapter == null) {
        Chapter toAddChapter;
        if (chapter.dateUpload.millisecondsSinceEpoch == 0) {
          final altDateUpload =
              (maxSeenUploadDate == 0) ? nowMillis : maxSeenUploadDate;
          toAddChapter = chapter.copyWith(
            dateUpload: DateTime.fromMillisecondsSinceEpoch(altDateUpload),
          );
        } else {
          maxSeenUploadDate = max(
            maxSeenUploadDate,
            sourceChapter.dateUpload.millisecondsSinceEpoch,
          );
          toAddChapter = chapter;
        }
        newChapters.add(toAddChapter);
      } else {
        if (shouldUpdateDbChapter.await_(dbChapter, chapter)) {
          //final shouldRenameChapter = downloadProvider.isChapterDirNameChanged(dbChapter, chapter) &&
          //    downloadManager.isChapterDownloaded(
          //      dbChapter.name, dbChapter.scanlator, manga.title, manga.source,
          //    );

          //if (shouldRenameChapter) {
          //  await downloadManager.renameChapter(source, manga, dbChapter, chapter);
          //}
          Chapter toChangeChapter = dbChapter.copyWith(
            name: chapter.name,
            chapterNumber: chapter.chapterNumber,
            scanlator: Value(chapter.scanlator),
            sourceOrder: chapter.sourceOrder,
          );
          if (chapter.dateUpload.millisecondsSinceEpoch != 0) {
            toChangeChapter = toChangeChapter.copyWith(
              dateUpload: chapter.dateUpload,
            );
          }
          updatedChapters.add(toChangeChapter);
        }
      }
    }

    // Return if there's nothing to add, delete, or update to avoid unnecessary db transactions.
    if (newChapters.isEmpty &&
        removedChapters.isEmpty &&
        updatedChapters.isEmpty) {
      if (manualFetch ||
          manga.fetchInterval == 0 ||
          (manga.nextUpdate?.millisecondsSinceEpoch ?? -1) <
              fetchWindow.first) {
        await updateManga.awaitUpdateFetchInterval(manga, now, fetchWindow);
      }
      return [];
    }

    final reAdded = <Chapter>[];

    final deletedChapterNumbers = SplayTreeSet<double>();
    final deletedReadChapterNumbers = SplayTreeSet<double>();
    final deletedBookmarkedChapterNumbers = SplayTreeSet<double>();

    for (final chapter in removedChapters) {
      if (chapter.read) deletedReadChapterNumbers.add(chapter.chapterNumber);
      if (chapter.bookmark) {
        deletedBookmarkedChapterNumbers.add(chapter.chapterNumber);
      }
      deletedChapterNumbers.add(chapter.chapterNumber);
    }

    final deletedChapterNumberDateFetchMap = removedChapters
        .sortedByDescending((it) => it.dateFetch)
        .associate((it) => MapEntry(it.chapterNumber, it.dateFetch));

    // Date fetch is set in such a way that the upper ones will have bigger value than the lower ones
    // Sources MUST return the chapters from most to less recent, which is common.
    var itemCount = newChapters.length;
    var updatedToAdd = newChapters.map((toAddItem) {
      var chapter =
          toAddItem.copyWith(dateFetch: DateTime(nowMillis + itemCount--));

      if (!chapter.isRecognizedNumber ||
          deletedChapterNumbers.contains(chapter.chapterNumber)) return chapter;

      chapter = chapter.copyWith(
        read: deletedReadChapterNumbers.contains(chapter.chapterNumber),
        bookmark:
            deletedBookmarkedChapterNumbers.contains(chapter.chapterNumber),
      );

      // Try to to use the fetch date of the original entry to not pollute 'Updates' tab
      if (deletedChapterNumberDateFetchMap[chapter.chapterNumber] != null) {
        chapter = chapter.copyWith(
            dateFetch: deletedChapterNumberDateFetchMap[chapter.chapterNumber]);
      }

      reAdded.add(chapter);

      return chapter;
    }).toList();

    if (removedChapters.isNotEmpty) {
      final toDeleteIds = removedChapters.map((it) => it.id).toList();
      await chapterRepository.removeChaptersWithIds(toDeleteIds);
    }

    if (updatedToAdd.isNotEmpty) {
      updatedToAdd = await chapterRepository.addAll(updatedToAdd);
    }

    if (updatedChapters.isNotEmpty) {
      final chapterUpdates =
          updatedChapters.map((it) => it.toChapterUpdate()).toList();
      await updateChapter.awaitAll(chapterUpdates);
    }
    await updateManga.awaitUpdateFetchInterval(manga, now, fetchWindow);

    // Set this manga as updated since chapters were changed
    // Note that last_update actually represents last time the chapter list changed at all
    await updateManga.awaitUpdateLastUpdate(manga.id);

    final reAddedUrls = reAdded.map((it) => it.url).toHashSet();

    final excludedScanlatorsData = await getExcludedScanlators.await_(manga.id);
    final excludedScanlators = HashSet.of(excludedScanlatorsData);

    return updatedToAdd
        .whereNot((it) =>
            reAddedUrls.contains(it.url) ||
            excludedScanlators.contains(it.scanlator))
        .toList();
  }
}

@riverpod
SyncChaptersWithSource syncChaptersWithSource(SyncChaptersWithSourceRef ref) =>
    SyncChaptersWithSource(
      ref.watch(downloadManagerProvider),
      ref.watch(downloadPreferencesProvider),
      //ref.watch(downloadProviderProvider),
      ref.watch(chapterRepositoryProvider),
      ref.watch(shouldUpdateDbChapterProvider),
      ref.watch(updateMangaProvider),
      ref.watch(updateChapterProvider),
      ref.watch(getChaptersByMangaIdProvider),
      ref.watch(getExcludedScanlatorsProvider),
    );
