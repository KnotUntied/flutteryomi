import 'package:flutter/material.dart';

import 'package:flutteryomi/domain/manga/model/manga_cover.dart' as manga_cover_data;
import 'package:flutteryomi/presentation/library/components/manga_item.dart';
import 'package:flutteryomi/presentation/manga/components/manga_cover.dart';

class LibraryCompactGrid extends StatelessWidget {
  const LibraryCompactGrid({
    super.key,
    //required this.items,
    required this.showTitle,
    required this.columns,
    //required this.contentPadding,
    //required this.selection,
    //required this.onClick,
    //required this.onLongClick,
    //this.onClickContinueReading,
    this.searchQuery,
    required this.onGlobalSearchClicked,
  });

  //final List<LibraryItem> items;
  final bool showTitle;
  final int columns;
  //final PaddingValues contentPadding;
  //final List<LibraryManga> selection;
  //final ValueChanged<LibraryManga> onClick;
  //final ValueChanged<LibraryManga> onLongClick;
  //final ValueChanged<LibraryManga>? onClickContinueReading;
  final String? searchQuery;
  final VoidCallback onGlobalSearchClicked;

  @override
  Widget build(BuildContext context) {
    //return GridView.builder(
    //  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
    //    crossAxisCount: columns,
    //    childAspectRatio: MangaCover.bookRatio,
    //    crossAxisSpacing: CommonMangaItemDefaults.gridHorizontalSpacer,
    //    mainAxisSpacing: CommonMangaItemDefaults.gridVerticalSpacer,
    //  ),
    //  itemCount: items.length,
    //  itemBuilder: (BuildContext context, int index) =>
    //    MangaCompactGridItem(
    //      title: 'Suavemente',
    //      coverData: manga_cover_data.MangaCover(
    //        mangaId: 1,
    //        sourceId: 1,
    //        isMangaFavorite: false,
    //        lastModified: DateTime.now(),
    //      ),
    //      onLongClick: () {  },
    //      onClick: () {  },
    //    ),
    //);
    return GridView.count(
      crossAxisCount: columns,
      childAspectRatio: MangaCover.bookRatio,
      crossAxisSpacing: CommonMangaItemDefaults.gridHorizontalSpacer,
      mainAxisSpacing: CommonMangaItemDefaults.gridVerticalSpacer,
      padding: const EdgeInsets.only(
        top: CommonMangaItemDefaults.gridVerticalSpacer,
        left: CommonMangaItemDefaults.gridHorizontalSpacer,
        right: CommonMangaItemDefaults.gridHorizontalSpacer,
      ),
      children: [
        MangaCompactGridItem(
          title: 'Suavemente besame que quiero Barcelona',
          coverData: manga_cover_data.MangaCover(
            mangaId: 1,
            sourceId: 1,
            isMangaFavorite: false,
            lastModified: DateTime.now(),
          ),
          onClick: () {},
          onLongClick: () {},
        ),
      ],
    );
  }
}
