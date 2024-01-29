import 'dart:collection';

import 'package:dartx/dartx.dart';
// Alias to prevent conflict with Freezed
import 'package:drift/drift.dart' as drift;
import 'package:equatable/equatable.dart';
import 'package:flutteryomi/presentation/util/chapter/chapter_get_next_unread.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:flutteryomi/core/preference/tri_state.dart';
import 'package:flutteryomi/core/util/collection_utils.dart';
import 'package:flutteryomi/domain/category/interactor/get_categories.dart';
import 'package:flutteryomi/domain/category/interactor/set_manga_categories.dart';
import 'package:flutteryomi/domain/category/model/category.dart';
import 'package:flutteryomi/domain/chapter/interactor/get_chapter.dart';
import 'package:flutteryomi/domain/chapter/interactor/get_chapters_by_manga_id.dart';
import 'package:flutteryomi/domain/chapter/interactor/set_read_status.dart';
import 'package:flutteryomi/domain/chapter/interactor/update_chapter.dart';
import 'package:flutteryomi/domain/chapter/model/chapter.dart';
import 'package:flutteryomi/domain/chapter/model/chapter_update.dart';
import 'package:flutteryomi/domain/download/download_manager.dart';
import 'package:flutteryomi/domain/download/model/download.dart';
import 'package:flutteryomi/domain/history/interactor/get_next_chapters.dart';
import 'package:flutteryomi/domain/library/model/library_display_mode.dart';
import 'package:flutteryomi/domain/library/model/library_manga.dart';
import 'package:flutteryomi/domain/library/model/library_sort_mode.dart';
import 'package:flutteryomi/domain/library/service/library_preferences.dart';
import 'package:flutteryomi/domain/manga/interactor/get_library_manga.dart';
import 'package:flutteryomi/domain/manga/interactor/get_manga.dart';
import 'package:flutteryomi/domain/manga/interactor/update_manga.dart';
import 'package:flutteryomi/domain/manga/model/manga.dart';
import 'package:flutteryomi/domain/manga/model/manga_update.dart';
import 'package:flutteryomi/domain/manga/model/tri_state.dart';
import 'package:flutteryomi/domain/source/model/smanga.dart';
import 'package:flutteryomi/domain/source/service/source_manager.dart';
import 'package:flutteryomi/domain/track/model/track.dart';
import 'package:flutteryomi/domain/updates/interactor/get_updates.dart';
import 'package:flutteryomi/domain/updates/model/updates_with_relations.dart';
import 'package:flutteryomi/presentation/library/components/library_toolbar.dart';
import 'package:flutteryomi/presentation/library/library_item.dart';
import 'package:flutteryomi/presentation/manga/components/chapter_download_indicator.dart';
import 'package:flutteryomi/presentation/manga/manga_screen_constants.dart';
import 'package:flutteryomi/presentation/updates/updates.dart';
import 'package:flutteryomi/presentation/util/lang/date_extensions.dart';

part 'library_screen_model.freezed.dart';
part 'library_screen_model.g.dart';

/// Typealias for the library manga, using the category as keys, and list of manga as values.
typedef LibraryMap = Map<Category, List<LibraryItem>>;

