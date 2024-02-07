import 'package:async/async.dart';
import 'package:collection/collection.dart';
import 'package:dartx/dartx.dart' hide IterableWhereNot, IterableWhereNotNull;
// Alias to prevent conflict with Freezed
import 'package:drift/drift.dart' as drift;
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:flutteryomi/domain/category/interactor/get_categories.dart';
import 'package:flutteryomi/domain/category/interactor/set_manga_categories.dart';
import 'package:flutteryomi/domain/category/model/category.dart';
import 'package:flutteryomi/domain/chapter/interactor/get_available_scanlators.dart';
import 'package:flutteryomi/domain/chapter/interactor/set_manga_default_chapter_flags.dart';
import 'package:flutteryomi/domain/manga/interactor/get_excluded_scanlators.dart';
import 'package:flutteryomi/domain/manga/interactor/get_manga_with_chapters.dart';
import 'package:flutteryomi/domain/manga/interactor/set_manga_chapter_flags.dart';
import 'package:flutteryomi/domain/manga/interactor/update_manga.dart';
import 'package:flutteryomi/domain/track/interactor/get_tracks_per_manga.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:flutteryomi/core/preference/tri_state.dart';
import 'package:flutteryomi/core/util/collection_utils.dart';
import 'package:flutteryomi/domain/chapter/interactor/get_chapter.dart';
import 'package:flutteryomi/domain/chapter/interactor/set_read_status.dart';
import 'package:flutteryomi/domain/chapter/interactor/update_chapter.dart';
import 'package:flutteryomi/domain/chapter/model/chapter.dart';
import 'package:flutteryomi/domain/chapter/model/chapter_update.dart';
import 'package:flutteryomi/domain/chapter/service/chapter_sort.dart';
import 'package:flutteryomi/domain/chapter/service/missing_chapters.dart';
import 'package:flutteryomi/domain/download/download_manager.dart';
import 'package:flutteryomi/domain/download/model/download.dart';
import 'package:flutteryomi/domain/library/service/library_preferences.dart';
import 'package:flutteryomi/domain/manga/interactor/get_manga.dart';
import 'package:flutteryomi/domain/manga/interactor/set_excluded_scanlators.dart';
import 'package:flutteryomi/domain/manga/model/manga.dart';
import 'package:flutteryomi/domain/manga/model/tri_state.dart';
import 'package:flutteryomi/domain/source/model/source.dart';
import 'package:flutteryomi/domain/source/service/source_manager.dart';
import 'package:flutteryomi/domain/track/interactor/get_tracks.dart';
import 'package:flutteryomi/domain/updates/interactor/get_updates.dart';
import 'package:flutteryomi/domain/updates/model/updates_with_relations.dart';
import 'package:flutteryomi/presentation/manga/components/chapter_download_indicator.dart';
import 'package:flutteryomi/presentation/manga/manga_screen_constants.dart';
import 'package:flutteryomi/presentation/manga/track/track_item.dart';
import 'package:flutteryomi/presentation/updates/updates.dart';
import 'package:flutteryomi/presentation/util/lang/date_extensions.dart';

part 'manga_screen_model.freezed.dart';
part 'manga_screen_model.g.dart';

@riverpod
class MangaScreenModel extends _$MangaScreenModel {
  @override
  Stream<MangaScreenState> build({required int mangaId, required bool isFromSource}) {
    final downloadManager = ref.watch(downloadManagerProvider);
    final getMangaWithChapters = ref.watch(getMangaWithChaptersProvider);
    final getExcludedScanlators = ref.watch(getExcludedScanlatorsProvider);
    final getAvailableScanlators = ref.watch(getAvailableScanlatorsProvider);
    final sourceManager = ref.watch(sourceManagerProvider);
    final stream1 = StreamZip([
      getMangaWithChapters.subscribe(mangaId, applyScanlatorFilter: true).distinct(),
      //TODO
      //downloadCache.changes,
      downloadManager.queueState,
    ]).asyncMap((e) async {
      final mangaAndChapters = e.first as Pair<Manga, List<Chapter>>;
      final manga = mangaAndChapters.first;
      return (
        manga: manga,
        chapters: mangaAndChapters.second.toChapterListItems(downloadManager, manga),
      );
    });

    final stream2 = getExcludedScanlators.subscribe(mangaId).distinct();
    final stream3 = getAvailableScanlators.subscribe(mangaId).distinct();

    _observeDownloads();

    if (manga != null && !manga!.favorite) {
      _setMangaDefaultChapterFlags(manga!);
    }

    // Start observe tracking since it only needs mangaId
    _observeTrackers();

    return StreamZip([stream1, stream2, stream3]).map((e) {
      final (manga, chapters) = e.first as (Manga, List<ChapterListItem>);
      final excludedScanlators = e.second as Set<String>;
      final availableScanlators = e.third as Set<String>;
      return MangaScreenState(
        manga: manga,
        source: sourceManager.getOrStub(manga.source),
        isFromSource: isFromSource,
        chapters: chapters,
        excludedScanlators: excludedScanlators,
        availableScanlators: availableScanlators,
      );
    });
  }

