import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
//import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutteryomi/presentation/browse/browse.dart';
import 'package:flutteryomi/presentation/history/history.dart';
import 'package:flutteryomi/presentation/library/library.dart';
import 'package:flutteryomi/presentation/more/more.dart';
import 'package:flutteryomi/presentation/updates/updates.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

const Map<int, Widget> homeScreenMap = {
  0: LibraryTab(),
  1: UpdatesTab(),
  2: HistoryTab(),
  3: BrowseTab(),
  4: MoreTab(),
};

class _HomeScreenState extends State<HomeScreen> {
  int currentPageIndex = 0;

  void navigate(int index) {
    setState(() {
      currentPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    //final homeProvider = Provider.of<HomeProvider>(context);

    return PopScope(
      canPop: currentPageIndex == 0,
      onPopInvoked: (bool didPop) {
        navigate(0);
      },
      child: LayoutBuilder(builder: (context, constraints) {
        return Scaffold(
          body: Row(
            children: [
              //if (false) NavigationRail(
              //  groupAlignment: -1.0,
              //  labelType: NavigationRailLabelType.all,
              //  onDestinationSelected: (int index) {
              //    setState(() {
              //      currentPageIndex = index;
              //    });
              //  },
              //  selectedIndex: currentPageIndex,
              //  destinations: <NavigationRailDestination>[
              //    NavigationRailDestination(
              //      selectedIcon: const Icon(Icons.collections_bookmark),
              //      icon: const Icon(Icons.collections_bookmark_outlined),
              //      label: Text(lang.label_library),
              //    ),
              //    NavigationRailDestination(
              //      selectedIcon: const Icon(Icons.new_releases),
              //      icon: const Icon(Icons.new_releases_outlined),
              //      label: Text(lang.label_recent_updates),
              //    ),
              //    NavigationRailDestination(
              //      selectedIcon: const Icon(Icons.history),
              //      icon: const Icon(Icons.history_outlined),
              //      label: Text(lang.label_recent_manga),
              //    ),
              //    NavigationRailDestination(
              //      selectedIcon: const Icon(Icons.explore),
              //      icon: const Icon(Icons.explore_outlined),
              //      label: Text(lang.browse),
              //    ),
              //    NavigationRailDestination(
              //      selectedIcon: Icon(Icons.adaptive.more),
              //      icon: Icon(Icons.adaptive.more_outlined),
              //      label: Text(lang.label_more),
              //    ),
              //  ],
              //),
              Expanded(
                child: Center(child: homeScreenMap[currentPageIndex]),
              ),
            ],
          ),
          //bottomNavigationBar: homeProvider.bottomNavVisibility
          //    ? HomeNavigationBar(
          //        index: currentPageIndex,
          //        onTap: navigate,
          //      )
          //    : null,
          bottomNavigationBar: HomeNavigationBar(
            index: currentPageIndex,
            onTap: navigate,
          ),
        );
      }),
    );
  }
}

class BadgedIcon extends StatelessWidget {
  const BadgedIcon({
    super.key,
    required this.icon,
    required this.count,
  });

  final Icon icon;
  final int count;

  @override
  Widget build(BuildContext context) {
    if (count > 0) {
      return Badge.count(count: count, child: icon);
    } else {
      return icon;
    }
  }
}

class HomeNavigationBar extends StatelessWidget {
  final int index;
  final ValueChanged<int> onTap;

  const HomeNavigationBar({
    super.key,
    required this.index,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final lang = AppLocalizations.of(context);
    return Platform.isIOS
        ? CupertinoTabBar(
            currentIndex: index,
            onTap: onTap,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                activeIcon: const Icon(Icons.collections_bookmark),
                icon: const Icon(Icons.collections_bookmark_outlined),
                label: lang.label_library,
              ),
              BottomNavigationBarItem(
                activeIcon: const Icon(Icons.new_releases),
                icon: const Icon(Icons.new_releases_outlined),
                label: lang.label_recent_updates,
              ),
              BottomNavigationBarItem(
                activeIcon: const Icon(Icons.history),
                icon: const Icon(Icons.history_outlined),
                label: lang.label_recent_manga,
              ),
              BottomNavigationBarItem(
                activeIcon: const Icon(Icons.explore),
                icon: const Icon(Icons.explore_outlined),
                label: lang.browse,
              ),
              BottomNavigationBarItem(
                activeIcon: Icon(Icons.adaptive.more),
                icon: Icon(Icons.adaptive.more_outlined),
                label: lang.label_more,
              ),
            ],
          )
        : NavigationBar(
            onDestinationSelected: onTap,
            selectedIndex: index,
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
                selectedIcon: Icon(Icons.adaptive.more),
                icon: Icon(Icons.adaptive.more_outlined),
                label: lang.label_more,
              ),
            ],
          );
  }
}
