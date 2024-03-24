import 'dart:io';

import 'package:collection/collection.dart';
import 'package:dartx/dartx_io.dart' hide IterableFirstOrNull, IterableSortedBy, IterableWhereNot;
import 'package:logger/logger.dart';
import 'package:mime/mime.dart';
import 'package:quiver/strings.dart';
import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:rxdart/rxdart.dart';

import 'package:flutteryomi/core/storage/directory_extensions.dart';
import 'package:flutteryomi/core/util/system/logger.dart';
import 'package:flutteryomi/l10n/l10n.dart';
import 'package:flutteryomi/domain/category/interactor/get_categories.dart';
import 'package:flutteryomi/domain/chapter/interactor/get_chapter.dart';
import 'package:flutteryomi/domain/chapter/model/chapter.dart';
import 'package:flutteryomi/domain/download/download_provider.dart';
import 'package:flutteryomi/domain/download/downloader.dart';
import 'package:flutteryomi/domain/download/model/download.dart';
import 'package:flutteryomi/domain/download/service/download_preferences.dart';
import 'package:flutteryomi/domain/manga/interactor/get_manga.dart';
import 'package:flutteryomi/domain/manga/model/manga.dart';
import 'package:flutteryomi/domain/source/model/page.dart';
import 'package:flutteryomi/domain/source/service/source_manager.dart';
import 'package:flutteryomi/source/api/source.dart';

part 'download_manager.g.dart';

//TODO
/// This class is used to manage chapter downloads in the application. It must be instantiated once
/// and retrieved through dependency injection. You can use this class to queue new chapters or query
/// downloaded chapters.
class DownloadManager {
  DownloadManager({
    required this.ref,
    required this.provider,
    //required this.cache,
    required this.getCategories,
    required this.getChapter,
    required this.getManga,
    required this.sourceManager,
    required this.downloadPreferences,
    required this.logger,
  });

  final Ref ref;
  final DownloadProvider provider;
  //final DownloadCache cache;
  final GetCategories getCategories;
  final GetChapter getChapter;
  final GetManga getManga;
  final SourceManager sourceManager;
  final DownloadPreferences downloadPreferences;
  final Logger logger;

  /// Downloader whose only task is to download chapters.
  late final _downloader = Downloader(
    ref: ref,
    provider: provider,
    //cache: cache,
    sourceManager: sourceManager,
    downloadPreferences: downloadPreferences,
    getCategories: getCategories,
    getChapter: getChapter,
    getManga: getManga,
  );

  bool get isRunning => _downloader.isRunning;

  /// Queue to delay the deletion of a list of chapters until triggered.
  //late final _pendingDeleter = DownloadPendingDeleter(context);

  late final queueState = _downloader.queueState;

  // For use by DownloadService only
  void downloaderStart() => _downloader.start();
  void downloaderStop(String? reason) => _downloader.stop(reason);

  //get isDownloaderRunning => DownloadJob.isRunningStream(context);
  late final isDownloaderRunning = Stream<bool>.value(false);

  /// Tells the downloader to begin downloads.
  void startDownloads() {
    if (_downloader.isRunning) return;

    //if (DownloadJob.isRunning(context)) {
    //  _downloader.start();
    //} else {
    //  DownloadJob.start(context);
    //}
  }

  /// Tells the downloader to pause downloads.
  void pauseDownloads() {
    _downloader.pause();
    _downloader.stop();
  }

  /// Empties the download queue.
  void clearQueue() {
    _downloader.clearQueue();
    _downloader.stop();
  }

  /// Returns the download from queue if the chapter with [chapterId] is queued for download
  /// else it will return null which means that the chapter is not queued for download
  Download? getQueuedDownloadOrNull(int chapterId) =>
      queueState.value.firstWhereOrNull((it) => it.chapter.id == chapterId);

  void startDownloadNow(int chapterId) async {
    final existingDownload = getQueuedDownloadOrNull(chapterId);
    // If not in queue try to start a new download
    final toAdd = existingDownload ?? await Download.fromChapterId(
      chapterId: chapterId,
      getChapter: getChapter,
      getManga: getManga,
      sourceManager: sourceManager,
    );
    if (toAdd == null) return;
    final queue = queueState.value;
    if (existingDownload != null) queue.remove(existingDownload);
    queue.insert(0, toAdd);
    reorderQueue(queue);
    startDownloads();
  }

  /// Reorders the download queue to [downloads].
  void reorderQueue(List<Download> downloads) {
    _downloader.updateQueue(downloads);
  }

