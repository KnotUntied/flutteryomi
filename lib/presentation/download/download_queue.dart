import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:flutteryomi/presentation/components/pill.dart';
import 'package:flutteryomi/presentation/screens/empty_screen.dart';

class DownloadQueueScreen extends StatelessWidget {
  const DownloadQueueScreen({super.key});

  static const downloadCount = 0;

  @override
  Widget build(BuildContext context) {
    final lang = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text(lang.label_download_queue),
            if (downloadCount > 0) Pill(text: downloadCount.toString()),
          ],
        ),
      ),
      body: downloadCount > 0
          ? ListView(children: const <Widget>[])
          : EmptyScreen(message: lang.information_no_downloads),
      floatingActionButton: downloadCount > 0
          ? FloatingActionButton.extended(
              label: Text(lang.action_pause),
              icon: const Icon(Icons.pause_outlined),
              onPressed: () {},
            )
          : null,
    );
  }
}
