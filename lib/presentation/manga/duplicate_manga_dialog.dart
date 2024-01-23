import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DuplicateMangaDialog extends StatelessWidget {
  const DuplicateMangaDialog({
    super.key,
    required this.onConfirm,
    required this.onOpenManga,
  });

  final VoidCallback onConfirm;
  final VoidCallback onOpenManga;

  @override
  Widget build(BuildContext context) {
    final lang = AppLocalizations.of(context);
    return AlertDialog.adaptive(
      title: Text(lang.are_you_sure),
      content: Text(lang.confirm_add_duplicate_manga),
      actions: [
        TextButton(
          child: Text(lang.action_show_manga),
          onPressed: () {
            Navigator.of(context).pop();
            onOpenManga();
          },
        ),
        Spacer(),
        TextButton(
          child: Text(lang.action_cancel),
          onPressed: () => Navigator.of(context).pop(),
        ),
        TextButton(
          child: Text(lang.action_ok),
          onPressed: () {
            Navigator.of(context).pop();
            onConfirm();
          },
        ),
      ],
    );
  }
}
