import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:flutteryomi/domain/category/model/category.dart';

class CategoryAddDialog extends StatefulWidget {
  const CategoryAddDialog({super.key});

  @override
  State<CategoryAddDialog> createState() => _CategoryAddDialogState();
}

class _CategoryAddDialogState extends State<CategoryAddDialog> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final lang = AppLocalizations.of(context);
    return AlertDialog.adaptive(
      title: Text(lang.action_add_category),
      content: TextField(
        autofocus: true,
        controller: _controller,
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          hintText: lang.name, // *required
          labelText: lang.name,
        ),
      ),
      actions: <Widget>[
        TextButton(
          child: Text(lang.action_cancel),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        TextButton(
          child: Text(lang.action_add),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}

class CategoryRenameDialog extends StatefulWidget {
  const CategoryRenameDialog({super.key});

  @override
  State<CategoryRenameDialog> createState() => _CategoryRenameDialogState();
}

class _CategoryRenameDialogState extends State<CategoryRenameDialog> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final lang = AppLocalizations.of(context);
    return AlertDialog.adaptive(
      title: Text(lang.action_rename_category),
      content: TextField(
        autofocus: true,
        controller: _controller,
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          hintText: lang.name, // *required
          labelText: lang.name,
        ),
      ),
      actions: <Widget>[
        TextButton(
          child: Text(lang.action_cancel),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        TextButton(
          child: Text(lang.action_add),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}