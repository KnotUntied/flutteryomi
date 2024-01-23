import 'package:flutter/material.dart';

import 'package:flutteryomi/presentation/components/app_bar.dart';

class TabContent {
  TabContent({
    required this.title,
    this.badgeNumber,
    this.searchEnabled = false,
    this.actions = const [],
    required this.content,
  });

  final String title;
  final int? badgeNumber;
  final bool searchEnabled;
  final List<AppBarAction> actions;
  final Widget content;
}