//TODO
@riverpod
class LibraryScreenModel extends _$LibraryScreenModel {
  @override
  Stream<LibraryScreenState> build() {
    final libraryPreferences = ref.watch(libraryPreferencesProvider);
    //combine(
    //  state.map((it) => it.searchQuery).distinctUntilChanged().debounce(searchDebounceMillis),
    //  getLibraryStream(),
    //  getTracksPerManga.subscribe(),
    //  getTrackingFilterFlow(),
    //  downloadCache.changes,
    //) { searchQuery, library, tracks, loggedInTrackers, _ =>
    //  library
    //      .applyFilters(tracks, loggedInTrackers)
    //      .applySort(tracks)
    //      .mapValues((_, value) =>
    //          searchQuery != null
    //              // Filter query
    //              ? value.filter((it) => it.matches(searchQuery))
    //              // Don't do anything
    //              : value
    //      )
    //}
    //    .collectLatest {
    //        mutableState.update { state ->
    //            state.copy(
    //                isLoading = false,
    //                library = it,
    //            )
    //        }
    //    }

    //combine(
    //  libraryPreferences.categoryTabs().changes(),
    //  libraryPreferences.categoryNumberOfItems().changes(),
    //  libraryPreferences.showContinueReadingButton().changes(),
    //) { a, b, c -> arrayOf(a, b, c) }
    //    .onEach { (showCategoryTabs, showMangaCount, showMangaContinueButton) ->
    //        mutableState.update { state ->
    //            state.copy(
    //                showCategoryTabs = showCategoryTabs,
    //                showMangaCount = showMangaCount,
    //                showMangaContinueButton = showMangaContinueButton,
    //            )
    //        }
    //    }
    //    .launchIn(screenModelScope)

    //combine(
    //    getLibraryItemPreferencesFlow(),
    //    getTrackingFilterFlow(),
    //) { prefs, trackFilter =>
    //    (
    //        [
    //          prefs.filterDownloaded,
    //          prefs.filterUnread,
    //          prefs.filterStarted,
    //          prefs.filterBookmarked,
    //          prefs.filterCompleted,
    //          prefs.filterIntervalCustom,
    //        ] + trackFilter.values
    //    ).any((it) => it != TriState.disabled)
    //}
    //    .distinctUntilChanged()
    //    .onEach {
    //        mutableState.update { state ->
    //            state.copy(hasActiveFilters: it)
    //        }
    //    }
    return Stream.empty();
  //  // TODO: Combine with download streams
  //  return getUpdates //
  //      .subscribe(limit)
  //      .distinct()
  //      .map((it) => LibraryScreenState(
  //            items: const [],
  //            lastUpdated: lastUpdated,
  //            selectedChapterIds: HashSet(),
  //          ));
  }


  /// Applies library filters to the given map of manga.
  Future<LibraryMap> applyFilters(
    LibraryMap map,
    Map<int, List<Track>> trackMap,
    Map<int, TriState> loggedInTrackers,
  ) async {
    final downloadManager = ref.watch(downloadManagerProvider);
    final prefs = await getLibraryItemPreferencesStream().first;
    final downloadedOnly = prefs.globalFilterDownloaded;
    final skipOutsideReleasePeriod = prefs.skipOutsideReleasePeriod;
    final filterDownloaded = downloadedOnly ? TriState.enabledIs : prefs.filterDownloaded;
    final filterUnread = prefs.filterUnread;
    final filterStarted = prefs.filterStarted;
    final filterBookmarked = prefs.filterBookmarked;
    final filterCompleted = prefs.filterCompleted;
    final filterIntervalCustom = prefs.filterIntervalCustom;

    final isNotLoggedInAnyTrack = loggedInTrackers.isEmpty;

    final excludedTracks = loggedInTrackers.entries
        .map((it) => it.value == TriState.enabledNot ? it.key : null)
        .whereNotNull();
    final includedTracks = loggedInTrackers.entries
        .map((it) => it.value == TriState.enabledIs ? it.key : null)
        .whereNotNull();
    final trackFiltersIsIgnored = includedTracks.isEmpty && excludedTracks.isEmpty;

    bool filterFnDownloaded(LibraryItem it) {
      return applyFilter(
        filterDownloaded,
        //TODO: Support for LocalSource
        //() => it.libraryManga.manga.isLocal() ||
        () => 
            it.downloadCount > 0 ||
            downloadManager.getDownloadCountForManga(it.libraryManga.manga) > 0,
      );
    }

    bool filterFnUnread(LibraryItem it) =>
        applyFilter(filterUnread, () => it.libraryManga.unreadCount > 0);

    bool filterFnStarted(LibraryItem it) =>
        applyFilter(filterStarted, () => it.libraryManga.hasStarted);

    bool filterFnBookmarked(LibraryItem it) =>
        applyFilter(filterBookmarked, () => it.libraryManga.hasBookmarks);

    bool filterFnCompleted(LibraryItem it) => applyFilter(
          filterCompleted,
          () => it.libraryManga.manga.status.toInt() == SManga.completed,
        );

    bool filterFnIntervalCustom(LibraryItem it) =>
        skipOutsideReleasePeriod
            ? applyFilter(filterIntervalCustom, () => it.libraryManga.manga.fetchInterval < 0)
            : true;

    bool filterFnTracking(LibraryItem item) {
      if (isNotLoggedInAnyTrack || trackFiltersIsIgnored) return true;

      final mangaTracks = trackMap
          .mapValues((entry) => entry.value.map((it) => it.trackerId))[item.libraryManga.id]
          ?? const [];

      final isExcluded = excludedTracks.isNotEmpty
          && mangaTracks.any((it) => excludedTracks.contains(it));
      final isIncluded = includedTracks.isEmpty
          || mangaTracks.any((it) => includedTracks.contains(it));

      return !isExcluded && isIncluded;
    }

    bool filterFn(LibraryItem it) =>
        filterFnDownloaded(it) &&
            filterFnUnread(it) &&
            filterFnStarted(it) &&
            filterFnBookmarked(it) &&
            filterFnCompleted(it) &&
            filterFnIntervalCustom(it) &&
            filterFnTracking(it);

    return map.mapValues((entry) => entry.value.where(filterFn).toList());
  }

