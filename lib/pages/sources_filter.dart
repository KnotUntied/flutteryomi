import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SourcesFilterPage extends StatelessWidget {
  const SourcesFilterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final lang = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(lang.label_sources),
      ),
      body: ListView(
        children: <Widget>[
          SourceFilterTile(
            // secondary is extension/source's icon
            icon: Icons.directions,
            label: lang.version,
            value: false,
            onChanged: (bool? value) {  },
          ),
        ],
      ),
    );
  }
}


class SourceFilterTile extends StatelessWidget {
  const SourceFilterTile({
    super.key,
    this.icon,
    required this.label,
    required this.value,
    required this.onChanged,
  });

  final IconData? icon;
  final String label;
  final bool value;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile.adaptive(
      // secondary is extension/source's icon
      secondary: Icon(icon),
      title: Text(label),
      value: value,
      onChanged: (bool? newValue) {
        onChanged(newValue!);
      },
    );
  }
}