import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HistoryDeleteDialog extends StatefulWidget {
  const HistoryDeleteDialog({
    super.key,
    required this.onDelete,
  });

  final ValueChanged<bool> onDelete;

  @override
  State<HistoryDeleteDialog> createState() => _HistoryDeleteDialogState();
}

class _HistoryDeleteDialogState extends State<HistoryDeleteDialog> {
  bool _removeEverything = false;

  @override
  Widget build(BuildContext context) {
    final lang = AppLocalizations.of(context);
    return AlertDialog.adaptive(
      title: Text(lang.action_remove),
      content: Column(
        children: [
          Text(lang.dialog_with_checkbox_remove_description),
          const SizedBox.square(dimension: 8.0),
          CheckboxListTile(
            controlAffinity: ListTileControlAffinity.leading,
            title: Text(lang.dialog_with_checkbox_reset),
            value: _removeEverything,
            onChanged: (bool? value) {
              setState(() {
                _removeEverything = value ?? false;
              });
            },
          ),
        ],
      ),
      actions: [
        TextButton(
          child: Text(lang.action_cancel),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        TextButton(
          child: Text(lang.action_remove),
          onPressed: () {
            widget.onDelete(_removeEverything);
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}


class HistoryDeleteAllDialog extends StatelessWidget {
  const HistoryDeleteAllDialog({
    super.key,
    required this.onDelete,
  });

  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    final lang = AppLocalizations.of(context);
    return AlertDialog.adaptive(
      title: Text(lang.action_remove_everything),
      content: Text(lang.clear_history_confirmation),
      actions: [
        TextButton(
          child: Text(lang.action_cancel),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        TextButton(
          child: Text(lang.action_ok),
          onPressed: () {
            onDelete();
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
