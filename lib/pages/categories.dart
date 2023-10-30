import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final lang = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(lang.action_edit_categories),
      ),
      body: ListView(
        children: const <CategoryListItem>[
          CategoryListItem("Curated"),
          CategoryListItem("Example"),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: Text(lang.action_add),
        icon: const Icon(Icons.add),
        onPressed: () => _showCategoryAddDialog(context),
      ),
    );
  }

  Future<void> _showCategoryAddDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return const CategoryAddDialog();
      },
    );
  }

  Future<void> _showCategoryRenameDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return const CategoryRenameDialog();
      },
    );
  }
}

class CategoryListItem extends StatelessWidget {
  const CategoryListItem(this.label, {super.key});

  final String label;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Card(
        //child: Padding(
        //  padding: const EdgeInsets.all(16),
        //  child: Column(
        //    children: <Widget>[
        //      ListTile(
        //        leading: const Icon(Icons.label_outlined),
        //        title: Text(label, style: Theme.of(context).textTheme.titleSmall),
        //      ),
        //      Row(
        //        children: <Widget>[
        //          IconButton(
        //            icon: const Icon(Icons.arrow_drop_up),
        //            onPressed: () {  },
        //          ),
        //          IconButton(
        //            icon: const Icon(Icons.arrow_drop_down),
        //            onPressed: () {  },
        //          ),
        //          const Spacer(),
        //          IconButton(
        //            icon: const Icon(Icons.edit_outlined),
        //            onPressed: () {  },
        //          ),
        //          IconButton(
        //            icon: const Icon(Icons.delete_outlined),
        //            onPressed: () {  },
        //          ),
        //        ],
        //      ),
        //    ],
        //  ),
        //),
        child: Column(
          children: <Widget>[
            //ListTile(
            //  leading: const Icon(Icons.label_outlined),
            //  title: Text(label, style: Theme.of(context).textTheme.titleSmall),
            //),
            Padding(
              padding:
                  const EdgeInsets.only(left: 16.0, top: 16.0, right: 16.0),
              child: Row(children: <Widget>[
                const Icon(Icons.label_outlined),
                Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: Text(label,
                      style: Theme.of(context).textTheme.titleSmall),
                ),
              ]),
            ),
            Row(children: <Widget>[
              IconButton(
                icon: const Icon(Icons.arrow_drop_up),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(Icons.arrow_drop_down),
                onPressed: () {},
              ),
              const Spacer(),
              IconButton(
                icon: const Icon(Icons.edit_outlined),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(Icons.delete_outlined),
                onPressed: () {},
              ),
            ]),
          ],
        ),
      ),
    );
  }
}

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
