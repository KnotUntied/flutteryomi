import 'dart:io';
import 'dart:math';

import 'package:dartx/dartx.dart';
import 'package:flutter/widgets.dart';
import 'package:flutteryomi/core/metadata/comic_info.dart';
import 'package:flutteryomi/core/util/system/image_util.dart';
import 'package:rxdart/rxdart.dart';

import 'package:flutteryomi/domain/category/interactor/get_categories.dart';
import 'package:flutteryomi/domain/chapter/interactor/get_chapter.dart';
import 'package:flutteryomi/domain/chapter/model/chapter.dart';
import 'package:flutteryomi/domain/download/download_store.dart';
import 'package:flutteryomi/domain/download/model/download.dart';
import 'package:flutteryomi/domain/download/service/download_preferences.dart';
import 'package:flutteryomi/domain/manga/interactor/get_manga.dart';
import 'package:flutteryomi/domain/manga/model/manga.dart';
import 'package:flutteryomi/domain/source/model/page.dart' as page_data;
import 'package:flutteryomi/domain/source/service/source_manager.dart';
import 'package:flutteryomi/source/api/online/http_source.dart';
import 'package:flutteryomi/source/api/unmetered_source.dart';

//TODO
/// This class is the one in charge of downloading chapters.
///
/// Its queue contains the list of chapters to download.
class Downloader {
  Downloader({
    //required this.context,
    //required this.provider,
    //required this.cache,
    required this.sourceManager,
    //required this.chapterCache,
    required this.downloadPreferences,
    //required this.xml,
    required this.getCategories,
    required this.getChapter,
    required this.getManga,
  });

  //final BuildContext context;
  //final DownloadProvider provider;
  //final DownloadCache cache;
  final SourceManager sourceManager;
  //final ChapterCache chapterCache;
  final DownloadPreferences downloadPreferences;
  //final XML xml;
  final GetCategories getCategories;
  final GetChapter getChapter;
  final GetManga getManga;


  /// Store for persisting downloads across restarts.
  late final _store = DownloadStore(
    sourceManager: sourceManager,
    getChapter: getChapter,
    getManga: getManga,
  );

  /// Queue where active downloads are kept.
  final _queueState = BehaviorSubject.seeded(<Download>[]);
  ValueStream<List<Download>> get queueState => _queueState.stream;

  /// Notifier for the downloader state and progress.
  //final _notifier by lazy { DownloadNotifier(context) }

  //final _scope = CoroutineScope(SupervisorJob() + Dispatchers.IO)
  //Job? _downloaderJob;

  /// Whether the downloader is running.
  //TODO
  //bool get isRunning => downloaderJob?.isActive ?? false;
  bool get isRunning => false;

  /// Whether the downloader is paused
  bool isPaused = false;

  //init {
  //  launchNow {
  //    final chapters = () async => await store.restore();
  //    _addAllToQueue(chapters.await_());
  //  }
  //}

  /// Starts the downloader. It doesn't do anything if it's already running or there isn't anything
  /// to download.
  ///
  /// Returns true if the downloader is started, false otherwise.
  Future<bool> start() async {
    if (isRunning || queueState.value.isEmpty) return false;

    final pending = queueState.value.where((it) => it.status != DownloadState.downloaded);
    for (final it in pending) {
      if (it.status != DownloadState.queue) it.status = DownloadState.queue;
    }

    isPaused = false;

    _launchDownloaderJob();

    return pending.isNotEmpty;
  }

  /// Stops the downloader.
  void stop([String? reason]) async {
    final value = await queueState.last;
    _cancelDownloaderJob();
    value
        .where((it) => it.status == DownloadState.downloading)
        .forEach((it) => it.status = DownloadState.error);

    if (reason != null) {
    //  notifier.onWarning(reason);
      return;
    }

    if (isPaused && queueState.value.isNotEmpty) {
    //  notifier.onPaused();
    } else {
    //  notifier.onComplete();
    }

    isPaused = false;

    //DownloadJob.stop(context);
  }

  /// Pauses the downloader
  void pause() async {
    final value = await queueState.last;
    _cancelDownloaderJob();
    value
        .where((it) => it.status == DownloadState.downloading)
        .forEach((it) => it.status = DownloadState.queue);
    isPaused = true;
  }

  /// Removes everything from the queue.
  void clearQueue() {
    _cancelDownloaderJob();

    _clearQueue();
    //notifier.dismissProgress();
  }

