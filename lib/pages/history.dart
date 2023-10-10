import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final lang = AppLocalizations.of(context);
    return DefaultTabController(
      length: 1,
      child: Scaffold(
        appBar: AppBar(
          title: Text(lang.history),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.refresh),
              onPressed: () {},
            ),
          ],
          bottom: TabBar(
            isScrollable: true,
            tabAlignment: TabAlignment.start,
            tabs: <Widget>[
              Tab(text: lang.label_default),
            ],
          ),
        ),
        body: ListView(
          children: <Widget>[
            Container(
              height: 50,
              child: const Center(child: Text('Logo here')),
            ),
            const Divider(),
            SwitchListTile(
              secondary: const Icon(Icons.cloud_off_outlined),
              title: Text(lang.label_downloaded_only),
              subtitle: Text(lang.downloaded_only_summary),
              value: true,
              onChanged: (bool? value) { },
            ),
            SwitchListTile(
              // glasses are somehow missing in Material Icons
              secondary: const Icon(Icons.visibility_off_outlined),
              title: Text(lang.pref_incognito_mode),
              subtitle: Text(lang.pref_incognito_mode_summary),
              value: true,
              onChanged: (bool? value) { },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.download_outlined),
              title: Text(lang.label_download_queue),
            ),
          ],
        ),
      ),
    );
  }
}