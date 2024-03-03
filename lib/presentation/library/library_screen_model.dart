import 'dart:math';

import 'package:dartx/dartx.dart';
// Alias to prevent conflict with Freezed
import 'package:drift/drift.dart' as drift;
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:rxdart/rxdart.dart' hide DebounceExtensions;
import 'package:stream_transform/stream_transform.dart';

import 'package:flutteryomi/core/preference/tri_state.dart';
import 'package:flutteryomi/data/track/tracker_manager.dart';
import 'package:flutteryomi/domain/base/base_preferences.dart';
import 'package:flutteryomi/domain/category/interactor/get_categories.dart';
import 'package:flutteryomi/domain/category/interactor/set_manga_categories.dart';
import 'package:flutteryomi/domain/category/model/category.dart';
import 'package:flutteryomi/domain/chapter/interactor/get_chapters_by_manga_id.dart';
import 'package:flutteryomi/domain/chapter/interactor/set_read_status.dart';
import 'package:flutteryomi/domain/chapter/model/chapter.dart';
import 'package:flutteryomi/domain/download/download_manager.dart';
import 'package:flutteryomi/domain/history/interactor/get_next_chapters.dart';
import 'package:flutteryomi/domain/library/model/library_display_mode.dart';
import 'package:flutteryomi/domain/library/model/library_manga.dart';
import 'package:flutteryomi/domain/library/model/library_sort_mode.dart';
import 'package:flutteryomi/domain/library/service/library_preferences.dart';
import 'package:flutteryomi/domain/manga/interactor/get_library_manga.dart';
import 'package:flutteryomi/domain/manga/interactor/update_manga.dart';
import 'package:flutteryomi/domain/manga/model/manga.dart';
import 'package:flutteryomi/domain/manga/model/manga_update.dart';
import 'package:flutteryomi/domain/manga/model/tri_state.dart';
import 'package:flutteryomi/domain/source/model/smanga.dart';
import 'package:flutteryomi/domain/source/service/source_manager.dart';
import 'package:flutteryomi/domain/track/interactor/get_tracks_per_manga.dart';
import 'package:flutteryomi/domain/track/model/track.dart';
import 'package:flutteryomi/presentation/components/app_bar.dart';
import 'package:flutteryomi/presentation/library/components/library_toolbar.dart';
import 'package:flutteryomi/presentation/library/library_item.dart';
import 'package:flutteryomi/presentation/manga/manga_screen_constants.dart';
import 'package:flutteryomi/presentation/util/chapter/chapter_get_next_unread.dart';
import 'package:flutteryomi/source/api/online/http_source.dart';
import 'package:flutteryomi/source/local/local_source.dart';

part 'library_screen_model.freezed.dart';
part 'library_screen_model.g.dart';

/// Typedef for the library manga, using the category as keys, and list of manga as values.
typedef LibraryMap = Map<Category, List<LibraryItem>>;

@riverpod
class LibraryScreenModel extends _$LibraryScreenModel {
  Stream<String?> searchQueryStream() async* {
    yield state.valueOrNull?.searchQuery;
  }