  /// Applies library sorting to the given map of manga.
  LibraryMap _applySort(LibraryMap map, Map<int, List<Track>> trackMap) {
    int sortAlphabetically(LibraryItem i1, LibraryItem i2) =>
        i1.libraryManga.manga.title.toLowerCase().compareTo(i2.libraryManga.manga.title.toLowerCase());

    final defaultTrackerScoreSortValue = -1.0;
  //  final trackerMap = trackerManager.loggedInTrackers().associateBy((e) => e.id);
  //  final trackerScores = trackMap.mapValues(
  //    (entry) => entry.value.isEmpty
  //        ? null
  //        : entry.value
  //            .mapNotNull((it) => trackerMap[it.trackerId]?.get10PointScore(it))
  //            .average(),
  //  );

  //  int sortFn(LibraryItem i1, LibraryItem i2) {
  //    final sort = map.keys.firstWhere((it) => it.id == i1.libraryManga.category).librarySort;
  //    switch (sort.type) {
  //      case Alphabetical():
  //        return sortAlphabetically(i1, i2);
  //      case LastRead():
  //        return i1.libraryManga.lastRead.compareTo(i2.libraryManga.lastRead);
  //      case LastUpdate():
  //        return i1.libraryManga.manga.lastUpdate!.compareTo(i2.libraryManga.manga.lastUpdate!);
  //      case UnreadCount():
  //        // Ensure unread content comes first
  //        if (i1.libraryManga.unreadCount == i2.libraryManga.unreadCount) {
  //          return 0;
  //        } else if (i1.libraryManga.unreadCount == 0) {
  //          return sort.isAscending ? 1 : -1;
  //        } else if (i2.libraryManga.unreadCount == 0 ) {
  //          return sort.isAscending ? -1 : 1;
  //        } else {
  //          return i1.libraryManga.unreadCount.compareTo(i2.libraryManga.unreadCount);
  //        }
  //      case TotalChapters():
  //        return i1.libraryManga.totalChapters.compareTo(i2.libraryManga.totalChapters);
  //      case LatestChapter():
  //        return i1.libraryManga.latestUpload.compareTo(i2.libraryManga.latestUpload);
  //      case ChapterFetchDate():
  //        return i1.libraryManga.chapterFetchedAt.compareTo(i2.libraryManga.chapterFetchedAt);
  //      case DateAdded():
  //        return i1.libraryManga.manga.dateAdded.compareTo(i2.libraryManga.manga.dateAdded);
  //      case TrackerMean():
  //        final item1Score = trackerScores[i1.libraryManga.id] ?? defaultTrackerScoreSortValue;
  //        final item2Score = trackerScores[i2.libraryManga.id] ?? defaultTrackerScoreSortValue;
  //        return item1Score.compareTo(item2Score);
  //    }
  //  }

  //  return map.mapValues((entry) {
  //    final comparator = map.keys.firstWhere((it) => it.id == entry.key.id).librarySort.isAscending
  //        ? Comparator(sortFn)
  //        : Collections.reverseOrder(sortFn);

  //    return entry.value.sortedWith(comparator.thenComparator(sortAlphabetically));
  //  });
    return {};
  }

