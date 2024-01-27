import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:flutteryomi/domain/manga/model/manga_cover.dart'
    as manga_cover_data;
import 'package:flutteryomi/presentation/components/badges.dart' as badges;
import 'package:flutteryomi/presentation/components/badges.dart';
import 'package:flutteryomi/presentation/components/material/constants.dart';
import 'package:flutteryomi/presentation/manga/components/manga_cover.dart';
import 'package:flutteryomi/presentation/util/modifier.dart';

abstract class CommonMangaItemDefaults {
  static const gridHorizontalSpacer = 4.0;
  static const gridVerticalSpacer = 4.0;
  static const browseFavoriteCoverAlpha = 0.34;
}

const _continueReadingButtonSize = 28.0;
const _continueReadingButtonGridPadding = 6.0;
const _continueReadingButtonListSpacing = 8.0;
const _gridSelectedCoverAlpha = 0.76;

/// Layout of grid list item with title overlaying the cover.
/// Accepts null [title] for a cover-only view.
class MangaCompactGridItem extends StatelessWidget {
  const MangaCompactGridItem({
    super.key,
    required this.coverData,
    required this.onClick,
    required this.onLongClick,
    this.isSelected = false,
    this.title,
    this.onClickContinueReading,
    this.coverAlpha = 1.0,
    this.coverBadgeStart,
    this.coverBadgeEnd,
  });

  final manga_cover_data.MangaCover coverData;
  final GestureTapCallback onClick;
  final GestureLongPressCallback onLongClick;
  final bool isSelected;
  final String? title;
  final GestureTapCallback? onClickContinueReading;
  final double coverAlpha;
  final List<Widget>? coverBadgeStart;
  final List<Widget>? coverBadgeEnd;

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

    return _GridItemSelectable(
      isSelected: false,
      onClick: onClick,
      onLongClick: onLongClick,
      child: _MangaGridCover(
        cover: Opacity(
          opacity: isSelected ? _gridSelectedCoverAlpha : coverAlpha,
          child: MangaCover.book(data: coverData),
        ),
        badgesStart: coverBadgeStart ?? const [],
        badgesEnd: coverBadgeEnd ?? const [],
        content: content,
      ),
    );
  }
}

/// Title overlay for [MangaCompactGridItem]
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
    return Container(
      alignment: Alignment.bottomCenter,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment(0.0, 0.33),
          end: Alignment.bottomCenter,
          colors: [Colors.transparent, Color(0xAA000000)],
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
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  color: Colors.white,
                  shadows: [
                    const Shadow(blurRadius: 4.0, color: Colors.black),
                  ],
                ),
                minLines: 1,
              ),
            ),
          ),
          if (onClickContinueReading != null) Padding(
            padding: const EdgeInsets.only(bottom: 2.0, right: 2.0),
            child: _ContinueReadingButton(
              onClickContinueReading: onClickContinueReading,
            ),
          ),
        ],
      ),
    );
  }
}

/// Layout of grid list item with title below the cover.
class MangaComfortableGridItem extends StatelessWidget {
  const MangaComfortableGridItem({
    super.key,
    required this.coverData,
    required this.title,
    required this.onClick,
    required this.onLongClick,
    this.isSelected = false,
    this.titleMaxLines = 2,
    this.coverAlpha = 1.0,
    this.coverBadgeStart,
    this.coverBadgeEnd,
    this.onClickContinueReading,
  });

  final manga_cover_data.MangaCover coverData;
  final String title;
  final GestureTapCallback onClick;
  final GestureLongPressCallback onLongClick;
  final bool isSelected;
  final int titleMaxLines;
  final double coverAlpha;
  final List<Widget>? coverBadgeStart;
  final List<Widget>? coverBadgeEnd;
  final GestureTapCallback? onClickContinueReading;

  @override
  Widget build(BuildContext context) {
    Widget? content;

    return _GridItemSelectable(
      isSelected: false,
      onClick: onClick,
      onLongClick: onLongClick,
      child: Column(
        children: [
          _MangaGridCover(
            cover: Opacity(
              opacity: isSelected ? _gridSelectedCoverAlpha : coverAlpha,
              child: MangaCover.book(data: coverData),
            ),
            badgesStart: coverBadgeStart ?? const [],
            badgesEnd: coverBadgeEnd ?? const [],
            content: onClickContinueReading != null
                ? Container(
                    alignment: AlignmentDirectional.bottomEnd,
                    padding: const EdgeInsets.all(
                      _continueReadingButtonGridPadding,
                    ),
                    child: _ContinueReadingButton(
                      onClickContinueReading: onClickContinueReading,
                    ),
                  )
                : null,
          ),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: _GridItemTitle(
              title: title,
              style: Theme.of(context).textTheme.titleSmall,
              minLines: 2,
              maxLines: titleMaxLines,
            ),
          ),
        ],
      ),
    );
  }
}