  void _setMangaDefaultChapterFlags(Manga manga) async {
    final setMangaDefaultChapterFlags = ref.watch(setMangaDefaultChapterFlagsProvider);
    await setMangaDefaultChapterFlags.await_(manga);
  }

  //final loggedInTrackers = trackerManager.trackers.where((it) => it.isLoggedIn);

  Manga? get manga => state.valueOrNull?.manga;

  Source? get source => state.valueOrNull?.source;

  bool get _isFavorited => manga?.favorite ?? false;

  List<ChapterListItem>? get _allChapters => state.valueOrNull?.chapters;

  List<ChapterListItem>? get _filteredChapters => state.valueOrNull?.processedChapters;

  //val chapterSwipeStartAction = libraryPreferences.swipeToEndAction().get()
  //val chapterSwipeEndAction = libraryPreferences.swipeToStartAction().get()

  //private val skipFiltered by readerPreferences.skipFiltered().asState(screenModelScope)

  //val isUpdateIntervalEnabled =
  //    LibraryPreferences.mangaOutsideReleasePeriod in libraryPreferences.autoUpdateMangaRestrictions().get()

  //private val selectedPositions: List<Int> = [-1, -1]; // first and last selected index in list
  // first and last selected index in list
  late final List<int> selectedPositions = [-1, -1];
  //private val selectedChapterIds: HashSet<int> = HashSet();

  void fetchAllFromSource([bool manualFetch = true]) {
  //    screenModelScope.launch {
  //        updateSuccessState { it.copy(isRefreshingData = true) }
  //        val fetchFromSourceTasks = listOf(
  //            async { _fetchMangaFromSource(manualFetch) },
  //            async { fetchChaptersFromSource(manualFetch) },
  //        )
  //        fetchFromSourceTasks.awaitAll()
  //        updateSuccessState { it.copy(isRefreshingData = false) }
  //    }
  }

  // Manga info - start

  /// Fetch manga information from source.
  Future<void> _fetchMangaFromSource([bool manualFetch = false]) async {
  //    val state = successState ?: return
  //    try {
  //        withIOContext {
  //            val networkManga = state.source.getMangaDetails(state.manga.toSManga())
  //            updateManga.awaitUpdateFromSource(state.manga, networkManga, manualFetch)
  //        }
  //    } catch (e: Throwable) {
  //        // Ignore early hints "errors" that aren't handled by OkHttp
  //        if (e is HttpException && e.code == 103) return

  //        logcat(LogPriority.ERROR, e)
  //        screenModelScope.launch {
  //            snackbarHostState.showSnackbar(message = with(context) { e.formattedMessage })
  //        }
  //    }
  }

  void toggleFavorite() {
    toggleFavoriteWithCallback(
      onRemoved: () {
        if (!_hasDownloads()) return;
  //      final result = snackbarHostState.showSnackbar(
  //        message: lang.delete_downloads_for_manga,
  //        actionLabel: lang.action_delete,
  //        withDismissAction: true,
  //      )
  //      if (result == SnackbarResult.ActionPerformed) {
  //        deleteDownloads();
  //      }
      },
    );
  }