  @override
  Stream<LibraryScreenState> build() {
    final libraryPreferences = ref.watch(libraryPreferencesProvider);
    final getTracksPerManga = ref.watch(getTracksPerMangaProvider);
    final stream1 = Rx.combineLatestList([
      searchQueryStream()
          .distinct()
          .debounce(const Duration(milliseconds: searchDebounceMillis)),
      _getLibraryStream(),
      getTracksPerManga.subscribe(),
      _getTrackingFilterStream(),
      //downloadCache.changes,
    ]).asyncMap((e) async {
      final searchQuery = e.first as String?;
      final library = e.second as LibraryMap;
      final tracks = e.third as Map<int, List<Track>>;
      final loggedInTrackers = e.fourth as Map<int, TriState>;
      final newLibrary = library;
      final filteredLibrary =
          await applyFilters(newLibrary, tracks, loggedInTrackers);
      final sortedLibrary = _applySort(filteredLibrary, tracks);
      final queriedLibrary =
          sortedLibrary.mapValues((entry) => searchQuery != null
              // Filter query
              ? entry.value.where((it) => it.matches(searchQuery)).toList()
              // Don't do anything
              : entry.value.toList());
      return LibraryScreenState(
        library: queriedLibrary,
        searchQuery: searchQuery,
      );
    });

    final stream2 = Rx.combineLatest3(
      libraryPreferences.categoryTabs().changes(),
      libraryPreferences.categoryNumberOfItems().changes(),
      libraryPreferences.showContinueReadingButton().changes(),
      (a, b, c) => LibraryScreenState(
        showCategoryTabs: a,
        showMangaCount: b,
        showMangaContinueButton: c,
      ),
    );

    final stream3 = Rx.combineLatest2(
      _getLibraryItemPreferencesStream(),
      _getTrackingFilterStream(),
      (prefs, trackFilter) => ([
        prefs.filterDownloaded,
        prefs.filterUnread,
        prefs.filterStarted,
        prefs.filterBookmarked,
        prefs.filterCompleted,
        prefs.filterIntervalCustom,
        trackFilter.values,
      ]).any((it) => it != TriState.disabled),
    )
        .distinct()
        .map((it) => LibraryScreenState(hasActiveFilters: it));

    return Rx.combineLatest3(
      stream1,
      stream2,
      stream3,
      (a, b, c) => LibraryScreenState(
        library: a.library,
        searchQuery: a.searchQuery,
        //selection?
        showCategoryTabs: b.showCategoryTabs,
        showMangaCount: b.showMangaCount,
        showMangaContinueButton: b.showMangaContinueButton,
        hasActiveFilters: c.hasActiveFilters,
      ),
    );
  }

