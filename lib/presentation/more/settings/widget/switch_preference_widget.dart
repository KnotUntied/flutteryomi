import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:flutteryomi/presentation/more/settings/widget/base_preference_widget.dart';
import 'package:flutteryomi/presentation/more/settings/widget/text_preference_widget.dart';

class SwitchPreferenceWidget extends StatelessWidget {
  const SwitchPreferenceWidget({
    super.key,
    required this.title,
    this.subtitle,
    this.icon,
    this.checked = false,
    required this.onCheckedChanged,
  });

  final String title;
  final String? subtitle;
  final IconData? icon;
  final bool checked;
  final ValueChanged<bool> onCheckedChanged;

  @override
  Widget build(BuildContext context) {
    return TextPreferenceWidget(
      title: title,
      subtitle: subtitle,
      icon: icon,
      widget: Padding(
        padding: const EdgeInsetsDirectional.only(start: trailingWidgetBuffer),
        child: Switch.adaptive(value: checked, onChanged: null),
      ),
      onPreferenceClick: () => onCheckedChanged(!checked),
    );
  }
}
