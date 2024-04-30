import 'package:flutter/widgets.dart';

import 'package:flutteryomi/presentation/more/settings/preference.dart';
import 'package:flutteryomi/presentation/more/settings/preference_scaffold.dart';

class SearchableSettings extends StatelessWidget {
  const SearchableSettings({
    super.key,
    required this.title,
    required this.getPreferences,
    this.actions = const [],
  });

  final String title;
  final List<Preference> Function() getPreferences;
  final List<Widget> actions;

  static String? highlightKey;

  @override
  Widget build(BuildContext context) {
    return PreferenceScaffold(
      title: title,
      actions: actions,
      itemsProvider: getPreferences,
    );
  }
}