  /// Prepares the subscriptions to start downloading.
  void _launchDownloaderJob() {
    if (isRunning) return;

    //downloaderJob = scope.launch {
      //final activeDownloadsStream = queueState.transformLatest((queue) {
      //  while (true) {
      //    final activeDownloads = queue.asSequence()
      //        // Ignore completed downloads, leave them in the queue
      //        .where((it) => it.status.index <= DownloadState.downloading.index)
      //        .groupBy((it) => it.source)
      //        .toList()
      //        .take(5) // Concurrently download from 5 different sources
      //        .map((_, downloads) => downloads.first());
      //    emit(activeDownloads);

      //    if (activeDownloads.isEmpty) break;
      //    // Suspend until a download enters the ERROR state
      //    final activeDownloadsErroredStream =
      //        Rx.combineLatestList(activeDownloads.map((it) => it.statusStream))
      //            .map((states) => states.contains(DownloadState.error))
      //            .where((it) => it);
      //    return activeDownloadsErroredStream.first();
      //  }
      //}).distinct();

    //  // Use supervisorScope to cancel child jobs when the downloader job is cancelled
    //  supervisorScope {
        //final downloadJobs = <Download, Job>{};

    //    activeDownloadsStream.collectLatest { activeDownloads ->
    //      final downloadJobsToStop = downloadJobs.where((it) => !activeDownloads.contains(it.key));
    //      downloadJobsToStop.forEach { (download, job) ->
    //        job.cancel()
    //        downloadJobs.remove(download)
    //      }

    //      final downloadsToStart = activeDownloads.where((it) => !downloadJobs.contains(it));
    //      downloadsToStart.forEach((download) => downloadJobs[download] = launchDownloadJob(download));
    //    }
    //  }
    //}
  }

  //private fun CoroutineScope.launchDownloadJob(Download download) = launchIO {
  //  try {
  //    _downloadChapter(download);

  //    // Remove successful download from queue
  //    if (download.status == DownloadState.downloaded) {
  //      _removeFromQueue(download);
  //    }
  //    if (_areAllDownloadsFinished()) {
  //      stop();
  //    }
  //  } catch (Throwable e) {
  //    if (e is CancellationException) throw e;
  //    logcat(LogPriority.ERROR, e);
  //    notifier.onError(e.message);
  //    stop();
  //  }
  //}

  /// Destroys the downloader subscriptions.
  void _cancelDownloaderJob() {
    //downloaderJob?.cancel();
    //downloaderJob = null;
  }

  /// Creates a download object for every chapter of [chapters] in [manga] and adds them to the downloads queue.
  ///
  /// [autoStart] dictates whether to start the downloader after enqueueing the chapters.
  void queueChapters(Manga manga, List<Chapter> chapters, bool autoStart) async {
    if (chapters.isEmpty) return;

    final source = sourceManager.get(manga.source) as HttpSource?;
    if (source == null) return;
    final wasEmpty = queueState.value.isEmpty;
    final chaptersToQueue = chapters
        // Filter out those already downloaded.
        //.where((it) => provider.findChapterDir(it.name, it.scanlator, manga.title, source) == null)
        // Add chapters to queue from the start.
        .sortedByDescending((it) => it.sourceOrder)
        // Filter out those already enqueued.
        .where((chapter) => queueState.value.none((it) => it.chapter.id == chapter.id))
        // Create a download for each one.
        .map((it) => Download(source, manga, it))
        .toList();

    if (chaptersToQueue.isNotEmpty) {
      _addAllToQueue(chaptersToQueue);

      // Start downloader if needed
      if (autoStart && wasEmpty) {
        final queuedDownloads = queueState.value.where((it) => it.source is! UnmeteredSource).length;
        final maxDownloadsFromSource = queueState.value
            .groupBy((it) => it.source)
            .filterKeys((it) => it is! UnmeteredSource)
            .maxBy((it) => it.value.length)
            ?.value
            .length
            ?? 0;
        if (queuedDownloads > _downloadsQueuedWarningThreshold ||
          maxDownloadsFromSource > chaptersPerSourceQueueWarningThreshold) {
          //notifier.onWarning(
          //  lang.download_queue_size_warning,
          //  warningNotifTimeoutMs,
          //  NotificationHandler.openUrl(context, LibraryUpdateNotifier.helpWarningUrl),
          //)
        }
        //DownloadJob.start(context);
      }
    }
  }

