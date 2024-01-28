import 'package:flutter/material.dart';

import 'package:flutteryomi/domain/category/model/category.dart';
import 'package:flutteryomi/domain/library/model/library_display_mode.dart';
import 'package:flutteryomi/domain/library/model/library_manga.dart';
import 'package:flutteryomi/presentation//library/components/library_compact_grid.dart';
import 'package:flutteryomi/presentation/library/components/library_pager.dart';
import 'package:flutteryomi/presentation/library/library_item.dart';

class LibraryContent extends StatelessWidget {
  const LibraryContent({
    super.key,
    required this.categories,
    this.searchQuery,
    required this.selection,
    required this.hasActiveFilters,
    required this.onChangeCurrentPage,
    required this.onMangaClicked,
    this.onContinueReadingClicked,
    required this.onToggleSelection,
    required this.onToggleRangeSelection,
    required this.onRefresh,
    required this.onGlobalSearchClicked,
    required this.getNumberOfMangaForCategory,
    required this.getDisplayMode,
    required this.getColumnsForOrientation,
    required this.getLibraryForPage,
  });

  final List<Category> categories;
  final String? searchQuery;
  final List<LibraryManga> selection;
  final bool hasActiveFilters;
  final ValueChanged<int> onChangeCurrentPage;
  final ValueChanged<int> onMangaClicked;
  final ValueChanged<LibraryManga>? onContinueReadingClicked;
  final ValueChanged<LibraryManga> onToggleSelection;
  final ValueChanged<LibraryManga> onToggleRangeSelection;
  final bool Function(Category?) onRefresh;
  final VoidCallback onGlobalSearchClicked;
  final int? Function(Category) getNumberOfMangaForCategory;
  final LibraryDisplayMode Function(int) getDisplayMode;
  final int Function(bool) getColumnsForOrientation;
  final List<LibraryItem> Function(int) getLibraryForPage;

  @override
  Widget build(BuildContext context) {
    final notSelectionMode = selection.isEmpty;
    final onClickManga = ((manga) => notSelectionMode
        ? onMangaClicked(manga.manga.id)
        : onToggleSelection(manga));
    return RefreshIndicator.adaptive(
      onRefresh: () async => onRefresh(
        categories[DefaultTabController.of(context).index],
      ),
      notificationPredicate: notSelectionMode ? (_) => true : (_) => false,
      child: LibraryPager(
        hasActiveFilters: hasActiveFilters,
        selectedManga: selection,
        searchQuery: searchQuery,
        onGlobalSearchClicked: onGlobalSearchClicked,
        getDisplayMode: getDisplayMode,
        getColumnsForOrientation: getColumnsForOrientation,
        getLibraryForPage: getLibraryForPage,
        onClickManga: onClickManga,
        onLongClickManga: onToggleRangeSelection,
        onClickContinueReading: onContinueReadingClicked,
      ),
    );
  }
}