  //TODO
  Stream<_ItemPreferences> getLibraryItemPreferencesStream() {
    final libraryPreferences = ref.watch(libraryPreferencesProvider);
  //  return combine(
  //    libraryPreferences.downloadBadge().changes(),
  //    libraryPreferences.localBadge().changes(),
  //    libraryPreferences.languageBadge().changes(),
  //    libraryPreferences.autoUpdateMangaRestrictions().changes(),

  //    preferences.downloadedOnly().changes(),
  //    libraryPreferences.filterDownloaded().changes(),
  //    libraryPreferences.filterUnread().changes(),
  //    libraryPreferences.filterStarted().changes(),
  //    libraryPreferences.filterBookmarked().changes(),
  //    libraryPreferences.filterCompleted().changes(),
  //    libraryPreferences.filterIntervalCustom().changes(),
  //  ) {
  //    _ItemPreferences(
  //      downloadBadge: it[0] as bool,
  //      localBadge: it[1] as bool,
  //      languageBadge: it[2] as bool,
  //      skipOutsideReleasePeriod: LibraryPreferences.mangaOutsideReleasePeriod in (it[3] as Set<*>),
  //      globalFilterDownloaded: it[4] as bool,
  //      filterDownloaded: it[5] as TriState,
  //      filterUnread: it[6] as TriState,
  //      filterStarted: it[7] as TriState,
  //      filterBookmarked: it[8] as TriState,
  //      filterCompleted: it[9] as TriState,
  //      filterIntervalCustom: it[10] as TriState,
  //    )
  //  }
    return Stream.empty();
  }

  /// Get the categories and all its manga from the database.
  Stream<LibraryMap> _getLibraryStream() {
    final downloadManager = ref.watch(downloadManagerProvider);
    final getLibraryManga = ref.watch(getLibraryMangaProvider);
  //  final libraryMangasStream = combine(
  //    getLibraryManga.subscribe(),
  //    getLibraryItemPreferencesStream(),
  //    downloadCache.changes,
  //  ) { libraryMangaList, prefs, _ ->
  //      libraryMangaList
  //          .map((libraryManga) => 
  //              // Display mode based on user preference: take it from global library setting or category
  //              LibraryItem(
  //                libraryManga,
  //                downloadCount: prefs.downloadBadge
  //                    ? downloadManager.getDownloadCount(libraryManga.manga).toLong()
  //                    : 0,
  //                unreadCount: libraryManga.unreadCount,
  //                isLocal: prefs.localBadge ? libraryManga.manga.isLocal() : false,
  //                sourceLanguage: prefs.languageBadge
  //                    ? sourceManager.getOrStub(libraryManga.manga.source).lang
  //                    : "",
  //              )
  //          )
  //          .groupBy((it) => it.libraryManga.category)
  //  }

  //  return combine(getCategories.subscribe(), libraryMangasStream) { categories, libraryManga ->
  //    final displayCategories = libraryManga.isNotEmpty && !libraryManga.containsKey(0)
  //      ? categories.whereNot((it) => it.isSystemCategory)
  //      : categories;

  //    displayCategories.associateWith((it) => libraryManga[it.id].orEmpty());
  //  }
    return Stream.empty();
  }

  /// Stream of tracking filter preferences
  ///
  /// Returns map of track id with the filter value
  Stream<Map<int, TriState>> _getTrackingFilterStream() {
    //final loggedInTrackers = trackerManager.loggedInTrackers();
    //if (loggedInTrackers.isNotEmpty) {
    //  final prefStreams = loggedInTrackers
    //      .map((it) => libraryPreferences.filterTracking(it.id.toInt()).changes());
    //  return combine(*prefStreams) {
    //      loggedInTrackers
    //          .mapIndexed { index, tracker -> tracker.id to it[index] }
    //          .toMap()
    //  }
    //} else {
    //  return flowOf(emptyMap());
    //}
    return Stream.empty();
  }

