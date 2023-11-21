import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NavigationBarItem {
  final String label;
  final Icon icon;
  final Icon? selectedIcon;
  final String? tooltip;

  const NavigationBarItem({
    required this.icon,
    required this.label,
    this.selectedIcon,
    this.tooltip,
  });
}

class AdaptiveNavigationBar extends StatelessWidget {
  const AdaptiveNavigationBar({
    super.key,
    required this.index,
    required this.items,
    this.onSelect,
  });

  final int index;
  final List<NavigationBarItem> items;
  final ValueChanged<int>? onSelect;

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoTabBar(
            currentIndex: index,
            onTap: onSelect,
            items: items
                .map(
                  (item) => BottomNavigationBarItem(
                    activeIcon: item.selectedIcon,
                    icon: item.icon,
                    label: item.label,
                    tooltip: item.tooltip,
                  ),
                )
                .toList(),
          )
        : NavigationBar(
            onDestinationSelected: onSelect,
            selectedIndex: index,
            destinations: items
                .map(
                  (item) => NavigationDestination(
                    selectedIcon: item.selectedIcon,
                    icon: item.icon,
                    label: item.label,
                    tooltip: item.tooltip,
                  ),
                )
                .toList(),
          );
  }
}
