import 'package:drift/drift.dart' as drift;
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:rxdart/rxdart.dart';

import 'package:flutteryomi/core/preference/preference.dart';
import 'package:flutteryomi/core/storage/disk_util.dart';
import 'package:flutteryomi/core/util/system/logger.dart';
import 'package:flutteryomi/domain/base/base_preferences.dart';
import 'package:flutteryomi/domain/chapter/interactor/update_chapter.dart';
import 'package:flutteryomi/domain/chapter/model/chapter_update.dart';
import 'package:flutteryomi/domain/download/download_manager.dart';
import 'package:flutteryomi/domain/download/model/download.dart';
import 'package:flutteryomi/domain/history/interactor/upsert_history.dart';
import 'package:flutteryomi/domain/history/model/history.dart';
import 'package:flutteryomi/domain/history/model/history_update.dart';
import 'package:flutteryomi/domain/manga/interactor/get_manga.dart';
import 'package:flutteryomi/domain/manga/interactor/set_manga_viewer_flags.dart';
import 'package:flutteryomi/domain/manga/model/manga.dart';
import 'package:flutteryomi/domain/reader/loader/chapter_loader.dart';
import 'package:flutteryomi/domain/reader/loader/download_page_loader.dart';
import 'package:flutteryomi/domain/reader/model/insert_page.dart';
import 'package:flutteryomi/domain/reader/model/reader_chapter.dart';
import 'package:flutteryomi/domain/reader/model/reader_page.dart';
import 'package:flutteryomi/domain/reader/model/viewer_chapters.dart';
import 'package:flutteryomi/domain/reader/setting/reader_orientation.dart';
import 'package:flutteryomi/domain/reader/setting/reader_preferences.dart';
import 'package:flutteryomi/domain/reader/setting/reading_mode.dart';
import 'package:flutteryomi/domain/source/model/page.dart';
import 'package:flutteryomi/domain/track/interactor/track_chapter.dart';
import 'package:flutteryomi/domain/track/service/track_preferences.dart';
import 'package:flutteryomi/presentation/reader/viewer/viewer.dart';
import 'package:flutteryomi/source/api/online/http_source.dart';
import 'package:flutteryomi/source/local/local_source.dart';

part 'reader_screen_model.freezed.dart';
part 'reader_screen_model.g.dart';

@riverpod
class ReaderScreenModel extends _$ReaderScreenModel {
  @override
  Stream<ReaderScreenState> build() {
    // To save state
    //state.map((it) => it.viewerChapters?.currChapter)
    //    .distinct()
    //    .whereNotNull()
    //    .onEach { currentChapter ->
    //        if (chapterPageIndex >= 0) {
    //            // Restore from SavedState
    //            currentChapter.requestedPage = chapterPageIndex
    //        } else if (!currentChapter.chapter.read) {
    //            currentChapter.requestedPage = currentChapter.chapter.last_page_read
    //        }
    //        chapterId = currentChapter.chapter.id!!
    //    }
    //    .launchIn(viewModelScope)
    return const Stream.empty();
  }

  ///// The chapter id of the currently loaded chapter. Used to restore from process kill.
  //private var chapterId = savedState.get<Long>("chapter_id") ?? -1
  //    set(value) {
  //        savedState["chapter_id"] = value
  //        field = value
  //    }

  ///// The visible page index of the currently loaded chapter. Used to restore from process kill.
  //private var chapterPageIndex = savedState.get<Int>("page_index") ?: -1
  //    set(value) {
  //        savedState["page_index"] = value
  //        field = value
  //    }

  ///// The chapter loader for the loaded manga. It'll be null until [manga] is set.
  //private var loader: ChapterLoader? = null

  ///// The time the chapter was started reading
  //private var chapterReadStartTime: Long? = null

  //private var chapterToDownload: Download? = null

  ///// Chapter list for the active manga. It's retrieved lazily and should be accessed for the first
  ///// time in a background thread to avoid blocking the UI.
  //private val chapterList by lazy {
  //    val manga = manga!!
  //    val chapters = runBlocking { getChaptersByMangaId.await(manga.id, applyScanlatorFilter = true) }