  /// Update favorite status of manga, (removes / adds) manga (to / from) library.
  void toggleFavoriteWithCallback({required VoidCallback onRemoved, bool checkDuplicate = true}) async {
  //  final state = successState ?? return;
  //  final manga = state.manga;

  //  if (_isFavorited) {
  //    // Remove from library
  //    if (await updateManga.awaitUpdateFavorite(manga.id, false)) {
  //      // Remove covers and update last modified in db
  //      if (manga.removeCovers() != manga) {
  //        await updateManga.awaitUpdateCoverLastModified(manga.id);
  //      }
  //      onRemoved();
  //    }
  //  } else {
  //    // Add to library
  //    // First, check if duplicate exists if callback is provided
  //    if (checkDuplicate) {
  //      final duplicate = await getDuplicateLibraryManga.await_(manga).getOrNull(0);

  //      if (duplicate != null) {
  //        updateSuccessState { it.copy(dialog = Dialog.DuplicateManga(manga, duplicate)) }
  //        return;
  //      }
  //    }

  //    // Now check if user previously set categories, when available
  //    final categories = getCategories();
  //    final defaultCategoryId = libraryPreferences.defaultCategory().get().toInt();
  //    final defaultCategory = categories.firstWhere((it) => it.id == defaultCategoryId);
  //    when {
  //        // Default category set
  //        defaultCategory != null -> {
  //            final result = updateManga.awaitUpdateFavorite(manga.id, true)
  //            if (!result) return@launchIO
  //            moveMangaToCategory(defaultCategory)
  //        }

  //        // Automatic 'Default' or no categories
  //        defaultCategoryId == 0 || categories.isEmpty() -> {
  //            final result = updateManga.awaitUpdateFavorite(manga.id, true)
  //            if (!result) return@launchIO
  //            moveMangaToCategory(null)
  //        }
  //    }

  //    // Finally match with enhanced tracking when available
  //    addTracks.bindEnhancedTrackers(manga, state.source);
  //  }
  }

  void setFetchInterval(Manga manga, int interval) {
  //  if (updateManga.awaitUpdateFetchInterval(
  //    // Custom intervals are negative
  //    manga.copyWith(fetchInterval: -interval),
  //  )) {
  //      final updatedManga = mangaRepository.getMangaById(manga.id);
  //      updateSuccessState { it.copyWith(manga: updatedManga) }
  //  }
  }

  /// Returns true if the manga has any downloads.
  bool _hasDownloads() {
  //    final manga = successState?.manga ?? return false;
  //    return downloadManager.getDownloadCount(manga) > 0
    return false;
  }

  /// Deletes all the downloads for the manga.
  void _deleteDownloads() {
  //    final state = successState ?? return;
  //    downloadManager.deleteManga(state.manga, state.source)
  }

  /// Get user categories, not including the default category.
  Future<List<Category>> getCategories() async {
    final getCategories = ref.watch(getCategoriesProvider);
    final categories = await getCategories.await_();
    return categories.whereNot((it) => it.isSystemCategory).toList();
  }

  /// Gets the category id's the manga is in, if the manga is not in a category, returns the default id.
  Future<List<int>> _getMangaCategoryIds(Manga manga) async {
    final getCategories = ref.watch(getCategoriesProvider);
    final categories = await getCategories.await_(manga.id);
    return categories.map((it) => it.id).toList();
  }

  void moveMangaToCategoriesAndAddToLibrary(Manga manga, List<int> categories) async {
    final updateManga = ref.watch(updateMangaProvider);
    _moveMangaToCategory(categories);
    if (manga.favorite) return;

    await updateManga.awaitUpdateFavorite(manga.id, true);
  }

  /// Move the given manga to categories.
  void _moveMangaToCategories(List<Category> categories) {
    final categoryIds = categories.map((it) => it.id).toList();
    _moveMangaToCategory(categoryIds);
  }

  void _moveMangaToCategory(List<int> categoryIds) async {
    final setMangaCategories = ref.watch(setMangaCategoriesProvider);
    await setMangaCategories.await_(mangaId, categoryIds);
  }

  /// Move the given manga to the category.
  void _moveMangaToCategoryWithCategory(Category? category) {
    _moveMangaToCategories([category].whereNotNull().toList());
  }

  // Manga info - end

  // Chapters list - start

  void _observeDownloads() {
  //    screenModelScope.launchIO {
  //        downloadManager.statusFlow()
  //            .where((it) => it.manga.id == successState?.manga?.id)
  //            .catch { error -> logcat(LogPriority.ERROR, error) }
  //            .collect {
  //                withUIContext {
  //                    updateDownloadState(it)
  //                }
  //            }
  //    }

  //    screenModelScope.launchIO {
  //        downloadManager.progressFlow()
  //            .where((it) => it.manga.id == successState?.manga?.id)
  //            .catch { error -> logcat(LogPriority.ERROR, error) }
  //            .collect {
  //                withUIContext {
  //                    updateDownloadState(it)
  //                }
  //            }
  //    }
  }

