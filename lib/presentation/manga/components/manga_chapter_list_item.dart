import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:flutteryomi/domain/download/model/download.dart';
import 'package:flutteryomi/domain/library/service/library_preferences.dart';
import 'package:flutteryomi/presentation/components/material/constants.dart';
import 'package:flutteryomi/presentation/manga/components/chapter_download_indicator.dart';
import 'package:flutteryomi/presentation/manga/components/dot_separator_text.dart';
import 'package:flutteryomi/presentation/util/modifier.dart';

class MangaChapterListItem extends StatelessWidget {
  const MangaChapterListItem({
    super.key,
    required this.title,
    this.date,
    this.readProgress,
    this.scanlator,
    required this.read,
    required this.bookmark,
    required this.selected,
    required this.downloadIndicatorEnabled,
    required this.downloadStateProvider,
    required this.downloadProgressProvider,
    required this.chapterSwipeStartAction,
    required this.chapterSwipeEndAction,
    required this.onLongClick,
    required this.onClick,
    required this.onDownloadClick,
    required this.onChapterSwipe,
  });

  final String title;
  final String? date;
  final String? readProgress;
  final String? scanlator;
  final bool read;
  final bool bookmark;
  final bool selected;
  final bool downloadIndicatorEnabled;
  final DownloadState Function() downloadStateProvider;
  final int Function() downloadProgressProvider;
  final ChapterSwipeAction chapterSwipeStartAction;
  final ChapterSwipeAction chapterSwipeEndAction;
  final VoidCallback onLongClick;
  final VoidCallback onClick;
  final ValueChanged<ChapterDownloadAction>? onDownloadClick;
  final ValueChanged<ChapterSwipeAction> onChapterSwipe;

  @override
  Widget build(BuildContext context) {
    final lang = AppLocalizations.of(context);
    final textAlpha = read ? readItemAlpha : 1.0;
    final textSubtitleAlpha = read ? readItemAlpha : secondaryItemAlpha;
    final start = _getSwipeAction(
      action: chapterSwipeStartAction,
      read: read,
      bookmark: bookmark,
      downloadState: downloadStateProvider(),
      background: Theme.of(context).colorScheme.primaryContainer,
      onSwipe: () => onChapterSwipe(chapterSwipeStartAction),
    );
    final end = _getSwipeAction(
      action: chapterSwipeEndAction,
      read: read,
      bookmark: bookmark,
      downloadState: downloadStateProvider(),
      background: Theme.of(context).colorScheme.primaryContainer,
      onSwipe: () => onChapterSwipe(chapterSwipeEndAction),
    );
    return Dismissible(
      key: key!,
      // TODO: Change color and produce haptic feedback
      // when reaching threshold
      background: Container(
        color: start?.background,
        child: Row(
          children: [
            if (start != null) Padding(
              padding: const EdgeInsets.all(16.0),
              child: Icon(
                start.icon,
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
          ],
        ),
      ),
      secondaryBackground: Container(
        color: end?.background,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            if (end != null) Padding(
              padding: const EdgeInsets.all(16.0),
              child: Icon(
                end.icon,
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
          ],
        ),
      ),
      //swipeActionThreshold in Kotlin is not fractional
      //but in Flutter is fractional
      //ignore for now
      //Might be possible with 56.0/MediaQuery.sizeof(context).width
      //dismissThresholds: {},
      onDismissed: (direction) {
        if (direction == DismissDirection.startToEnd) {
          start?.onSwipe();
        } else if (direction == DismissDirection.endToStart) {
          end?.onSwipe();
        }
      },
      confirmDismiss: (direction) async => false,
      child: InkWell(
        onTap: onClick,
        onLongPress: onLongClick,
        child: Container(
          color: selected ? selectedBackground(context) : null,
          padding: const EdgeInsetsDirectional.only(
              start: 16.0, top: 12.0, end: 8.0, bottom: 12.0),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    Row(
                      children: [
                        if (!read)
                          Padding(
                            padding: const EdgeInsetsDirectional.only(end: 4.0),
                            child: Icon(
                              Icons.circle,
                              semanticLabel: lang.unread,
                              size: 8.0,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          ),
                        if (!read && bookmark) const SizedBox(width: 6.0),
                        if (bookmark)
                          Padding(
                            padding: const EdgeInsetsDirectional.only(end: 4.0),
                            child: Icon(
                              Icons.bookmark,
                              semanticLabel: lang.unread,
                              size: 10.0,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          ),
                        const SizedBox(width: 6.0),
                        Opacity(
                          opacity: textAlpha,
                          child: Text(
                            title,
                            style: Theme.of(context).textTheme.bodyMedium,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    DefaultTextStyle.merge(
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.color
                                ?.withOpacity(textAlpha),
                            fontSize: 12.0,
                          ),
                      child: Row(
                        children: [
                          if (date != null) ...[
                            Text(
                              date!,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            if (readProgress != null || scanlator != null)
                              const DotSeparatorText(),
                          ],
                          if (readProgress != null) ...[
                            Text(
                              readProgress!,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            if (readProgress != null || scanlator != null)
                              const DotSeparatorText(),
                          ],
                          if (scanlator != null) Text(
                            scanlator!,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              ChapterDownloadIndicator(
                enabled: downloadIndicatorEnabled,
                downloadStateProvider: downloadStateProvider,
                downloadProgressProvider: downloadProgressProvider,
                onClick: (value) {
                  if (onDownloadClick != null) onDownloadClick!(value);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

_SwipeAction? _getSwipeAction({
  required ChapterSwipeAction action,
  required bool read,
  required bool bookmark,
  required DownloadState downloadState,
  required Color background,
  required VoidCallback onSwipe,
}) =>
    switch (action) {
      ChapterSwipeAction.toggleRead => _swipeAction(
          icon: !read ? Icons.done_outlined : Icons.remove_done_outlined,
          background: background,
          onSwipe: onSwipe,
        ),
      ChapterSwipeAction.toggleBookmark => _swipeAction(
          icon: !bookmark
              ? Icons.bookmark_add_outlined
              : Icons.bookmark_remove_outlined,
          background: background,
          onSwipe: onSwipe,
        ),
      ChapterSwipeAction.download => _swipeAction(
          icon: switch (downloadState) {
            DownloadState.notDownloaded ||
            DownloadState.error =>
              Icons.download_outlined,
            DownloadState.queue ||
            DownloadState.downloading =>
              Icons.file_download_off_outlined,
            DownloadState.downloaded => Icons.delete_outlined,
          },
          background: background,
          onSwipe: onSwipe,
        ),
      ChapterSwipeAction.disabled => null,
    };

_SwipeAction _swipeAction({
  required VoidCallback onSwipe,
  required IconData icon,
  required Color background,
}) =>
    _SwipeAction(
      onSwipe: onSwipe,
      icon: icon,
      background: background,
    );

class _SwipeAction {
  const _SwipeAction({
    required this.onSwipe,
    required this.icon,
    required this.background,
  });

  final VoidCallback onSwipe;
  final IconData icon;
  final Color background;
}
