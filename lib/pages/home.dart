import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:flutteryomi/pages/browse.dart';
import 'package:flutteryomi/pages/library.dart';
import 'package:flutteryomi/pages/more.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

const Map<int, Widget> _HomePageMap = {
  0: LibraryPage(),
  1: LibraryPage(),
  2: LibraryPage(),
  3: BrowsePage(),
  4: MorePage(),
};

class _HomePageState extends State<HomePage> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    final lang = AppLocalizations.of(context);

    return WillPopScope(
      onWillPop: () async {
        if (currentPageIndex == 0) {
          return true;
        } else {
          setState(() { currentPageIndex = 0; });
          return false;
        }
      },
      child: LayoutBuilder(builder: (context, constraints) {
        return Scaffold(
          body: Center(child: _HomePageMap[currentPageIndex]),
          bottomNavigationBar: NavigationBar(
            onDestinationSelected: (int index) {
              // TODO: Find declarative way to have LibraryPage as the home page for HomePage
              // Currently not supported or documented for NavigationBar
              setState(() { currentPageIndex = index; });
            },
            selectedIndex: currentPageIndex,
            destinations: <NavigationDestination>[
              NavigationDestination(
                selectedIcon: const Icon(Icons.collections_bookmark),
                icon: const Icon(Icons.collections_bookmark_outlined),
                label: lang.label_library,
              ),
              NavigationDestination(
                selectedIcon: const Icon(Icons.new_releases),
                icon: const Icon(Icons.new_releases_outlined),
                label: lang.label_recent_updates,
              ),
              NavigationDestination(
                selectedIcon: const Icon(Icons.history),
                icon: const Icon(Icons.history_outlined),
                label: lang.label_recent_manga,
              ),
              NavigationDestination(
                selectedIcon: const Icon(Icons.explore),
                icon: const Icon(Icons.explore_outlined),
                label: lang.browse,
              ),
              NavigationDestination(
                selectedIcon: const Icon(Icons.more_horiz),
                icon: const Icon(Icons.more_horiz_outlined),
                label: lang.label_more,
              ),
            ],
          ),
        );
      }),
    );
  }
}
