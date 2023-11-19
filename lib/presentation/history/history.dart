import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HistoryTab extends StatelessWidget {
  const HistoryTab({super.key});

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
            IconButton(
              icon: const Icon(Icons.delete_sweep_outlined),
              onPressed: () => _askDeleteHistory(context),
            ),
          ],
        ),
        body: ListView(
          children: <Widget>[
            ListTile(
              leading: const Icon(Icons.download_outlined),
              title: Text(lang.label_download_queue),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _askDeleteHistory(BuildContext context) {
    final lang = AppLocalizations.of(context);
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog.adaptive(
          title: Text(lang.action_remove_everything),
          content: Text(lang.clear_history_confirmation),
          actions: <Widget>[
            TextButton(
              child: Text(lang.action_cancel),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text(lang.action_ok),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