  //    val selectedChapter = chapters.find { it.id == chapterId }
  //        ?: error("Requested chapter of id $chapterId not found in chapter list")

  //    val chaptersForReader = when {
  //        (readerPreferences.skipRead().get() || readerPreferences.skipFiltered().get()) -> {
  //            val filteredChapters = chapters.filterNot {
  //                when {
  //                    readerPreferences.skipRead().get() && it.read -> true
  //                    readerPreferences.skipFiltered().get() -> {
  //                        (manga.unreadFilterRaw == Manga.CHAPTER_SHOW_READ && !it.read) ||
  //                            (manga.unreadFilterRaw == Manga.CHAPTER_SHOW_UNREAD && it.read) ||
  //                            (
  //                                manga.downloadedFilterRaw == Manga.CHAPTER_SHOW_DOWNLOADED &&
  //                                    !downloadManager.isChapterDownloaded(
  //                                        it.name, it.scanlator, manga.title, manga.source,
  //                                    )
  //                                ) ||
  //                            (
  //                                manga.downloadedFilterRaw == Manga.CHAPTER_SHOW_NOT_DOWNLOADED &&
  //                                    downloadManager.isChapterDownloaded(
  //                                        it.name, it.scanlator, manga.title, manga.source,
  //                                    )
  //                                ) ||
  //                            (manga.bookmarkedFilterRaw == Manga.CHAPTER_SHOW_BOOKMARKED && !it.bookmark) ||
  //                            (manga.bookmarkedFilterRaw == Manga.CHAPTER_SHOW_NOT_BOOKMARKED && it.bookmark)
  //                    }
  //                    else -> false
  //                }
  //            }

  //            if (filteredChapters.any { it.id == chapterId }) {
  //                filteredChapters
  //            } else {
  //                filteredChapters + listOf(selectedChapter)
  //            }
  //        }
  //        else -> chapters
  //    }

  //    chaptersForReader
  //        .sortedWith(getChapterSort(manga, sortDescending = false))
  //        .run {
  //            if (readerPreferences.skipDupe().get()) {
  //                removeDuplicates(selectedChapter)
  //            } else {
  //                this
  //            }
  //        }
  //        .run {
  //            if (basePreferences.downloadedOnly().get()) {
  //                filterDownloaded(manga)
  //            } else {
  //                this
  //            }
  //        }
  //        .map { it.toDbChapter() }
  //        .map(::ReaderChapter)
  //}

  //private val incognitoMode = preferences.incognitoMode().get();
  //private val downloadAheadAmount = downloadPreferences.autoDownloadWhileReading().get();

  //@override
  //void onCleared() {
  //  final currentChapters = state.valueOrNull?.viewerChapters;
  //  if (currentChapters != null) {
  //    currentChapters.unref()l
  //    chapterToDownload?.let {
  //        downloadManager.addDownloadsToStartOfQueue([it]);
  //    }
  //  }
  //}

  /// Called when the user pressed the back button and is going to leave the reader. Used to
  /// trigger deletion of the downloaded chapters.
  void onActivityFinish() =>_deletePendingChapters();

  /// Whether this presenter is initialized yet.
  bool needsInit() => state.valueOrNull?.manga == null;

  /// Initializes this presenter with the given [mangaId] and [initialChapterId]. This method will
  /// fetch the manga from the database and initialize the initial chapter.
  //Future<Result<bool>> init(int mangaId, int initialChapterId) async {
  //  if (!needsInit()) return Result.success(true);
  //  try {
  //    final manga = await getManga.await_(mangaId);
  //    if (manga != null) {
  //      sourceManager.isInitialized.first { it }
  //      mutableState.update { it.copy(manga = manga) }
  //      if (chapterId == -1) chapterId = initialChapterId;

  //      final context = Injekt.get<Application>();
  //      final source = sourceManager.getOrStub(manga.source);
  //      loader = ChapterLoader(context, downloadManager, downloadProvider, manga, source);