  /// Applies library filters to the given map of manga.
  Future<LibraryMap> applyFilters(
    LibraryMap map,
    Map<int, List<Track>> trackMap,
    Map<int, TriState> loggedInTrackers,
  ) async {
    final downloadManager = ref.watch(downloadManagerProvider);
    final prefs = await _getLibraryItemPreferencesStream().first;
    final downloadedOnly = prefs.globalFilterDownloaded;
    final skipOutsideReleasePeriod = prefs.skipOutsideReleasePeriod;
    final filterDownloaded =
        downloadedOnly ? TriState.enabledIs : prefs.filterDownloaded;
    final filterUnread = prefs.filterUnread;
    final filterStarted = prefs.filterStarted;
    final filterBookmarked = prefs.filterBookmarked;
    final filterCompleted = prefs.filterCompleted;
    final filterIntervalCustom = prefs.filterIntervalCustom;

    final isNotLoggedInAnyTrack = loggedInTrackers.isEmpty;

    final excludedTracks = loggedInTrackers.entries
        .mapNotNull((it) => it.value == TriState.enabledNot ? it.key : null);
    final includedTracks = loggedInTrackers.entries
        .mapNotNull((it) => it.value == TriState.enabledIs ? it.key : null);
    final trackFiltersIsIgnored =
        includedTracks.isEmpty && excludedTracks.isEmpty;

    bool filterFnDownloaded(LibraryItem it) {
      return applyFilter(
        filterDownloaded,
        () =>
            it.libraryManga.manga.isLocal() ||
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

    bool filterFnIntervalCustom(LibraryItem it) => skipOutsideReleasePeriod
        ? applyFilter(
            filterIntervalCustom, () => it.libraryManga.manga.fetchInterval < 0)
        : true;

    bool filterFnTracking(LibraryItem item) {
      if (isNotLoggedInAnyTrack || trackFiltersIsIgnored) return true;

      final mangaTracks = trackMap.mapValues(
            (entry) => entry.value.map((it) => it.trackerId),
          )[item.libraryManga.id] ??
          const [];

      final isExcluded = excludedTracks.isNotEmpty &&
          mangaTracks.any((it) => excludedTracks.contains(it));
      final isIncluded = includedTracks.isEmpty ||
          mangaTracks.any((it) => includedTracks.contains(it));

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
    final trackerManager = ref.watch(trackerManagerProvider);
    int sortAlphabetically(LibraryItem i1, LibraryItem i2) =>
        i1.libraryManga.manga.title
            .toLowerCase()
            .compareTo(i2.libraryManga.manga.title.toLowerCase());

    const defaultTrackerScoreSortValue = -1.0;
    final trackerMap =
        trackerManager.loggedInTrackers().associateBy((e) => e.id);
    final trackerScores = trackMap.mapValues(
      (entry) => entry.value.isEmpty
          ? null
          : entry.value
              .mapNotNull((it) => trackerMap[it.trackerId]?.get10PointScore(it))
              .average(),
    );

    int sortFn(LibraryItem i1, LibraryItem i2) {
      final sort = map.keys
          .firstWhere((it) => it.id == i1.libraryManga.category)
          .librarySort;
      switch (sort.type) {
        case Alphabetical():
          return sortAlphabetically(i1, i2);
        case LastRead():
          return i1.libraryManga.lastRead.compareTo(i2.libraryManga.lastRead);
        case LastUpdate():
          return i1.libraryManga.manga.lastUpdate!
              .compareTo(i2.libraryManga.manga.lastUpdate!);
        case UnreadCount():
          // Ensure unread content comes first
          if (i1.libraryManga.unreadCount == i2.libraryManga.unreadCount) {
            return 0;
          } else if (i1.libraryManga.unreadCount == 0) {
            return sort.isAscending ? 1 : -1;
          } else if (i2.libraryManga.unreadCount == 0) {
            return sort.isAscending ? -1 : 1;
          } else {
            return i1.libraryManga.unreadCount
                .compareTo(i2.libraryManga.unreadCount);
          }
        case TotalChapters():
          return i1.libraryManga.totalChapters
              .compareTo(i2.libraryManga.totalChapters);
        case LatestChapter():
          return i1.libraryManga.latestUpload
              .compareTo(i2.libraryManga.latestUpload);
        case ChapterFetchDate():
          return i1.libraryManga.chapterFetchedAt
              .compareTo(i2.libraryManga.chapterFetchedAt);
        case DateAdded():
          return i1.libraryManga.manga.dateAdded
              .compareTo(i2.libraryManga.manga.dateAdded);
        case TrackerMean():
          final item1Score =
              trackerScores[i1.libraryManga.id] ?? defaultTrackerScoreSortValue;
          final item2Score =
              trackerScores[i2.libraryManga.id] ?? defaultTrackerScoreSortValue;
          return item1Score.compareTo(item2Score);
      }
    }

    return map.mapValues((entry) {
      final comparator = map.keys
              .firstWhere((it) => it.id == entry.key.id)
              .librarySort
              .isAscending
          ? sortFn
          : sortFn.reverse();
      return entry.value.sortedWith(comparator).sortedWith(sortAlphabetically);
    });
  }

  Stream<_ItemPreferences> _getLibraryItemPreferencesStream() {
    final preferences = ref.watch(basePreferencesProvider);
    final libraryPreferences = ref.watch(libraryPreferencesProvider);
    return Rx.combineLatestList([
      libraryPreferences.downloadBadge().changes(),
      libraryPreferences.localBadge().changes(),
      libraryPreferences.languageBadge().changes(),
      libraryPreferences.autoUpdateMangaRestrictions().changes(),
      preferences.downloadedOnly().changes(),
      libraryPreferences.filterDownloaded().changes(),
      libraryPreferences.filterUnread().changes(),
      libraryPreferences.filterStarted().changes(),
      libraryPreferences.filterBookmarked().changes(),
      libraryPreferences.filterCompleted().changes(),
      libraryPreferences.filterIntervalCustom().changes(),
    ]).map((it) => _ItemPreferences(
          downloadBadge: it[0] as bool,
          localBadge: it[1] as bool,
          languageBadge: it[2] as bool,
          skipOutsideReleasePeriod: (it[3] as Set<String>)
              .contains(LibraryPreferences.mangaOutsideReleasePeriod),
          globalFilterDownloaded: it[4] as bool,
          filterDownloaded: it[5] as TriState,
          filterUnread: it[6] as TriState,
          filterStarted: it[7] as TriState,
          filterBookmarked: it[8] as TriState,
          filterCompleted: it[9] as TriState,
          filterIntervalCustom: it[10] as TriState,
        ));
  }

  /// Get the categories and all its manga from the database.
  Stream<LibraryMap> _getLibraryStream() {
    //final downloadCache = ref.watch(downloadCacheProvider);
    final downloadManager = ref.watch(downloadManagerProvider);
    final getCategories = ref.watch(getCategoriesProvider);
    final getLibraryManga = ref.watch(getLibraryMangaProvider);
    final sourceManager = ref.watch(sourceManagerProvider);
    final libraryMangasStream = Rx.combineLatest2(
      getLibraryManga.subscribe(),
      _getLibraryItemPreferencesStream(),
      //downloadCache.changes,
      (libraryMangaList, prefs) => libraryMangaList.map(
        // Display mode based on user preference: take it from global library setting or category
        (libraryManga) => LibraryItem(
          libraryManga: libraryManga,
          downloadCount: prefs.downloadBadge
              ? downloadManager.getDownloadCountForManga(libraryManga.manga)
              : 0,
          unreadCount: libraryManga.unreadCount,
          isLocal: prefs.localBadge ? libraryManga.manga.isLocal() : false,
          sourceLanguage: prefs.languageBadge
              ? sourceManager.getOrStub(libraryManga.manga.source).lang
              : "",
          sourceManager: sourceManager,
        ),
      ).groupBy((it) => it.libraryManga.category),
    );

    return Rx.combineLatest2(
      getCategories.subscribe(),
      libraryMangasStream,
      (categories, libraryManga) {
        final displayCategories =
            libraryManga.isNotEmpty && !libraryManga.containsKey(0)
                ? categories.whereNot((it) => it.isSystemCategory)
                : categories;

        return displayCategories
            .associateWith((it) => libraryManga[it.id] ?? const []);
      }
    );
  }

  /// Stream of tracking filter preferences
  ///
  /// Returns map of track id with the filter value
  Stream<Map<int, TriState>> _getTrackingFilterStream() {
    final libraryPreferences = ref.watch(libraryPreferencesProvider);
    final trackerManager = ref.watch(trackerManagerProvider);
    final loggedInTrackers = trackerManager.loggedInTrackers();
    if (loggedInTrackers.isNotEmpty) {
      final prefStreams = loggedInTrackers
          .map((it) => libraryPreferences.filterTracking(it.id).changes());
      return Rx.combineLatestList(prefStreams).map((it) => Map.fromIterable(
            loggedInTrackers
                .mapIndexed((index, tracker) => (tracker.id, it[index])),
          ));
    } else {
      return Stream.value({});
    }
  }

  /// Returns the common categories for the given list of manga [mangas].
  Future<Iterable<Category>> getCommonCategories(List<Manga> mangas) async {
    if (mangas.isEmpty) return const [];
    final getCategories = ref.watch(getCategoriesProvider);
    final categories = [
      for (final it in mangas) await getCategories.await_(it.id),
    ].map((it) => it.toSet());
    return categories.reduce((set1, set2) => set1.intersection(set2));
  }

  Future<Chapter?> getNextUnreadChapter(Manga manga) async {
    final downloadManager = ref.watch(downloadManagerProvider);
    final getChaptersByMangaId = ref.watch(getChaptersByMangaIdProvider);
    final chapters =
        await getChaptersByMangaId.await_(manga.id, applyScanlatorFilter: true);
    return chapters.getNextUnread(manga, downloadManager);
  }

  /// Returns the mix (non-common) categories for the given list of manga [mangas].
  Future<Iterable<Category>> getMixCategories(List<Manga> mangas) async {
    final getCategories = ref.watch(getCategoriesProvider);
    if (mangas.isEmpty) return const [];
    final mangaCategories = await Future.wait(
      mangas.map((it) async {
        final categories = await getCategories.await_(it.id);
        return categories.toSet();
      }),
    );
    final common = mangaCategories.reduce(
      (set1, set2) => set1.intersection(set2),
    );
    return mangaCategories.flatten().toSet().difference(common);
  }

  void runDownloadActionSelection(DownloadAction action) {
    final currentState = state.valueOrNull;
    if (currentState != null) {
      final selection = currentState.selection;
      final mangas = selection.map((it) => it.manga).toList();
      switch (action) {
        case DownloadAction.next1Chapter:
          _downloadUnreadChapters(mangas, 1);
        case DownloadAction.next5Chapters:
          _downloadUnreadChapters(mangas, 5);
        case DownloadAction.next10Chapters:
          _downloadUnreadChapters(mangas, 10);
        case DownloadAction.next25Chapters:
          _downloadUnreadChapters(mangas, 25);
        case DownloadAction.unreadChapters:
          _downloadUnreadChapters(mangas, null);
      }
    }
    clearSelection();
  }

  /// Queues the [amount] specified of unread chapters from the list of mangas [mangas].
  ///
  /// [amount] can be set to null to queue all
  void _downloadUnreadChapters(List<Manga> mangas, int? amount) async {
    final downloadManager = ref.watch(downloadManagerProvider);
    final getNextChapters = ref.watch(getNextChaptersProvider);
    for (final manga in mangas) {
      final rawChapters = await getNextChapters.awaitByMangaId(manga.id);
      final filteredChapters = rawChapters.whereNot(
        (chapter) =>
            downloadManager.getQueuedDownloadOrNull(chapter.id) != null ||
            downloadManager.isChapterDownloaded(
              chapter.name,
              chapter.scanlator,
              manga.title,
              manga.source,
            ),
      );
      final chapters = amount != null //
          ? filteredChapters.take(amount)
          : filteredChapters;

      downloadManager.downloadChapters(manga, chapters.toList());
    }
  }

  /// Marks mangas' chapters read status.
  void markReadSelection(bool read) {
    final setReadStatus = ref.watch(setReadStatusProvider);
    if (state.valueOrNull != null) {
      final mangas = state.valueOrNull!.selection.toList();
      for (final manga in mangas) {
        setReadStatus.awaitByManga(manga.manga, read);
      }
      clearSelection();
    }
  }

  //TODO
  /// Remove the selected manga in [mangaList].
  ///
  /// [deleteFromLibrary] indicates whether to delete manga from library.
  /// [deleteChapters] indicates whether to delete downloaded chapters.
  void removeMangas(List<Manga> mangaList, bool deleteFromLibrary,
      bool deleteChapters) async {
    final downloadManager = ref.watch(downloadManagerProvider);
    final sourceManager = ref.watch(sourceManagerProvider);
    final updateManga = ref.watch(updateMangaProvider);
    final mangaToDelete = mangaList.distinctBy((it) => it.id);

    if (deleteFromLibrary) {
      final toDelete = mangaToDelete.map((it) {
        //it.removeCovers(coverCache);
        return MangaUpdate(
          favorite: const drift.Value(false),
          id: drift.Value(it.id),
        );
      }).toList();
      await updateManga.awaitAll(toDelete);
    }

    if (deleteChapters) {
      for (final manga in mangaToDelete) {
        final source = sourceManager.get(manga.source) as HttpSource?;
        if (source != null) downloadManager.deleteManga(manga, source);
      }
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
  ) async {
    final getCategories = ref.watch(getCategoriesProvider);
    final setMangaCategories = ref.watch(setMangaCategoriesProvider);
    for (final manga in mangaList) {
      final rawCategoryIds = await getCategories.await_(manga.id);
      final categoryIds = rawCategoryIds.map((it) => it.id).toSet();
      categoryIds.removeAll(removeCategories);
      categoryIds.addAll(addCategories);

      await setMangaCategories.await_(manga.id, categoryIds.toList());
    }
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

  LibraryItem? getRandomLibraryItemForCategory(int index) {
    final currentState = state.valueOrNull;
    if (currentState?.categories.isEmpty ?? false) return null;
    final libraryItems = currentState!.getLibraryItemsByCategoryId(
      currentState.categories[index].id,
    );
    return (libraryItems?.isNotEmpty ?? false)
        ? libraryItems![Random().nextInt(libraryItems.length)]
        : null;
  }

  void clearSelection() async {
    final previousState = state.valueOrNull;
    if (previousState != null) {
      state = await AsyncValue.guard(
        () async => previousState.copyWith(selection: const []),
      );
    }
  }

  void toggleSelection(LibraryManga manga) async {
    final previousState = state.valueOrNull;
    if (previousState != null) {
      // Might mutate previousState
      final newSelection = previousState.selection;
      if (newSelection.any((it) => it.id == manga.id)) {
        newSelection.removeWhere((it) => it.id == manga.id);
      } else {
        newSelection.add(manga);
      }
      final newState = previousState.copyWith(selection: newSelection);
      state = await AsyncValue.guard(() async => newState);
    }
  }

  /// Selects all mangas between and including the given manga and the last pressed manga from the
  /// same category as the given manga
  void toggleRangeSelection(LibraryManga manga) async {
    final previousState = state.valueOrNull;
    if (previousState != null) {
      // Might mutate previousState
      final newSelection = previousState.selection;
      final lastSelected = newSelection.lastOrNull;
      if (lastSelected?.category != manga.category) {
        newSelection.add(manga);
        final newState = previousState.copyWith(selection: newSelection);
        state = await AsyncValue.guard(() async => newState);
        return;
      }

      final items = previousState
              .getLibraryItemsByCategoryId(manga.category)
              ?.map((it) => it.libraryManga)
              .toList() ??
          const [];
      final lastMangaIndex = items.indexOf(lastSelected!);
      final curMangaIndex = items.indexOf(manga);

      final selectedIds = newSelection.map((it) => it.id);
      final IntRange selectionRange;
      if (lastMangaIndex < curMangaIndex) {
        selectionRange = IntRange(lastMangaIndex, curMangaIndex);
      } else if (curMangaIndex < lastMangaIndex) {
        selectionRange = IntRange(curMangaIndex, lastMangaIndex);
      } else {
        // We shouldn't reach this point
        return;
      }
      final newSelections = selectionRange.mapNotNull(
        (index) => selectedIds.contains(items[index].id) ? null : items[index],
      );
      newSelection.addAll(newSelections);
      final newState = previousState.copyWith(selection: newSelection);
      state = await AsyncValue.guard(() async => newState);
    }
  }

  void selectAll(int index) async {
    final previousState = state.valueOrNull;
    if (previousState != null) {
      // Might mutate previousState
      final newSelection = previousState.selection;
      final categoryId =
          previousState.categories.elementAtOrNull(index)?.id ?? -1;
      final selectedIds = newSelection.map((it) => it.id);
      final items = previousState
          .getLibraryItemsByCategoryId(categoryId)
          ?.mapNotNull((item) => selectedIds.contains(item.libraryManga.id)
              ? null
              : item.libraryManga);
      if (items != null) newSelection.addAll(items);
      final newState = previousState.copyWith(selection: newSelection);
      state = await AsyncValue.guard(() async => newState);
    }
  }

  void invertSelection(int index) async {
    final previousState = state.valueOrNull;
    if (previousState != null) {
      // Might mutate previousState
      final newSelection = previousState.selection;
      final categoryId = previousState.categories[index].id;
      final items = previousState
              .getLibraryItemsByCategoryId(categoryId)
              ?.map((it) => it.libraryManga) ??
          const [];
      final selectedIds = newSelection.map((it) => it.id);
      final partitions = items.partition((it) => selectedIds.contains(it.id));
      final toRemove = partitions[0];
      final toAdd = partitions[1];
      final toRemoveIds = toRemove.map((it) => it.id);
      newSelection.removeWhere((it) => toRemoveIds.contains(it.id));
      newSelection.addAll(toAdd);
      final newState = previousState.copyWith(selection: newSelection);
      state = await AsyncValue.guard(() async => newState);
    }
  }

  void search(String? query) async {
    final previousState = state.valueOrNull;
    if (previousState != null) {
      final newState = previousState.copyWith(searchQuery: query);
      state = await AsyncValue.guard(() async => newState);
    }
  }
}

@freezed
class LibraryScreenState with _$LibraryScreenState {
  const LibraryScreenState._();
  const factory LibraryScreenState({
    @Default({}) LibraryMap library,
    String? searchQuery,
    @Default([]) List<LibraryManga> selection,
    @Default(false) bool hasActiveFilters,
    @Default(false) bool showCategoryTabs,
    @Default(false) bool showMangaCount,
    @Default(false) bool showMangaContinueButton,
  }) = _LibraryScreenState;

  // Getters might be slower than precomputed values :(
  int get _libraryCount => library.values
      .flatten()
      .distinctBy((it) => it.libraryManga.manga.id)
      .length;

  bool get isLibraryEmpty => _libraryCount == 0;

  bool get selectionMode => selection.isNotEmpty;

  List<Category> get categories => library.keys.toList();

  List<LibraryItem>? getLibraryItemsByCategoryId(int categoryId) {
    final items = library.filter((e) => e.key.id == categoryId);
    return items.isNotEmpty ? items.toList().first.second : null;
  }

  List<LibraryItem> getLibraryItemsByPage(int page) =>
      library.values.toList().elementAtOrNull(page) ?? const [];

  int? getMangaCountForCategory(Category category) =>
      showMangaCount || !searchQuery.isNullOrEmpty
          ? library[category]?.length
          : null;

  LibraryToolbarTitle getToolbarTitle({
    required String defaultTitle,
    required String defaultCategoryTitle,
    required int page,
  }) {
    final category = categories.elementAtOrNull(page);
    if (category == null) return LibraryToolbarTitle(defaultTitle);
    final categoryName =
        category.isSystemCategory ? defaultCategoryTitle : category.name;
    final title = showCategoryTabs ? defaultTitle : categoryName;
    final int? count;
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
}

@freezed
class _ItemPreferences with _$ItemPreferences {
  const factory _ItemPreferences({
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