  /// Returns the common categories for the given list of manga [mangas].
  Future<Iterable<Category>> _getCommonCategories(List<Manga> mangas) async {
    if (mangas.isEmpty) return const [];
    final getCategories = ref.watch(getCategoriesProvider);
    final _categories = [
      for (final it in mangas) await getCategories.await_(it.id),
    ].map((it) => it.toSet());
    return _categories.reduce((set1, set2) => set1.intersection(set2));
  }

  Future<Chapter?> getNextUnreadChapter(Manga manga) async {
    final downloadManager = ref.watch(downloadManagerProvider);
    final getChaptersByMangaId = ref.watch(getChaptersByMangaIdProvider);
    final chapters = await getChaptersByMangaId.await_(manga.id, applyScanlatorFilter: true);
    return chapters.getNextUnread(manga, downloadManager);
  }

  /// Returns the mix (non-common) categories for the given list of manga [mangas].
  Future<Iterable<Category>> _getMixCategories(List<Manga> mangas) async {
    //if (mangas.isEmpty) return const [];
    //final mangaCategories = mangas.map((it) => getCategories.await_(it.id).toSet());
    //final common = mangaCategories.reduce((set1, set2) => set1.intersect(set2));
    //return mangaCategories.flatten().distinct().subtract(common);
    return [];
  }

  void runDownloadActionSelection(DownloadAction action) {
    //final selection = state.value.selection;
    //final mangas = selection.map((it) => it.manga).toList();
    //switch (action) {
    //  case DownloadAction.next1Chapter:
    //    _downloadUnreadChapters(mangas, 1);
    //  case DownloadAction.next5Chapters:
    //    _downloadUnreadChapters(mangas, 5);
    //  case DownloadAction.next10Chapters:
    //    _downloadUnreadChapters(mangas, 10);
    //  case DownloadAction.next25Chapters:
    //    _downloadUnreadChapters(mangas, 25);
    //  case DownloadAction.unreadChapters:
    //    _downloadUnreadChapters(mangas, null);
    //}
    //clearSelection();
  }

  /// Queues the [amount] specified of unread chapters from the list of mangas [mangas].
  ///
  /// [amount] can be set to null to queue all
  void _downloadUnreadChapters(List<Manga> mangas, int? amount) {
    final downloadManager = ref.watch(downloadManagerProvider);
    final getNextChapters = ref.watch(getNextChaptersProvider);
    mangas.forEach((manga) async {
      final __chapters = await getNextChapters.awaitByMangaId(manga.id);
      final _chapters = __chapters
          .whereNot((chapter) =>
                downloadManager.getQueuedDownloadOrNull(chapter.id) != null ||
                downloadManager.isChapterDownloaded(
                  chapter.name,
                  chapter.scanlator,
                  manga.title,
                  manga.source,
                ),
          );
      final chapters = amount != null ? _chapters.take(amount) : _chapters;

      downloadManager.downloadChapters(manga, chapters.toList());
    });
  }

  /// Marks mangas' chapters read status.
  void markReadSelection(bool read) {
    final setReadStatus = ref.watch(setReadStatusProvider);
    //final mangas = state.value.selection.toList();
    //mangas.forEach((manga) => setReadStatus.awaitByManga(manga.manga, read));
    //clearSelection();
  }

  /// Remove the selected manga in [mangaList].
  ///
  /// [deleteFromLibrary] indicates whether to delete manga from library.
  /// [deleteChapters] indicates whether to delete downloaded chapters.
  void removeMangas(List<Manga> mangaList, bool deleteFromLibrary, bool deleteChapters) async {
    final downloadManager = ref.watch(downloadManagerProvider);
    final updateManga = ref.watch(updateMangaProvider);
    final mangaToDelete = mangaList.distinctBy((it) => it.id);

    if (deleteFromLibrary) {
      final toDelete = mangaToDelete.map((it) {
        //it.removeCovers(coverCache);
        return MangaUpdate(
          favorite: drift.Value(false),
          id: drift.Value(it.id),
        )
      }).toList();
      await updateManga.awaitAll(toDelete);
    }

    if (deleteChapters) {
      mangaToDelete.forEach((manga) {
        //final source = sourceManager.get(manga.source) as? HttpSource;
        //if (source != null) {
        //  downloadManager.deleteManga(manga, source);
        //}
      });
    }
  }

