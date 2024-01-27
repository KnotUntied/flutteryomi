import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:flutteryomi/domain/download/model/download.dart';
import 'package:flutteryomi/domain/updates/model/updates_with_relations.dart';
import 'package:flutteryomi/presentation/components/material/constants.dart';
import 'package:flutteryomi/presentation/manga/components/chapter_download_indicator.dart';
import 'package:flutteryomi/presentation/manga/components/dot_separator_text.dart';
import 'package:flutteryomi/presentation/manga/components/manga_cover.dart';
import 'package:flutteryomi/presentation/updates/updates.dart';
import 'package:flutteryomi/presentation/updates/updates_screen_model.dart';
import 'package:flutteryomi/presentation/util/modifier.dart';
import 'package:flutteryomi/presentation/util/time_utils.dart';

class UpdatesLastUpdatedItem extends StatelessWidget {
  const UpdatesLastUpdatedItem({super.key, required this.lastUpdated});

  final DateTime lastUpdated;

  @override
  Widget build(BuildContext context) {
    final lang = AppLocalizations.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: MaterialPadding.medium,
        vertical: MaterialPadding.small,
      ),
      child: Text(
        lang.updates_last_update_info(
          relativeTimeSpanString(context, lastUpdated),
        ),
      ),
    );
  }
}

class UpdatesUiItem extends StatelessWidget {
  const UpdatesUiItem({
    super.key,
    required this.update,
    required this.selected,
    this.readProgress,
    required this.onClick,
    required this.onLongClick,
    this.onClickCover,
    this.onDownloadChapter,
    // Download indicator
    required this.downloadStateProvider,
    required this.downloadProgressProvider,
  });

  final UpdatesWithRelations update;
  final bool selected;
  final String? readProgress;
  final VoidCallback onClick;
  final VoidCallback onLongClick;
  final VoidCallback? onClickCover;
  final ValueChanged<ChapterDownloadAction>? onDownloadChapter;
  final DownloadState Function() downloadStateProvider;
  final int Function() downloadProgressProvider;

  @override
  Widget build(BuildContext context) {
    final lang = AppLocalizations.of(context);
    final textAlpha = update.read ? readItemAlpha : 1.0;
    //TODO: Check if ListTile can replace this widget
    return InkWell(
      onTap: onClick,
      onLongPress: onLongClick,
      child: Container(
        color: selected ? selectedBackground(context) : null,
        padding: const EdgeInsets.symmetric(horizontal: MaterialPadding.medium),
        height: 56.0,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 6.0),
              child: MangaCover.square(
                data: update.coverData,
                onClick: onClickCover,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: MaterialPadding.medium,
                ),
                child: Column(
                  children: [
                    Opacity(
                      opacity: textAlpha,
                      child: Text(
                        update.mangaTitle,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                    Row(
                      children: [
                        if (!update.read)
                          Icon(
                            Icons.circle,
                            semanticLabel: lang.unread,
                            size: 8.0,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        //TODO: Make bookmark's height equal to subtitle height
                        if (update.bookmark) ...[
                          Icon(
                            Icons.bookmark,
                            semanticLabel: lang.action_filter_bookmarked,
                            size: 12.0,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                          const SizedBox(width: 2.0),
                        ],
                        Flexible(
                          child: Opacity(
                            opacity: textAlpha,
                            child: Text(
                              update.chapterName,
                              maxLines: 1,
                              style: Theme.of(context).textTheme.bodySmall,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                        if (readProgress != null) ...[
                          const DotSeparatorText(),
                          Opacity(
                            opacity: readItemAlpha,
                            child: Text(
                              readProgress!,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.only(start: 4.0),
              child: ChapterDownloadIndicator(
                enabled: onDownloadChapter != null,
                downloadStateProvider: downloadStateProvider,
                downloadProgressProvider: downloadProgressProvider,
                onClick: onDownloadChapter != null //
                    ? onDownloadChapter!
                    : (_) {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
