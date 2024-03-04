import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class RadioMenuItem extends StatelessWidget {
  const RadioMenuItem({
    super.key,
    required this.text,
    required this.isChecked,
    required this.onClick,
  });

  final Widget text;
  final bool isChecked;
  final VoidCallback onClick;

  @override
  Widget build(BuildContext context) {
    final lang = AppLocalizations.of(context);
    return MenuItemButton(
      onPressed: onClick,
      trailingIcon: isChecked
          ? Icon(
              Icons.radio_button_checked_outlined,
              semanticLabel: lang.selected,
              color: Theme.of(context).colorScheme.primary,
            )
          : Icon(
              Icons.radio_button_unchecked_outlined,
              semanticLabel: lang.not_selected,
            ),
      child: text,
    );
  }
}
