import 'package:dartx/dartx_io.dart' hide IterableWhereNot;
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutteryomi/presentation/more/settings/preference.dart';
import 'package:flutteryomi/presentation/more/settings/screen/searchable_settings.dart';

//TODO
class SettingsSecurityScreen extends ConsumerWidget {
  const SettingsSecurityScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final lang = AppLocalizations.of(context);
    //final securityPreferences = ref.watch(securityPreferencesProvider);
    //final authSupported = remember { context.isAuthenticationSupported() }

    //final useAuthPref = securityPreferences.useAuthenticator();
    //final useAuth = useAuthPref.get();

    return SearchableSettings(
      title: lang.pref_category_security,
      getPreferences: () => [
        //SwitchPreference(
        //  pref: useAuthPref,
        //  title: lang.lock_with_biometrics,
        //  enabled: authSupported,
        //  onValueChanged: {
        //    (context as FragmentActivity).authenticate(
        //      title: context.lang.lock_with_biometrics,
        //    )
        //  },
        //),
        //ListPreference(
        //  pref: securityPreferences.lockAppAfter(),
        //  title: lang.lock_when_idle,
        //  enabled: authSupported && useAuth,
        //  entries: _lockAfterValues
        //      .associateWith((it) => switch (it) {
        //        -1 => lang.lock_never,
        //        0 => lang.lock_always,
        //        _ => lang.lock_after_mins(it),
        //      }),
        //  onValueChanged: {
        //    (context as FragmentActivity).authenticate(
        //      title: context.lang.lock_when_idle,
        //    )
        //  },
        //),
        //SwitchPreference(
        //  pref: securityPreferences.hideNotificationContent(),
        //  title: lang.hide_notification_content,
        //),
        //ListPreference(
        //  pref: securityPreferences.secureScreen(),
        //  title: lang.secure_screen,
        //  entries: SecurityPreferences.SecureScreenMode.entries
        //      .associateWith((it) => it.title(context)),
        //),
        InfoPreference(title: lang.secure_screen_summary),
      ],
    );
  }
}

const _lockAfterValues = [
  0, // Always
  1,
  2,
  5,
  10,
  -1, // Never
];