  /// Tells the downloader to enqueue the given list of [chapters] in [manga]. Can be set to [autoStart].
  void downloadChapters(Manga manga, List<Chapter> chapters, [bool autoStart = true]) {
    _downloader.queueChapters(manga, chapters, autoStart);
  }

  /// Tells the downloader to enqueue the given list of [downloads] at the start of the queue.
  void addDownloadsToStartOfQueue(List<Download> downloads) async {
    if (downloads.isEmpty) return;
    final queue = await queueState.last;
    queue.insertAll(0, downloads);
    reorderQueue(queue);
    //if (!DownloadJob.isRunning(context)) startDownloads();
  }

  /// Builds and returns the page list of a downloaded [chapter] from its [manga] and [source].
  Future<List<Page>> buildPageList(Source source, Manga manga, Chapter chapter) async {
    final lang = ref.read(appLocalizationsProvider);
    final chapterDir = await provider.findChapterDir(
      chapterName: chapter.name,
      chapterScanlator: chapter.scanlator,
      mangaTitle: manga.title,
      source: source,
    );
    final files = chapterDir
        ?.listSync()
        .where((it) => lookupMimeType(it.name)?.contains("image") ?? false)
        ?? const [];

    if (files.isEmpty) {
      throw Exception(lang.page_list_empty_error);
    }

    return files.sortedBy((it) => it.name)
        .mapIndexed((i, file) => Page(i)..status = PageState.ready)
        .toList();
  }

  // TODO
  /// Returns true if the chapter is downloaded.
  bool isChapterDownloaded(
    String chapterName,
    String? chapterScanlator,
    String mangaTitle,
    int sourceId, {
    bool skipCache = false,
  }) => false;
  //]) => cache.isChapterDownloaded(
  //  chapterName,
  //  chapterScanlator,
  //  mangaTitle,
  //  sourceId,
  //  skipCache,
  //);

  /// Returns the amount of downloaded chapters.
  //int getDownloadCount() => cache.getTotalDownloadCount();
  int getDownloadCount() => 0;

  /// Returns the amount of downloaded chapters for a [manga].
  //int getDownloadCountForManga(Manga manga) => cache.getDownloadCount(manga);
  int getDownloadCountForManga(Manga manga) => 0;

  void cancelQueuedDownloads(List<Download> downloads) =>
      _removeFromDownloadQueue(downloads.map((it) => it.chapter).toList());

  /// Deletes the directories of a list of downloaded [chapters] in their [manga] and [source].
  void deleteChapters(List<Chapter> chapters, Manga manga, Source source) async {
    final filteredChapters = await _getChaptersToDelete(chapters, manga);
    if (filteredChapters.isEmpty) return;

    _removeFromDownloadQueue(filteredChapters);

    final (mangaDir, chapterDirs) = await provider.findChapterDirs(
      chapters: filteredChapters,
      manga: manga,
      source: source,
    );
    for (final it in chapterDirs) {
      it.delete();
    }
    //cache.removeChapters(filteredChapters, manga);

    // Delete manga directory if empty
    if (mangaDir?.listSync().isEmpty ?? false) {
      deleteManga(manga, source, removeQueued: false);
    }
  }

  /// Deletes the directory of a downloaded [manga] in a given [source].
  /// Can be set to also remove queued downloads with [removeQueued].
  void deleteManga(Manga manga, Source source, {bool removeQueued = true}) async {
    if (removeQueued) _downloader.removeMangaFromQueue(manga);
    (await provider.findMangaDir(mangaTitle: manga.title, source: source))
        ?.delete();
    //cache.removeManga(manga);

    // Delete source directory if empty
    final sourceDir = await provider.findSourceDir(source);
    if (sourceDir?.listSync().isEmpty ?? false) {
      sourceDir?.delete();
      //cache.removeSource(source);
    }
  }

  void _removeFromDownloadQueue(List<Chapter> chapters) {
    final wasRunning = _downloader.isRunning;
    if (wasRunning) _downloader.pause();

    _downloader.removeChaptersFromQueue(chapters);

    if (wasRunning) {
      if (queueState.value.isEmpty) {
        //_downloader.stop();
      } else {
        //_downloader.start();
      }
    }
  }

  // TODO
  /// Adds a list of [chapters] from a given [manga] to be deleted later.
  Future<void> enqueueChaptersToDelete(List<Chapter> chapters, Manga manga) async => await null;
    //await pendingDeleter.addChapters(_getChaptersToDelete(chapters, manga), manga);