  void _updateDownloadState(Download download) {
  //    updateSuccessState { successState ->
  //        val modifiedIndex = successState.chapters.indexOfFirst { it.id == download.chapter.id }
  //        if (modifiedIndex < 0) return@updateSuccessState successState

  //        val newChapters = successState.chapters.toMutableList().apply {
  //            val item = removeAt(modifiedIndex)
  //                .copy(downloadState = download.status, downloadProgress = download.progress)
  //            add(modifiedIndex, item)
  //        }
  //        successState.copy(chapters = newChapters)
  //    }
  }

  /// Requests an updated list of chapters from the source.
  Future<void> _fetchChaptersFromSource([bool manualFetch = false]) async {
  //  final state = successState ?? return;
  //  try {
  //    final chapters = state.source.getChapterList(state.manga.toSManga());

  //    final newChapters = await syncChaptersWithSource.await_(
  //      chapters,
  //      state.manga,
  //      state.source,
  //      manualFetch,
  //    )

  //    if (manualFetch) downloadNewChapters(newChapters);
  //  } catch (Throwable e) {
  //    final message = if (e is NoChaptersException) {
  //      lang.no_chapters_error;
  //    } else {
  //      logcat(LogPriority.ERROR, e)
  //      with(context) { e.formattedMessage }
  //    }

  //    screenModelScope.launch {
  //        snackbarHostState.showSnackbar(message = message)
  //    }
  //    final newManga = mangaRepository.getMangaById(mangaId);
  //    updateSuccessState { it.copyWith(manga: newManga) };
  //  }
  }

  /// Throws an IllegalStateException if the swipe action is LibraryPreferences.ChapterSwipeAction.disabled
  void chapterSwipe(ChapterListItem chapterItem, ChapterSwipeAction swipeAction) {
    final chapter = chapterItem.chapter;
    switch (swipeAction) {
      case ChapterSwipeAction.toggleRead:
        markChaptersRead([chapter], !chapter.read);
      case ChapterSwipeAction.toggleBookmark:
        bookmarkChapters([chapter], !chapter.bookmark);
      case ChapterSwipeAction.download:
        final downloadAction = switch (chapterItem.downloadState) {
          DownloadState.error || DownloadState.notDownloaded => ChapterDownloadAction.startNow,
          DownloadState.queue || DownloadState.downloading => ChapterDownloadAction.cancel,
          DownloadState.downloaded => ChapterDownloadAction.delete,
        };
        runChapterDownloadActions(
          items: [chapterItem],
          action: downloadAction,
        );
      case ChapterSwipeAction.disabled:
        //throw IllegalStateException();
    }
  }

  /// Returns the next unread chapter or null if everything is read.
  Chapter? getNextUnreadChapter() {
  //  final successState = successState ?? return null;
  //  return successState.chapters.getNextUnread(successState.manga);
  }

  List<Chapter> _getUnreadChapters() {
  //  final chapterItems = skipFiltered ? filteredChapters.orEmpty() : allChapters.orEmpty();
  //  return chapterItems
  //      .where((chapter, dlStatus) => !chapter.read && dlStatus == DownloadState.notDownloaded)
  //      .map((it) => it.chapter);
    return [];
  }

  List<Chapter> _getUnreadChaptersSorted() {
  //  final manga = successState?.manga ?? return const [];
  //  final chaptersSorted = _getUnreadChapters().sortedWith(getChapterSort(manga))
  //  return manga.sortDescending() ? chaptersSorted.reversed() : chaptersSorted;
    return [];
  }

  void _startDownload(List<Chapter> chapters, bool startNow) {
  //  final successState = successState ?? return;

  //  if (startNow) {
  //    final chapterId = chapters.singleOrNull()?.id ?? return;
  //    downloadManager.startDownloadNow(chapterId);
  //  } else {
  //    _downloadChapters(chapters);
  //  }

  //  if (!_isFavorited && !successState.hasPromptedToAddBefore) {
  //    updateSuccessState { state ->
  //      state.copyWith(hasPromptedToAddBefore: true);
  //    }
  //    final result = snackbarHostState.showSnackbar(
  //      message: lang.snack_add_to_library,
  //      actionLabel: lang.action_add,
  //      withDismissAction: true,
  //    )
  //    if (result == SnackbarResult.ActionPerformed && !_isFavorited) {
  //      toggleFavorite();
  //    }
  //  }
  }

