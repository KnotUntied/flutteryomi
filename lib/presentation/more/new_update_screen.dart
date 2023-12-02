import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

import 'package:flutteryomi/presentation/screens/info_screen.dart';

class NewUpdateScreen extends StatelessWidget {
  const NewUpdateScreen({
    super.key,
    required this.versionName,
    required this.changelogInfo,
    required this.onOpenInBrowser,
    required this.onAcceptUpdate,
    required this.onRejectUpdate,
  });

  final String versionName;
  final String changelogInfo;
  final VoidCallback onOpenInBrowser;
  final VoidCallback onAcceptUpdate;
  final VoidCallback onRejectUpdate;

  @override
  Widget build(BuildContext context) {
    final lang = AppLocalizations.of(context);
    return InfoScreen(
      icon: Icons.new_releases_outlined,
      headingText: lang.update_check_notification_update_available,
      subtitleText: versionName,
      acceptText: lang.update_check_confirm,
      onAcceptClick: onAcceptUpdate,
      rejectText: lang.action_not_now,
      onRejectClick: onRejectUpdate,
      content: [
        Markdown(data: changelogInfo),
        TextButton(
          onPressed: onOpenInBrowser,
          child: Row(
            children: [
              Text(lang.update_check_open),
              const SizedBox.square(dimension: 4.0),
              const Icon(Icons.open_in_new_outlined),
            ],
          ),
        ),
      ],
    );
  }
}
