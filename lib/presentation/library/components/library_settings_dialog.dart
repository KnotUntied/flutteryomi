import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LibrarySettingsDialog extends StatelessWidget {
  const LibrarySettingsDialog({
    super.key,
    required this.onDismiss,
    //required this.category,
  });

  final VoidCallback onDismiss;
  //final Category? category;

  @override
  Widget build(BuildContext context) {
    final lang = AppLocalizations.of(context);
    return DefaultTabController(
      length: 3,
      child: Column(
        children: <Widget>[
          TabBar(
            tabAlignment: TabAlignment.fill,
            tabs: <Widget>[
              Tab(text: lang.action_filter),
              Tab(text: lang.action_sort),
              Tab(text: lang.pref_category_display),
            ],
          ),
          const Expanded(
            child: TabBarView(
              children: <Widget>[
                _FilterPage(),
                //_SortPage(category),
                _SortPage(),
                _DisplayPage(),
              ],
            ),
          ),
        ],
      )
    );
  }
}

class _FilterPage extends StatelessWidget {
  const _FilterPage({super.key});

  @override
  Widget build(BuildContext context) {
    //final lang = AppLocalizations.of(context);
    return ListView(
      children: const [],
    );
  }
}

class _SortPage extends StatelessWidget {
  const _SortPage({super.key});

  @override
  Widget build(BuildContext context) {
    //final lang = AppLocalizations.of(context);
    return ListView(
      children: const [],
    );
  }
}


class _DisplayPage extends StatelessWidget {
  const _DisplayPage({super.key});

  @override
  Widget build(BuildContext context) {
    //final lang = AppLocalizations.of(context);
    return ListView(
      children: const [],
    );
  }
}
