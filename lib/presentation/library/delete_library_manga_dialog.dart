import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DeleteLibraryMangaDialog extends StatefulWidget {
  const DeleteLibraryMangaDialog({
    super.key,
    required this.containsLocalManga,
    required this.onConfirm,
  });

  final bool containsLocalManga;
  final void Function(bool, bool) onConfirm;

  @override
  State<DeleteLibraryMangaDialog> createState() =>
      _DeleteLibraryMangaDialogState();
}

class _DeleteLibraryMangaDialogState extends State<DeleteLibraryMangaDialog> {
  late final list = [
    false,
    if (!widget.containsLocalManga) false,
  ];

  @override
  Widget build(BuildContext context) {
    final lang = AppLocalizations.of(context);
    return AlertDialog.adaptive(
      title: Text(lang.action_remove),
      content: ListView(
        children: [
          CheckboxListTile(
            value: list[0],
            onChanged: (bool? value) => setState(() => list[0] = value!),
            title: Text(lang.manga_from_library),
            controlAffinity: ListTileControlAffinity.leading,
          ),
          if (!widget.containsLocalManga)
            CheckboxListTile(
              value: list[1],
              onChanged: (bool? value) => setState(() => list[1] = value!),
              title: Text(lang.downloaded_chapters),
              controlAffinity: ListTileControlAffinity.leading,
            ),
        ],
      ),
      actions: [
        TextButton(
          child: Text(lang.action_cancel),
          onPressed: () => Navigator.of(context).pop(),
        ),
        TextButton(
          onPressed: list.any((it) => it)
              ? () {
                  Navigator.of(context).pop();
                  widget.onConfirm(
                    list[0],
                    !widget.containsLocalManga ? list[1] : false,
                  );
                }
              : null,
          child: Text(lang.action_ok),
        ),
      ],
    );
  }
}