  void runChapterDownloadActions({required List<ChapterListItem> items, required ChapterDownloadAction action}) {
    final downloadManager = ref.watch(downloadManagerProvider);
    switch (action) {
      case ChapterDownloadAction.start:
        _startDownload(items.map((it) => it.chapter).toList(), false);
        if (items.any((it) => it.downloadState == DownloadState.error)) {
          downloadManager.startDownloads();
        }
      case ChapterDownloadAction.startNow:
        final chapter = items.singleOrNull?.chapter;
        if (chapter == null) return;
        _startDownload([chapter], true);
      case ChapterDownloadAction.cancel:
        final chapterId = items.singleOrNull?.id;
        if (chapterId == null) return;
        _cancelDownload(chapterId);
      case ChapterDownloadAction.delete:
        deleteChapters(items.map((it) => it.chapter).toList());
    }
  }

  void runDownloadAction(DownloadAction action) {
    final chaptersToDownload = switch (action) {
      DownloadAction.next1Chapter => _getUnreadChaptersSorted().take(1),
      DownloadAction.next5Chapters => _getUnreadChaptersSorted().take(5),
      DownloadAction.next10Chapters => _getUnreadChaptersSorted().take(10),
      DownloadAction.next25Chapters => _getUnreadChaptersSorted().take(25),
      DownloadAction.unreadChapters => _getUnreadChapters(),
    };
    if (chaptersToDownload.isNotEmpty) {
      _startDownload(chaptersToDownload.toList(), false);
    }
  }

  void _cancelDownload(int chapterId) {
    final downloadManager = ref.watch(downloadManagerProvider);
    final activeDownload = downloadManager.getQueuedDownloadOrNull(chapterId);
    if (activeDownload == null) return;
    downloadManager.cancelQueuedDownloads([activeDownload]);
  //  updateDownloadState(activeDownload.apply { status = Download.State.NOT_DOWNLOADED });
  }

  void markPreviousChapterRead(Chapter pointer) {
  //  final manga = successState?.manga ?? return;
  //  final chapters = filteredChapters.orEmpty().map((it) => it.chapter);
  //  final prevChapters = manga.sortDescending() ? chapters.asReversed() : chapters;
  //  final pointerPos = prevChapters.indexOf(pointer)
  //  if (pointerPos != -1) markChaptersRead(prevChapters.take(pointerPos), true);
  }

  /// Mark the selected chapter list as read/unread.
  void markChaptersRead(List<Chapter> chapters, bool read) async {
    final setReadStatus = ref.watch(setReadStatusProvider);
    await setReadStatus.await_(read: read, chapters: chapters);
    toggleAllSelection(false);
  }

  /// Downloads the given list of chapters with the manager.
  void _downloadChapters(List<Chapter> chapters) {
    final downloadManager = ref.watch(downloadManagerProvider);
  //  final manga = successState?.manga ?? return;
  //  downloadManager.downloadChapters(manga, chapters);
    toggleAllSelection(false);
  }

  /// Bookmarks the given list of chapters.
  void bookmarkChapters(List<Chapter> chapters, bool bookmarked) async {
    final updateChapter = ref.watch(updateChapterProvider);
    final notBookmarkedChapters =  chapters
        .whereNot((it) => it.bookmark == bookmarked)
        .map((it) => ChapterUpdate(id: drift.Value(it.id), bookmark: drift.Value(bookmarked),))
        .toList();
    await updateChapter.awaitAll(notBookmarkedChapters);
    toggleAllSelection(false);
  }

  /// Deletes the given list of chapters.
  void deleteChapters(List<Chapter> chapters) {
  //  try {
  //      successState?.let { state ->
  //          downloadManager.deleteChapters(
  //              chapters,
  //              state.manga,
  //              state.source,
  //          )
  //      }
  //  } catch (e: Throwable) {
  //      logcat(LogPriority.ERROR, e);
  //  }
  }

