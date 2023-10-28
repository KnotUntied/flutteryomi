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
        children: const <CategoryTile>[
          CategoryTile("Curated"),
          CategoryTile("Example"),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: const Text('Add'),
        icon: const Icon(Icons.add),
        onPressed: () {  },
      ),
    );
  }
}


class CategoryTile extends StatelessWidget {
  const CategoryTile(this.label, {super.key});

  final String label;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Card(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: <ListTile>[
              ListTile(
                leading: const Icon(Icons.label_outlined),
                title: Text(label, style: Theme.of(context).textTheme.titleSmall),
              ),
              ListTile(
                leading: Row(
                  children: <IconButton>[
                    IconButton(
                      icon: const Icon(Icons.arrow_drop_up),
                      onPressed: () {  },
                    ),
                    IconButton(
                      icon: const Icon(Icons.arrow_drop_down),
                      onPressed: () {  },
                    ),
                  ]
                ),
                trailing: Row(
                  children: <IconButton>[
                    IconButton(
                      icon: const Icon(Icons.edit_outlined),
                      onPressed: () {  },
                    ),
                    IconButton(
                      icon: const Icon(Icons.delete_outlined),
                      onPressed: () {  },
                    ),
                  ]
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}