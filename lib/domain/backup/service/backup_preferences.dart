import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:flutteryomi/core/preference/preference.dart';
import 'package:flutteryomi/core/preference/preference_store.dart';

part 'backup_preferences.g.dart';

class BackupPreferences {
  BackupPreferences(this.preferenceStore);
  final PreferenceStore preferenceStore;

  Preference<int> backupInterval() =>
      preferenceStore.getInt('backup_interval', 12);
  Preference<int> lastAutoBackupTimestamp() => preferenceStore.getInt(
        Preference.appStateKey('last_auto_backup_timestamp'),
        0
      );
}

@riverpod
BackupPreferences backupPreferences(BackupPreferencesRef ref) =>
    BackupPreferences(ref.watch(preferenceStoreProvider));
