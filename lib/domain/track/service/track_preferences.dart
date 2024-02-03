import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:flutteryomi/core/preference/preference.dart';
import 'package:flutteryomi/core/preference/preference_store.dart';
import 'package:flutteryomi/data/track/tracker.dart';

part 'track_preferences.g.dart';

// TODO: Support for flutter_secure_storage
class TrackPreferences {
  TrackPreferences(this.preferenceStore);
  final PreferenceStore preferenceStore;

  Preference<String> trackUsername(Tracker tracker) =>
      preferenceStore.getString(
          Preference.privateKey("pref_mangasync_username_${tracker.id}"), "");

  Preference<String> trackPassword(Tracker tracker) =>
      preferenceStore.getString(
          Preference.privateKey("pref_mangasync_password_${tracker.id}"), "");

  Preference<bool> trackAuthExpired(Tracker tracker) => preferenceStore.getBool(
      Preference.privateKey("pref_tracker_auth_expired_${tracker.id}"), false);

  void setCredentials(Tracker tracker, String username, String password) {
    trackUsername(tracker).set(username);
    trackPassword(tracker).set(password);
    trackAuthExpired(tracker).set(false);
  }

  Preference<String> trackToken(Tracker tracker) => preferenceStore.getString(
      Preference.privateKey("track_token_${tracker.id}"), "");

  //TODO
  Preference<String> anilistScoreType(Tracker tracker) =>
      preferenceStore.getString("anilist_score_type", "");

  Preference<bool> autoUpdateTrack() =>
      preferenceStore.getBool("pref_auto_update_manga_sync_key", true);
}

@riverpod
TrackPreferences trackPreferences(TrackPreferencesRef ref) =>
    TrackPreferences(ref.watch(preferenceStoreProvider));
