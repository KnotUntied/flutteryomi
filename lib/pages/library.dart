import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LibraryPage extends StatefulWidget {
  const LibraryPage({super.key});

  @override
  State<LibraryPage> createState() => _LibraryPageState();
}

class _LibraryPageState extends State<LibraryPage> {
  //final String _query = '';

  void _incrementCounter() {
    //setState(() { _query++; });
  }

  @override
  Widget build(BuildContext context) {
    final lang = AppLocalizations.of(context);
    return DefaultTabController(
      length: 1,
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
              onPressed: () {},
            ),
            MenuAnchor(
              builder: (BuildContext context, MenuController controller,
                  Widget? child) {
                return IconButton(
                  onPressed: () {
                    if (controller.isOpen) {
                      controller.close();
                    } else {
                      controller.open();
                    }
                  },
                  icon: const Icon(Icons.more_vert),
                );
              },
              menuChildren: <MenuItemButton>[
                MenuItemButton(
                  onPressed: () => {},
                  child: Text(lang.pref_category_library_update),
                ),
                MenuItemButton(
                  onPressed: () => {},
                  child: Text(lang.action_open_random_manga),
                ),
              ],
            ),
          ],
          bottom: TabBar(
            isScrollable: true,
            tabAlignment: TabAlignment.start,
            tabs: <Widget>[
              Tab(text: lang.label_default),
            ],
          ),
        ),
        //body: TabBarView(
        //children: myTabs.map((Tab tab) {
        //  return Center(
        //    child: Text(
        //      'This is the tab',
        //      style: const TextStyle(fontSize: 36),
        //    ),
        //  );
        //}).toList(),
        //),
      ),
    );
  }
}