  //      _loadChapter(loader!, chapterList.first { chapterId == it.chapter.id })
  //      return Result.success(true);
  //    } else {
  //      // Unlikely but okay
  //      return Result.success(false);
  //    }
  //  } catch (e) {
  //    return Result.failure(e);
  //  }
  //}

  /// Loads the given [chapter] with this [loader] and updates the currently active chapters.
  /// Callers must handle errors.
  //Future<ViewerChapters> _loadChapter(
  //  ChapterLoader loader,
  //  ReaderChapter chapter,
  //) async {
  //  loader.loadChapter(chapter);

  //  final chapterPos = chapterList.indexOf(chapter);
  //  final newChapters = ViewerChapters(
  //      chapter,
  //      chapterList.getOrNull(chapterPos - 1),
  //      chapterList.getOrNull(chapterPos + 1),
  //  );

  //  mutableState.update {
  //      // Add new references first to avoid unnecessary recycling
  //      newChapters.ref()
  //      it.viewerChapters?.unref()

  //      chapterToDownload = cancelQueuedDownloads(newChapters.currChapter)
  //      it.copy(
  //          viewerChapters = newChapters,
  //          bookmarked = newChapters.currChapter.chapter.bookmark,
  //      )
  //  }
  //  return newChapters;
  //}

  /// Called when the user changed to the given [chapter] when changing pages from the viewer.
  /// It's used only to set this chapter as active.
  void _loadNewChapter(ReaderChapter chapter) {
    final logger = ref.watch(loggerProvider);
    //final loader = loader ?? return;

    //logger.i("Loading ${chapter.chapter.url}");

    //flushReadTimer();
    //restartReadTimer();

    //try {
    //  _loadChapter(loader, chapter);
    //} catch (e) {
    //  logger.e(e);
    //}
  }

  /// Called when the user is going to load the prev/next chapter through the toolbar buttons.
  Future<void> _loadAdjacent(ReaderChapter chapter) async {
    final logger = ref.watch(loggerProvider);
    //final loader = loader ?? return;

    //logger.i("Loading adjacent ${chapter.chapter.url}");
    //final previousState = state.valueOrNull;
    //if (previousState != null) {
    //  state = await AsyncValue.guard(
    //    () async => previousState.copyWith(isLoadingAdjacentChapter: true),
    //  );
    //  try {
    //    _loadChapter(loader, chapter);
    //  } catch (e) {
    //    logger.e(e);
    //  } finally {
    //    state = await AsyncValue.guard(
    //      () async => previousState.copyWith(isLoadingAdjacentChapter: false),
    //    );
    //  }
    //}
  }

  /// Called when the viewers decide it's a good time to preload a [chapter] and improve the UX so
  /// that the user doesn't have to wait too long to continue reading.
  Future<void> preload(ReaderChapter chapter) async {
    //final downloadManager = ref.watch(downloadManagerProvider);
    //final logger = ref.watch(loggerProvider);
    //if (chapter.state is ReaderChapterStateLoaded || chapter.state is ReaderChapterStateLoading) return;

    //if (chapter.pageLoader?.isLocal == false) {
    //  final manga = state.valueOrNull?.manga;
    //  if (manga == null) return;
    //  final dbChapter = chapter.chapter;
    //  final isDownloaded = downloadManager.isChapterDownloaded(
    //    dbChapter.name,
    //    dbChapter.scanlator,
    //    manga.title,
    //    manga.source,
    //    skipCache: true,
    //  );
    //  if (isDownloaded) {
    //    chapter.state = const ReaderChapterState.wait();
    //  }
    //}

    //if (chapter.state is! ReaderChapterStateWait && chapter.state is! ReaderChapterStateError) return;

    //final loader = loader ?? return;
    //try {
    //  logger.i("Preloading ${chapter.chapter.url}");
    //  loader.loadChapter(chapter);
    //} catch (_) {}
    ////eventChannel.trySend(Event.ReloadViewerChapters);
  }

  void onViewerLoaded(Viewer? viewer) async {
    final previousState = state.valueOrNull;
    if (previousState != null) {
      state = await AsyncValue.guard(
        () async => previousState.copyWith(viewer: viewer),
      );
    }
  }

