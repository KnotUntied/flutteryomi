import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:flutteryomi/presentation/components/badges.dart' as badges;

class DownloadsBadge extends StatelessWidget {
  const DownloadsBadge({super.key, required this.count});

  final int count;

  @override
  Widget build(BuildContext context) {
    if (count > 0) {
      return badges.Badge(
        text: count.toString(),
        color: Theme.of(context).colorScheme.tertiary,
        textColor: Theme.of(context).colorScheme.onTertiary,
      );
    }
    return const SizedBox.shrink();
  }
}

class UnreadBadge extends StatelessWidget {
  const UnreadBadge({super.key, required this.count});

  final int count;

  @override
  Widget build(BuildContext context) {
    if (count > 0) return badges.Badge(text: count.toString());
    return const SizedBox.shrink();
  }
}

class LanguageBadge extends StatelessWidget {
  const LanguageBadge({
    super.key,
    required this.isLocal,
    required this.sourceLanguage,
  });

  final bool isLocal;
  final String sourceLanguage;

  @override
  Widget build(BuildContext context) {
    final lang = AppLocalizations.of(context);
    if (isLocal) {
      return badges.IconBadge(
        iconData: Icons.folder_outlined,
        color: Theme.of(context).colorScheme.tertiary,
        iconColor: Theme.of(context).colorScheme.onTertiary,
      );
    } else if (sourceLanguage.isNotEmpty) {
      return badges.Badge(
        text: sourceLanguage.toUpperCase(),
        color: Theme.of(context).colorScheme.tertiary,
        textColor: Theme.of(context).colorScheme.onTertiary,
      );
    }
    return const SizedBox.shrink();
  }
}