  /// Downloads a chapter [download].
  void _downloadChapter(Download download) {
    //final mangaDir = provider.getMangaDir(download.manga.title, download.source);

    //final availSpace = DiskUtil.getAvailableStorageSpace(mangaDir);
    //if (availSpace != -1 && availSpace < _minDiskSpace) {
    //  download.status = DownloadState.error;
    //  notifier.onError(
    //    lang.download_insufficient_space,
    //    download.chapter.name,
    //    download.manga.title,
    //  );
    //  return;
    //}

    //final chapterDirname = provider.getChapterDirName(download.chapter.name, download.chapter.scanlator);
    //final tmpDir = mangaDir.createDirectory(chapterDirname + tmpDirSuffix)!;

    //try {
    //  // If the page list already exists, start from the file
    //  final pageList = download.pages ?? run {
    //    // Otherwise, pull page list from network and add them to download object
    //    final pages = download.source.getPageList(download.chapter.toSChapter());

    //    if (pages.isEmpty) {
    //      throw Exception(lang.page_list_empty_error);
    //    }
    //    // Don't trust index from source
    //    final reIndexedPages = pages.mapIndexed((index, page) => Page(index, page.url, page.imageUrl, page.uri));
    //    download.pages = reIndexedPages;
    //    reIndexedPages;
    //  }

    //  // Delete all temporary (unfinished) files
    //  tmpDir.listFiles()
    //      ?.where((it) => it.extension == "tmp")
    //      ?.forEach((it) => it.delete());

    //  download.status = DownloadState.downloading;

    //  // Start downloading images, consider we can have downloaded images already
    //  // Concurrently do 2 pages at a time
    //  pageList.asFlow()
    //      .flatMapMerge(concurrency = 2) { page ->
    //          flow {
    //              // Fetch image URL if necessary
    //              if (page.imageUrl.isNullOrEmpty()) {
    //                  page.status = PageState.loadPage
    //                  try {
    //                      page.imageUrl = download.source.getImageUrl(page);
    //                  } catch (Throwable e) {
    //                      page.status = PageState.error;
    //                  }
    //              }

    //              withIOContext { _getOrDownloadImage(page, download, tmpDir) }
    //              emit(page)
    //          }.flowOn(Dispatchers.IO)
    //      }
    //      .collect {
    //          // Do when page is downloaded.
    //          notifier.onProgressChange(download)
    //      }

    //  // Do after download completes

    //  if (!_isDownloadSuccessful(download, tmpDir)) {
    //    download.status = DownloadState.error;
    //    return;
    //  }

    //  _createComicInfoFile(
    //    tmpDir,
    //    download.manga,
    //    download.chapter,
    //    download.source,
    //  );

    //  // Only rename the directory if it's downloaded
    //  if (downloadPreferences.saveChaptersAsCBZ().get()) {
    //    _archiveChapter(mangaDir, chapterDirname, tmpDir);
    //  } else {
    //    tmpDir.renameTo(chapterDirname);
    //  }
    //  cache.addChapter(chapterDirname, mangaDir, download.manga);

    //  DiskUtil.createNoMediaFile(tmpDir, context);

    //  download.status = DownloadState.downloaded;
    //} catch (error) {
    //  if (error is CancellationException) throw error;
    //  // If the page list threw, it will resume here
    //  logger.e(error);
    //  download.status = DownloadState.error;
    //  notifier.onError(error.message, download.chapter.name, download.manga.title);
    //}
  }

  /// Gets the [download] image of [page] from the filesystem in [tmpDir] if it exists or downloads it otherwise.
  Future<void> _getOrDownloadImage(page_data.Page page, Download download, Directory tmpDir) async {
    // If the image URL is empty, do nothing
    if (page.imageUrl == null) return;

    final digitCount = max(3, (download.pages?.length ?? 0).toString().length);
    //final filename = "%0${digitCount}d".format(Locale.ENGLISH, page.number);
    //final tmpFile = tmpDir.findFile("$filename.tmp");

    // Delete temp file if it exists
    //tmpFile?.delete();

    // Try to find the image file
    //final imageFile = tmpDir.listFiles()?.firstOrNull(
    //  (it) => it.name!.startsWith("$filename.") ||
    //  it.name!.startsWith("${filename}__001"),
    //);

    try {
      // If the image is already downloaded, do nothing. Otherwise download from network
      //final file;
      //if (imageFile != null) {
      //  file = imageFile;
      //} else if (chapterCache.isImageInCache(page.imageUrl!)) {
      //  file = _copyImageFromCache(chapterCache.getImageFile(page.imageUrl!), tmpDir, filename);
      //} else {
      //  file = downloadImage(page, download.source, tmpDir, filename);
      //}

      // When the page is ready, set page path, progress (just in case) and status
  //    _splitTallImageIfNeeded(page, tmpDir);

  //    page.uri = file.uri;
      page.progress = 100;
      page.status = page_data.PageState.ready;
    } catch (e) {
      //if (e is CancellationException) rethrow;
      // Mark this page as error and allow to download the remaining
      page.progress = 0;
      page.status = page_data.PageState.error;
      //notifier.onError(e.message, download.chapter.name, download.manga.title);
    }
  }