  /// Called every time a page changes on the reader. Used to mark the flag of chapters being
  /// read, update tracking services, enqueue downloaded chapter deletion, and updating the active chapter if this
  /// [page]'s chapter is different from the currently active.
  void onPageSelected(ReaderPage page) {
    final logger = ref.watch(loggerProvider);
    // InsertPage doesn't change page progress
    if (page is InsertPage) return;

    final selectedChapter = page.chapter;
    final pages = selectedChapter.pages;
    if (pages == null) return;

    // Save last page read and mark as read if needed
    _updateChapterProgress(selectedChapter, page);

    if (selectedChapter != _getCurrentChapter()) {
      logger.i("Setting ${selectedChapter.chapter.url} as active");
      _loadNewChapter(selectedChapter);
    }

    final inDownloadRange = page.number.toDouble() / pages.length > 0.25;
    if (inDownloadRange) _downloadNextChapters();

    //eventChannel.trySend(Event.PageChanged)
  }

  //TODO
  void _downloadNextChapters() async {
    final downloadManager = ref.watch(downloadManagerProvider);
    //if (downloadAheadAmount == 0) return;
    //val manga = manga ?: return

    //// Only download ahead if current + next chapter is already downloaded too to avoid jank
    //if (_getCurrentChapter()?.pageLoader is! DownloadPageLoader) return;;
    //val nextChapter = state.value.viewerChapters?.nextChapter?.chapter ?: return;

    //final isNextChapterDownloaded = downloadManager.isChapterDownloaded(
    //  nextChapter.name,
    //  nextChapter.scanlator,
    //  manga.title,
    //  manga.source,
    //);
    //if (!isNextChapterDownloaded) return;

    //final chaptersToDownload = await getNextChapters.await_(manga.id, nextChapter.id!).run {
    //    if (readerPreferences.skipDupe().get()) {
    //        removeDuplicates(nextChapter.toDomainChapter()!!)
    //    } else {
    //        this
    //    }
    //}.take(downloadAheadAmount);

    //downloadManager.downloadChapters(manga, chaptersToDownload);
  }

  //TODO
  /// Removes [currentChapter] from download queue
  /// if setting is enabled and [currentChapter] is queued for download
  Download? _cancelQueuedDownloads(ReaderChapter currentChapter) {
    final downloadManager = ref.watch(downloadManagerProvider);
    final queuedDownload = downloadManager.getQueuedDownloadOrNull(currentChapter.chapter.id);
    if (queuedDownload != null) downloadManager.cancelQueuedDownloads([queuedDownload]);
    return queuedDownload;
  }

  //TODO: Drift setter
  /// Saves the chapter progress (last read page and whether it's read)
  /// if incognito mode isn't on.
  Future<void> _updateChapterProgress(ReaderChapter readerChapter, Page page) async {
    final updateChapter = ref.watch(updateChapterProvider);
    final pageIndex = page.index;

    final previousState = state.valueOrNull;
    if (previousState != null) {
      state = await AsyncValue.guard(
        () async => previousState.copyWith(currentPage: pageIndex + 1),
      );
    }

    readerChapter.requestedPage = pageIndex;
    //chapterPageIndex = pageIndex;

    //if (!incognitoMode && page.status != PageState.error) {
    ////  readerChapter.chapter.lastPageRead = pageIndex;

    //  if (readerChapter.pages?.lastIndex == pageIndex) {
    //    readerChapter.chapter.read = true;
    //    _updateTrackChapterRead(readerChapter);
    //    deleteChapterIfNeeded(readerChapter);
    //  }

    //  await updateChapter.await_(
    //    ChapterUpdate(
    //      id: drift.Value(readerChapter.chapter.id!),
    //      read: drift.Value(readerChapter.chapter.read),
    //      lastPageRead: drift.Value(readerChapter.chapter.lastPageRead),
    //    ),
    //  );
    //}
  }

  //TODO
  void restartReadTimer() {
    //chapterReadStartTime = DateTime.now().millisecondsSinceEpoch;
  }

  void flushReadTimer() {
    final currChapter = _getCurrentChapter();
    if (currChapter != null) _updateHistory(currChapter);
  }

