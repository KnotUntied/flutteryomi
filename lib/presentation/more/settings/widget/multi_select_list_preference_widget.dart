import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:flutteryomi/presentation/more/settings/preference.dart';
import 'package:flutteryomi/presentation/more/settings/widget/text_preference_widget.dart';

class MultiSelectListPreferenceWidget<T> extends StatelessWidget {
  const MultiSelectListPreferenceWidget({
    super.key,
    required this.preference,
    required this.values,
    required this.onValuesChange,
  });

  final MultiSelectListPreference preference;
  final Set<String> values;
  final ValueChanged<Set<String>> onValuesChange;

  @override
  Widget build(BuildContext context) {
    return TextPreferenceWidget(
      title: preference.title,
      subtitle: preference.subtitleProvider(preference, context, values, preference.entries),
      icon: preference.icon,
      onPreferenceClick: () => showAdaptiveDialog(
        context: context,
        builder: (context) => _MultiSelectListPreferenceDialog(
          preference: preference,
          values: values,
          onValuesChange: onValuesChange,
        ),
      ),
    );
  }
}

class _MultiSelectListPreferenceDialog<T> extends StatefulWidget {
  const _MultiSelectListPreferenceDialog({
    super.key,
    required this.preference,
    required this.values,
    required this.onValuesChange,
  });

  final MultiSelectListPreference preference;
  final Set<String> values;
  final ValueChanged<Set<String>> onValuesChange;

  @override
  State<_MultiSelectListPreferenceDialog<T>> createState() => _MultiSelectListPreferenceDialogState<T>();
}

class _MultiSelectListPreferenceDialogState<T> extends State<_MultiSelectListPreferenceDialog<T>> {
  late final selected = widget.preference.entries.keys
          .where((it) => widget.values.contains(it))
          .toList();

  @override
  Widget build(BuildContext context) {
    final lang = AppLocalizations.of(context);
    final entriesList = widget.preference.entries.entries.toList();
    return AlertDialog.adaptive(
      title: Text(widget.preference.title),
      content: ListView.builder(
        itemCount: entriesList.length,
        itemBuilder: (context, index) {
          final current = entriesList[index];
          return CheckboxListTile(
            controlAffinity: ListTileControlAffinity.leading,
            title: Text(current.value),
            value: selected.contains(current.key),
            onChanged: (it) => it!
                ? selected.add(current.key)
                : selected.remove(current.key),
          );
        },
      ),
      actions: [
        TextButton(
          child: Text(lang.action_cancel),
          onPressed: () => Navigator.pop(context),
        ),
        TextButton(
          onPressed: () {
            Navigator.pop(context);
            widget.onValuesChange(selected.toSet());
          },
          child: Text(lang.action_ok),
        ),
      ],
    );
  }
}