  /// Downloads the image in [page] from [source] from network to a file [filename] in [tmpDir].
  Future<File> _downloadImage(page_data.Page page, HttpSource source, Directory tmpDir, String filename) async {
    page.status = page_data.PageState.downloadImage;
    page.progress = 0;
  //  return flow {
  //      final response = source.getImage(page);
  //      final file = tmpDir.createFile("$filename.tmp")!;
  //      try {
  //          response.body.source().saveTo(file.openOutputStream())
  //          val extension = _getImageExtension(response, file)
  //          file.renameTo("$filename.$extension")
  //      } catch (e: Exception) {
  //          response.close()
  //          file.delete()
  //          throw e
  //      }
  //      emit(file)
  //  }
  //      // Retry 3 times, waiting 2, 4 and 8 seconds between attempts.
  //      .retryWhen { _, attempt ->
  //          if (attempt < 3) {
  //              delay((2 << attempt.toInt()) * 1000)
  //              true
  //          } else {
  //              false
  //          }
  //      }
  //      .first();
    return File('');
  }

  /// Copies the image [filename] from [cacheFile] to file in [tmpDir].
  File _copyImageFromCache(File cacheFile, Directory tmpDir, String filename) {
    //final tmpFile = tmpDir.createFile("$filename.tmp")!!;
  //  cacheFile.inputStream().use { input ->
  //    tmpFile.openOutputStream().use { output ->
  //      input.copyTo(output);
  //    }
  //  }
    //final extension = ImageUtil.findImageType(cacheFile.inputStream()) ?? return tmpFile;
  //  tmpFile.renameTo("$filename.${extension.extension}")
    cacheFile.delete();
  //  return tmpFile;
    return File('');
  }

  /// Returns the extension of the downloaded image from the network [response], or if it's null,
  /// analyze the [file]. If everything fails, assume it's a jpg.
  String _getImageExtension(HttpResponse response, File file) {
    // Read content type if available.
  //  final mime = response.body.contentType()?.run { type == "image" ? "image/$subtype" : null }
  //      // Else guess from the uri.
  //      ?? context.contentResolver.getType(file.uri)
  //      // Else read magic numbers.
  //      ?? ImageUtil.findImageType { file.openInputStream() }?.mime;

  //  return ImageUtil.getExtensionFromMimeType(mime);
    return '';
  }

  void _splitTallImageIfNeeded(page_data.Page page, File tmpDir) {
    if (!downloadPreferences.splitTallImages().get()) return;

    try {
    //  final filenamePrefix = "%03d".format(Locale.ENGLISH, page.number);
    //  final imageFile = tmpDir.listFiles()?.firstOrNull { it.name.orEmpty().startsWith(filenamePrefix) }
    //      ?? error(context.stringResource(MR.strings.download_notifier_split_page_not_found, page.number));

    //  // If the original page was previously split, then skip
    //  if (imageFile.name.orEmpty().startsWith("${filenamePrefix}__")) return;

    //  ImageUtil.splitTallImage(tmpDir, imageFile, filenamePrefix);
    } catch (e) {
      //logger.e(e, "Failed to split downloaded image");
    }
  }

  /// Checks if the [download] in [tmpDir] was successful.
  bool _isDownloadSuccessful(Download download, Directory tmpDir) {
    // Page list hasn't been initialized
    final downloadPageCount = download.pages?.length;
    if (downloadPageCount == null) return false;

    // Ensure that all pages have been downloaded
    if (download.downloadedImages != downloadPageCount) {
      return false;
    }

    // Ensure that the chapter folder has all the pages
    //final downloadedImagesCount = tmpDir.listFiles().orEmpty().count((it) {
    //  final fileName = it.name.orEmpty();
    //  if ([comicInfoFile, nomediaFile].contains(fileName)) {
    //    return false;
    //  } else if (fileName.endsWith(".tmp")) {
    //    return false;
    //  } else if (fileName.contains("__") && !fileName.endsWith("__001.jpg")) {
    //    // Only count the first split page and not the others
    //    return false;
    //  } else {
    //    return true;
    //  }
    //});
    //return downloadedImagesCount == downloadPageCount;
    return false;
  }