  //TODO
  /// Saves the chapter last read history if incognito mode isn't on.
  Future<void> _updateHistory(ReaderChapter readerChapter) async {
    //final upsertHistory = ref.watch(upsertHistoryProvider);
    //if (incognitoMode) return;

    //final chapterId = readerChapter.chapter.id!;
    //final endTime = DateTime.now();
    //final sessionReadDuration = chapterReadStartTime != null
    //    ? endTime.time - chapterReadStartTime
    //    : 0;

    //await upsertHistory.await_(
    //  History(chapterId: chapterId, readAt: endTime, readDuration: sessionReadDuration)
    //);
    //chapterReadStartTime = null;
  }

  /// Called from the activity to load and set the next chapter as active.
  Future<void> loadNextChapter() async {
    final nextChapter = state.valueOrNull?.viewerChapters?.nextChapter;
    if (nextChapter == null) return;
    await _loadAdjacent(nextChapter);
  }

  /// Called from the activity to load and set the previous chapter as active.
  Future<void> loadPreviousChapter() async {
    final prevChapter = state.valueOrNull?.viewerChapters?.prevChapter;
    if (prevChapter == null) return;
    await _loadAdjacent(prevChapter);
  }

  //TODO
  /// Returns the currently active chapter.
  //ReaderChapter? _getCurrentChapter() => state.valueOrNull?.currentChapter;
  ReaderChapter? _getCurrentChapter() => null;

  //TODO
  HttpSource? getSource() {
    return null;
    //manga?.source?.let { sourceManager.getOrStub(it) } as? HttpSource
  }

  String? getChapterUrl() {
    final logger = ref.watch(loggerProvider);
    final sChapter = _getCurrentChapter()?.chapter;
    if (sChapter == null) return null;
    final source = getSource();
    if (source == null) return null;

    try {
      //TODO
      //return source.getChapterUrl(sChapter);
      return null;
    } catch (e) {
      logger.e(e);
      return null;
    }
  }

  //TODO: Setter for chapter.bookmark
  /// Bookmarks the currently active chapter.
  void toggleChapterBookmark() async {
    final updateChapter = ref.watch(updateChapterProvider);
    final chapter = _getCurrentChapter()?.chapter;
    if (chapter == null) return;
    final bookmarked = !chapter.bookmark;
    //chapter.bookmark = bookmarked;

    await updateChapter.await_(
      ChapterUpdate(
        id: drift.Value(chapter.id),
        bookmark: drift.Value(bookmarked),
      ),
    );

    final previousState = state.valueOrNull;
    if (previousState != null) {
      state = await AsyncValue.guard(
        () async => previousState.copyWith(bookmarked: bookmarked),
      );
    }
  }

  /// Returns the viewer position used by this manga or the default one.
  int getMangaReadingMode([bool resolveDefault = true]) {
    final readerPreferences = ref.watch(readerPreferencesProvider);
    final default_ = readerPreferences.defaultReadingMode().get();
    final manga = state.valueOrNull?.manga;
    final readingMode = ReadingMode.fromPreference(manga?.readingMode);
    if (resolveDefault && readingMode == ReadingMode.default_) {
      return default_;
    } else {
      return manga?.readingMode ?? default_;
    }
  }

  /// Updates the viewer position for the open manga.
  void setMangaReadingMode(ReadingMode readingMode) async {
    final getManga = ref.watch(getMangaProvider);
    final setMangaViewerFlags = ref.watch(setMangaViewerFlagsProvider);
    final previousState = state.valueOrNull;
    if (previousState != null) {
      final manga = previousState.manga;
      if (manga == null) return;
      await setMangaViewerFlags.awaitSetReadingMode(manga.id, readingMode.flagValue);
      final currChapters = previousState.viewerChapters;
      if (currChapters != null) {
        // Save current page
        final currChapter = currChapters.currChapter;
        currChapter.requestedPage = currChapter.chapter.lastPageRead;
        state = await AsyncValue.guard(
          () async => previousState.copyWith(
                manga: await getManga.await_(manga.id),
                viewerChapters: currChapters,
              ),
        );
        //eventChannel.send(Event.ReloadViewerChapters)
      }
    }
  }

