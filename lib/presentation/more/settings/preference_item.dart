import 'package:dartx/dartx.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sprintf/sprintf.dart';

import 'package:flutteryomi/data/track/tracker.dart';
import 'package:flutteryomi/domain/track/service/track_preferences.dart';
import 'package:flutteryomi/presentation/more/settings/preference.dart' as d;
import 'package:flutteryomi/presentation/more/settings/widget/info_widget.dart';
import 'package:flutteryomi/presentation/more/settings/widget/text_preference_widget.dart';

const localPreferenceHighlighted = false;
const localPreferenceMinHeight = 56.0;

class StatusWrapper extends StatelessWidget {
  const StatusWrapper({
    super.key,
    required this.item,
    this.highlightKey,
    required this.child,
  });

  final d.PreferenceItem item;
  final String? highlightKey;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    //TODO: Animated visibility, not sure if Flutter has it
    return Container(child: child);
  }
}

class PreferenceItem extends ConsumerWidget {
  const PreferenceItem({
    super.key,
    required this.item,
    this.highlightKey,
  });

  final d.PreferenceItem item;
  final String? highlightKey;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    switch (item) {
      case d.SwitchPreference():
        final dItem = item as d.SwitchPreference;
        final value = dItem.pref.get();
        return SwitchPreferenceWidget(
          title: dItem.title,
          subtitle: dItem.subtitle,
          icon: dItem.icon,
          checked: value,
          onCheckedChanged: (newValue) async {
            if (await dItem.onValueChanged(newValue)) {
              dItem.pref.set(newValue);
            }
          },
        );
      case d.SliderPreference():
        final dItem = item as d.SliderPreference;
        return SliderPreferenceWidget(
          label: dItem.title,
          min: dItem.min,
          max: dItem.max,
          value: dItem.value,
          valueText: dItem.subtitle.isNullOrEmpty
              ? dItem.value.toString()
              : dItem.subtitle,
          onChange: (it) => item.onValueChanged(it),
        );
      case d.ListPreference():
        final dItem = item as d.ListPreference;
        final value = dItem.pref.get();
        return ListPreferenceWidget(
          value: value,
          title: dItem.title,
          subtitle: dItem.internalSubtitleProvider(value, dItem.entries),
          icon: dItem.icon,
          entries: dItem.entries,
          onValueChange: (newValue) async {
            if (await dItem.internalOnValueChanged(newValue!)) {
              dItem.internalSet(newValue);
            }
          },
        );
      case d.BasicListPreference():
        final dItem = item as d.BasicListPreference;
        return ListPreferenceWidget(
          value: dItem.value,
          title: dItem.title,
          subtitle: dItem.subtitleProvider(dItem, dItem.value, dItem.entries),
          icon: dItem.icon,
          entries: dItem.entries,
          onValueChange: (it) => dItem.onValueChanged(it),
        );
      case d.MultiSelectListPreference():
        final dItem = item as d.MultiSelectListPreference;
        final values = dItem.pref.get();
        return MultiSelectListPreferenceWidget(
          preference: dItem,
          values: values,
          onValuesChange: (newValues) async {
            if (await dItem.onValueChanged(newValues)) {
              dItem.pref.set(newValues.toSet());
            }
          },
        );
      case d.TextPreference():
        final dItem = item as d.TextPreference;
        return TextPreferenceWidget(
          title: dItem.title,
          subtitle: dItem.subtitle,
          icon: dItem.icon,
          onPreferenceClick: dItem.onClick,
        );
      case d.EditTextPreference():
        final dItem = item as d.EditTextPreference;
        final values = dItem.pref.get();
        return EditTextPreferenceWidget(
          title: dItem.title,
          subtitle: dItem.subtitle,
          icon: dItem.icon,
          value: values,
          onConfirm: (it) async {
            final accepted = await dItem.onValueChanged(it);
            if (accepted) dItem.pref.set(it);
            return accepted;
          },
        );
      case d.TrackerPreference():
        final trackPreferences = ref.watch(trackPreferencesProvider);
        final dItem = item as d.TrackerPreference;
        final uName = trackPreferences.trackUsername(dItem.tracker).get();
        return TrackingPreferenceWidget(
          tracker: dItem.tracker,
          checked: uName.isNotEmpty,
          onClick: dItem.tracker.isLoggedIn ? dItem.logout : dItem.login,
        );
      case d.InfoPreference():
        // TODO: Handle this case.
        final dItem = item as d.InfoPreference;
        return InfoWidget(text: item.title);
      case d.CustomPreference():
        // TODO: Handle this case.
        final dItem = item as d.CustomPreference;
        return dItem.content ?? const SizedBox.shrink();
    }
  }
}