  /// Bulk update categories of manga using old and new common categories.
  ///
  /// [mangaList] is the list of manga to move.
  /// [addCategories] is the list of categories to add for all mangas.
  /// [removeCategories] is the list ofcategories to remove in all mangas.
  void setMangaCategories(
    List<Manga> mangaList,
    List<int> addCategories,
    List<int> removeCategories,
  ) {
    final getCategories = ref.watch(getCategoriesProvider);
    final setMangaCategories = ref.watch(setMangaCategoriesProvider);
    mangaList.forEach((manga) async {
      final _categoryIds = await getCategories.await_(manga.id);
      final categoryIds = _categoryIds.map((it) => it.id).toSet();
      categoryIds.removeAll(removeCategories);
      categoryIds.addAll(addCategories);

      await setMangaCategories.await_(manga.id, categoryIds.toList());
    });
  }

  LibraryDisplayMode getDisplayMode() {
    final libraryPreferences = ref.watch(libraryPreferencesProvider);
    return libraryPreferences.displayMode().get();
  }

  int getColumnsPreferenceForCurrentOrientation(bool isLandscape) {
    final libraryPreferences = ref.watch(libraryPreferencesProvider);
    return isLandscape
        ? libraryPreferences.landscapeColumns().get()
        : libraryPreferences.portraitColumns().get();
  }

  Future<LibraryItem?> getRandomLibraryItemForCurrentCategory() async {
    //if (state.value.categories.isEmpty) return null;

    //return withIOContext {
    //    state.value
    //        .getLibraryItemsByCategoryId(state.value.categories[activeCategoryIndex].id)
    //        ?.randomOrNull();
    //};
    return null;
  }

  //TODO
  void clearSelection() {
    //mutableState.update { it.copy(selection: const []) }
  }

  //TODO
  void toggleSelection(LibraryManga manga) {
    //mutableState.update { state ->
    //  final newSelection = state.selection.mutate { list ->
    //    if (list.any((it) => it.id == manga.id) {
    //      list.removeAll((it) => it.id == manga.id);
    //    } else {
    //      list.add(manga);
    //    }
    //  }
    //  state.copy(selection: newSelection);
    //}
  }

  //TODO
  /// Selects all mangas between and including the given manga and the last pressed manga from the
  /// same category as the given manga
  void toggleRangeSelection(LibraryManga manga) {
    //mutableState.update { state ->
    //  final newSelection = state.selection.mutate { list ->
    //    final lastSelected = list.lastOrNull()
    //    if (lastSelected?.category != manga.category) {
    //      list.add(manga)
    //      return@mutate
    //    }

    //    final items = state.getLibraryItemsByCategoryId(manga.category)
    //        ?.map((it) => it.libraryManga).orEmpty()
    //    final lastMangaIndex = items.indexOf(lastSelected)
    //    final curMangaIndex = items.indexOf(manga)

    //    final selectedIds = list.fastMap { it.id }
    //    final selectionRange;
    //    if (lastMangaIndex < curMangaIndex) {
    //      selectionRange = IntRange(lastMangaIndex, curMangaIndex);
    //    } (curMangaIndex < lastMangaIndex) {
    //      selectionRange = IntRange(curMangaIndex, lastMangaIndex);
    //    } else {
    //      // We shouldn't reach this point
    //      //return;
    //    }
    //    final newSelections = selectionRange.mapNotNull { index ->
    //        items[index].takeUnless { it.id in selectedIds }
    //    }
    //    list.addAll(newSelections);
    //  }
    //  state.copy(selection: newSelection);
    //}
  }