  void _downloadNewChapters(List<Chapter> chapters) async {
  //  final manga = successState?.manga ?? return;
  //  final categories = await getCategories.await_(manga.id).map((it) => it.id);
  //  if (chapters.isEmpty || !manga.shouldDownloadNewChapters(categories, downloadPreferences)) {
  //    return;
  //  }

    _downloadChapters(chapters);
  }

  /// Sets the read filter and requests an UI update.
  ///
  /// [state] dictates whether to display only unread chapters or all chapters.
  void setUnreadFilter(TriState state) async {
    final setMangaChapterFlags = ref.watch(setMangaChapterFlagsProvider);
  //  final manga = successState?.manga ?? return;

    final flag = switch (state) {
      TriState.disabled => MangaUtils.showAll,
      TriState.enabledIs => MangaUtils.chapterShowUnread,
      TriState.enabledNot => MangaUtils.chapterShowRead,
    };

    //await setMangaChapterFlags.awaitSetUnreadFilter(manga, flag);
  }

  /// Sets the download filter and requests an UI update.
  ///
  /// [state] dictates whether to display only downloaded chapters or all chapters.
  void setDownloadedFilter(TriState state) async {
    final setMangaChapterFlags = ref.watch(setMangaChapterFlagsProvider);
  //  final manga = successState?.manga ?? return;

    final flag = switch (state) {
      TriState.disabled => MangaUtils.showAll,
      TriState.enabledIs => MangaUtils.chapterShowDownloaded,
      TriState.enabledNot => MangaUtils.chapterShowNotDownloaded,
    };

  //  await setMangaChapterFlags.awaitSetDownloadedFilter(manga, flag);
  }

  /// Sets the bookmark filter and requests an UI update.
  ///
  /// [state] dictates whether to display only bookmarked chapters or all chapters.
  void setBookmarkedFilter(TriState state) async {
    final setMangaChapterFlags = ref.watch(setMangaChapterFlagsProvider);
  //  final manga = successState?.manga ?? return;

    final flag = switch (state) {
      TriState.disabled => MangaUtils.showAll,
      TriState.enabledIs => MangaUtils.chapterShowBookmarked,
      TriState.enabledNot => MangaUtils.chapterShowNotBookmarked,
    };

  //  await setMangaChapterFlags.awaitSetBookmarkFilter(manga, flag);
  }

  /// Sets the active display mode.
  void setDisplayMode(int mode) async {
    final setMangaChapterFlags = ref.watch(setMangaChapterFlagsProvider);
  //  final manga = successState?.manga ?? return;

  //  await setMangaChapterFlags.awaitSetDisplayMode(manga, mode);
  }

  /// Sets the sorting method and requests an UI update.
  void setSorting(int sort) async {
    final setMangaChapterFlags = ref.watch(setMangaChapterFlagsProvider);
  //  final manga = successState?.manga ?? return;

  //  await setMangaChapterFlags.awaitSetSortingModeOrFlipOrder(manga, sort);
  }

  void setCurrentSettingsAsDefault(bool applyToExisting) async {
    final libraryPreferences = ref.watch(libraryPreferencesProvider);
    final setMangaDefaultChapterFlags = ref.watch(setMangaDefaultChapterFlagsProvider);
  //  final manga = successState?.manga ?? return;
  //  libraryPreferences.setChapterSettingsDefault(manga);
    if (applyToExisting) {
      await setMangaDefaultChapterFlags.awaitAll();
    }
  //  //https://stackoverflow.com/questions/66317145/how-do-i-show-a-snackbar-from-a-statenotifier-in-riverpod
  //  //snackbarHostState.showSnackbar(message: lang.chapter_settings_updated);
  }

  void resetToDefaultSettings() async {
    final setMangaDefaultChapterFlags = ref.watch(setMangaDefaultChapterFlagsProvider);
  //  final manga = successState?.manga ?? return;
  //  await setMangaDefaultChapterFlags.await_(manga);
  }

