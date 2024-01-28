import 'package:dartx/dartx.dart';
import 'package:flutter/material.dart';

import 'package:flutteryomi/domain/library/model/library_manga.dart';
import 'package:flutteryomi/domain/manga/model/manga_cover.dart'
    as manga_cover_data;
import 'package:flutteryomi/presentation/library/components/common_manga_item.dart';
import 'package:flutteryomi/presentation/library/components/global_search_item.dart';
import 'package:flutteryomi/presentation/library/components/library_badges.dart';
import 'package:flutteryomi/presentation/library/library_item.dart';
import 'package:flutteryomi/presentation/manga/components/manga_cover.dart';

// Better to manually define sliver grid than use LibraryGrid or LazyLibraryGrid
class LibraryCompactGrid extends StatelessWidget {
  const LibraryCompactGrid({
    super.key,
    required this.items,
    required this.showTitle,
    required this.columns,
    required this.selection,
    required this.onClick,
    required this.onLongClick,
    this.onClickContinueReading,
    this.searchQuery,
    required this.onGlobalSearchClicked,
  });

  final List<LibraryItem> items;
  final bool showTitle;
  final int columns;
  final List<LibraryManga> selection;
  final ValueChanged<LibraryManga> onClick;
  final ValueChanged<LibraryManga> onLongClick;
  final ValueChanged<LibraryManga>? onClickContinueReading;
  final String? searchQuery;
  final VoidCallback onGlobalSearchClicked;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        if (!searchQuery.isNullOrEmpty)
          SliverToBoxAdapter(
            child: Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: GlobalSearchItem(
                searchQuery: searchQuery!,
                onClick: onGlobalSearchClicked,
              ),
            ),
          ),
        SliverGrid.builder(
          gridDelegate: columns == 0
              ? const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 128.0,
                  childAspectRatio: MangaCover.bookRatio,
                  crossAxisSpacing:
                      CommonMangaItemDefaults.gridHorizontalSpacer,
                  mainAxisSpacing: CommonMangaItemDefaults.gridVerticalSpacer,
                )
              : SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: columns,
                  childAspectRatio: MangaCover.bookRatio,
                  crossAxisSpacing:
                      CommonMangaItemDefaults.gridHorizontalSpacer,
                  mainAxisSpacing: CommonMangaItemDefaults.gridVerticalSpacer,
                ),
          itemCount: items.length,
          itemBuilder: (context, index) {
            final item = items[index];
            final manga = item.libraryManga.manga;
            return MangaCompactGridItem(
              isSelected: selection.any(
                (it) => it.id == item.libraryManga.id,
              ),
              title: showTitle ? manga.title : null,
              coverData: manga_cover_data.MangaCover(
                mangaId: manga.id,
                sourceId: manga.source,
                isMangaFavorite: manga.favorite,
                url: manga.thumbnailUrl,
                lastModified: manga.coverLastModified,
              ),
              coverBadgeStart: [
                DownloadsBadge(count: item.downloadCount),
                UnreadBadge(count: item.unreadCount),
              ],
              coverBadgeEnd: [
                LanguageBadge(
                  isLocal: item.isLocal,
                  sourceLanguage: item.sourceLanguage,
                ),
              ],
              onLongClick: () => onLongClick(item.libraryManga),
              onClick: () => onClick(item.libraryManga),
              onClickContinueReading:
                  onClickContinueReading != null && item.unreadCount > 0
                      ? () => onClickContinueReading!(item.libraryManga)
                      : null,
            );
          },
        ),
      ],
    );
  }
}
