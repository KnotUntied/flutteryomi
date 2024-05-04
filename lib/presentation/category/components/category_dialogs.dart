import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:flutteryomi/core/preference/checkbox_state.dart';
import 'package:flutteryomi/domain/category/model/category.dart';
import 'package:flutteryomi/presentation/category/category_extensions.dart';

class CategoryCreateDialog extends StatefulWidget {
  const CategoryCreateDialog({
    super.key,
    required this.onCreate,
    required this.categories,
  });

  final ValueChanged<String> onCreate;
  final List<Category> categories;

  @override
  State<CategoryCreateDialog> createState() => _CategoryCreateDialogState();
}

class _CategoryCreateDialogState extends State<CategoryCreateDialog> {
  final _nameController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: _nameController,
      builder: (context, value, __) {
        final lang = AppLocalizations.of(context);
        final name = _nameController.text;
        final nameAlreadyExists = widget.categories.anyWithName(name);
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
          actions: [
            TextButton(
              child: Text(lang.action_cancel),
              onPressed: () => Navigator.pop(context),
            ),
            TextButton(
              onPressed: (name.isNotEmpty && !nameAlreadyExists)
                  ? () {
                      Navigator.pop(context);
                      widget.onCreate(name);
                    }
                  : null,
              child: Text(lang.action_add),
            ),
          ],
        );
      },
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
  final _nameController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: _nameController,
      builder: (context, TextEditingValue value, __) {
        final lang = AppLocalizations.of(context);
        final String name = _nameController.text;
        final bool nameAlreadyExists = widget.categories.anyWithName(name);
        final bool valueHasChanged = widget.category.name != name;
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
          actions: [
            TextButton(
              child: Text(lang.action_cancel),
              onPressed: () => Navigator.pop(context),
            ),
            TextButton(
              onPressed: valueHasChanged && !nameAlreadyExists
                  ? () {
                      Navigator.pop(context);
                      widget.onRename(name);
                    }
                  : null,
              child: Text(lang.action_ok),
            ),
          ],
        );
      },
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
      actions: [
        TextButton(
          child: Text(lang.action_cancel),
          onPressed: () => Navigator.pop(context),
        ),
        TextButton(
          onPressed: () {
            Navigator.pop(context);
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
      actions: [
        TextButton(
          child: Text(lang.action_cancel),
          onPressed: () => Navigator.pop(context),
        ),
        TextButton(
          onPressed: () {
            Navigator.pop(context);
            onSort();
          },
          child: Text(lang.action_ok),
        ),
      ],
    );
  }
}

// Might be better to ditch CheckboxState
class ChangeCategoryDialog extends StatefulWidget {
  const ChangeCategoryDialog({
    super.key,
    required this.initialSelection,
    required this.onEditCategories,
    required this.onConfirm,
  });

  final List<CheckboxState<Category>> initialSelection;
  final VoidCallback onEditCategories;
  final Function(List<int>, List<int>) onConfirm;

  @override
  State<ChangeCategoryDialog> createState() => _ChangeCategoryDialogState();
}

class _ChangeCategoryDialogState extends State<ChangeCategoryDialog> {
  late List<CheckboxState<Category>> selection;

  @override
  void initState() {
    super.initState();
    selection = widget.initialSelection;
  }

  @override
  Widget build(BuildContext context) {
    final lang = AppLocalizations.of(context);
    if (widget.initialSelection.isEmpty) {
      return AlertDialog.adaptive(
        title: Text(lang.action_move_category),
        content: Text(lang.information_empty_category_dialog),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              widget.onEditCategories();
            },
            child: Text(lang.action_edit_categories),
          ),
        ],
      );
    }
    return AlertDialog.adaptive(
      title: Text(lang.action_move_category),
      content: ListView.builder(
        itemCount: selection.length,
        itemBuilder: (context, index) {
          final checkbox = selection[index];
          bool? value;
          if (checkbox is CheckboxTriState) {
            value = (checkbox as CheckboxTriState).asBool();
          } else if (checkbox is CheckboxRegularState) {
            value = (checkbox as CheckboxRegularState).isChecked;
          }
          return CheckboxListTile(
            title: Text(checkbox.value.visualName(context)),
            value: value,
            onChanged: (bool? _) => setState(() {
              selection = selection
                  .map((it) => it == checkbox ? checkbox.next() : it)
                  .toList();
            }),
          );
        },
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
            widget.onEditCategories();
          },
          child: Text(lang.action_edit),
        ),
        const Spacer(),
        TextButton(
          child: Text(lang.action_cancel),
          onPressed: () => Navigator.pop(context),
        ),
        TextButton(
          onPressed: () {
            Navigator.pop(context);
            widget.onConfirm(
              selection
                  .where((it) =>
                      it is CheckboxRegularStateChecked ||
                      it is CheckboxTriStateInclude)
                  .map((it) => it.value.id)
                  .toList(),
              selection
                  .where((it) =>
                      it is CheckboxRegularStateNone ||
                      it is CheckboxTriStateNone)
                  .map((it) => it.value.id)
                  .toList(),
            );
          },
          child: Text(lang.action_ok),
        ),
      ],
    );
  }
}

extension _CategoryListExtensions on List<Category> {
  bool anyWithName(String name) => any((it) => name == it.name);
}
