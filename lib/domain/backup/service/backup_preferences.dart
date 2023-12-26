import 'package:flutteryomi/core/preference/preference.dart';
import 'package:flutteryomi/core/preference/preference_store.dart';

class BackupPreferences {
  BackupPreferences(this.preferenceStore);
  final PreferenceStore preferenceStore;

  Preference<int> backupInterval() => preferenceStore.getInt(
        'backup_interval',
        defaultValue: 12,
      );
  Preference<int> lastAutoBackupTimestamp() => preferenceStore.getInt(
        Preference.appStateKey('last_auto_backup_timestamp'),
        defaultValue: 0,
      );
}
