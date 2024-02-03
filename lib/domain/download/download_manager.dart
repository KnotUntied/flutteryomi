import 'package:collection/collection.dart';
import 'package:dartx/dartx.dart';
import 'package:drift/drift.dart';
import 'package:flutter/widgets.dart';
import 'package:logger/logger.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:flutteryomi/core/util/system/logger.dart';
import 'package:flutteryomi/domain/category/interactor/get_categories.dart';
import 'package:flutteryomi/domain/category/model/category_update.dart';
import 'package:flutteryomi/domain/category/repository/category_repository.dart';
import 'package:flutteryomi/domain/chapter/model/chapter.dart';
import 'package:flutteryomi/domain/download/downloader.dart';
import 'package:flutteryomi/domain/download/model/download.dart';
import 'package:flutteryomi/domain/download/service/download_preferences.dart';
import 'package:flutteryomi/domain/manga/model/manga.dart';
import 'package:flutteryomi/domain/source/model/source.dart';
import 'package:flutteryomi/domain/source/service/source_manager.dart';

part 'download_manager.g.dart';

//TODO
/// This class is used to manage chapter downloads in the application. It must be instantiated once
/// and retrieved through dependency injection. You can use this class to queue new chapters or query
/// downloaded chapters.
class DownloadManager {
  //final BuildContext context;
  //final DownloadProvider provider;
  //final DownloadCache cache;
  final GetCategories getCategories;
  final SourceManager sourceManager;
  final DownloadPreferences downloadPreferences;
  final Logger logger;
  DownloadManager({
    //required this.context,
    //required this.provider,
    //required this.cache,
    required this.getCategories,
    required this.sourceManager,
    required this.downloadPreferences,
    required this.logger,
  });

  /// Downloader whose only task is to download chapters.
  //late final _downloader = Downloader(context, provider, cache);
  late final _downloader = Downloader(
    sourceManager: sourceManager,
    downloadPreferences: downloadPreferences,
    getCategories: getCategories,
  );

  bool get isRunning => _downloader.isRunning;

  /// Queue to delay the deletion of a list of chapters until triggered.
  //late final _pendingDeleter = DownloadPendingDeleter(context);

  late final queueState = _downloader.queueState;

  // For use by DownloadService only
  void downloaderStart() => _downloader.start();
  void downloaderStop(String? reason) => _downloader.stop(reason);

  //get isDownloaderRunning => DownloadJob.isRunningStream(context);
  late final isDownloaderRunning = const Stream<bool>.empty();

