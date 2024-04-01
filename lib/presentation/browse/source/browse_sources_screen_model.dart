import 'package:collection/collection.dart';
import 'package:dartx/dartx_io.dart' hide IterableFirstOrNull, IterableWhereNot;
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:flutteryomi/core/util/system/logger.dart';
import 'package:flutteryomi/domain/category/interactor/get_categories.dart';
import 'package:flutteryomi/domain/category/interactor/set_manga_categories.dart';
import 'package:flutteryomi/domain/category/model/category.dart';
import 'package:flutteryomi/domain/chapter/interactor/set_manga_default_chapter_flags.dart';
import 'package:flutteryomi/domain/library/service/library_preferences.dart';
import 'package:flutteryomi/domain/manga/interactor/get_duplicate_library_manga.dart';
import 'package:flutteryomi/domain/manga/interactor/update_manga.dart';
import 'package:flutteryomi/domain/manga/model/manga.dart';
import 'package:flutteryomi/domain/source/interactor/get_enabled_sources.dart';
import 'package:flutteryomi/domain/source/interactor/get_remote_manga.dart';
import 'package:flutteryomi/domain/source/interactor/toggle_source.dart';
import 'package:flutteryomi/domain/source/interactor/toggle_source_pin.dart';
import 'package:flutteryomi/domain/source/model/domain_source.dart';
import 'package:flutteryomi/domain/source/model/filter.dart';
import 'package:flutteryomi/domain/source/model/filter_list.dart';
import 'package:flutteryomi/domain/source/model/pin.dart';
import 'package:flutteryomi/domain/track/interactor/add_tracks.dart';
import 'package:flutteryomi/presentation/browse/source/sources.dart';
import 'package:flutteryomi/source/api/catalogue_source.dart';

part 'browse_sources_screen_model.freezed.dart';
part 'browse_sources_screen_model.g.dart';

//TODO
@riverpod
class BrowseSourcesScreenModel extends _$BrowseSourcesScreenModel {
  @override
  Stream<BrowseSourcesScreenState> build(int sourceId) {
//    final getEnabledSources = ref.watch(getEnabledSourcesProvider);
//    final logger = ref.watch(loggerProvider);
//    return getEnabledSources.subscribe().handleError((it) {
//      logger.e(it);
//      //_events.send(Event.FailedFetchingSources)
//    }).asyncMap(_collectLatestSources);
    return const Stream.empty();
  }

//  Future<void> toggleSource(Source source) async {
//    final toggleSourceInteractor = ref.watch(toggleSourceProvider);
//    await toggleSourceInteractor.await_(source);
//  }

  // getColumnsPreference probably in widget

  //TODO
  Future<void> resetFilters() async {
    //if (source is! CatalogueSource) return;
    //final previousState = state.valueOrNull;
    //if (previousState != null) {
    //  state = await AsyncValue.guard(
    //    () async => previousState.copyWith(filters: source.getFilterList()),
    //  );
    //}
  }

  Future<void> setListing(Listing listing) async {
    final previousState = state.valueOrNull;
    if (previousState != null) {
      state = await AsyncValue.guard(
        () async => previousState.copyWith(
          listing: listing,
          toolbarQuery: null,
        ),
      );
    }
  }

  //TODO
  Future<void> setFilters(FilterList filters) async {
    //if (source is! CatalogueSource) return;
    final previousState = state.valueOrNull;
    if (previousState != null) {
      state = await AsyncValue.guard(
        () async => previousState.copyWith(filters: filters),
      );
    }
  }

  //TODO: Convert Listing to freezed classes or implement copyWith
  Future<void> search([String? query, FilterList? filters]) async {
    //if (source is! CatalogueSource) return;
    //final previousState = state.valueOrNull;
    //if (previousState != null) {
    //  final input = previousState.listing as ListingSearch?
    //      ?? ListingSearch(query: null, filters: source.getFilterList());
    //  state = await AsyncValue.guard(
    //    () async => previousState.copyWith(
    //          listing: input.copyWith(
    //            query: query ?? input.query,
    //            filters: filters ?? input.filters,
    //          ),
    //          toolbarQuery: query ?? input.query,
    //        ),
    //  );
    //}
  }

  //TODO
  Future<void> searchGenre(String genreName) async {
    //if (source is! CatalogueSource) return;
    //final previousState = state.valueOrNull;
    //if (previousState != null) {
    //  final defaultFilters = source.getFilterList();
    //  var genreExists = false;

    //  filterLoop:
    //  for (final sourceFilter in defaultFilters) {
    //    if (sourceFilter is SourceModelFilterGroup<*>) {
    //      for (final filter in sourceFilter.state) {
    //        if (filter is SourceModelFilter<*> && filter.name.equals(genreName, true)) {
    //          switch (filter) {
    //            case SourceModelFilterTriState:
    //              filter.state = 1;
    //            case SourceModelFilterCheckBox:
    //              filter.state = true;
    //          }
    //          genreExists = true;
    //          break filterLoop;
    //        }
    //      }
    //    } else if (sourceFilter is SourceModelFilterSelect<*>) {
    //      final index = sourceFilter.values.whereType<String>()
    //          .indexOfFirst((it) => it.equals(genreName, true));

    //      if (index != -1) {
    //        sourceFilter.state = index;
    //        genreExists = true;
    //        break;
    //      }
    //    }
    //  }

    //  final listing = genreExists
    //      ? ListingSearch(query: null, filters: defaultFilters)
    //      : ListingSearch(query: genreName, filters: defaultFilters);
    //  state = await AsyncValue.guard(
    //    () async => previousState.copyWith(
    //          filters: defaultFilters,
    //          listing: listing,
    //          toolbarQuery: listing.query,
    //        ),
    //  );
    //}
  }