  /// Archive the chapter pages as a CBZ.
  void _archiveChapter(Directory mangaDir, String dirname, Directory tmpDir) {
    //final zip = mangaDir.createFile("$dirname.cbz$tmpDirSuffix")!;
    //ZipOutputStream(BufferedOutputStream(zip.openOutputStream())).use { zipOut ->
    //  zipOut.setMethod(ZipEntry.STORED);

    //  tmpDir.listFiles()?.forEach { img ->
    //    img.openInputStream().use { input ->
    //      final data = input.readBytes();
    //      final size = img.length();
    //      final entry = ZipEntry(img.name).apply {
    //        final crc = CRC32().apply {
    //          update(data);
    //        }
    //        setCrc(crc.value);

    //        compressedSize = size;
    //        setSize(size);
    //      }
    //      zipOut.putNextEntry(entry)
    //      zipOut.write(data)
    //    }
    //  }
    //}
    //zip.renameTo("$dirname.cbz");
    //tmpDir.delete();
  }

  /// Creates a ComicInfo.xml file inside the given directory.
  Future<void> _createComicInfoFile(
    Directory dir,
    Manga manga,
    Chapter chapter,
    HttpSource source,
  ) async {
  //  final chapterUrl = source.getChapterUrl(chapter.toSChapter());
    final fetchedCategories = await getCategories.await_(manga.id);
    final categories = fetchedCategories.isEmpty
        ? null
        : fetchedCategories.map((it) => it.name.trim());
    //final comicInfo = getComicInfo(manga, chapter, chapterUrl, categories);
    // Remove the old file
    //dir.findFile(comicInfoFile, true)?.delete();
    //dir.createFile(comicInfoFile)!!.openOutputStream().use {
  //    final comicInfoString = xml.encodeToString(ComicInfo.serializer(), comicInfo);
  //    it.write(comicInfoString.toByteArray());
  //  }
  }

  /// Returns true if all the queued downloads are in [downloaded] or [error] state.
  bool _areAllDownloadsFinished() =>
      queueState.value.none((it) => it.status.index <= DownloadState.downloading.index);

  void _addAllToQueue(List<Download> downloads) {
    //_queueState.update((it) {
    //  downloads.forEach((download) => download.status = DownloadState.queue);
    //  store.addAll(downloads);
    //  it + downloads;
    //});
  }

  void _removeFromQueue(Download download) {
    //_queueState.update((it) {
    //  store.remove(download);
    //  if (download.status == DownloadState.downloading || download.status == DownloadState.queue) {
    //    download.status = DownloadState.notDownloaded;
    //  }
    //  it - download;
    //});
  }

  void _removeFromQueueIf(bool Function(Download) predicate) {
    //_queueState.update((queue) {
    //  final downloads = queue.where((it) => predicate(it));
    //  store.removeAll(downloads);
    //  downloads.forEach((download) {
    //    if (download.status == DownloadState.downloading || download.status == DownloadState.queue) {
    //      download.status = DownloadState.notDownloaded;
    //    }
    //  });
    //  queue - downloads;
    //});
  }

  void removeChaptersFromQueue(List<Chapter> chapters) {
    final chapterIds = chapters.map((it) => it.id);
    _removeFromQueueIf((it) => chapterIds.contains(it.chapter.id));
  }

  void removeMangaFromQueue(Manga manga) {
    _removeFromQueueIf((it) => it.manga.id == manga.id);
  }

  void _clearQueue() {
    //_queueState.update((it) {
    //  it.forEach((download) {
    //    if (download.status == DownloadState.downloading || download.status == DownloadState.queue) {
    //      download.status = DownloadState.notDownloaded;
    //    }
    //  });
    //  store.clear();
    //  emptyList();
    //});
  }

  void updateQueue(List<Download> downloads) {
    final wasRunning = isRunning;

    if (downloads.isEmpty) {
      clearQueue();
      stop();
      return;
    }

    pause();
    _clearQueue();
    _addAllToQueue(downloads);

    if (wasRunning) {
      start();
    }
  }

  static const tmpDirSuffix = "_tmp";
  static const warningNotifTimeoutMs = 30000;
  static const chaptersPerSourceQueueWarningThreshold = 15;
  static const _downloadsQueuedWarningThreshold = 30;
}

// Arbitrary minimum required space to start a download: 200 MB
const _minDiskSpace = 200 * 1024 * 1024;
