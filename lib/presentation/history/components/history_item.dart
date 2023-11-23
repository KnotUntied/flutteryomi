import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:flutteryomi/presentation/manga/components/manga_cover.dart';

const _historyItemHeight = 96.0;

class HistoryItem extends StatelessWidget {
  const HistoryItem({
    super.key,
    //required this.history,
    required this.onClickCover,
    required this.onClickResume,
    required this.onClickDelete,
  });

  //final HistoryWithRelations history;
  final VoidCallback onClickCover;
  final VoidCallback onClickResume;
  final VoidCallback onClickDelete;

  @override
  Widget build(BuildContext context) {
    final lang = AppLocalizations.of(context);
    return ListTile(
      //leading: MangaCover.book(
      //  data: history.coverData,
      //  onClick: onClickCover,
      //),
      //title: Text(
      //  history.text,
      //  maxLines: 2,
      //  overflow: TextOverflow.ellipsis,
      //  style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w600),
      //),
      //subtitle: const Padding(
      //  padding: EdgeInsets.only(top: 4.0),
      //  child: Text(''),
      //),
      onTap: onClickResume,
      subtitle: const Text(''),
      isThreeLine: true,
      trailing: IconButton(
        icon: Icon(
          Icons.delete_outlined,
          semanticLabel: lang.action_delete,
        ),
        style: IconButton.styleFrom(
          surfaceTintColor: Theme.of(context).colorScheme.onSurface,
        ),
        onPressed: onClickDelete,
      ),
    );
  }
}
