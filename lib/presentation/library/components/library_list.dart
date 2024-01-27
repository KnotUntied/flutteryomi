import 'package:dartx/dartx.dart';
import 'package:flutter/material.dart';

import 'package:flutteryomi/domain/library/model/library_manga.dart';
import 'package:flutteryomi/domain/manga/model/manga_cover.dart';
import 'package:flutteryomi/presentation/library/components/common_manga_item.dart';
import 'package:flutteryomi/presentation/library/components/global_search_item.dart';
import 'package:flutteryomi/presentation/library/components/library_badges.dart';
import 'package:flutteryomi/presentation/library/library_item.dart';

class LibraryList extends StatelessWidget {
  const LibraryList({
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
        if (!searchQuery.isNullOrEmpty) SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: GlobalSearchItem(
              searchQuery: searchQuery!,
              onClick: onGlobalSearchClicked,
            ),
          ),
        ),
        SliverList.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            final item = items[index];
            final manga = item.libraryManga.manga;
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: MangaListItem(
                isSelected: selection.any((it) => it.id == item.libraryManga.id),
                title: manga.title,
                coverData: MangaCover(
                  mangaId: manga.id,
                  sourceId: manga.source,
                  isMangaFavorite: manga.favorite,
                  url: manga.thumbnailUrl,
                  lastModified: manga.coverLastModified,
                ),
                badge: [
                  DownloadsBadge(count: item.downloadCount),
                  UnreadBadge(count: item.unreadCount),
                  LanguageBadge(
                    isLocal: item.isLocal,
                    sourceLanguage: item.sourceLanguage,
                  )
                ],
                onLongClick: () => onLongClick(item.libraryManga),
                onClick: () => onClick(item.libraryManga),
                onClickContinueReading: onClickContinueReading != null && item.unreadCount > 0
                    ? () => onClickContinueReading!(item.libraryManga)
                    : null,
              ),
            );
          }
        ),
      ],
    );
  }
}
