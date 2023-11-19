import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:flutteryomi/presentation/more/settings/screen/about/about.dart';
import 'package:flutteryomi/presentation/more/create_backup.dart';
import 'package:flutteryomi/presentation/category/category.dart';
import 'package:flutteryomi/presentation/download/download_queue.dart';
import 'package:flutteryomi/presentation/more/stats/stats.dart';

final Uri helpUrl = Uri.parse('https://github.com/KnotUntied/flutteryomi');

class MoreTab extends StatelessWidget {
  const MoreTab({super.key});

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
        SwitchListTile.adaptive(
          secondary: const Icon(Icons.cloud_off_outlined),
          title: Text(lang.label_downloaded_only),
          subtitle: Text(lang.downloaded_only_summary),
          value: true,
          onChanged: (bool? value) {},
        ),
        SwitchListTile.adaptive(
          // glasses are somehow missing in Material Icons
          // Tachiyomi uses custom icon
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
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const DownloadQueueScreen(),
              ),
            );
          },
        ),
        ListTile(
          leading: const Icon(Icons.label_outlined),
          title: Text(lang.categories),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const CategoryScreen(),
              ),
            );
          },
        ),
        ListTile(
          leading: const Icon(Icons.query_stats_outlined),
          title: Text(lang.label_stats),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const StatsScreen(),
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
                builder: (context) => const CreateBackupScreen(),
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
                builder: (context) => const AboutScreen(),
              ),
            );
          },
        ),
        ListTile(
          leading: const Icon(Icons.help_outline),
          title: Text(lang.label_help),
          onTap: _launchHelpUrl,
        ),
      ],
    );
  }
}

Future<void> _launchHelpUrl() async {
  if (!await launchUrl(helpUrl)) {
    throw Exception('Could not open $helpUrl');
  }
}
