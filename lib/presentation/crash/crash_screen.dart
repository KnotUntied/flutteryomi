import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:flutteryomi/presentation/components/material/constants.dart';
import 'package:flutteryomi/presentation/screens/info_screen.dart';

class CrashScreen extends StatelessWidget {
  const CrashScreen({
    super.key,
    this.exception,
    required this.onRestartClick,
  });

  final Exception? exception;
  final VoidCallback onRestartClick;

  @override
  Widget build(BuildContext context) {
    final lang = AppLocalizations.of(context);
    return InfoScreen(
      icon: Icons.bug_report_outlined,
      headingText: lang.crash_screen_title,
      subtitleText: lang.crash_screen_description(lang.app_name),
      acceptText: lang.pref_dump_crash_logs,
      //TODO
      onAcceptClick: () {},
      rejectText: lang.crash_screen_restart_application,
      //TODO
      onRejectClick: onRestartClick,
      children: [
        Container(
          color: Theme.of(context).colorScheme.surfaceVariant,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(MaterialCorner.small),
          ),
          padding: const EdgeInsets.symmetric(vertical: MaterialPadding.small),
          child: Padding(
            padding: const EdgeInsets.all(MaterialPadding.small),
            child: Text(
              exception.toString(),
              style: TextStyle(
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