  /// Returns the orientation type used by this manga or the default one.
  int getMangaOrientation([bool resolveDefault = true]) {
    final readerPreferences = ref.watch(readerPreferencesProvider);
    final default_ = readerPreferences.defaultOrientationType().get();
    final manga = state.valueOrNull?.manga;
    final orientation = ReaderOrientation.fromPreference(manga?.readerOrientation);
    if (resolveDefault && orientation == ReaderOrientation.default_) {
      return default_;
    } else {
      return manga?.readerOrientation ?? default_;
    }
  }

  /// Updates the orientation type for the open manga.
  void setMangaOrientationType(ReaderOrientation orientation) async {
    final getManga = ref.watch(getMangaProvider);
    final setMangaViewerFlags = ref.watch(setMangaViewerFlagsProvider);
    final previousState = state.valueOrNull;
    if (previousState != null) {
      final manga = previousState.manga;
      if (manga == null) return;
      await setMangaViewerFlags.awaitSetOrientation(manga.id, orientation.flagValue);
      final currChapters = previousState.viewerChapters;
      if (currChapters != null) {
        // Save current page
        final currChapter = currChapters.currChapter;
        currChapter.requestedPage = currChapter.chapter.lastPageRead;
        state = await AsyncValue.guard(
          () async => previousState.copyWith(
                manga: await getManga.await_(manga.id),
                viewerChapters: currChapters,
              ),
        );
        //eventChannel.send(Event.SetOrientation(getMangaOrientation()))
        //eventChannel.send(Event.ReloadViewerChapters)
      }
    }
  }

  bool toggleCropBorders() {
    final readerPreferences = ref.watch(readerPreferencesProvider);
    final isPagerType = ReadingMode.isPagerType(getMangaReadingMode());
    return isPagerType
        ? readerPreferences.cropBorders().toggle()
        : readerPreferences.cropBordersWebtoon().toggle();
  }

  //TODO: Consideration for filename bytes
  /// Generate a filename for the given [manga] and [page]
  String _generateFilename(Manga manga, ReaderPage page) {
    final chapter = page.chapter.chapter;
    final filenameSuffix = " - ${page.number}";
    return DiskUtil.buildValidFilename(
      //"${manga.title} - ${chapter.name}".takeBytes(DiskUtil.maxFileNameBytes - filenameSuffix.byteSize()),
      "${manga.title} - ${chapter.name}".substring(0, 250),
    ) + filenameSuffix;
  }

  void showMenus(bool visible) async {
    final previousState = state.valueOrNull;
    if (previousState != null) {
      state = await AsyncValue.guard(
        () async => previousState.copyWith(menuVisible: visible),
      );
    }
  }

  void setBrightnessOverlayValue(int value) async {
    final previousState = state.valueOrNull;
    if (previousState != null) {
      state = await AsyncValue.guard(
        () async => previousState.copyWith(brightnessOverlayValue: value),
      );
    }
  }

  /// Saves the image of the selected page on the pictures directory and notifies the UI of the result.
  /// There's also a notification to allow sharing the image somewhere else or deleting it.
  void saveImage(ReaderPage page) {
    final readerPreferences = ref.watch(readerPreferencesProvider);
    if (page.status != PageState.ready) return;
    final manga = state.valueOrNull?.manga;
    if (manga == null) return;

    //final context = Injekt.get<Application>();
    //final notifier = SaveImageNotifier(context);
    //notifier.onClear();

    final filename = _generateFilename(manga, page);

    // Pictures directory.
    final relativePath = readerPreferences.folderPerManga().get()
        ? DiskUtil.buildValidFilename(manga.title)
        : "";

    //try {
    //  final uri = imageSaver.save(
    //    image: ImagePage(
    //      inputStream: page.stream!,
    //      name: filename,
    //      location: Location.Pictures.create(relativePath),
    //    ),
    //  );
    //  notifier.onComplete(uri);
    //  eventChannel.send(Event.SavedImage(SaveImageResult.Success(uri)));
    //} catch (e) {
    //  //notifier.onError(e.message);
    //  //eventChannel.send(Event.SavedImage(SaveImageResult.Error(e)));
    //}
  }

