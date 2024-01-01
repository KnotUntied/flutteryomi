import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';

import 'package:flutteryomi/domain/history/model/history_with_relations.dart';
import 'package:flutteryomi/presentation/components/material/constants.dart';
import 'package:flutteryomi/presentation/manga/components/manga_cover.dart';

const _historyItemHeight = 96.0;

class HistoryItem extends StatelessWidget {
  const HistoryItem({
    super.key,
    required this.history,
    required this.onClickCover,
    required this.onClickResume,
    required this.onClickDelete,
  });

  final HistoryWithRelations history;
  final VoidCallback onClickCover;
  final VoidCallback onClickResume;
  final VoidCallback onClickDelete;

  @override
  Widget build(BuildContext context) {
    final lang = AppLocalizations.of(context);
    final readAt = history.readAt != null ? DateFormat.jm().format(history.readAt!) : '';
    return InkWell(
      onTap: onClickResume,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: MaterialPadding.medium,
          vertical: MaterialPadding.small,
        ),
        child: SizedBox(
          height: _historyItemHeight,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              MangaCover.book(
                data: history.coverData,
                onClick: onClickCover,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsetsDirectional.only(
                    start: MaterialPadding.medium,
                    end: MaterialPadding.small,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        history.title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w600),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 4.0),
                        child: Text(
                          history.chapterNumber > -1
                              ? lang.recent_manga_time(history.chapterNumber, history.readAt!)
                              : readAt,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              IconButton(
                icon: Icon(
                  Icons.delete_outlined,
                  semanticLabel: lang.action_delete,
                ),
                style: IconButton.styleFrom(
                  surfaceTintColor: Theme.of(context).colorScheme.onSurface,
                ),
                onPressed: onClickDelete,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
