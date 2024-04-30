import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';

//TODO
class AppLanguageScreen extends StatelessWidget {
  const AppLanguageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final lang = AppLocalizations.of(context);
    const locales = AppLocalizations.supportedLocales;
    final currentLanguage = Intl.getCurrentLocale();
    return Scaffold(
      appBar: AppBar(
        title: Text(lang.pref_app_language),
      ),
      body: ListView.builder(
        itemCount: locales.length,
        itemBuilder: (context, index) {
          final locale = locales[index];
          return ListTile(
            onTap: () {},
            title: const Text('Default'),
            subtitle: const Text('Localized Display name'),
            trailing: Icon(
              Icons.check,
              color: Theme.of(context).colorScheme.primary,
            ),
          );
        },
      ),
    );
  }
}