  void toggleSelection(
    ChapterListItem item,
    bool selected, [
    bool userSelected = false,
    bool fromLongPress = false,
  ]) {
  //    updateSuccessState { successState ->
  //        val newChapters = successState.processedChapters.toList().apply {
  //            val selectedIndex = successState.processedChapters.indexOfFirst { it.id == item.chapter.id }
  //            if (selectedIndex < 0) return@apply

  //            val selectedItem = get(selectedIndex)
  //            if ((selectedItem.selected && selected) || (!selectedItem.selected && !selected)) return@apply

  //            val firstSelection = none { it.selected }
  //            set(selectedIndex, selectedItem.copy(selected = selected))
  //            selectedChapterIds.addOrRemove(item.id, selected)

  //            if (selected && userSelected && fromLongPress) {
  //                if (firstSelection) {
  //                    selectedPositions[0] = selectedIndex
  //                    selectedPositions[1] = selectedIndex
  //                } else {
  //                    // Try to select the items in-between when possible
  //                    val range: IntRange
  //                    if (selectedIndex < selectedPositions[0]) {
  //                        range = selectedIndex + 1..<selectedPositions[0]
  //                        selectedPositions[0] = selectedIndex
  //                    } else if (selectedIndex > selectedPositions[1]) {
  //                        range = (selectedPositions[1] + 1)..<selectedIndex
  //                        selectedPositions[1] = selectedIndex
  //                    } else {
  //                        // Just select itself
  //                        range = IntRange.EMPTY
  //                    }

  //                    range.forEach {
  //                        val inbetweenItem = get(it)
  //                        if (!inbetweenItem.selected) {
  //                            selectedChapterIds.add(inbetweenItem.id)
  //                            set(it, inbetweenItem.copy(selected = true))
  //                        }
  //                    }
  //                }
  //            } else if (userSelected && !fromLongPress) {
  //                if (!selected) {
  //                    if (selectedIndex == selectedPositions[0]) {
  //                        selectedPositions[0] = indexOfFirst { it.selected }
  //                    } else if (selectedIndex == selectedPositions[1]) {
  //                        selectedPositions[1] = indexOfLast { it.selected }
  //                    }
  //                } else {
  //                    if (selectedIndex < selectedPositions[0]) {
  //                        selectedPositions[0] = selectedIndex
  //                    } else if (selectedIndex > selectedPositions[1]) {
  //                        selectedPositions[1] = selectedIndex
  //                    }
  //                }
  //            }
  //        }
  //        successState.copyWith(chapters: newChapters);
  //    }
  }

  void toggleAllSelection(bool selected) {
  //  updateSuccessState { successState =>
  //    final newChapters = successState.chapters.map((it) {
  //      selectedChapterIds.addOrRemove(it.id, selected)
  //      return it.copyWith(selected: selected);
  //    });
  //    selectedPositions[0] = -1;
  //    selectedPositions[1] = -1;
  //    successState.copyWith(chapters: newChapters);
  //  }
  }

  void invertSelection() {
  //    updateSuccessState { successState =>
  //      final newChapters = successState.chapters.map((it) {
  //        selectedChapterIds.addOrRemove(it.id, !it.selected);
  //        return it.copyWith(selected: !it.selected);
  //      });
  //      selectedPositions[0] = -1;
  //      selectedPositions[1] = -1;
  //      successState.copyWith(chapters: newChapters);
  //    }
  }

  // Chapters list - end

  // Track sheet - start

  void _observeTrackers() {
    final getTracks = ref.watch(getTracksProvider);
  //  final manga = successState?.manga ?? return;

  //  getTracks.subscribe(manga.id)
  //      .catch { logcat(LogPriority.ERROR, it) }
  //      .map { tracks ->
  //          loggedInTrackers
  //              // Map to TrackItem
  //              .map { service -> TrackItem(tracks.find { it.trackerId == service.id }, service) }
  //              // Show only if the service supports this manga's source
  //              .filter { (it.tracker as? EnhancedTracker)?.accept(source!!) ?: true }
  //      }
  //      .distinct()
  //      .collectLatest { trackItems ->
  //          updateSuccessState { it.copy(trackItems = trackItems) }
  //      };
  }

  // Track sheet - end

  void setExcludedScanlators(Set<String> excludedScanlators) async {
    final setExcludedScanlators = ref.watch(setExcludedScanlatorsProvider);
    await setExcludedScanlators.await_(mangaId, excludedScanlators);
  }
}

@unfreezed
class MangaScreenState with _$MangaScreenState {
  MangaScreenState._();
  factory MangaScreenState({
    required Manga manga,
    required Source source,
    required bool isFromSource,
    required List<ChapterListItem> chapters,
    required Set<String> availableScanlators,
    required Set<String> excludedScanlators,
    @Default([]) List<TrackItem> trackItems,
    @Default(false) bool hasPromptedToAddBefore,
  }) = _MangaScreenState;

