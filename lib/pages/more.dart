import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:flutteryomi/pages/about.dart';
import 'package:flutteryomi/pages/backup_and_restore.dart';
import 'package:flutteryomi/pages/statistics.dart';


class MorePage extends StatelessWidget {
  const MorePage({super.key});

  @override
  Widget build(BuildContext context) {
    final lang = AppLocalizations.of(context);
    return ListView(
      children: <Widget>[
        const SizedBox(
          height: 50,
          child: Center(child: Text('Logo here')),
        ),
        const Divider(),
        SwitchListTile(
          secondary: const Icon(Icons.cloud_off_outlined),
          title: Text(lang.label_downloaded_only),
          subtitle: Text(lang.downloaded_only_summary),
          value: true,
          onChanged: (bool? value) {},
        ),
        SwitchListTile(
          // glasses are somehow missing in Material Icons
          secondary: const Icon(Icons.visibility_off_outlined),
          title: Text(lang.pref_incognito_mode),
          subtitle: Text(lang.pref_incognito_mode_summary),
          value: true,
          onChanged: (bool? value) {},
        ),
        const Divider(),
        ListTile(
          leading: const Icon(Icons.download_outlined),
          title: Text(lang.label_download_queue),
        ),
        ListTile(
          leading: const Icon(Icons.label_outlined),
          title: Text(lang.categories),
        ),
        ListTile(
          leading: const Icon(Icons.query_stats_outlined),
          title: Text(lang.label_stats),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const StatisticsPage(),
              ),
            );
          },
        ),
        ListTile(
          leading: const Icon(Icons.settings_backup_restore_outlined),
          title: Text(lang.label_backup),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const BackupAndRestorePage(),
              ),
            );
          },
        ),
        const Divider(),
        ListTile(
          leading: const Icon(Icons.settings_outlined),
          title: Text(lang.label_settings),
        ),
        ListTile(
          leading: const Icon(Icons.info_outlined),
          title: Text(lang.pref_category_about),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const AboutPage(),
              ),
            );
          },
        ),
        ListTile(
          leading: const Icon(Icons.help_outline),
          title: Text(lang.label_help),
        ),
      ],
    );
  }
}
