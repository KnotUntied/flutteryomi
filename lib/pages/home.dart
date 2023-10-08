import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:flutteryomi/pages/library.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    final lang = AppLocalizations.of(context);
    Widget page;
    switch (currentPageIndex) {
      case 0:
        page = const LibraryPage();
      case 1:
        page = const LibraryPage();
      case 2:
        page = const LibraryPage();
      case 3:
        page = const LibraryPage();
      case 4:
        page = const LibraryPage();
      default:
        throw UnimplementedError('Undefined page from menu.');
    }

    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
        body: Column(
          children: [
            Expanded(
              child: Container(
                child: page,
              ),
            ),
            NavigationBar(
              onDestinationSelected: (int index) {
                setState(() {
                  currentPageIndex = index;
                });
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
          ],
        ),
      );
    });
  }
}
