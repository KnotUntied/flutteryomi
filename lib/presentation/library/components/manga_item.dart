import 'package:flutter/material.dart';

import 'package:flutteryomi/domain/manga/model/manga_cover.dart' as manga_cover_data;
import 'package:flutteryomi/presentation/components/badges.dart' as badges;
import 'package:flutteryomi/presentation/manga/components/manga_cover.dart';

class CommonMangaItemDefaults {
  static const gridHorizontalSpacer = 4.0;
  static const gridVerticalSpacer = 4.0;
  static const browseFavoriteCoverAlpha = 0.34;
}

const _continueReadingButtonSize = 32.0;
const _continueReadingButtonGridPadding = 6.0;
const _continueReadingButtonListSpacing = 8.0;
const _gridSelectedCoverAlpha = 0.76;

class MangaCompactGridItem extends StatelessWidget {
  const MangaCompactGridItem({
    super.key,
    this.title,
    this.isSelected = false,
    required this.coverData,
    this.coverAlpha = 1.0,
    this.coverBadgeStart,
    this.coverBadgeEnd,
    required this.onLongClick,
    required this.onClick,
    this.onClickContinueReading,
  });

  final bool isSelected;
  final String? title;
  final manga_cover_data.MangaCover coverData;
  final double coverAlpha;
  final Widget? coverBadgeStart;
  final Widget? coverBadgeEnd;
  final GestureLongPressCallback onLongClick;
  final GestureTapCallback onClick;
  final VoidCallback? onClickContinueReading;

  @override
  Widget build(BuildContext context) {
    Widget? content;
    if (title != null) {
      content = _CoverTextOverlay(
        title: title!,
        onClickContinueReading: onClickContinueReading,
      );
    } else if (onClickContinueReading != null) {
      content = Positioned(
        bottom: _continueReadingButtonGridPadding,
        right: _continueReadingButtonGridPadding,
        child: _ContinueReadingButton(
          onClickContinueReading: onClickContinueReading,
        ),
      );
    }

    return GridItemSelectable(
      isSelected: false,
      onClick: onClick,
      onLongClick: onLongClick,
      child: MangaGridCover(
        cover: Opacity(
          opacity: isSelected ? _gridSelectedCoverAlpha : coverAlpha,
          child: MangaCover.book(
            contentDescription: '',
            data: coverData,
          ),
        ),
        badgesStart: const [],
        badgesEnd: const [],
        content: content,
      ),
    );
  }
}

class _CoverTextOverlay extends StatelessWidget {
  const _CoverTextOverlay({
    super.key,
    required this.title,
    this.onClickContinueReading,
  });

  final String title;
  final VoidCallback? onClickContinueReading;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          alignment: Alignment.bottomCenter,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment(0.0, 0.34),
              end: Alignment.bottomCenter,
              colors: <Color>[
                Colors.transparent,
                Color(0xAA000000),
              ],
            ),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: _GridItemTitle(
                    title: title,
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      color: Colors.white,
                      shadows: [
                        const Shadow(
                          blurRadius: 4.0,
                          color: Colors.black,
                        ),
                      ],
                    ),
                    minLines: 1,
                  ),
                ),
              ),
              //if (onClickContinueReading != null) _ContinueReadingButton(
              //  onClickContinueReading: onClickContinueReading,
              //),
              Padding(
                padding: const EdgeInsets.only(bottom: 2.0, right: 2.0),
                child: _ContinueReadingButton(
                  onClickContinueReading: onClickContinueReading,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class MangaGridCover extends StatelessWidget {
  const MangaGridCover({
    super.key,
    required this.cover,
    required this.badgesStart,
    required this.badgesEnd,
    this.content,
  });

  final Widget cover;
  final List<Widget> badgesStart;
  final List<Widget> badgesEnd;
  final Widget? content;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: MangaCover.bookRatio,
      child: Stack(
        children: [
          cover,
          if (badgesStart.isNotEmpty)
            Positioned(
              top: 4.0,
              left: 4.0,
              //child: badgesStart as Widget,
              child: badges.BadgeGroup(content: badgesStart),
            ),
          if (badgesEnd.isNotEmpty)
            Positioned(
              top: 4.0,
              right: 4.0,
              //child: badgesEnd as Widget,
              child: badges.BadgeGroup(content: badgesEnd),
            ),
          //if (content != null) content as Widget,
          content!,
        ],
      ),
    );
  }
}

class _GridItemTitle extends StatelessWidget {
  const _GridItemTitle({
    super.key,
    required this.title,
    required this.style,
    required this.minLines,
    this.maxLines = 2,
  });

  final String title;
  final TextStyle style;
  final int minLines;
  final int maxLines;

  @override
  Widget build(BuildContext context) {
    // Text widget has no minLines property, bruh
    // https://github.com/flutter/flutter/issues/31134
    return Text(
      title,
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
      style: style.copyWith(fontSize: 12.0),
    );
  }
}

class GridItemSelectable extends StatelessWidget {
  const GridItemSelectable({
    super.key,
    required this.isSelected,
    this.onClick,
    this.onLongClick,
    required this.child,
  });

  final bool isSelected;
  final GestureTapCallback? onClick;
  final GestureLongPressCallback? onLongClick;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    //https://api.flutter.dev/flutter/material/Material-class.html
    //https://developer.android.com/jetpack/compose/designsystems/material3
    return Container(
      decoration: isSelected
          //https://api.flutter.dev/flutter/painting/ShapeDecoration-class.html
          ? BoxDecoration(
              //https://api.flutter.dev/flutter/painting/RoundedRectangleBorder-class.html
              border: Border.all(
                color: Theme.of(context).colorScheme.secondary,
              ),
              //borderRadius: BorderRadius.circular(12),
            )
          : null,
      padding: const EdgeInsets.all(4.0),
      child: Ink(
        child: InkWell(
          onTap: onClick,
          onLongPress: onLongClick,
          child: child,
        ),
      ),
    );
  }
}

class _ContinueReadingButton extends StatelessWidget {
  const _ContinueReadingButton({
    super.key,
    this.onClickContinueReading,
  });

  final VoidCallback? onClickContinueReading;

  @override
  Widget build(BuildContext context) {
    return IconButton.filled(
      icon: const Icon(Icons.play_arrow),
      iconSize: 16.0,
      onPressed: onClickContinueReading,
      style: ButtonStyle(
        backgroundColor: MaterialStatePropertyAll<Color>(
          Theme.of(context).colorScheme.primary.withOpacity(0.9),
        ),
        iconColor: MaterialStatePropertyAll<Color>(
            Theme.of(context).colorScheme.onPrimary),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0))),
      ),
      visualDensity: VisualDensity.compact,
    );
  }
}
