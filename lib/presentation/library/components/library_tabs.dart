import 'package:flutter/material.dart';

import 'package:flutteryomi/domain/category/model/category.dart';
import 'package:flutteryomi/presentation/category/category_extensions.dart';
import 'package:flutteryomi/presentation/components/material/tab_text.dart';

class LibraryTabs extends StatelessWidget implements PreferredSizeWidget {
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
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
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
