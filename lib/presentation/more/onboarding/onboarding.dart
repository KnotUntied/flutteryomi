import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutteryomi/domain/base/base_preferences.dart';
import 'package:flutteryomi/presentation/components/material/constants.dart';
import 'package:flutteryomi/presentation/screens/info_screen.dart';

//TODO
class OnboardingScreen extends ConsumerStatefulWidget {
  const OnboardingScreen({super.key});

  @override
  ConsumerState<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends ConsumerState<OnboardingScreen> {
  final steps = [
    //ThemeStep(),
    //StorageStep(),
    //PermissionStep(),
    //GuidesStep(onRestoreBackup: onRestoreBackup),
  ];
  int currentStep = 0;

  @override
  Widget build(BuildContext context) {
    final lang = AppLocalizations.of(context);
    final isLastStep = currentStep == steps.length - 1;
    final basePreferences = ref.watch(basePreferencesProvider);
    final shownOnboardingStream =
        basePreferences.shownOnboardingFlow().changes();
    return StreamBuilder<bool>(
      stream: shownOnboardingStream,
      builder: (context, snapshot) {
        final canPop = snapshot.data ?? false;
        return PopScope(
          canPop: canPop,
          child: InfoScreen(
            icon: Icons.rocket_launch_outlined,
            headingText: lang.onboarding_heading,
            subtitleText: lang.onboarding_description,
            acceptText: isLastStep
                ? lang.onboarding_action_finish
                : lang.onboarding_action_next,
            onAcceptClick: steps[currentStep].isComplete
                ? () {
                    if (isLastStep) {
                      Navigator.pop(context);
                      basePreferences.shownOnboardingFlow().set(true);
                    } else {
                      setState(() => currentStep++);
                    }
                  }
                : null,
            children: [
              Container(
                color: Theme.of(context).colorScheme.surfaceContainerHighest,
                padding: const EdgeInsets.symmetric(
                  vertical: MaterialPadding.small,
                ),
                child: steps[currentStep],
              ),
            ],
          ),
        );
      }
    );
  }
}
