import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:flutteryomi/widgets/app_bar.dart';
import 'package:flutteryomi/widgets/pill.dart';

class LibraryContent extends StatelessWidget {
  const LibraryContent({
    super.key,
    //required this.categories,
    this.searchQuery,
    //required this.selection,
    //required this.contentPadding,
    required this.currentPage,
    required this.hasActiveFilters,
    required this.showPageTabs,
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
  final int Function() currentPage;
  final bool hasActiveFilters;
  final bool showPageTabs;
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
    return DefaultTabController(
      length: 2,
      //length: categories.length,
      child: Column(
        children: [
          if (showPageTabs) const TabBar(
            dividerColor: Colors.transparent,
            isScrollable: true,
            tabAlignment: TabAlignment.start,
            tabs: <Widget>[
              Tab(text: 'Dest'),
              Tab(text: 'Dest'),
            ],
          ),
          if (showPageTabs) const Divider(height: 1.0),
          //if (showPageTabs && categories.size > 1)
          RefreshIndicator.adaptive(
            onRefresh: () async {  },
            child: const TabBarView(
              children: [
                Placeholder(),
                Placeholder(),
                //LibraryCompactGrid(
                //  showTitle: true,
                //  columns: 3,
                //),
                //LibraryCompactGrid(
                //  showTitle: true,
                //  columns: 3,
                //),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
