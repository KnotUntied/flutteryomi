import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:flutteryomi/pages/about.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final lang = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(lang.label_settings),
      ),
      body: ListView(
        children: <ListTile>[
          ListTile(
            leading: const Icon(Icons.tune_outlined),
            title: Text(lang.pref_category_general),
            subtitle: Text(lang.pref_general_summary),
          ),
          ListTile(
            leading: const Icon(Icons.palette_outlined),
            title: Text(lang.pref_category_appearance),
            subtitle: Text(lang.pref_appearance_summary),
          ),
          ListTile(
            leading: const Icon(Icons.collections_bookmark_outlined),
            title: Text(lang.pref_category_library),
            subtitle: Text(lang.pref_library_summary),
          ),
          ListTile(
            leading: const Icon(Icons.chrome_reader_mode_outlined),
            title: Text(lang.pref_category_reader),
            subtitle: Text(lang.pref_reader_summary),
          ),
          ListTile(
            leading: const Icon(Icons.download_outlined),
            title: Text(lang.pref_category_downloads),
            subtitle: Text(lang.pref_downloads_summary),
          ),
          ListTile(
            leading: const Icon(Icons.sync_outlined),
            title: Text(lang.pref_category_tracking),
            subtitle: Text(lang.pref_tracking_summary),
          ),
          ListTile(
            leading: const Icon(Icons.explore_outlined),
            title: Text(lang.browse),
            subtitle: Text(lang.pref_browse_summary),
          ),
          ListTile(
            leading: const Icon(Icons.settings_backup_restore_outlined),
            title: Text(lang.label_backup),
            subtitle: Text(lang.pref_backup_summary),
          ),
          ListTile(
            leading: const Icon(Icons.security_outlined),
            title: Text(lang.pref_category_security),
            subtitle: Text(lang.pref_security_summary),
          ),
          ListTile(
            leading: const Icon(Icons.code_outlined),
            title: Text(lang.pref_category_advanced),
            subtitle: Text(lang.pref_advanced_summary),
          ),
          ListTile(
            leading: const Icon(Icons.info_outlined),
            title: Text(lang.pref_category_about),
            subtitle: const Text("Placeholder version"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AboutPage(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
