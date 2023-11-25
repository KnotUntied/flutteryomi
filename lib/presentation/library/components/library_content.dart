import 'package:flutter/material.dart';

import 'package:flutteryomi/presentation//library/components/library_compact_grid.dart';

class LibraryContent extends StatelessWidget {
  const LibraryContent({
    super.key,
    //required this.categories,
    this.searchQuery,
    //required this.selection,
    //required this.contentPadding,
    required this.hasActiveFilters,
    required this.onChangeCurrentPage,
    required this.onMangaClicked,
    //this.onContinueReadingClicked,
    //required this.onToggleSelection,
    //required this.onToggleRangeSelection,
    //required this.onRefresh,
    required this.onGlobalSearchClicked,
    //required this.getNumberOfMangaForCategory,
    //required this.getDisplayMode,
    //required this.getColumnsForOrientation,
    //required this.getLibraryForPage,
  });

  //final List<Category> categories;
  final String? searchQuery;
  //final List<LibraryManga> selection;
  //final PaddingValues contentPadding;
  final bool hasActiveFilters;
  final ValueChanged<int> onChangeCurrentPage;
  final ValueChanged<int> onMangaClicked;
  //final ValueChanged<LibraryManga>? onContinueReadingClicked;
  //final ValueChanged<LibraryManga> onToggleSelection;
  //final ValueChanged<LibraryManga> onToggleRangeSelection;
  //final bool Function(Category?) onRefresh;
  final VoidCallback onGlobalSearchClicked;
  //final int? Function(Category) getNumberOfMangaForCategory;
  //final PreferenceMutableState<LibraryDisplayMode> Function(int) getDisplayMode;
  //final PreferenceMutableState<Int> Function(bool) getColumnsForOrientation;
  //final List<LibraryItem> Function(int) getLibraryForPage;

  @override
  Widget build(BuildContext context) {
    return TabBarView(
      children: [
        RefreshIndicator.adaptive(
          onRefresh: () async {},
          child: LibraryCompactGrid(
            showTitle: false,
            columns: 3,
            onGlobalSearchClicked: () {},
          ),
        ),
        RefreshIndicator.adaptive(
          onRefresh: () async {},
          child: LibraryCompactGrid(
            showTitle: false,
            columns: 3,
            onGlobalSearchClicked: () {},
          ),
        ),
        RefreshIndicator.adaptive(
          onRefresh: () async {},
          child: LibraryCompactGrid(
            showTitle: false,
            columns: 3,
            onGlobalSearchClicked: () {},
          ),
        ),
        RefreshIndicator.adaptive(
          onRefresh: () async {},
          child: LibraryCompactGrid(
            showTitle: false,
            columns: 3,
            onGlobalSearchClicked: () {},
          ),
        ),
        RefreshIndicator.adaptive(
          onRefresh: () async {},
          child: LibraryCompactGrid(
            showTitle: false,
            columns: 3,
            onGlobalSearchClicked: () {},
          ),
        ),
      ],
    );
  }
}
