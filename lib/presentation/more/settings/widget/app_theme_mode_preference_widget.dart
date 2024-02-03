import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';

import 'package:flutteryomi/presentation/more/settings/widget/base_preference_widget.dart';

class AppThemeModePreferenceWidget extends StatelessWidget {
  const AppThemeModePreferenceWidget({
    super.key,
    required this.value,
    required this.onItemClick,
  });

  final ThemeMode value;
  final ValueChanged<ThemeMode> onItemClick;

  @override
  Widget build(BuildContext context) {
    final lang = AppLocalizations.of(context);
    final options = {
      ThemeMode.system: lang.theme_system,
      ThemeMode.light: lang.theme_light,
      ThemeMode.dark: lang.theme_dark,
    };
    return BasePreferenceWidget(
      subcomponent: Expanded(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: prefsHorizontalPadding,
          ),
          child: SegmentedButton(
            segments: options.entries.map((e) {
              return ButtonSegment(
                value: e.key,
                label: Text(e.value),
              );
            }).toList(),
            selected: {value},
            onSelectionChanged: (newSelection) =>
                onItemClick(newSelection.first),
          ),
        ),
      ),
    );
  }
}
