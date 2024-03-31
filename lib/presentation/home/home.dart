import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
//import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutteryomi/presentation/browse/browse.dart';
import 'package:flutteryomi/presentation/components/adaptive_navigation_bar.dart';
import 'package:flutteryomi/presentation/history/history.dart';
import 'package:flutteryomi/presentation/library/library.dart';
import 'package:flutteryomi/presentation/more/more.dart';
import 'package:flutteryomi/presentation/updates/updates.dart';

const _tabs = {
  0: LibraryTab(),
  1: UpdatesTab(),
  2: HistoryTab(),
  3: BrowseTab(),
  4: MoreTab(),
};

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentPageIndex = 0;

  void navigate(int index) {
    setState(() => currentPageIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: currentPageIndex == 0,
      onPopInvoked: (bool didPop) {
        navigate(0);
      },
      child: LayoutBuilder(builder: (context, constraints) {
        return Scaffold(
          body: Row(
            children: [
              //tablet rail
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
                child: Center(
                  child: _tabs[currentPageIndex],
                ),
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
            onSelect: navigate,
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
  final ValueChanged<int> onSelect;

  const HomeNavigationBar({
    super.key,
    required this.index,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    final lang = AppLocalizations.of(context);
    final isApple = Platform.isIOS || Platform.isMacOS;
    final items = isApple
        ? [
            NavigationBarItem(
              selectedIcon: const Icon(CupertinoIcons.collections_solid),
              icon: const Icon(CupertinoIcons.collections),
              label: lang.label_library,
            ),
            NavigationBarItem(
              selectedIcon: const Icon(CupertinoIcons.news_solid),
              icon: const Icon(CupertinoIcons.news),
              label: lang.label_recent_updates,
            ),
            NavigationBarItem(
              selectedIcon: const Icon(CupertinoIcons.clock_solid),
              icon: const Icon(CupertinoIcons.clock),
              label: lang.label_recent_manga,
            ),
            NavigationBarItem(
              selectedIcon: const Icon(CupertinoIcons.compass_fill),
              icon: const Icon(CupertinoIcons.compass),
              label: lang.browse,
            ),
            NavigationBarItem(
              selectedIcon: Icon(Icons.adaptive.more),
              icon: Icon(Icons.adaptive.more_outlined),
              label: lang.label_more,
            ),
          ]
        : [
            NavigationBarItem(
              selectedIcon: const Icon(Icons.collections_bookmark),
              icon: const Icon(Icons.collections_bookmark_outlined),
              label: lang.label_library,
            ),
            NavigationBarItem(
              selectedIcon: const Icon(Icons.new_releases),
              icon: const Icon(Icons.new_releases_outlined),
              label: lang.label_recent_updates,
            ),
            NavigationBarItem(
              selectedIcon: const Icon(Icons.history),
              icon: const Icon(Icons.history_outlined),
              label: lang.label_recent_manga,
            ),
            NavigationBarItem(
              selectedIcon: const Icon(Icons.explore),
              icon: const Icon(Icons.explore_outlined),
              label: lang.browse,
            ),
            NavigationBarItem(
              selectedIcon: Icon(Icons.adaptive.more),
              icon: Icon(Icons.adaptive.more_outlined),
              label: lang.label_more,
            ),
          ];

    return AdaptiveNavigationBar(
      index: index,
      items: items,
      onSelect: onSelect,
    );
  }
}