  //TODO
  /// Shares the image of the selected page and notifies the UI with the path of the file to share.
  /// The image must be first copied to the internal partition because there are many possible
  /// formats it can come from, like a zipped chapter, in which case it's not possible to directly
  /// get a path to the file and it has to be decompressed somewhere first. Only the last shared
  /// image will be kept so it won't be taking lots of internal disk space.
  void shareImage(ReaderPage page) {
    //final logger = ref.watch(loggerProvider);
    if (page.status != PageState.ready) return;
    final manga = state.valueOrNull?.manga;
    if (manga == null) return;

    //final context = Injekt.get<Application>();
    //final destDir = context.cacheImageDir;

    final filename = _generateFilename(manga, page);

    //try {
    //  destDir.deleteRecursively();
    //  final uri = imageSaver.save(
    //    image = ImagePage(
    //      inputStream: page.stream!,
    //      name: filename,
    //      location: LocationCache,
    //    ),
    //  )
    //  //eventChannel.send(EventShareImage(uri, page));
    //} catch (e) {
    //  logger.e(e);
    //}
  }

  //TODO
  /// Sets the image of the selected page as cover and notifies the UI of the result.
  void setAsCover(ReaderPage page) {
    if (page.status != PageState.ready) return;
    final manga = state.valueOrNull?.manga;
    if (manga == null) return;
    final stream = page.stream;
    if (stream == null) return;

    //final SetAsCoverResult result;
    //try {
    //  manga.editCover(Injekt.get(), stream());
    //  if (manga.isLocal() || manga.favorite) {
    //    result = SetAsCoverResult.success;
    //  } else {
    //    result = SetAsCoverResult.addToLibraryFirst;
    //  }
    //} catch (_) {
    //  result = SetAsCoverResult.error;
    //}
    //eventChannel.send(Event.SetCoverResult(result));
  }

  /// Starts the service that updates the last chapter read in sync services. This operation
  /// will run in a background thread and errors are ignored.
  void _updateTrackChapterRead(ReaderChapter readerChapter) {
    final preferences = ref.watch(basePreferencesProvider);
    final trackPreferences = ref.watch(trackPreferencesProvider);
    final trackChapter = ref.watch(trackChapterProvider);
    final incognitoMode = preferences.incognitoMode().get();
    if (incognitoMode) return;
    if (!trackPreferences.autoUpdateTrack().get()) return;

    final manga = state.valueOrNull?.manga;
    if (manga == null) return;

    trackChapter.await_(manga.id, readerChapter.chapter.chapterNumber);
  }

  /// Enqueues this [chapter] to be deleted when [_deletePendingChapters] is called. The download
  /// manager handles persisting it across process deaths.
  void _enqueueDeleteReadChapters(ReaderChapter chapter) {
    if (!chapter.chapter.read) return;
    final downloadManager = ref.watch(downloadManagerProvider);
    final manga = state.valueOrNull?.manga;
    if (manga == null) return;

    downloadManager.enqueueChaptersToDelete([chapter.chapter], manga);
  }

  /// Deletes all the pending chapters. This operation will run in a background thread and errors
  /// are ignored.
  void _deletePendingChapters() {
    final downloadManager = ref.watch(downloadManagerProvider);
    downloadManager.deletePendingChapters();
  }
}

@freezed
class ReaderScreenState with _$ReaderScreenState {
  const ReaderScreenState._();

  @Assert('brightnessOverlayValue >= -100')
  @Assert('brightnessOverlayValue <= 100')
  const factory ReaderScreenState({
    /// The manga loaded in the reader.
    Manga? manga,
    ViewerChapters? viewerChapters,
    @Default(false) bool bookmarked,
    @Default(false) bool isLoadingAdjacentChapter,
    @Default(-1) int currentPage,

    /// Viewer used to display the pages (pager, webtoon, ...).
    Viewer? viewer,
    @Default(false) bool menuVisible,
    @Default(0) int brightnessOverlayValue,
  }) = _ReaderScreenState;
}