  //TODO
  /// Adds or removes a manga from the library.
  Future<void> changeMangaFavorite(Manga manga) async {
    //final addTracks = ref.watch(addTracksProvider);
    //final coverCache = ref.watch(coverCacheProvider);
    final setMangaDefaultChapterFlags = ref.watch(setMangaDefaultChapterFlagsProvider);
    final updateManga = ref.watch(updateMangaProvider);
    var newManga = manga.copyWith(
      favorite: !manga.favorite,
      dateAdded: manga.favorite
        ? DateTime.fromMillisecondsSinceEpoch(0, isUtc: true)
        : DateTime.now(),
    );

    if (!newManga.favorite) {
      //newManga = newManga.removeCovers(coverCache);
    } else {
      await setMangaDefaultChapterFlags.await_(manga);
      //await addTracks.bindEnhancedTrackers(manga, source);
    }

    await updateManga.await_(newManga.toCompanion(true));
  }

  //TODO: Move dialog
  /// If true, show ChangeMangaCategory dialog.
  Future<bool> addFavorite(Manga manga) async {
    //final getCategoriesInteractor = ref.watch(getCategoriesProvider);
    final libraryPreferences = ref.watch(libraryPreferencesProvider);
    final categories = await getCategories();
    final defaultCategoryId = libraryPreferences.defaultCategory().get();
    final defaultCategory = categories.firstWhereOrNull((it) => it.id == defaultCategoryId);

    if (defaultCategory != null) {
      // Default category set
      _moveMangaToCategoriesUsingCategories(manga, [defaultCategory]);
      changeMangaFavorite(manga);
      return false;
    } else if (defaultCategoryId == 0 || categories.isEmpty) {
      // Automatic 'Default' or no categories
      moveMangaToCategories(manga, []);
      changeMangaFavorite(manga);
      return false;
    } else {
      // Choose a category
      return true;
      //final preselectedIds = (await getCategoriesInteractor.await_(manga.id)).map((it) => it.id);
      //setDialog(
      //  Dialog.ChangeMangaCategory(
      //    manga,
      //    categories.mapAsCheckboxState { it.id in preselectedIds }.toImmutableList(),
      //  ),
      //)
    }
  }

  //Mihon uses subscribe instead of await, not sure if this has differences
  /// Get user categories, excluding the default category.
  Future<List<Category>> getCategories() async {
    final getCategories = ref.watch(getCategoriesProvider);
    return (await getCategories.await_())
        .whereNot((it) => it.isSystemCategory)
        .toList();
  }

  Future<Manga?> getDuplicateLibraryManga(Manga manga) async {
    final getDuplicateLibraryManga = ref.watch(getDuplicateLibraryMangaProvider);
    return (await getDuplicateLibraryManga.await_(manga)).firstOrNull;
  }

  Future<void> _moveMangaToCategoriesUsingCategories(
    Manga manga,
    Iterable<Category> categories,
  ) =>
      moveMangaToCategories(
        manga,
        categories.where((it) => it.id != 0).map((it) => it.id).toList(),
      );

  Future<void> moveMangaToCategories(Manga manga, List<int> categoryIds) async {
    final setMangaCategories = ref.watch(setMangaCategoriesProvider);
    await setMangaCategories.await_(manga.id, categoryIds);
  }

  Future<void> setToolbarQuery(String? query) async {
    final previousState = state.valueOrNull;
    if (previousState != null) {
      state = await AsyncValue.guard(
        () async => previousState.copyWith(toolbarQuery: query),
      );
    }
  }
}

@freezed
class BrowseSourcesScreenState with _$BrowseSourcesScreenState {
  const BrowseSourcesScreenState._();
  const factory BrowseSourcesScreenState({
    required Listing listing,
    required FilterList filters,
    String? toolbarQuery,
  }) = _BrowseSourcesScreenState;

  bool get isUserQuery =>
      listing is ListingSearch && listing.query.isNotNullOrEmpty;
}

sealed class Listing extends Equatable {
  const Listing({
    this.query,
    required this.filters,
  });

  final String? query;
  final FilterList filters;

  static Listing valueOf(String? query) => switch (query) {
        GetRemoteManga.queryPopular => const ListingPopular(),
        GetRemoteManga.queryLatest => const ListingLatest(),
        _ => ListingSearch(
            query: query, filters: const []), // filters are filled in later
      };

  @override
  List<Object?> get props => [query, filters];

  @override
  bool get stringify => true;
}

class ListingPopular implements Listing {
  const ListingPopular();

  @override
  String? get query => GetRemoteManga.queryPopular;

  @override
  FilterList get filters => const [];

  @override
  List<Object?> get props => [query, filters];

  @override
  bool get stringify => true;
}

class ListingLatest implements Listing {
  const ListingLatest();

  @override
  String? get query => GetRemoteManga.queryLatest;

  @override
  FilterList get filters => const [];

  @override
  List<Object?> get props => [query, filters];

  @override
  bool get stringify => true;
}

class ListingSearch extends Listing {
  const ListingSearch({
    super.query,
    required super.filters,
  });
}
