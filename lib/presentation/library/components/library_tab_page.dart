import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:flutteryomi/presentation/library/components/global_search_item.dart';
import 'package:flutteryomi/presentation/library/components/library_compact_grid.dart';
import 'package:flutteryomi/presentation/screens/empty_screen.dart';

class LibraryTabPage extends StatelessWidget {
  const LibraryTabPage({
    super.key,
    //required this.contentPadding,
    required this.hasActiveFilters,
    //required this.selectedManga,
    this.searchQuery,
    required this.onGlobalSearchClicked,
    //required this.getDisplayMode,
    //required this.getColumnsForOrientation,
    //required this.library,
    //required this.onClickManga,
    //required this.onLongClickManga,
    //this.onClickContinueReading,
  });

  //final PaddingValues contentPadding,
  final bool hasActiveFilters;
  //final List<LibraryManga> selectedManga;
  final String? searchQuery;
  final VoidCallback onGlobalSearchClicked;
  //final PreferenceMutableState<LibraryDisplayMode> Function(int) getDisplayMode;
  //final PreferenceMutableState<int> Function(bool) getColumnsForOrientation;
  //final List<LibraryItem> getLibraryForPage;
  //final ValueChanged<LibraryManga> onClickManga;
  //final ValueChanged<LibraryManga> onLongClickManga;
  //final ValueChanged<LibraryManga>? onClickContinueReading;

  @override
  Widget build(BuildContext context) {
    //if (library.isEmpty()) {
    //  return LibraryTabPageEmptyScreen(
    //    searchQuery: searchQuery,
    //    hasActiveFilters: hasActiveFilters,
    //    //contentPadding: contentPadding,
    //    onGlobalSearchClicked: onGlobalSearchClicked,
    //  );
    //}
    return LibraryCompactGrid(
      //items: library,
      //showTitle: displayMode is LibraryDisplayMode.CompactGrid,
      showTitle: true,
      //columns: columns,
      columns: 3,
      //contentPadding: contentPadding,
      //selection: selectedManga,
      //onClick: onClickManga,
      //onLongClick: onLongClickManga,
      //onClickContinueReading: onClickContinueReading,
      searchQuery: searchQuery,
      onGlobalSearchClicked: onGlobalSearchClicked,
    );
  }
}

class LibraryTabPageEmptyScreen extends StatelessWidget {
  const LibraryTabPageEmptyScreen({
    super.key,
    this.searchQuery,
    required this.hasActiveFilters,
    //required this.contentPadding,
    required this.onGlobalSearchClicked,
  });

  final String? searchQuery;
  final bool hasActiveFilters;
  //final PaddingValues contentPadding;
  final VoidCallback onGlobalSearchClicked;

  @override
  Widget build(BuildContext context) {
    final lang = AppLocalizations.of(context);
    String msg;
    if (searchQuery != null && searchQuery!.isNotEmpty) {
      msg = lang.no_results_found;
    } else if (hasActiveFilters) {
      msg = lang.error_no_match;
    } else {
      msg = lang.information_no_manga_category;
    }
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          if (searchQuery != null && searchQuery!.isNotEmpty)
            GlobalSearchItem(
              onClick: onGlobalSearchClicked,
              searchQuery: searchQuery!,
            ),
          Expanded(child: EmptyScreen(message: msg)),
        ],
      ),
    );
  }
}
