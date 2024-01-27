import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:flutteryomi/domain/category/model/category.dart';
import 'package:flutteryomi/presentation/category/category_extensions.dart';
import 'package:flutteryomi/presentation/components/material/tab_text.dart';
import 'package:flutteryomi/presentation/library/components/global_search_item.dart';
import 'package:flutteryomi/presentation/library/components/library_compact_grid.dart';
import 'package:flutteryomi/presentation/screens/empty_screen.dart';

class LibraryTabs extends StatelessWidget {
  const LibraryTabs({
    super.key,
    required this.categories,
    required this.getNumberOfMangaForCategory,
    required this.onTabItemClick,
  });

  final List<Category> categories;
  final int? Function(Category) getNumberOfMangaForCategory;
  final ValueChanged<int> onTabItemClick;

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
    return TabBar(
      isScrollable: true,
      tabAlignment: TabAlignment.start,
      tabs: List.generate(
        categories.length,
        (index) {
          final category = categories[index];
          return Tab(
            icon: TabText(
              text: category.visualName(context),
              badgeCount: getNumberOfMangaForCategory(category),
            ),
          );
        },
        growable: false,
      ),
    );
  }
}
