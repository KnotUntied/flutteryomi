import 'package:collection/collection.dart';
import 'package:dartx/dartx.dart';
import 'package:flutter/widgets.dart';
import 'package:flutteryomi/presentation/more/settings/preference.dart';
import 'package:flutteryomi/presentation/more/settings/preference_item.dart' as p;

/// Preference Screen composable which contains a list of [Preference] items
/// to be displayed on the preference screen.
///
/// An item can be a single [PreferenceItem] or a group ([PreferenceGroup]).
class PreferenceScreen extends StatelessWidget {
  const PreferenceScreen({super.key, required this.items});

  final List<Preference> items;

  // TODO: Highlight selected result from search

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: items.mapIndexed((i, preference) {
        switch (preference) {
          case PreferenceGroup():
            if (preference.enabled) {
              return <Widget>[
                PreferenceGroupHeader(title: preference.title),
                p.PreferenceItem(
                  item: preference,
                  highlightKey: highlightKey,
                ),
                if (i < items.length - 1) const SizedBox(height: 12.0),
              ];
            }
          case PreferenceItem():
            return p.PreferenceItem(
              item: preference,
              highlightKey: highlightKey,
            );
        }
      }).flattened.toList(),
    );
  }
}