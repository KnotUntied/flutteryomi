import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:flutteryomi/presentation/more/settings/widget/text_preference_widget.dart';

class ListPreferenceWidget<T> extends StatelessWidget {
  const ListPreferenceWidget({
    super.key,
    required this.value,
    required this.title,
    this.subtitle,
    this.icon,
    required this.entries,
    required this.onValueChange,
  });

  final T value;
  final String title;
  final String? subtitle;
  final IconData? icon;
  final Map<T, String> entries;
  final ValueChanged<T> onValueChange;

  @override
  Widget build(BuildContext context) {
    return TextPreferenceWidget(
      title: title,
      subtitle: subtitle,
      icon: icon,
      onPreferenceClick: () => showAdaptiveDialog(
        context: context,
        builder: (context) => _ListPreferenceDialog(
          title: title,
          value: value,
          entries: entries,
          onValueChange: onValueChange,
        ),
      ),
    );
  }
}

class _ListPreferenceDialog<T> extends StatelessWidget {
  const _ListPreferenceDialog({
    super.key,
    required this.title,
    required this.value,
    required this.entries,
    required this.onValueChange,
  });

  final String title;
  final T value;
  final Map<T, String> entries;
  final ValueChanged<T> onValueChange;

  @override
  Widget build(BuildContext context) {
    final lang = AppLocalizations.of(context);
    final entriesList = entries.entries.toList();
    return AlertDialog.adaptive(
      title: Text(title),
      content: ListView.builder(
        itemCount: entriesList.length,
        itemBuilder: (context, index) {
          final current = entriesList[index];
          return RadioListTile.adaptive(
            controlAffinity: ListTileControlAffinity.leading,
            title: Text(current.value),
            value: current.key,
            groupValue: value,
            onChanged: (_) {
              Navigator.pop(context);
              onValueChange(current.key);
            },
          );
        },
      ),
      actions: [
        TextButton(
          child: Text(lang.action_cancel),
          onPressed: () => Navigator.pop(context),
        ),
      ],
    );
  }
}
