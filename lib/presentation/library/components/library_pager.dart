import 'package:dartx/dartx.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:flutteryomi/domain/category/model/category.dart';
import 'package:flutteryomi/domain/library/model/library_display_mode.dart';
import 'package:flutteryomi/domain/library/model/library_manga.dart';
import 'package:flutteryomi/presentation//library/components/library_compact_grid.dart';
import 'package:flutteryomi/presentation/library/components/global_search_item.dart';
import 'package:flutteryomi/presentation/library/components/library_comfortable_grid.dart';
import 'package:flutteryomi/presentation/library/components/library_list.dart';
import 'package:flutteryomi/presentation/library/library_item.dart';
import 'package:flutteryomi/presentation/screens/empty_screen.dart';

class LibraryPager extends StatelessWidget {
  const LibraryPager({
    super.key,
    required this.hasActiveFilters,
    required this.selectedManga,
    this.searchQuery,
    required this.onGlobalSearchClicked,
    required this.getDisplayMode,
    required this.getColumnsForOrientation,
    required this.getLibraryForPage,
    required this.onClickManga,
    required this.onLongClickManga,
    this.onClickContinueReading,
  });

  final bool hasActiveFilters;
  final List<LibraryManga> selectedManga;
  final String? searchQuery;
  final VoidCallback onGlobalSearchClicked;
  final LibraryDisplayMode Function(int) getDisplayMode;
  final int Function(bool) getColumnsForOrientation;
  final List<LibraryItem> Function(int) getLibraryForPage;
  final ValueChanged<LibraryManga> onClickManga;
  final ValueChanged<LibraryManga> onLongClickManga;
  final ValueChanged<LibraryManga>? onClickContinueReading;

  @override
  Widget build(BuildContext context) {
    final page = DefaultTabController.of(context).index;
    final library = getLibraryForPage(page);
    final displayMode = getDisplayMode(page);
    final columns = displayMode is! ListMode
        ? getColumnsForOrientation(MediaQuery.orientationOf(context) == Orientation.landscape,)
        : 0;
    return TabBarView(
      children: List.generate(
        DefaultTabController.of(context).length,
        (index) {
          if (library.isEmpty) {
            return _LibraryPagerEmptyScreen(
              searchQuery: searchQuery,
              hasActiveFilters: hasActiveFilters,
              onGlobalSearchClicked: onGlobalSearchClicked,
            );
          }
          return switch (displayMode) {
            ListMode() => LibraryList(
              items: library,
              selection: selectedManga,
              onClick: onClickManga,
              onLongClick: onLongClickManga,
              onClickContinueReading: onClickContinueReading,
              searchQuery: searchQuery,
              onGlobalSearchClicked: onGlobalSearchClicked,
            ),
            CompactGrid() || CoverOnlyGrid() => LibraryCompactGrid(
              items: library,
              showTitle: displayMode is CompactGrid,
              columns: columns,
              selection: selectedManga,
              onClick: onClickManga,
              onLongClick: onLongClickManga,
              onClickContinueReading: onClickContinueReading,
              searchQuery: searchQuery,
              onGlobalSearchClicked: onGlobalSearchClicked,
            ),
            ComfortableGrid() => LibraryComfortableGrid(
              items: library,
              columns: columns,
              selection: selectedManga,
              onClick: onClickManga,
              onLongClick: onLongClickManga,
              onClickContinueReading: onClickContinueReading,
              searchQuery: searchQuery,
              onGlobalSearchClicked: onGlobalSearchClicked,
            ),
          };
        },
        growable: false,
      ),
    );
  }
}

class _LibraryPagerEmptyScreen extends StatelessWidget {
  const _LibraryPagerEmptyScreen({
    super.key,
    this.searchQuery,
    required this.hasActiveFilters,
    required this.onGlobalSearchClicked,
  });

  final String? searchQuery;
  final bool hasActiveFilters;
  final VoidCallback onGlobalSearchClicked;

  @override
  Widget build(BuildContext context) {
    final lang = AppLocalizations.of(context);
    final String msg;
    if (!searchQuery.isNullOrEmpty) {
      msg = lang.no_results_found;
    } else if (hasActiveFilters) {
      msg = lang.error_no_match;
    } else {
      msg = lang.information_no_manga_category;
    }

    return ListView(
      padding: const EdgeInsets.all(8),
      children: [
        if (!searchQuery.isNullOrEmpty)
          Center(
            child: GlobalSearchItem(
              searchQuery: searchQuery!,
              onClick: onGlobalSearchClicked,
            ),
          ),
        Expanded(
          child: EmptyScreen(message: msg),
        ),
      ],
    );
  }
}
