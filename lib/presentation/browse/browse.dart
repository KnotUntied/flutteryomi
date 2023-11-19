import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
//import 'package:shared_preferences/shared_preferences.dart';

import 'package:flutteryomi/presentation/browse/source/sources.dart';
import 'package:flutteryomi/presentation/browse/source/sources_filter.dart';

class BrowseTab extends StatefulWidget {
  const BrowseTab({super.key});

  @override
  State<BrowseTab> createState() => _BrowseTabState();
}

class _BrowseTabState extends State<BrowseTab>
    with AutomaticKeepAliveClientMixin<BrowseTab> {
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
                    builder: (context) => const SourcesFilterScreen(),
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
          SourcesTab(),
          SourcesTab(),
          SourcesTab(),
        ]),
      ),
    );
  }
}
