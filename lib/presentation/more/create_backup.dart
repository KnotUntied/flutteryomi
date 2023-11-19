import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CreateBackupScreen extends StatelessWidget {
  const CreateBackupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final lang = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(lang.label_backup),
      ),
      body: ListView(
        children: <ListTile>[
          ListTile(
            title: Text(lang.pref_create_backup),
            subtitle: Text(lang.pref_create_backup_summ),
            onTap: () {},
          ),
          ListTile(
            title: Text(lang.pref_restore_backup),
            subtitle: Text(lang.pref_restore_backup_summ),
            onTap: () {},
          ),
          ListTile(
            title: Text(lang.pref_backup_service_category),
          ),
          ListTile(
            title: Text(lang.pref_backup_interval),
            subtitle: const Text('Daily'),
            onTap: () {},
          ),
          ListTile(
            title: Text(lang.pref_backup_directory),
            subtitle: const Text('location'),
            onTap: () {},
          ),
          ListTile(
            title: Text(lang.pref_backup_slots),
            subtitle: const Text('2'),
            onTap: () {},
          ),
          const ListTile(
            leading: Icon(Icons.info_outlined),
          ),
          ListTile(
            subtitle: Text(lang.backup_info),
          ),
        ],
      ),
    );
  }
}