/// Common cover layout to add contents to be drawn on top of the cover.
class _MangaGridCover extends StatelessWidget {
  const _MangaGridCover({
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
          if (content != null) content!,
          if (badgesStart.isNotEmpty)
            Align(
              alignment: AlignmentDirectional.topStart,
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: badges.BadgeGroup(content: badgesStart),
              ),
            ),
          if (badgesEnd.isNotEmpty)
            Align(
              alignment: AlignmentDirectional.topEnd,
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: badges.BadgeGroup(content: badgesEnd),
              ),
            ),
        ],
      ),
    );
  }
}

class _GridItemTitle extends StatelessWidget {
  const _GridItemTitle({
    super.key,
    required this.title,
    this.style,
    required this.minLines,
    this.maxLines = 2,
  });

  final String title;
  final TextStyle? style;
  final int minLines;
  final int maxLines;

  @override
  Widget build(BuildContext context) {
    // Text widget has no minLines property, bruh
    // https://github.com/flutter/flutter/issues/31134
    return Stack(
      children: [
        Text('\n' * minLines),
        Text(
          title,
          maxLines: maxLines,
          overflow: TextOverflow.ellipsis,
          style: style?.copyWith(fontSize: 12.0, height: 1.5),
        ),
      ],
    );
  }
}

/// Wrapper for grid items to handle selection state, click and long click.
class _GridItemSelectable extends StatelessWidget {
  const _GridItemSelectable({
    super.key,
    required this.isSelected,
    required this.onClick,
    required this.onLongClick,
    required this.child,
  });

  final bool isSelected;
  final GestureTapCallback onClick;
  final GestureLongPressCallback onLongClick;
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
              borderRadius: BorderRadius.circular(MaterialPadding.small),
            )
          : null,
      padding: const EdgeInsets.all(4.0),
      child: InkWell(
        onTap: onClick,
        onLongPress: onLongClick,
        child: child,
      ),
    );
  }
}

/// Layout of list item.
class MangaListItem extends StatelessWidget {
  const MangaListItem({
    super.key,
    required this.coverData,
    required this.title,
    required this.onClick,
    required this.onLongClick,
    required this.badge,
    this.isSelected = false,
    this.coverAlpha = 1.0,
    this.onClickContinueReading,
  });

  final manga_cover_data.MangaCover coverData;
  final String title;
  final GestureTapCallback onClick;
  final GestureLongPressCallback onLongClick;
  final List<Widget> badge;
  final bool isSelected;
  final double coverAlpha;
  final GestureTapCallback? onClickContinueReading;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      onLongPress: onLongClick,
      child: Container(
        color: isSelected ? selectedBackground(context) : null,
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        height: 56.0,
        child: Row(
          children: [
            Opacity(
              opacity: coverAlpha,
              child: MangaCover.square(data: coverData),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
            ),
            BadgeGroup(content: badge),
            if (onClickContinueReading != null)
              Padding(
                padding: const EdgeInsetsDirectional.only(
                  start: _continueReadingButtonListSpacing,
                ),
                child: _ContinueReadingButton(
                  onClickContinueReading: onClickContinueReading,
                ),
              )
          ],
        ),
      ),
    );
  }
}

class _ContinueReadingButton extends StatelessWidget {
  const _ContinueReadingButton({super.key, this.onClickContinueReading});

  final VoidCallback? onClickContinueReading;

  @override
  Widget build(BuildContext context) {
    final lang = AppLocalizations.of(context);
    return IconButton.filled(
      icon: Icon(
        Icons.play_arrow,
        semanticLabel: lang.action_resume,
      ),
      onPressed: onClickContinueReading,
      style: IconButton.styleFrom(
        backgroundColor: Theme.of(context).colorScheme.primary.withOpacity(0.9),
        fixedSize: const Size.square(_continueReadingButtonSize),
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
        iconSize: 16.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(MaterialPadding.small),
        ),
      ),
    );
  }
}
