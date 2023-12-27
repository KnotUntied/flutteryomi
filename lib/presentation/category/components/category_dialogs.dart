import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:flutteryomi/domain/category/model/category.dart';

class CategoryCreateDialog extends StatefulWidget {
  const CategoryCreateDialog({
    super.key,
    //required this.onDismissRequest,
    required this.onCreate,
    required this.categories,
  });

  //final VoidCallback onDismissRequest;
  final ValueChanged<String> onCreate;
  final List<Category> categories;

  @override
  State<CategoryCreateDialog> createState() => _CategoryCreateDialogState();
}

class _CategoryCreateDialogState extends State<CategoryCreateDialog> {
  late TextEditingController _nameController;
  String get name => _nameController.text;
  bool get nameAlreadyExists => widget.categories.anyWithName(name);

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final lang = AppLocalizations.of(context);
    return AlertDialog.adaptive(
      title: Text(lang.action_add_category),
      content: TextField(
        autofocus: true,
        controller: _nameController,
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          errorText: (name.isNotEmpty && nameAlreadyExists)
              ? lang.error_category_exists
              : null,
          helperText: lang.information_required_plain,
          labelText: lang.name,
        ),
      ),
      actions: <Widget>[
        TextButton(
          child: Text(lang.action_cancel),
          onPressed: () => Navigator.of(context).pop(),
        ),
        TextButton(
          onPressed: name.isNotEmpty && !nameAlreadyExists
              ? () {
                  Navigator.of(context).pop();
                  widget.onCreate(name);
                }
              : null,
          child: Text(lang.action_add),
        ),
      ],
    );
  }
}



class CategoryRenameDialog extends StatefulWidget {
  const CategoryRenameDialog({
    super.key,
    //required this.onDismissRequest,
    required this.onRename,
    required this.categories,
    required this.category,
  });

  //final VoidCallback onDismissRequest;
  final ValueChanged<String> onRename;
  final List<Category> categories;
  final Category category;

  @override
  State<CategoryRenameDialog> createState() => _CategoryRenameDialogState();
}

class _CategoryRenameDialogState extends State<CategoryRenameDialog> {
  late TextEditingController _nameController;
  String get name => _nameController.text;
  bool get nameAlreadyExists => widget.categories.anyWithName(name);
  bool get valueHasChanged => widget.category.name != name;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final lang = AppLocalizations.of(context);
    final String name = _nameController.text;
    final bool nameAlreadyExists = widget.categories.anyWithName(name);
    return AlertDialog.adaptive(
      title: Text(lang.action_rename_category),
      content: TextField(
        autofocus: true,
        controller: _nameController,
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          errorText: (valueHasChanged && nameAlreadyExists)
              ? lang.error_category_exists
              : null,
          helperText: lang.information_required_plain,
          labelText: lang.name,
        ),
      ),
      actions: <Widget>[
        TextButton(
          child: Text(lang.action_cancel),
          onPressed: () => Navigator.of(context).pop(),
        ),
        TextButton(
          onPressed: valueHasChanged && !nameAlreadyExists
              ? () {
                  Navigator.of(context).pop();
                  widget.onRename(name);
                }
              : null,
          child: Text(lang.action_ok),
        ),
      ],
    );
  }
}

class CategoryDeleteDialog extends StatelessWidget {
  const CategoryDeleteDialog({
    super.key,
    required this.onDelete,
    required this.category,
  });

  final VoidCallback onDelete;
  final Category category;

  @override
  Widget build(BuildContext context) {
    final lang = AppLocalizations.of(context);
    return AlertDialog.adaptive(
      title: Text(lang.delete_category),
      content: Text(lang.delete_category_confirmation(category.name)),
      actions: <Widget>[
        TextButton(
          child: Text(lang.action_cancel),
          onPressed: () => Navigator.of(context).pop(),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
            onDelete();
          },
          child: Text(lang.action_ok),
        ),
      ],
    );
  }
}

class CategorySortAlphabeticallyDialog extends StatelessWidget {
  const CategorySortAlphabeticallyDialog({
    super.key,
    required this.onSort,
  });

  final VoidCallback onSort;

  @override
  Widget build(BuildContext context) {
    final lang = AppLocalizations.of(context);
    return AlertDialog.adaptive(
      title: Text(lang.action_sort_category),
      content: Text(lang.sort_category_confirmation),
      actions: <Widget>[
        TextButton(
          child: Text(lang.action_cancel),
          onPressed: () => Navigator.of(context).pop(),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
            onSort();
          },
          child: Text(lang.action_ok),
        ),
      ],
    );
  }
}

// TODO: ChangeCategoryDialog

extension _CategoryListExtensions on List<Category> {
  bool anyWithName(String name) => any((it) => name == it.name);
}
