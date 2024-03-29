import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:rxdart/rxdart.dart';

import 'package:flutteryomi/core/storage/disk_util.dart';
import 'package:flutteryomi/core/util/system/logger.dart';
import 'package:flutteryomi/domain/base/base_preferences.dart';
import 'package:flutteryomi/domain/download/download_manager.dart';
import 'package:flutteryomi/domain/manga/model/manga.dart';
import 'package:flutteryomi/domain/reader/model/reader_chapter.dart';
import 'package:flutteryomi/domain/reader/model/reader_page.dart';
import 'package:flutteryomi/domain/reader/model/viewer_chapters.dart';
import 'package:flutteryomi/domain/reader/setting/reader_preferences.dart';
import 'package:flutteryomi/domain/source/model/page.dart';
import 'package:flutteryomi/domain/track/interactor/track_chapter.dart';
import 'package:flutteryomi/domain/track/service/track_preferences.dart';
import 'package:flutteryomi/presentation/reader/viewer/viewer.dart';
import 'package:flutteryomi/source/local/local_source.dart';

part 'reader_screen_model.freezed.dart';
part 'reader_screen_model.g.dart';

@riverpod
class ReaderScreenModel extends _$ReaderScreenModel {
  @override
  Stream<ReaderScreenState> build() {
//    final downloadManager = ref.watch(downloadManagerProvider);
//    final getMangaWithChapters = ref.watch(getMangaWithChaptersProvider);
//    final getExcludedScanlators = ref.watch(getExcludedScanlatorsProvider);
//    final getAvailableScanlators = ref.watch(getAvailableScanlatorsProvider);
//    final sourceManager = ref.watch(sourceManagerProvider);
//    final stream1 = Rx.combineLatest2(
//      getMangaWithChapters
//          .subscribe(mangaId, applyScanlatorFilter: true)
//          .distinct(),
//      //TODO
//      //downloadCache.changes,
//      downloadManager.queueState as Stream<List<Download>>,
//      (mangaAndChapters, _) {
//        final manga = mangaAndChapters.first;
//        return (
//          manga: manga,
//          chapters: mangaAndChapters.second.toChapterListItems(
//            downloadManager,
//            manga,
//            state.valueOrNull?.selectedChapterIds ?? {},
//          ),
//        );
//      },
//    );

//    final stream2 = getExcludedScanlators.subscribe(mangaId).distinct();
//    final stream3 = getAvailableScanlators.subscribe(mangaId).distinct();

//    _observeDownloads();

//    final manga = state.valueOrNull?.manga;
//    if (manga != null && !manga.favorite) {
//      _setMangaDefaultChapterFlags(manga);
//    }

//    // Start observe tracking since it only needs mangaId
//    _observeTrackers();

//    //return Rx.combineLatest3(
//    //  stream1,
//    //  stream2,
//    //  stream3,
//    //  (mangaAndChapters, excludedScanlators, availableScanlators) {
//    //    final (manga: manga, chapters: chapters) = mangaAndChapters;
//    //    return ReaderScreenState(
//    //      manga: manga,
//    //      source: sourceManager.getOrStub(manga.source),
//    //      isFromSource: isFromSource,
//    //      chapters: chapters,
//    //      excludedScanlators: excludedScanlators,
//    //      availableScanlators: availableScanlators,
//    //    );
//    //  }
//    //);
//    return Rx.combineLatestList([
//      stream1,
//      stream2,
//      stream3,
//    ]).asyncMap((e) async {
//      final mangaAndChapters =
//          e.first as ({List<ChapterListItem> chapters, Manga manga});
//      final excludedScanlators = e.second as Set<String>;
//      final availableScanlators = e.third as Set<String>;
//      final (manga: manga, chapters: chapters) = mangaAndChapters;
//      return ReaderScreenState(
//        manga: manga,
//        source: await sourceManager.getOrStub(manga.source),
//        isFromSource: isFromSource,
//        chapters: chapters,
//        excludedScanlators: excludedScanlators,
//        availableScanlators: availableScanlators,
//      );
//    });
    return const Stream.empty();
  }

//  void _setMangaDefaultChapterFlags(Manga manga) async {
//    final setMangaDefaultChapterFlags =
//        ref.watch(setMangaDefaultChapterFlagsProvider);
//    await setMangaDefaultChapterFlags.await_(manga);
//  }

//  bool get _isFavorited => state.valueOrNull?.manga.favorite ?? false;

//  List<ChapterListItem>? get _allChapters => state.valueOrNull?.chapters;

//  List<ChapterListItem>? get _filteredChapters =>
//      state.valueOrNull?.processedChapters;

//  void fetchAllFromSource([bool manualFetch = true]) async {
//    //updateSuccessState { it.copy(isRefreshingData = true) }
//    //final fetchFromSourceTasks = [
//    //    async { _fetchMangaFromSource(manualFetch) },
//    //    async { fetchChaptersFromSource(manualFetch) },
//    //]
//    //await fetchFromSourceTasks.awaitAll();
//    //updateSuccessState { it.copy(isRefreshingData = false) }
//  }

//  // Manga info - start

//  /// Fetch manga information from source.
//  Future<void> _fetchMangaFromSource([bool manualFetch = false]) async {
//    final logger = ref.watch(loggerProvider);
//    final updateManga = ref.watch(updateMangaProvider);
//    final previousState = state.valueOrNull;
//    if (previousState != null) {
//      try {
//        //Deprecated?
//        //final networkManga = previousState.source.getMangaDetails(previousState.manga.toSManga());
//        //updateManga.awaitUpdateFromSource(previousState.manga, networkManga, manualFetch);
//      } catch (e) {
//        // Ignore early hints "errors" that aren't handled by OkHttp or any future client
//        //if (e is HttpException && e.code == 103) return
//        logger.e(e);
//        //snackbarHostState.showSnackbar(message = with(context) { e.formattedMessage })
//      }
//    }
//  }

//  void toggleFavorite() {
//    toggleFavoriteWithCallback(
//      onRemoved: () {
//        if (!_hasDownloads()) return;
//        //final result = snackbarHostState.showSnackbar(
//        //  message: lang.delete_downloads_for_manga,
//        //  actionLabel: lang.action_delete,
//        //  withDismissAction: true,
//        //)
//        //if (result == SnackbarResult.ActionPerformed) {
//        //  _deleteDownloads();
//        //}
//      },
//    );
//  }

//  /// Update favorite status of manga, (removes / adds) manga (to / from) library.
//  void toggleFavoriteWithCallback({
//    required VoidCallback onRemoved,
//    bool checkDuplicate = true,
//  }) async {
//    final addTracks = ref.watch(addTracksProvider);
//    final getDuplicateLibraryManga =
//        ref.watch(getDuplicateLibraryMangaProvider);
//    final libraryPreferences = ref.watch(libraryPreferencesProvider);
//    final updateManga = ref.watch(updateMangaProvider);
//    final previousState = state.valueOrNull;
//    if (previousState != null) {
//      final manga = previousState.manga;

//      if (_isFavorited) {
//        // Remove from library
//        if (await updateManga.awaitUpdateFavorite(manga.id, false)) {
//          // Remove covers and update last modified in db
//          if (manga.removeCovers() != manga) {
//            await updateManga.awaitUpdateCoverLastModified(manga.id);
//          }
//          onRemoved();
//        }
//      } else {
//        // Add to library
//        // First, check if duplicate exists if callback is provided
//        if (checkDuplicate) {
//          final duplicates = await getDuplicateLibraryManga.await_(manga);
//          final duplicate = duplicates.firstOrNull;
//          //TODO:
//          //launch duplicatedialog
//          //updateSuccessState { it.copy(dialog = Dialog.DuplicateManga(manga, duplicate)) }
//          return;
//        }

//        // Now check if user previously set categories, when available
//        final categories = await getCategories();
//        final defaultCategoryId =
//            libraryPreferences.defaultCategory().get().toInt();
//        final defaultCategory =
//            categories.firstWhereOrNull((it) => it.id == defaultCategoryId);
//        // Default category set
//        if (defaultCategory != null) {
//          final result = await updateManga.awaitUpdateFavorite(manga.id, true);
//          if (!result) return;
//          _moveMangaToCategoryWithCategory(defaultCategory);
//          // Automatic 'Default' or no categories
//        } else if (defaultCategoryId == 0 || categories.isEmpty) {
//          final result = await updateManga.awaitUpdateFavorite(manga.id, true);
//          if (!result) return;
//          _moveMangaToCategoryWithCategory(null);
//        }

//        // Finally match with enhanced tracking when available
//        addTracks.bindEnhancedTrackers(manga, previousState.source);
//      }
//    }
//  }

//  void setFetchInterval(Manga manga, int interval) async {
//    final fetchInterval = ref.watch(fetchIntervalProvider);
//    final mangaRepository = ref.watch(mangaRepositoryProvider);
//    final updateManga = ref.watch(updateMangaProvider);
//    final now = DateTime.now();
//    if (await updateManga.awaitUpdateFetchInterval(
//      // Custom intervals are negative
//      manga.copyWith(fetchInterval: -interval),
//      now,
//      fetchInterval.getWindow(now),
//    )) {
//      final updatedManga = await mangaRepository.getMangaById(manga.id);
//      final previousState = state.valueOrNull;
//      if (previousState != null) {
//        final newState = previousState.copyWith(manga: updatedManga);
//        state = await AsyncValue.guard(() async => newState);
//      }
//    }
//  }

//  /// Returns true if the manga has any downloads.
//  bool _hasDownloads() {
//    final downloadManager = ref.watch(downloadManagerProvider);
//    final previousState = state.valueOrNull;
//    if (previousState == null) {
//      return false;
//    } else {
//      final manga = previousState.manga;
//      return downloadManager.getDownloadCountForManga(manga) > 0;
//    }
//  }

//  /// Deletes all the downloads for the manga.
//  void _deleteDownloads() {
//    final downloadManager = ref.watch(downloadManagerProvider);
//    final previousState = state.valueOrNull;
//    if (previousState == null) {
//      return;
//    } else {
//      downloadManager.deleteManga(previousState.manga, previousState.source);
//    }
//  }

//  /// Get user categories, not including the default category.
//  Future<List<Category>> getCategories() async {
//    final getCategories = ref.watch(getCategoriesProvider);
//    final categories = await getCategories.await_();
//    return categories.whereNot((it) => it.isSystemCategory).toList();
//  }

//  /// Gets the category id's the manga is in, if the manga is not in a category, returns the default id.
//  Future<List<int>> getMangaCategoryIds(Manga manga) async {
//    final getCategories = ref.watch(getCategoriesProvider);
//    final categories = await getCategories.await_(manga.id);
//    return categories.map((it) => it.id).toList();
//  }

//  void moveMangaToCategoriesAndAddToLibrary(
//    Manga manga,
//    List<int> categories,
//  ) async {
//    final updateManga = ref.watch(updateMangaProvider);
//    _moveMangaToCategory(categories);
//    if (manga.favorite) return;

//    await updateManga.awaitUpdateFavorite(manga.id, true);
//  }

//  /// Move the given manga to categories.
//  void _moveMangaToCategories(List<Category> categories) {
//    final categoryIds = categories.map((it) => it.id).toList();
//    _moveMangaToCategory(categoryIds);
//  }

//  void _moveMangaToCategory(List<int> categoryIds) async {
//    final setMangaCategories = ref.watch(setMangaCategoriesProvider);
//    await setMangaCategories.await_(mangaId, categoryIds);
//  }

//  /// Move the given manga to the category.
//  void _moveMangaToCategoryWithCategory(Category? category) {
//    _moveMangaToCategories([category].whereNotNull().toList());
//  }

//  // Manga info - end

//  // Chapters list - start

//  //TODO
//  void _observeDownloads() {
//    final downloadManager = ref.watch(downloadManagerProvider);
//    final logger = ref.watch(loggerProvider);
//    final previousState = state.valueOrNull;
//    if (previousState != null) {
//      downloadManager
//          .statusStream()
//          .where((it) => it.manga.id == previousState.manga.id)
//          .handleError((error) => logger.e(error))
//          .forEach(_updateDownloadState);

//      downloadManager
//          .progressStream()
//          .where((it) => it.manga.id == previousState.manga.id)
//          .handleError((error) => logger.e(error))
//          .forEach(_updateDownloadState);
//    }
//  }

//  void _updateDownloadState(Download download) async {
//    final previousState = state.valueOrNull;
//    if (previousState != null) {
//      final modifiedIndex = previousState.chapters
//          .indexWhere((it) => it.id == download.chapter.id);
//      if (modifiedIndex < 0) return;

//      final newChapters = previousState.chapters;
//      final item = newChapters.removeAt(modifiedIndex).copyWith(
//          downloadState: download.status, downloadProgress: download.progress);
//      newChapters.insert(modifiedIndex, item);
//      final newState = previousState.copyWith(chapters: newChapters);
//      state = await AsyncValue.guard(() async => newState);
//    }
//  }

//  /// Requests an updated list of chapters from the source.
//  Future<void> _fetchChaptersFromSource([bool manualFetch = false]) async {
//    final logger = ref.watch(loggerProvider);
//    final mangaRepository = ref.watch(mangaRepositoryProvider);
//    final syncChaptersWithSource = ref.watch(syncChaptersWithSourceProvider);
//    final previousState = state.valueOrNull;
//    if (previousState != null) {
//      try {
//        //Deprecated?
//        //final chapters = previousState.source.getChapterList(previousState.manga.toSManga());
//        //final newChapters = await syncChaptersWithSource.await_(
//        //  chapters,
//        //  previousState.manga,
//        //  previousState.source,
//        //  manualFetch,
//        //);

//        //if (manualFetch) downloadNewChapters(newChapters);
//      } catch (e) {
//        //final message = if (e is NoChaptersException) {
//        //  lang.no_chapters_error;
//        //} else {
//        //  logger.e(e);
//        //  //with(context) { e.formattedMessage }
//        //}

//        //screenModelScope.launch {
//        //    snackbarHostState.showSnackbar(message = message)
//        //}
//        final newManga = await mangaRepository.getMangaById(mangaId);
//        final newState = previousState.copyWith(manga: newManga);
//        state = await AsyncValue.guard(() async => newState);
//      }
//    }
//  }

//  //TODO
//  /// Throws an IllegalStateException if the swipe action is LibraryPreferences.ChapterSwipeAction.disabled
//  void chapterSwipe(
//    ChapterListItem chapterItem,
//    ChapterSwipeAction swipeAction,
//  ) {
//    final chapter = chapterItem.chapter;
//    switch (swipeAction) {
//      case ChapterSwipeAction.toggleRead:
//        markChaptersRead([chapter], !chapter.read);
//      case ChapterSwipeAction.toggleBookmark:
//        bookmarkChapters([chapter], !chapter.bookmark);
//      case ChapterSwipeAction.download:
//        final downloadAction = switch (chapterItem.downloadState) {
//          DownloadState.error ||
//          DownloadState.notDownloaded =>
//            ChapterDownloadAction.startNow,
//          DownloadState.queue ||
//          DownloadState.downloading =>
//            ChapterDownloadAction.cancel,
//          DownloadState.downloaded => ChapterDownloadAction.delete,
//        };
//        runChapterDownloadActions([chapterItem], downloadAction);
//      case ChapterSwipeAction.disabled:
//      //throw IllegalStateException();
//    }
//  }

//  /// Returns the next unread chapter or null if everything is read.
//  Chapter? getNextUnreadChapter() {
//    final previousState = state.valueOrNull;
//    if (previousState != null) {
//      return previousState.chapters.getNextUnread(previousState.manga);
//    } else {
//      return null;
//    }
//  }

//  //TODO
//  List<Chapter> _getUnreadChapters() {
//    //final readerPreferences = ref.watch(readerPreferencesProvider);
//    //final skipFiltered = readerPreferences.skipFiltered().get();
//    //  final chapterItems = skipFiltered ? filteredChapters.orEmpty() : allChapters.orEmpty();
//    //  return chapterItems
//    //      .where((chapter, dlStatus) => !chapter.read && dlStatus == DownloadState.notDownloaded)
//    //      .map((it) => it.chapter);
//    return [];
//  }

//  List<Chapter> _getUnreadChaptersSorted() {
//    final previousState = state.valueOrNull;
//    if (previousState != null) {
//      final manga = previousState.manga;
//      final chaptersSorted = _getUnreadChapters().sortedWith(
//        getChapterSort(manga: manga),
//      );
//      return manga.sortDescending()
//          ? chaptersSorted.reversed.toList()
//          : chaptersSorted.toList();
//    } else {
//      return [];
//    }
//  }

//  void _startDownload(List<Chapter> chapters, bool startNow) async {
//    final downloadManager = ref.watch(downloadManagerProvider);
//    final previousState = state.valueOrNull;
//    if (previousState != null) {
//      if (startNow) {
//        final chapterId = chapters.singleOrNull?.id;
//        if (chapterId == null) return;
//        downloadManager.startDownloadNow(chapterId);
//      } else {
//        _downloadChapters(chapters);
//      }

//      if (!_isFavorited && !previousState.hasPromptedToAddBefore) {
//        final newState = previousState.copyWith(hasPromptedToAddBefore: true);
//        state = await AsyncValue.guard(() async => newState);
//        //final result = snackbarHostState.showSnackbar(
//        //  message: lang.snack_add_to_library,
//        //  actionLabel: lang.action_add,
//        //  withDismissAction: true,
//        //)
//        //if (result == SnackbarResult.ActionPerformed && !_isFavorited) {
//        //  toggleFavorite();
//        //}
//      }
//    }
//  }

//  void runChapterDownloadActions(
//    List<ChapterListItem> items,
//    ChapterDownloadAction action,
//  ) {
//    final downloadManager = ref.watch(downloadManagerProvider);
//    switch (action) {
//      case ChapterDownloadAction.start:
//        _startDownload(items.map((it) => it.chapter).toList(), false);
//        if (items.any((it) => it.downloadState == DownloadState.error)) {
//          downloadManager.startDownloads();
//        }
//      case ChapterDownloadAction.startNow:
//        final chapter = items.singleOrNull?.chapter;
//        if (chapter == null) return;
//        _startDownload([chapter], true);
//      case ChapterDownloadAction.cancel:
//        final chapterId = items.singleOrNull?.id;
//        if (chapterId == null) return;
//        _cancelDownload(chapterId);
//      case ChapterDownloadAction.delete:
//        deleteChapters(items.map((it) => it.chapter).toList());
//    }
//  }

//  void runDownloadAction(DownloadAction action) {
//    final chaptersToDownload = switch (action) {
//      DownloadAction.next1Chapter => _getUnreadChaptersSorted().take(1),
//      DownloadAction.next5Chapters => _getUnreadChaptersSorted().take(5),
//      DownloadAction.next10Chapters => _getUnreadChaptersSorted().take(10),
//      DownloadAction.next25Chapters => _getUnreadChaptersSorted().take(25),
//      DownloadAction.unreadChapters => _getUnreadChapters(),
//    };
//    if (chaptersToDownload.isNotEmpty) {
//      _startDownload(chaptersToDownload.toList(), false);
//    }
//  }

//  void _cancelDownload(int chapterId) {
//    final downloadManager = ref.watch(downloadManagerProvider);
//    final activeDownload = downloadManager.getQueuedDownloadOrNull(chapterId);
//    if (activeDownload == null) return;
//    downloadManager.cancelQueuedDownloads([activeDownload]);
//    //  _updateDownloadState(activeDownload.apply { status = DownloadState.notDownloaded });
//  }

//  //TODO
//  void markPreviousChapterRead(Chapter pointer) async {
//    final previousState = state.valueOrNull;
//    if (previousState != null) {
//      final manga = previousState.manga;
//      //final chapters = filteredChapters.orEmpty().map((it) => it.chapter);
//      //final prevChapters = manga.sortDescending() ? chapters.asReversed() : chapters;
//      //final pointerPos = prevChapters.indexOf(pointer);
//      //if (pointerPos != -1) markChaptersRead(prevChapters.take(pointerPos), true);
//    }
//  }

//  /// Mark the selected chapter list as read/unread.
//  void markChaptersRead(List<Chapter> chapters, bool read) async {
//    final setReadStatus = ref.watch(setReadStatusProvider);
//    await setReadStatus.await_(read: read, chapters: chapters);
//    toggleAllSelection(false);
//  }

//  /// Downloads the given list of chapters with the manager.
//  void _downloadChapters(List<Chapter> chapters) {
//    final downloadManager = ref.watch(downloadManagerProvider);
//    final previousState = state.valueOrNull;
//    if (previousState != null) {
//      final manga = previousState.manga;
//      downloadManager.downloadChapters(manga, chapters);
//      toggleAllSelection(false);
//    }
//  }

//  /// Bookmarks the given list of chapters.
//  void bookmarkChapters(List<Chapter> chapters, bool bookmarked) async {
//    final updateChapter = ref.watch(updateChapterProvider);
//    final notBookmarkedChapters = chapters
//        .whereNot((it) => it.bookmark == bookmarked)
//        .map((it) => ChapterUpdate(
//              id: drift.Value(it.id),
//              bookmark: drift.Value(bookmarked),
//            ))
//        .toList();
//    await updateChapter.awaitAll(notBookmarkedChapters);
//    toggleAllSelection(false);
//  }

//  /// Deletes the given list of chapters.
//  void deleteChapters(List<Chapter> chapters) {
//    final downloadManager = ref.watch(downloadManagerProvider);
//    final logger = ref.watch(loggerProvider);
//    try {
//      final previousState = state.valueOrNull;
//      if (previousState != null) {
//        downloadManager.deleteChapters(
//          chapters,
//          previousState.manga,
//          previousState.source,
//        );
//      }
//    } catch (e) {
//      logger.e(e);
//    }
//  }

//  void _downloadNewChapters(List<Chapter> chapters) async {
//    final downloadPreferences = ref.watch(downloadPreferencesProvider);
//    final getCategories = ref.watch(getCategoriesProvider);
//    final previousState = state.valueOrNull;
//    if (previousState != null) {
//      final manga = previousState.manga;
//      final categories = await getCategories.await_(manga.id);
//      final categoryIds = categories.map((it) => it.id).toList();
//      if (chapters.isEmpty ||
//          !manga.shouldDownloadNewChapters(categoryIds, downloadPreferences)) {
//        return;
//      }
//      _downloadChapters(chapters);
//    }
//  }

//  /// Sets the read filter and requests an UI update.
//  ///
//  /// [triState] dictates whether to display only unread chapters or all chapters.
//  void setUnreadFilter(TriState triState) async {
//    final setMangaChapterFlags = ref.watch(setMangaChapterFlagsProvider);
//    final previousState = state.valueOrNull;
//    if (previousState != null) {
//      final manga = previousState.manga;
//      final flag = switch (triState) {
//        TriState.disabled => MangaUtils.showAll,
//        TriState.enabledIs => MangaUtils.chapterShowUnread,
//        TriState.enabledNot => MangaUtils.chapterShowRead,
//      };
//      await setMangaChapterFlags.awaitSetUnreadFilter(manga, flag);
//    }
//  }

//  /// Sets the download filter and requests an UI update.
//  ///
//  /// [triState] dictates whether to display only downloaded chapters or all chapters.
//  void setDownloadedFilter(TriState triState) async {
//    final setMangaChapterFlags = ref.watch(setMangaChapterFlagsProvider);
//    final previousState = state.valueOrNull;
//    if (previousState != null) {
//      final manga = previousState.manga;
//      final flag = switch (triState) {
//        TriState.disabled => MangaUtils.showAll,
//        TriState.enabledIs => MangaUtils.chapterShowDownloaded,
//        TriState.enabledNot => MangaUtils.chapterShowNotDownloaded,
//      };
//      await setMangaChapterFlags.awaitSetDownloadedFilter(manga, flag);
//    }
//  }

//  /// Sets the bookmark filter and requests an UI update.
//  ///
//  /// [triState] dictates whether to display only bookmarked chapters or all chapters.
//  void setBookmarkedFilter(TriState triState) async {
//    final setMangaChapterFlags = ref.watch(setMangaChapterFlagsProvider);
//    final previousState = state.valueOrNull;
//    if (previousState != null) {
//      final manga = previousState.manga;
//      final flag = switch (triState) {
//        TriState.disabled => MangaUtils.showAll,
//        TriState.enabledIs => MangaUtils.chapterShowBookmarked,
//        TriState.enabledNot => MangaUtils.chapterShowNotBookmarked,
//      };
//      await setMangaChapterFlags.awaitSetBookmarkFilter(manga, flag);
//    }
//  }

//  /// Sets the active display mode.
//  void setDisplayMode(int mode) async {
//    final setMangaChapterFlags = ref.watch(setMangaChapterFlagsProvider);
//    final previousState = state.valueOrNull;
//    if (previousState != null) {
//      final manga = previousState.manga;
//      await setMangaChapterFlags.awaitSetDisplayMode(manga, mode);
//    }
//  }

//  /// Sets the sorting method and requests an UI update.
//  void setSorting(int sort) async {
//    final setMangaChapterFlags = ref.watch(setMangaChapterFlagsProvider);
//    final previousState = state.valueOrNull;
//    if (previousState != null) {
//      final manga = previousState.manga;
//      await setMangaChapterFlags.awaitSetSortingModeOrFlipOrder(manga, sort);
//    }
//  }

//  void setCurrentSettingsAsDefault(bool applyToExisting) async {
//    final libraryPreferences = ref.watch(libraryPreferencesProvider);
//    final setMangaDefaultChapterFlags =
//        ref.watch(setMangaDefaultChapterFlagsProvider);
//    final previousState = state.valueOrNull;
//    if (previousState != null) {
//      final manga = previousState.manga;
//      libraryPreferences.setChapterSettingsDefault(manga);
//      if (applyToExisting) {
//        await setMangaDefaultChapterFlags.awaitAll();
//      }
//      //https://stackoverflow.com/questions/66317145/how-do-i-show-a-snackbar-from-a-statenotifier-in-riverpod
//      //snackbarHostState.showSnackbar(message: lang.chapter_settings_updated);
//    }
//  }

//  void resetToDefaultSettings() async {
//    final setMangaDefaultChapterFlags =
//        ref.watch(setMangaDefaultChapterFlagsProvider);
//    final previousState = state.valueOrNull;
//    if (previousState != null) {
//      final manga = previousState.manga;
//      await setMangaDefaultChapterFlags.await_(manga);
//    }
//  }

//  void toggleSelection(
//    ChapterListItem item,
//    bool selected, [
//    bool userSelected = false,
//    bool fromLongPress = false,
//  ]) async {
//    final previousState = state.valueOrNull;
//    if (previousState != null) {
//      final newChapters = previousState.processedChapters.toList();
//      final selectedIndex = previousState.processedChapters
//          .indexWhere((it) => it.id == item.chapter.id);
//      if (selectedIndex < 0) return;

//      final selectedItem = newChapters[selectedIndex];
//      if ((selectedItem.selected && selected) ||
//          (!selectedItem.selected && !selected)) return;

//      final firstSelection = newChapters.none((it) => it.selected);
//      newChapters[selectedIndex] = selectedItem.copyWith(selected: selected);
//      final selectedChapterIds = Set.of(previousState.selectedChapterIds);
//      selectedChapterIds.addOrRemove(item.id, selected);

//      final selectedPositions = [...previousState.selectedPositions];
//      if (selected && userSelected && fromLongPress) {
//        if (firstSelection) {
//          selectedPositions[0] = selectedIndex;
//          selectedPositions[1] = selectedIndex;
//        } else {
//          // Try to select the items in-between when possible
//          final IntRange range;
//          if (selectedIndex < selectedPositions[0]) {
//            range = IntRange(selectedIndex + 1, selectedPositions[0]);
//            selectedPositions[0] = selectedIndex;
//          } else if (selectedIndex > selectedPositions[1]) {
//            range = IntRange((selectedPositions[1] + 1), selectedIndex);
//            selectedPositions[1] = selectedIndex;
//          } else {
//            // Just select itself
//            range = IntRange(0, -1);
//          }

//          for (final it in range) {
//            final inbetweenItem = newChapters[it];
//            if (!inbetweenItem.selected) {
//              selectedChapterIds.add(inbetweenItem.id);
//              newChapters[it] = inbetweenItem.copyWith(selected: true);
//            }
//          }
//        }
//      } else if (userSelected && !fromLongPress) {
//        if (!selected) {
//          if (selectedIndex == selectedPositions[0]) {
//            selectedPositions[0] = newChapters.indexWhere((it) => it.selected);
//          } else if (selectedIndex == selectedPositions[1]) {
//            selectedPositions[1] =
//                newChapters.lastIndexWhere((it) => it.selected);
//          }
//        } else {
//          if (selectedIndex < selectedPositions[0]) {
//            selectedPositions[0] = selectedIndex;
//          } else if (selectedIndex > selectedPositions[1]) {
//            selectedPositions[1] = selectedIndex;
//          }
//        }
//      }
//      final newState = previousState.copyWith(
//        chapters: newChapters,
//        selectedChapterIds: selectedChapterIds,
//        selectedPositions: selectedPositions,
//      );
//      state = await AsyncValue.guard(() async => newState);
//    }
//  }

//  void toggleAllSelection(bool selected) async {
//    final previousState = state.valueOrNull;
//    if (previousState != null) {
//      final selectedChapterIds = Set.of(previousState.selectedChapterIds);
//      final newChapters = previousState.chapters.map((it) {
//        selectedChapterIds.addOrRemove(it.id, selected);
//        return it.copyWith(selected: selected);
//      }).toList();
//      final selectedPositions = [...previousState.selectedPositions];
//      selectedPositions[0] = -1;
//      selectedPositions[1] = -1;
//      final newState = previousState.copyWith(
//        chapters: newChapters,
//        selectedChapterIds: selectedChapterIds,
//        selectedPositions: selectedPositions,
//      );
//      state = await AsyncValue.guard(() async => newState);
//    }
//  }

//  void invertSelection() async {
//    final previousState = state.valueOrNull;
//    if (previousState != null) {
//      final selectedChapterIds = Set.of(previousState.selectedChapterIds);
//      final newChapters = previousState.chapters.map((it) {
//        selectedChapterIds.addOrRemove(it.id, !it.selected);
//        return it.copyWith(selected: !it.selected);
//      }).toList();
//      final selectedPositions = [...previousState.selectedPositions];
//      selectedPositions[0] = -1;
//      selectedPositions[1] = -1;
//      final newState = previousState.copyWith(
//        chapters: newChapters,
//        selectedChapterIds: selectedChapterIds,
//        selectedPositions: selectedPositions,
//      );
//      state = await AsyncValue.guard(() async => newState);
//    }
//  }

//  // Chapters list - end

//  // Track sheet - start

//  void _observeTrackers() {
//    final getTracks = ref.watch(getTracksProvider);
//    final logger = ref.watch(loggerProvider);
//    final trackerManager = ref.watch(trackerManagerProvider);
//    final loggedInTrackers =
//        trackerManager.trackers.where((it) => it.isLoggedIn);
//    final previousState = state.valueOrNull;
//    if (previousState != null) {
//      final manga = previousState.manga;
//      getTracks
//          .subscribe(manga.id)
//          .handleError((it) => logger.e(it))
//          .map((tracks) => loggedInTrackers
//                  // Map to TrackItem
//                  .map((service) => TrackItem(
//                        track: tracks.firstWhereOrNull(
//                            (it) => it.trackerId == service.id),
//                        tracker: service,
//                      ))
//              // Show only if the service supports this manga's source
//              //.where((it) => (it.tracker as? EnhancedTracker)?.accept(source!) ?? true),
//              )
//          .distinct()
//          .forEach((trackItems) async {
//        final newState =
//            previousState.copyWith(trackItems: trackItems.toList());
//        state = await AsyncValue.guard(() async => newState);
//      });
//    }
//  }

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

    //final filename = generateFilename(manga, page);

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

    //final filename = generateFilename(manga, page);

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
