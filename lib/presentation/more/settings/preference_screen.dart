import 'package:collection/collection.dart';
import 'package:dartx/dartx.dart';
import 'package:flutter/widgets.dart';

import 'package:flutteryomi/presentation/more/settings/preference.dart';
import 'package:flutteryomi/presentation/more/settings/preference_item.dart'
    as p;
import 'package:flutteryomi/presentation/more/settings/widget/preference_group_header.dart';

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
      children: items
          .mapIndexed((i, preference) {
            switch (preference) {
              case PreferenceGroup():
                if (preference.enabled) {
                  return [
                    PreferenceGroupHeader(title: preference.title),
                    ...preference.preferenceItems.map((item) {
                      return p.PreferenceItem(
                        item: item,
                        //highlightKey: highlightKey,
                      );
                    }),
                    if (i < items.length - 1) const SizedBox(height: 12.0),
                  ];
                } else {
                  return const <Widget>[];
                }
              case PreferenceItem():
                return <Widget>[
                  p.PreferenceItem(
                    item: preference,
                    //highlightKey: highlightKey,
                  ),
                ];
            }
          })
          .flattened
          .toList(),
    );
  }
}

extension _PreferenceListFindHighlightedIndex on List<Preference> {
  int findHighlightedIndex(String highlightKey) =>
      flatMap((it) => it is PreferenceGroup
          ? [
              null, // Header
              ...it.preferenceItems.map((groupItem) => groupItem.title),
              null, // Spacer
            ]
          : [it.title]).toList().indexWhere((it) => it == highlightKey);
}