  //TODO
  void selectAll(int index) {
    //mutableState.update { state ->
    //  final newSelection = state.selection.mutate { list ->
    //    final categoryId = state.categories.elementAtOrNull(index)?.id ?? -1;
    //    final selectedIds = list.map((it) => it.id);
    //    state.getLibraryItemsByCategoryId(categoryId)
    //      ?.mapNotNull { item ->
    //        item.libraryManga.takeUnless { it.id in selectedIds }
    //      }
    //      ?.let { list.addAll(it) }
    //  }
    //  state.copy(selection: newSelection)
    //}
  }

  //TODO
  void invertSelection(int index) {
    //mutableState.update { state ->
    //  final newSelection = state.selection.mutate { list ->
    //    final categoryId = state.categories[index].id
    //    final items = state.getLibraryItemsByCategoryId(categoryId)?.fastMap { it.libraryManga }.orEmpty()
    //    final selectedIds = list.fastMap { it.id }
    //    final (toRemove, toAdd) = items.fastPartition { it.id in selectedIds }
    //    final toRemoveIds = toRemove.fastMap { it.id }
    //    list.removeAll { it.id in toRemoveIds }
    //    list.addAll(toAdd)
    //  }
    //  state.copy(selection = newSelection)
    //}
  }

  //TODO
  void search(String? query) {
    //mutableState.update { it.copy(searchQuery = query) };
  }
}

class LibraryScreenState extends Equatable {
  LibraryScreenState({
    this.isLoading = true,
    this.library = const {},
    this.searchQuery,
    this.selection = const [],
    this.hasActiveFilters = false,
    this.showCategoryTabs = false,
    this.showMangaCount = false,
    this.showMangaContinueButton = false,
  });

  final bool isLoading;
  final LibraryMap library;
  final String? searchQuery;
  final List<LibraryManga> selection;
  final bool hasActiveFilters;
  final bool showCategoryTabs;
  final bool showMangaCount;
  final bool showMangaContinueButton;

  late final _libraryCount = library.values
      .flatten()
      .distinctBy((it) => it.libraryManga.manga.id)
      .length;

  late final isLibraryEmpty = _libraryCount == 0;

  late final selectionMode = selection.isNotEmpty;

  late final categories = library.keys.toList();

  List<LibraryItem>? getLibraryItemsByCategoryId(int categoryId) {
    final items = library.filter((e) => e.key.id == categoryId);
    return items.isNotEmpty ? items.toList().first.second : null;
  }

  List<LibraryItem> getLibraryItemsByPage(int page) =>
      library.values.toList().elementAtOrNull(page) ?? const [];

  int? getMangaCountForCategory(Category category) =>
    showMangaCount || !searchQuery.isNullOrEmpty ? library[category]?.length : null;

  LibraryToolbarTitle getToolbarTitle(
    String defaultTitle,
    String defaultCategoryTitle,
    int page,
  ) {
    final category = categories.elementAtOrNull(page);
    if (category == null) return LibraryToolbarTitle(defaultTitle);
    final categoryName = category.isSystemCategory ? defaultCategoryTitle : category.name;
    final title = showCategoryTabs ? defaultTitle : categoryName;
    final count;
    if (!showMangaCount) {
      count = null;
    } else if (!showCategoryTabs) {
      count = getMangaCountForCategory(category);
    } else {
      // Whole library count
      count = _libraryCount;
    }

    return LibraryToolbarTitle(title, count);
  }

  @override
  List<Object?> get props => [
        isLoading,
        library,
        searchQuery,
        selection,
        hasActiveFilters,
        showCategoryTabs,
        showMangaCount,
        showMangaContinueButton,
      ];
}

@freezed
class _ItemPreferences with _$ItemPreferences {
  const factory _ItemPreferences({
    required UpdatesWithRelations update,
    required DownloadState Function() downloadStateProvider,
    required int Function() downloadProgressProvider,
    @Default(false) bool selected,
    required bool downloadBadge,
    required bool localBadge,
    required bool languageBadge,
    required bool skipOutsideReleasePeriod,
    required bool globalFilterDownloaded,
    required TriState filterDownloaded,
    required TriState filterUnread,
    required TriState filterStarted,
    required TriState filterBookmarked,
    required TriState filterCompleted,
    required TriState filterIntervalCustom,
  }) = __ItemPreferences;
}

extension LibraryMapExtensions on LibraryMap {
}
