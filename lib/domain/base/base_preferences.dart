import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:flutteryomi/core/preference/preference.dart';
import 'package:flutteryomi/core/preference/preference_store.dart';

part 'base_preferences.g.dart';

class BasePreferences {
  BasePreferences(this.preferenceStore);
  final PreferenceStore preferenceStore;

  Preference<bool> downloadedOnly() => preferenceStore.getBool(
      Preference.appStateKey("pref_downloaded_only"), false);

  Preference<bool> incognitoMode() => preferenceStore.getBool(
      Preference.appStateKey("incognito_mode"), false);

  Preference<bool> shownOnboardingFlow() => preferenceStore.getBool(
      Preference.appStateKey("onboarding_complete"), false);
}

@riverpod
BasePreferences basePreferences(BasePreferencesRef ref) =>
    BasePreferences(ref.watch(preferenceStoreProvider));
