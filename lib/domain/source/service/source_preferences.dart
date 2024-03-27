import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:flutteryomi/core/preference/preference.dart';
import 'package:flutteryomi/core/preference/preference_store.dart';
import 'package:flutteryomi/core/util/system/locale_helper.dart';
import 'package:flutteryomi/domain/library/model/library_display_mode.dart';
import 'package:flutteryomi/domain/source/interactor/set_migrate_sorting.dart';

part 'source_preferences.g.dart';

class SourcePreferences {
  SourcePreferences(this.preferenceStore);
  final PreferenceStore preferenceStore;

  Preference<LibraryDisplayMode> sourceDisplayMode() => preferenceStore.getObject(
        "pref_display_mode_catalogue",
        LibraryDisplayMode.default_,
        LibraryDisplayMode.serializer,
        LibraryDisplayMode.deserialize,
      );

  Preference<Set<String>> enabledLanguages() =>
      preferenceStore.getStringSet("source_languages", LocaleHelper.getDefaultEnabledLanguages());

  Preference<Set<String>> disabledSources() =>
      preferenceStore.getStringSet("hidden_catalogues", {});

  Preference<Set<String>> pinnedSources() =>
      preferenceStore.getStringSet("pinned_catalogues", {});

  Preference<int> lastUsedSource() =>
      preferenceStore.getInt(Preference.appStateKey("last_catalogue_source"), -1);

  Preference<bool> showNsfwSource() =>
      preferenceStore.getBool("show_nsfw_source", true);

  Preference<SetMigrateSortingMode> migrationSortingMode() => preferenceStore.getEnum(
      "pref_migration_sorting", SetMigrateSortingMode.alphabetical, SetMigrateSortingMode.values);

  Preference<SetMigrateSortingDirection> migrationSortingDirection() => preferenceStore.getEnum(
      "pref_migration_direction", SetMigrateSortingDirection.ascending, SetMigrateSortingDirection.values);

  Preference<bool> hideInLibraryItems() => preferenceStore.getBool("browse_hide_in_library_items", false);

  Preference<Set<String>> extensionRepos() => preferenceStore.getStringSet("extension_repos", {});

  Preference<int> extensionUpdatesCount() => preferenceStore.getInt("ext_updates_count", 0);

  Preference<Set<String>> trustedExtensions() => preferenceStore.getStringSet(
    Preference.appStateKey("trusted_extensions"),
    {},
  );
}

@riverpod
SourcePreferences sourcePreferences(SourcePreferencesRef ref) =>
    SourcePreferences(ref.watch(preferenceStoreProvider));