  /// Triggers the execution of the deletion of pending chapters.
  void deletePendingChapters() {
  //  final pendingChapters = pendingDeleter.getPendingChapters();
  //  for (final (manga, chapters) in pendingChapters) {
  //    final source = sourceManager.get(manga.source);
  //    if (source == null) continue;
  //    deleteChapters(chapters, manga, source);
  //  }
  }

  /// Renames source download folder from [oldSource] to [newSource].
  void renameSource(Source oldSource, Source newSource) async {
    final oldFolder = await provider.findSourceDir(oldSource);
    if (oldFolder == null) return;
    final newName = provider.getSourceDirName(newSource);

    if (oldFolder.name == newName) return;

    final capitalizationChanged = equalsIgnoreCase(oldFolder.name, newName);
    if (capitalizationChanged) {
      final tempName = newName + Downloader.tmpDirSuffix;
      try {
        oldFolder.renameSync(tempName);
      } catch (e) {
        logger.e("Failed to rename source download folder: ${oldFolder.name}");
        return;
      }
    }

    try {
      oldFolder.renameSync(newName);
    } catch (e) {
      logger.e("Failed to rename source download folder: ${oldFolder.name}");
    }
  }

  /// Renames an already downloaded chapter in a [manga] and [source]
  /// from [oldChapter] to [newChapter].
  Future<void> renameChapter(
    Source source,
    Manga manga,
    Chapter oldChapter,
    Chapter newChapter,
  ) async {
    final oldNames = provider.getValidChapterDirNames(
      chapterName: oldChapter.name,
      chapterScanlator: oldChapter.scanlator,
    );
    final mangaDir = await provider.getMangaDir(manga.title, source);

    // Assume there's only 1 version of the chapter name formats present
    final oldDownload = oldNames
        .mapNotNull((it) => mangaDir.findFile(it))
        .firstOrNull;
    if (oldDownload == null) return;

    String newName = provider.getChapterDirName(newChapter.name, newChapter.scanlator);
    if (oldDownload.extension == "cbz") newName += ".cbz";

    if (oldDownload.name == newName) return;

    try {
      oldDownload.renameSync(newName);
      //cache.removeChapter(oldChapter, manga);
      //cache.addChapter(newName, mangaDir, manga);
    } catch (e) {
      logger.e("Could not rename downloaded chapter: ${oldNames.joinToString()}");
    }
  }

  Future<List<Chapter>> _getChaptersToDelete(List<Chapter> chapters, Manga manga) async {
    // Retrieve the categories that are set to exclude from being deleted on read
    final categoriesToExclude = downloadPreferences.removeExcludeCategories().get().map((it) => int.parse(it));

    final categories = await getCategories.await_(manga.id);
    var categoriesForManga = categories.map((it) => it.id).toList();
    if (categoriesForManga.isEmpty) categoriesForManga = const [0];
    final filteredCategoryManga = categoriesForManga.intersect(categoriesToExclude).isNotEmpty
        ? chapters.filterNot((it) => it.read)
        : chapters;

    if (!downloadPreferences.removeBookmarkedChapters().get()) {
      return filteredCategoryManga.whereNot((it) => it.bookmark).toList();
    } else {
      return filteredCategoryManga.toList();
    }
  }

  Stream<Download> statusStream() => queueState
      .switchMap((downloads) => Rx.merge(
        downloads.map((download) => download.statusStream.skip(1).map((_) => download))
      ))
      .startWithMany(
        queueState
            .value
            .where((download) => download.status == DownloadState.downloading)
            .toList(),
      );

  Stream<Download> progressStream() => queueState
      .switchMap((downloads) => Rx.merge(
        downloads.map((download) => download.progressStream.skip(1).map((_) => download))
      ))
      .startWithMany(
        queueState
            .value
            .where((download) => download.status == DownloadState.downloading)
            .toList(),
      );
}

@riverpod
DownloadManager downloadManager(DownloadManagerRef ref) => DownloadManager(
      ref: ref,
      provider: ref.watch(downloadProviderProvider),
      //cache: ref.watch(downloadCacheProvider),
      getCategories: ref.watch(getCategoriesProvider),
      getChapter: ref.watch(getChapterProvider),
      getManga: ref.watch(getMangaProvider),
      sourceManager: ref.watch(sourceManagerProvider),
      downloadPreferences: ref.watch(downloadPreferencesProvider),
      logger: ref.watch(loggerProvider),
    );
