import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:flutteryomi/core/preference/preference.dart';
import 'package:flutteryomi/core/preference/preference_store.dart';
import 'package:flutteryomi/core/storage/folder_provider.dart';

part 'storage_preferences.g.dart';

class StoragePreferences {
  StoragePreferences(this.folderProvider, this.preferenceStore);
  final FolderProvider folderProvider;
  final PreferenceStore preferenceStore;

  Future<Preference<String>> baseStorageDirectory() async =>
      preferenceStore.getString(
        "pref_display_mode_library",
        await folderProvider.path() ?? '',
      );
}

@riverpod
StoragePreferences storagePreferences(StoragePreferencesRef ref) =>
    StoragePreferences(
      FolderProvider(),
      ref.watch(preferenceStoreProvider),
    );