  /// Tells the downloader to begin downloads.
  void startDownloads() {
    //if (_downloader.isRunning) return;

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
  Download? getQueuedDownloadOrNull(int chapterId) => null;
      //queueState.value.firstWhereOrNull((it) => it.chapter.id == chapterId);

  void startDownloadNow(int chapterId) {
    //final existingDownload = getQueuedDownloadOrNull(chapterId);
    // If not in queue try to start a new download
    //final toAdd = existingDownload ?? runBlocking(() => Download.fromChapterId(chapterId));
    //if (toAdd == null) return;
    //final queue = queueState.value;
    //final existingDownload = queue.existingDownload;
    //if (existingDownload != null) {
    //  queue.remove(existingDownload);
    //}
    //queue.add(0, toAdd);
    //reorderQueue(queue);
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
  void addDownloadsToStartOfQueue(List<Download> downloads) {
    if (downloads.isEmpty) return;
    final queue = queueState.value;
    queue.addAll(0, downloads);
    //reorderQueue(queue);
    //if (!DownloadJob.isRunning(context)) startDownloads();
  }

  /// Builds and returns the page list of a downloaded [chapter] from its [manga] and [source].
  List<Page> buildPageList(Source source, Manga manga, Chapter chapter) {
  //  final chapterDir = provider.findChapterDir(chapter.name, chapter.scanlator, manga.title, source);
  //  final files = chapterDir?.listFiles().orEmpty().filter((it) => "image" in it.type.orEmpty());

  //  if (files.isEmpty) {
  //    //throw Exception(lang.page_list_empty_error);
  //  }

  //  return files.sortedBy((it) => it.name)
  //      .mapIndexed((i, file) {
  //        final page = Page(i, uri: file.uri);
  //          //.apply { status = Page.State.READY }
  //      });
    return [];
  }

  // TODO
  /// Returns true if the chapter is downloaded.
  ///
  /// [chapterName] and [chapterScanlator] are the name and scanlator of
  /// the chapter to query, respectively.
  /// [mangaTitle] is the title of the manga to query.
  /// [sourceId] is the id of the source of the chapter.
  /// [skipCache] is whether to skip the directory cache and check in the filesystem.
  bool isChapterDownloaded(
    String chapterName,
    String? chapterScanlator,
    String mangaTitle,
    int sourceId, [
    bool skipCache = false,
  ]) => false;
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
      null;
  //    _removeFromDownloadQueue(downloads.map((it) => it.chapter));

  /// Deletes the directories of a list of downloaded [chapters] in their [manga] and [source].
  void deleteChapters(List<Chapter> chapters, Manga manga, Source source) {
    //final filteredChapters = _getChaptersToDelete(chapters, manga);
    //if (filteredChapters.isEmpty()) return;

    //_removeFromDownloadQueue(filteredChapters);

    //final (mangaDir, chapterDirs) = provider.findChapterDirs(filteredChapters, manga, source);
    //chapterDirs.forEach((it) => it.delete());
    //cache.removeChapters(filteredChapters, manga);

    //// Delete manga directory if empty
    //if (mangaDir?.listFiles()?.isEmpty() == true) {
    //  deleteManga(manga, source, removeQueued: false);
    //}
  }

  /// Deletes the directory of a downloaded [manga] in a given [source].
  /// Can be set to also remove queued downloads with [removeQueued].
  void deleteManga(Manga manga, Source source, [bool removeQueued = true]) {
    if (removeQueued) {
  //    downloader.removeFromQueue(manga);
    }
  //  provider.findMangaDir(manga.title, source)?.delete();
  //  cache.removeManga(manga);

  //  // Delete source directory if empty
  //  final sourceDir = provider.findSourceDir(source);
  //  if (sourceDir?.listFiles()?.isEmpty) {
  //    sourceDir.delete();
  //    cache.removeSource(source);
  //  }
  }

  void _removeFromDownloadQueue(List<Chapter> chapters) {
    //final wasRunning = downloader.isRunning;
    //if (wasRunning) {
    //  downloader.pause();
    //}

    //downloader.removeFromQueue(chapters);

    //if (wasRunning) {
    //  if (queueState.value.isEmpty) {
    //    downloader.stop();
    //  } else {
    //    downloader.start();
    //  }
    //}
  }

  // TODO
  /// Adds a list of [chapters] from a given [manga] to be deleted later.
  Future<void> enqueueChaptersToDelete(List<Chapter> chapters, Manga manga) async => null;
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
  void renameSource(Source oldSource, Source newSource) {
  //  final oldFolder = provider.findSourceDir(oldSource);
  //  if (oldFolder == null) return;
  //  final newName = provider.getSourceDirName(newSource);

  //  if (oldFolder.name == newName) return;

  //  final capitalizationChanged = oldFolder.name.equals(newName, ignoreCase: true);
  //  if (capitalizationChanged) {
  //    final tempName = newName + Downloader.tmpDirSuffix;
  //    if (oldFolder.renameTo(tempName).not()) {
  //      logger.e("Failed to rename source download folder: ${oldFolder.name}");
  //      return;
  //    }
  //  }

  //  if (oldFolder.renameTo(newName).not()) {
  //    logger.e("Failed to rename source download folder: ${oldFolder.name}");
  //  }
  }

  /// Renames an already downloaded chapter in a [manga] and [source]
  /// from [oldChapter] to [newChapter].
  Future<void> renameChapter(
    Source source,
    Manga manga,
    Chapter oldChapter,
    Chapter newChapter,
  ) async {
  //  final oldNames = provider.getValidChapterDirNames(oldChapter.name, oldChapter.scanlator);
  //  final mangaDir = provider.getMangaDir(manga.title, source);

  //  // Assume there's only 1 version of the chapter name formats present
  //  final oldDownload = oldNames.asSequence()
  //      .mapNotNull((it) => mangaDir.findFile(it))
  //      .firstOrNull();
  //  if (oldDownload == null) return;

  //  String newName = provider.getChapterDirName(newChapter.name, newChapter.scanlator);
  //  if (oldDownload.isFile && oldDownload.extension == "cbz") newName += ".cbz";

  //  if (oldDownload.name == newName) return;

  //  if (oldDownload.renameTo(newName)) {
  //    cache.removeChapter(oldChapter, manga);
  //    cache.addChapter(newName, mangaDir, manga);
  //  } else {
  //    logger.e("Could not rename downloaded chapter: ${oldNames.joinToString()}");
  //  }
  }

  Future<List<Chapter>> _getChaptersToDelete(List<Chapter> chapters, Manga manga) async {
    // Retrieve the categories that are set to exclude from being deleted on read
    final categoriesToExclude = downloadPreferences.removeExcludeCategories().get().map((it) => int.parse(it));

    final _categoriesForManga = await getCategories.await_(manga.id);
    var categoriesForManga = _categoriesForManga.map((it) => it.id).toList();
    if (categoriesForManga.isEmpty) categoriesForManga = const [0];
    final filteredCategoryManga = categoriesForManga.intersect(categoriesToExclude).isNotEmpty
        ? chapters.filterNot((it) => it.read)
        : chapters;

    if (!downloadPreferences.removeBookmarkedChapters().get()) {
      return filteredCategoryManga.filterNot((it) => it.bookmark).toList();
    } else {
      return filteredCategoryManga.toList();
    }
  }

  //Stream<Download> statusStream() => queueState
  //    .flatMapLatest((downloads) => downloads
  //        .map((download) => download.statusStream.drop(1).map(() => download))
  //        .merge())
  //    .onStart(() => emitAll(
  //      queueState.value.where((download) => download.status == DownloadState.downloading) .asStream(),
  //    ));
  Stream<Download> statusStream() => Stream.empty();

  //Stream<Download> progressStream() => queueState
  //    .flatMapLatest((downloads) => downloads
  //        .map((download) => download.pregressStream.drop(1).map(() => download))
  //        .merge())
  //    .onStart(() => emitAll(
  //      queueState.value.where((download) => download.status == DownloadState.downloading) .asStream(),
  //    ));
  Stream<Download> progressStream() => Stream.empty();
}

@riverpod
DownloadManager downloadManager(DownloadManagerRef ref) => DownloadManager(
      //context: ref.watch(contextProvider),
      //provider: ref.watch(downloadProviderProvider),
      //cache: ref.watch(downloadCacheProvider),
      getCategories: ref.watch(getCategoriesProvider),
      sourceManager: ref.watch(sourceManagerProvider),
      downloadPreferences: ref.watch(downloadPreferencesProvider),
      logger: ref.watch(loggerProvider),
    );
