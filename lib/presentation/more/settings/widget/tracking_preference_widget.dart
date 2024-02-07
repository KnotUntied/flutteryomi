import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:flutteryomi/data/track/tracker.dart';
import 'package:flutteryomi/presentation/more/settings/widget/base_preference_widget.dart';
import 'package:flutteryomi/presentation/track/components/track_logo_icon.dart';

class TrackingPreferenceWidget extends StatelessWidget {
  const TrackingPreferenceWidget({
    super.key,
    required this.tracker,
    required this.checked,
    this.onClick,
  });

  final Tracker tracker;
  final bool checked;
  final VoidCallback? onClick;

  @override
  Widget build(BuildContext context) {
    final lang = AppLocalizations.of(context);
    return ListTile(
      leading: TrackLogoIcon(tracker: tracker),
      title: Text(
        tracker.name,
        style: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontSize: titleFontSize,
            ),
      ),
      trailing: checked
          ? Icon(
              Icons.done_outlined,
              size: 32.0,
              color: const Color(0xFF4CAF50),
              semanticLabel: lang.login_success,
            )
          : null,
      onTap: onClick,
    );
  }
}