  late final processedChapters = chapters.applyFilters(manga).toList();

  late final isAnySelected = chapters.any((it) => it.selected);

  late final chapterListItems = processedChapters.insertSeparators((before, after) {
    final (lowerChapter, higherChapter) = manga.sortDescending()
        ? (after, before)
        : (before, after);
    if (higherChapter == null) return null;

    int? missingCount;
    if (lowerChapter == null) {
      missingCount = (higherChapter.chapter.chapterNumber.floor() - 1).coerceAtLeast(0);
    } else {
      missingCount = calculateChapterGapUsingChapter(higherChapter.chapter, lowerChapter.chapter);
    }
    if (missingCount <= 0) missingCount = null;
    if (missingCount != null) {
      return ChapterListMissingCount(
        id: "${lowerChapter?.id}-${higherChapter.id}",
        count: missingCount,
      );
    } else {
      return null;
    }
  });

  bool get scanlatorFilterActive => excludedScanlators.intersect(availableScanlators).isNotEmpty;

  bool get filterActive => scanlatorFilterActive || manga.chaptersFiltered();

  int get trackingCount => trackItems.count((it) => it.track != null);
}



sealed class ChapterList {}

class ChapterListMissingCount extends Equatable implements ChapterList {
  const ChapterListMissingCount({required this.id, required this.count});

  final String id;
  final int count;

  @override
  List<Object?> get props => [id, count];
}

class ChapterListItem extends Equatable implements ChapterList {
  ChapterListItem({
    required this.chapter,
    required this.downloadState,
    required this.downloadProgress,
    this.selected = false,
  });

  final Chapter chapter;
  final DownloadState downloadState;
  final int downloadProgress;
  final bool selected;

  late final id = chapter.id;
  late final isDownloaded = downloadState == DownloadState.downloaded;

  @override
  List<Object?> get props => [chapter, downloadState, downloadProgress, selected];
}


extension _ChapterListItemsUtils on List<ChapterListItem> {
  /// Applies the view filters to the list of chapters obtained from the database.
  /// Returns an observable of the list of chapters filtered and sorted.
  List<ChapterListItem> applyFilters(Manga manga) {
    //TODO: Support for isLocal
    //final isLocalManga = manga.isLocal();
    const isLocalManga = true;
    final unreadFilter = manga.unreadFilter;
    final downloadedFilter = manga.downloadedFilter;
    final bookmarkedFilter = manga.bookmarkedFilter;

    return where((it) => applyFilter(unreadFilter, () => !it.chapter.read))
        .where((it) => applyFilter(bookmarkedFilter, () => it.chapter.bookmark))
        .where((it) => applyFilter(downloadedFilter, () => it.isDownloaded || isLocalManga))
        .sortedWith((i1, i2) => getChapterSort(manga: manga)(i1.chapter, i2.chapter));
  }

  Chapter? getNextUnread(Manga manga) {
    final chapters = applyFilters(manga);
    return manga.sortDescending()
        ? chapters.lastWhereOrNull((it) => !it.chapter.read)?.chapter
        : chapters.firstWhereOrNull((it) => !it.chapter.read)?.chapter;
  }
}

extension _ChapterListUtils on List<Chapter> {
  //TODO: Support for isLocal
  List<ChapterListItem> toChapterListItems(DownloadManager downloadManager, Manga manga) {
//    final isLocal = manga.isLocal();
    return map((chapter) {
      const activeDownload = null;
      const downloaded = true;
//      final activeDownload = isLocal
//          ? null
//          : downloadManager.getQueuedDownloadOrNull(chapter.id);
//      final downloaded = isLocal
//          ? true
//          : downloadManager.isChapterDownloaded(chapter.name, chapter.scanlator, manga.title, manga.source);
      final DownloadState downloadState;
      if (activeDownload != null) {
        downloadState = activeDownload.status;
      } else if (downloaded) {
        downloadState = DownloadState.downloaded;
      } else {
        downloadState = DownloadState.notDownloaded;
      }

      return ChapterListItem(
        chapter: chapter,
        downloadState: downloadState,
        downloadProgress: activeDownload?.progress ?? 0,
        //selected: selectedChapterIds.contains(chapter.id),
        selected: false,
      );
    }).toList();
  }
}
