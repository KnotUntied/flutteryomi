import 'package:flutter/material.dart';

import 'package:flutteryomi/presentation/more/settings/preference.dart';
import 'package:flutteryomi/presentation/more/settings/preference_screen.dart';

class PreferenceScaffold extends StatelessWidget {
  const PreferenceScaffold({
    super.key,
    required this.title,
    this.actions = const [],
    //this.onBackPressed,
    required this.itemsProvider,
  });

  final String title;
  final List<Widget> actions;
  //final VoidCallback? onBackPressed;
  final List<Preference> Function() itemsProvider;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions: actions,
      ),
      body: PreferenceScreen(items: itemsProvider()),
    );
  }
}
