import 'package:flutter/material.dart';

import 'package:flutteryomi/domain/manga/model/manga.dart';
import 'package:flutteryomi/presentation/components/material/constants.dart';
import 'package:flutteryomi/presentation/manga/components/manga_cover.dart';

class BaseMangaListItem extends StatelessWidget {
  const BaseMangaListItem({
    super.key,
    required this.manga,
    this.onClickItem = _defaultOnClickItem,
    this.onClickCover = _defaultOnClickItem,
    this.cover,
    this.actions = const [],
    this.content,
  });

  final Manga manga;
  final VoidCallback onClickItem;
  final VoidCallback onClickCover;
  final List<Widget>? cover;
  final List<Widget> actions;
  final List<Widget>? content;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClickItem,
      child: Container(
        height: 56.0,
        padding: const EdgeInsets.symmetric(horizontal: MaterialPadding.medium),
        child: Row(
          children: [
            if (cover != null)
              ...cover!
            else
              _DefaultCover(manga, onClickCover),
            ...actions,
            if (content != null) ...content! else _DefaultContent(manga),
          ],
        ),
      ),
    );
  }

  static void _defaultOnClickItem() {}
}

class _DefaultCover extends StatelessWidget {
  const _DefaultCover(this.manga, this.onClick, {super.key});

  final Manga manga;
  final GestureTapCallback onClick;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: MaterialPadding.small),
      child: MangaCover.square(
        data: manga,
        onClick: onClick,
      ),
    );
  }
}

class _DefaultContent extends StatelessWidget {
  const _DefaultContent(this.manga, {super.key});

  final Manga manga;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding:
            const EdgeInsetsDirectional.only(start: MaterialPadding.medium),
        child: Text(
          manga.title,
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ),
    );
  }
}
