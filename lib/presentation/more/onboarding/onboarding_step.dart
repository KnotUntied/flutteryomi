import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:flutteryomi/presentation/components/material/constants.dart';
import 'package:flutteryomi/presentation/screens/info_screen.dart';

class OnboardingStep extends StatelessWidget {
  const OnboardingStep({
    super.key,
    required this.acceptText,
    this.onAcceptClick,
    this.child,
  });

  final String acceptText;
  final VoidCallback? onAcceptClick;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    final lang = AppLocalizations.of(context);
    return InfoScreen(
      icon: Icons.rocket_launch_outlined,
      headingText: lang.onboarding_heading,
      subtitleText: lang.onboarding_description,
      acceptText: acceptText,
      onAcceptClick: onAcceptClick,
      children: [
        Container(
          color: Theme.of(context).colorScheme.surfaceContainerHighest,
          padding: const EdgeInsets.symmetric(vertical: MaterialPadding.small),
          child: child,
        ),
      ],
    );
  }
}