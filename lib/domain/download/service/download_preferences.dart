import 'package:flutteryomi/core/preference/preference.dart';
import 'package:flutteryomi/core/preference/preference_store.dart';

class DownloadPreferences {
  DownloadPreferences(this.preferenceStore);
  final PreferenceStore preferenceStore;

  Preference<bool> downloadOnlyOverWifi() => preferenceStore.getBool(
        'pref_download_only_over_wifi_key',
        defaultValue: true,
      );
  Preference<bool> saveChaptersAsCBZ() =>
      preferenceStore.getBool("save_chapter_as_cbz", defaultValue: true);

  Preference<bool> splitTallImages() =>
      preferenceStore.getBool("split_tall_images", defaultValue: false);

  Preference<int> autoDownloadWhileReading() =>
      preferenceStore.getInt("auto_download_while_reading", defaultValue: 0);

  Preference<int> removeAfterReadSlots() =>
      preferenceStore.getInt("remove_after_read_slots", defaultValue: -1);

  Preference<bool> removeAfterMarkedAsRead() => preferenceStore.getBool(
        "pref_remove_after_marked_as_read_key",
        defaultValue: false,
      );

  Preference<bool> removeBookmarkedChapters() =>
      preferenceStore.getBool("pref_remove_bookmarked", defaultValue: false);

  Preference<Set<String>> removeExcludeCategories() =>
      preferenceStore.getStringSet(
        "remove_exclude_categories",
        defaultValue: <String>{},
      );

  Preference<bool> downloadNewChapters() =>
      preferenceStore.getBool("download_new", defaultValue: false);

  Preference<Set<String>> downloadNewChapterCategories() =>
      preferenceStore.getStringSet(
        "download_new_categories",
        defaultValue: <String>{},
      );

  Preference<Set<String>> downloadNewChapterCategoriesExclude() =>
      preferenceStore.getStringSet(
        "download_new_categories_exclude",
        defaultValue: <String>{},
      );
}
