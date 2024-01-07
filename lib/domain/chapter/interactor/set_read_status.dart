import 'package:dartx/dartx.dart';
import 'package:drift/drift.dart';
import 'package:logger/logger.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:flutteryomi/core/util/system/logger.dart';
import 'package:flutteryomi/domain/chapter/model/chapter.dart';
import 'package:flutteryomi/domain/chapter/model/chapter_update.dart';
import 'package:flutteryomi/domain/chapter/repository/chapter_repository.dart';
import 'package:flutteryomi/domain/download/interactor/delete_download.dart';
import 'package:flutteryomi/domain/download/service/download_preferences.dart';
import 'package:flutteryomi/domain/manga/repository/manga_repository.dart';
import 'package:flutteryomi/domain/manga/model/manga.dart';

part 'set_read_status.g.dart';

class SetReadStatus {
  final DownloadPreferences downloadPreferences;
  final DeleteDownload deleteDownload;
  final MangaRepository mangaRepository;
  final ChapterRepository chapterRepository;
  final Logger logger;

  SetReadStatus(
    this.downloadPreferences,
    this.deleteDownload,
    this.mangaRepository,
    this.chapterRepository,
    this.logger,
  );

  ChapterUpdate mapper(Chapter chapter, bool read) => ChapterUpdate(
        read: Value(read),
        lastPageRead: !read ? const Value(0) : const Value.absent(),
        id: Value(chapter.id),
      );

  Future<void> await_({
    required bool read,
    required List<Chapter> chapters,
  }) async {
    final chaptersToUpdate = chapters.where((it) => switch (read) {
          true => !it.read,
          false => it.read || it.lastPageRead > 0,
        });
    if (chaptersToUpdate.isEmpty) return;

    try {
      await chapterRepository.updateAll(
        chaptersToUpdate.map((it) => mapper(it, read)).toList(),
      );
    } catch (e) {
      logger.e(e);
      rethrow;
    }

    if (read && downloadPreferences.removeAfterMarkedAsRead().get()) {
      final mangaAndChapters = chaptersToUpdate.groupBy((it) => it.mangaId);
      for (final pair in mangaAndChapters.entries) {
        final mangaId = pair.key;
        final chapters = pair.value;
        await deleteDownload.awaitAll(
          await mangaRepository.getMangaById(mangaId),
          chapters,
        );
      }
    }
  }

  Future<void> awaitByMangaId(int mangaId, bool read) async => await_(
        read: read,
        chapters: await chapterRepository.getChapterByMangaId(mangaId),
      );

  Future<void> awaitByManga(Manga manga, bool read) async =>
      await awaitByMangaId(manga.id, read);
}

@riverpod
SetReadStatus setReadStatus(SetReadStatusRef ref) => SetReadStatus(
      ref.watch(downloadPreferencesProvider),
      ref.watch(deleteDownloadProvider),
      ref.watch(mangaRepositoryProvider),
      ref.watch(chapterRepositoryProvider),
      ref.watch(loggerProvider),
    );
