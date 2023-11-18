import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
//import 'package:shared_preferences/shared_preferences.dart';

import 'package:flutteryomi/pages/sources.dart';
import 'package:flutteryomi/pages/sources_filter.dart';

class BrowsePage extends StatefulWidget {
  const BrowsePage({super.key});

  @override
  State<BrowsePage> createState() => _BrowsePageState();
}

class _BrowsePageState extends State<BrowsePage>
    with AutomaticKeepAliveClientMixin<BrowsePage> {
  //final String _query = '';

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final lang = AppLocalizations.of(context);
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text(lang.label_library),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.filter_list),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SourcesFilterPage(),
                  ),
                );
              },
            ),
          ],
          bottom: TabBar(
            tabs: <Tab>[
              Tab(text: lang.label_sources),
              Tab(text: lang.label_extensions),
              Tab(text: lang.label_migration),
            ],
          ),
        ),
        body: const TabBarView(children: [
          SourcesPage(),
          SourcesPage(),
          SourcesPage(),
        ]),
      ),
    );
  }
}
