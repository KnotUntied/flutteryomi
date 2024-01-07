import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:flutteryomi/core/preference/preference.dart';
import 'package:flutteryomi/core/preference/preference_store.dart';

part 'download_preferences.g.dart';

class DownloadPreferences {
  DownloadPreferences(this.preferenceStore);
  final PreferenceStore preferenceStore;

  Preference<bool> downloadOnlyOverWifi() =>
      preferenceStore.getBool('pref_download_only_over_wifi_key', true);
  Preference<bool> saveChaptersAsCBZ() =>
      preferenceStore.getBool("save_chapter_as_cbz", true);

  Preference<bool> splitTallImages() =>
      preferenceStore.getBool("split_tall_images", false);

  Preference<int> autoDownloadWhileReading() =>
      preferenceStore.getInt("auto_download_while_reading", 0);

  Preference<int> removeAfterReadSlots() =>
      preferenceStore.getInt("remove_after_read_slots", -1);

  Preference<bool> removeAfterMarkedAsRead() =>
      preferenceStore.getBool("pref_remove_after_marked_as_read_key", false);

  Preference<bool> removeBookmarkedChapters() =>
      preferenceStore.getBool("pref_remove_bookmarked", false);

  Preference<Set<String>> removeExcludeCategories() =>
      preferenceStore.getStringSet("remove_exclude_categories", {});

  Preference<bool> downloadNewChapters() =>
      preferenceStore.getBool("download_new", false);

  Preference<Set<String>> downloadNewChapterCategories() =>
      preferenceStore.getStringSet("download_new_categories", {});

  Preference<Set<String>> downloadNewChapterCategoriesExclude() =>
      preferenceStore.getStringSet("download_new_categories_exclude", {});
}

@riverpod
DownloadPreferences downloadPreferences(DownloadPreferencesRef ref) =>
    DownloadPreferences(ref.watch(preferenceStoreProvider));
