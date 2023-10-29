import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:flutteryomi/widgets/list_heading.dart';


class SourcesPage extends StatelessWidget {
  const SourcesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final lang = AppLocalizations.of(context);
    return ListView(
      children: <Widget>[
        ListHeading(lang.last_used_source),
        SourceTile(
          icon: Icons.directions,
          label: lang.version,
          language: "English",
        ),
      ],
    );
  }
}


class SourceTile extends StatelessWidget {
  const SourceTile({
    super.key,
    required this.icon,
    required this.label,
    required this.language,
  });

  final IconData? icon;
  final String label;
  final String language;

  @override
  Widget build(BuildContext context) {
    final lang = AppLocalizations.of(context);
    return ListTile(
      // secondary is extension/source's icon
      leading: Icon(icon),
      title: Text(label),
      subtitle: Text(language),
      trailing: Wrap(
        children: [
          TextButton(
            onPressed: () {  },
            child: Text(lang.latest),
          ),
          IconButton(
            icon: const Icon(Icons.push_pin_outlined),
            onPressed: () {  },
          ),
        ],
      ),
      onTap: () {  },
      onLongPress: () => _showSourceDialog(context),
    );
  }

  Future<void> _showSourceDialog(BuildContext context) {
    final lang = AppLocalizations.of(context);
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: Text(label),
          children: <SimpleDialogOption>[
            SimpleDialogOption(
              child: Text(lang.action_pin),
              onPressed: () { Navigator.of(context).pop(); },
            ),
            SimpleDialogOption(
              child: Text(lang.action_disable),
              onPressed: () { Navigator.of(context).pop(); },
            ),
          ],
        );
      },
    );
  }
}
