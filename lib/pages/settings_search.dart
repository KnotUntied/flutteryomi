import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SettingsSearchPage extends StatelessWidget {
  const SettingsSearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    final lang = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(lang.pref_category_about),
      ),
      body: ListView(
        children: const <Widget>[
          //const SizedBox(
          //  height: 50,
          //  child: Center(child: Text('Logo here')),
          //),
          //ListTile(
          //  title: Text(lang.version),
          //  subtitle: const Text('placeholder version'),
          //  onTap: () {
          //    // Copy app and device info top clipboard
          //  },
          //),
          //ListTile(
          //  title: Text(lang.check_for_updates),
          //),
          //ListTile(
          //  title: Text(lang.whats_new),
          //),
          //ListTile(
          //  title: Text(lang.help_translate),
          //),
          //ListTile(
          //  title: Text(lang.licenses),
          //),
          //ListTile(
          //  title: Text(lang.privacy_policy),
          //),
        ],
      ),
    );
  }
}