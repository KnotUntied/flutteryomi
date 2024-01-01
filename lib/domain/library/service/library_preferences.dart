import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:flutteryomi/core/preference/preference.dart';
import 'package:flutteryomi/core/preference/preference_store.dart';
import 'package:flutteryomi/core/preference/tri_state.dart';
import 'package:flutteryomi/domain/library/model/library_display_mode.dart';
import 'package:flutteryomi/domain/library/model/library_sort_mode.dart';
import 'package:flutteryomi/domain/manga/model/manga.dart';

part 'library_preferences.g.dart';

class LibraryPreferences {
  LibraryPreferences(this.preferenceStore);
  final PreferenceStore preferenceStore;

  Preference<LibraryDisplayMode> displayMode() => preferenceStore.getObject(
        "pref_display_mode_library",
        LibraryDisplayMode.default_,
        LibraryDisplayMode.serializer,
        LibraryDisplayMode.deserialize,
      );

  Preference<LibrarySort> sortingMode() => preferenceStore.getObject(
        "library_sorting_mode",
        LibrarySort.default_,
        LibrarySort.serializer,
        LibrarySort.deserialize,
      );

  Preference<int> portraitColumns() =>
      preferenceStore.getInt("pref_library_columns_portrait_key", 0);

  Preference<int> landscapeColumns() =>
      preferenceStore.getInt("pref_library_columns_landscape_key", 0);

  Preference<int> lastUpdatedTimestamp() => preferenceStore.getInt(
        Preference.appStateKey("library_update_last_timestamp"),
        0,
      );
  Preference<int> autoUpdateInterval() =>
      preferenceStore.getInt("pref_library_update_interval_key", 0);

  Preference<Set<String>> autoUpdateDeviceRestrictions() => preferenceStore
      .getStringSet("library_update_restriction", {deviceOnlyOnWifi});
  Preference<Set<String>> autoUpdateMangaRestrictions() =>
      preferenceStore.getStringSet(
        "library_update_manga_restriction",
        {
          mangaHasUnread,
          mangaNonCompleted,
          mangaNonRead,
          mangaOutsideReleasePeriod,
        },
      );

  Preference<bool> autoUpdateMetadata() =>
      preferenceStore.getBool("auto_update_metadata", false);

  Preference<bool> showContinueReadingButton() =>
      preferenceStore.getBool("display_continue_reading_button", false);

  // region Filter

  Preference<TriState> filterDownloaded() => preferenceStore.getEnum(
      "pref_filter_library_downloaded", TriState.disabled, TriState.values);

  Preference<TriState> filterUnread() => preferenceStore.getEnum(
      "pref_filter_library_unread", TriState.disabled, TriState.values);

  Preference<TriState> filterStarted() => preferenceStore.getEnum(
      "pref_filter_library_started", TriState.disabled, TriState.values);

  Preference<TriState> filterBookmarked() => preferenceStore.getEnum(
      "pref_filter_library_bookmarked", TriState.disabled, TriState.values);

  Preference<TriState> filterCompleted() => preferenceStore.getEnum(
        "pref_filter_library_completed",
        TriState.disabled,
        TriState.values,
      );

  Preference<TriState> filterIntervalCustom() => preferenceStore.getEnum(
        "pref_filter_library_interval_custom",
        TriState.disabled,
        TriState.values,
      );

  Preference<TriState> filterIntervalLong() => preferenceStore.getEnum(
        "pref_filter_library_interval_long",
        TriState.disabled,
        TriState.values,
      );

  Preference<TriState> filterIntervalLate() => preferenceStore.getEnum(
        "pref_filter_library_interval_late",
        TriState.disabled,
        TriState.values,
      );

  Preference<TriState> filterIntervalDropped() => preferenceStore.getEnum(
        "pref_filter_library_interval_dropped",
        TriState.disabled,
        TriState.values,
      );

  Preference<TriState> filterIntervalPassed() => preferenceStore.getEnum(
        "pref_filter_library_interval_passed",
        TriState.disabled,
        TriState.values,
      );

  Preference<TriState> filterTracking(int id) => preferenceStore.getEnum(
        "pref_filter_library_tracked_$id",
        TriState.disabled,
        TriState.values,
      );

  // endregion

  // region Badges

  Preference<bool> downloadBadge() =>
      preferenceStore.getBool("display_download_badge", false);

  Preference<bool> localBadge() =>
      preferenceStore.getBool("display_local_badge", true);

  Preference<bool> languageBadge() =>
      preferenceStore.getBool("display_language_badge", false);

  Preference<bool> newShowUpdatesCount() =>
      preferenceStore.getBool("library_show_updates_count", true);
  Preference<int> newUpdatesCount() => preferenceStore.getInt(
        Preference.appStateKey("library_unseen_updates_count"),
        0,
      );

  // endregion

  // region Category

  Preference<int> defaultCategory() =>
      preferenceStore.getInt("default_category", -1);

  Preference<int> lastUsedCategory() => preferenceStore.getInt(
        Preference.appStateKey("last_used_category"),
        0,
      );

  Preference<bool> categoryTabs() =>
      preferenceStore.getBool("display_category_tabs", true);

  Preference<bool> categoryNumberOfItems() =>
      preferenceStore.getBool("display_number_of_items", false);

  Preference<bool> categorizedDisplaySettings() =>
      preferenceStore.getBool("categorized_display", false);

  Preference<Set<String>> updateCategories() =>
      preferenceStore.getStringSet("library_update_categories", {});

  Preference<Set<String>> updateCategoriesExclude() =>
      preferenceStore.getStringSet("library_update_categories_exclude", {});

  // endregion

  // region Chapter

  Preference<int> filterChapterByRead() => preferenceStore.getInt(
        "default_chapter_filter_by_read",
        MangaUtils.showAll,
      );

  Preference<int> filterChapterByDownloaded() => preferenceStore.getInt(
        "default_chapter_filter_by_downloaded",
        MangaUtils.showAll,
      );

  Preference<int> filterChapterByBookmarked() => preferenceStore.getInt(
        "default_chapter_filter_by_bookmarked",
        MangaUtils.showAll,
      );

  // and upload date
  Preference<int> sortChapterBySourceOrNumber() => preferenceStore.getInt(
        "default_chapter_sort_by_source_or_number",
        MangaUtils.chapterSortingSource,
      );

  Preference<int> displayChapterByNameOrNumber() => preferenceStore.getInt(
        "default_chapter_display_by_name_or_number",
        MangaUtils.chapterDisplayName,
      );

  Preference<int> sortChapterByAscendingOrDescending() =>
      preferenceStore.getInt(
        "default_chapter_sort_by_ascending_or_descending",
        MangaUtils.chapterSortDesc,
      );

  void setChapterSettingsDefault(Manga manga) {
    filterChapterByRead().set(manga.unreadFilterRaw);
    filterChapterByDownloaded().set(manga.downloadedFilterRaw);
    filterChapterByBookmarked().set(manga.bookmarkedFilterRaw);
    sortChapterBySourceOrNumber().set(manga.sorting);
    displayChapterByNameOrNumber().set(manga.displayMode);
    sortChapterByAscendingOrDescending().set(
      manga.sortDescending()
          ? MangaUtils.chapterSortDesc
          : MangaUtils.chapterSortAsc,
    );
  }

  Preference<bool> autoClearChapterCache() =>
      preferenceStore.getBool("auto_clear_chapter_cache", false);

  // endregion

  // region Swipe Actions

  Preference<ChapterSwipeAction> swipeToStartAction() =>
      preferenceStore.getEnum(
        "pref_chapter_swipe_end_action",
        ChapterSwipeAction.toggleBookmark,
        ChapterSwipeAction.values,
      );

  Preference<ChapterSwipeAction> swipeToEndAction() => preferenceStore.getEnum(
        "pref_chapter_swipe_start_action",
        ChapterSwipeAction.toggleRead,
        ChapterSwipeAction.values,
      );

  // endregion

  static const deviceOnlyOnWifi = "wifi";
  static const deviceNetworkNotMetered = "network_not_metered";
  static const deviceCharging = "ac";

  static const mangaNonCompleted = "manga_ongoing";
  static const mangaHasUnread = "manga_fully_read";
  static const mangaNonRead = "manga_started";
  static const mangaOutsideReleasePeriod = "manga_outside_release_period";
}

enum ChapterSwipeAction {
  toggleRead,
  toggleBookmark,
  download,
  disabled,
}

@riverpod
LibraryPreferences libraryPreferences(LibraryPreferencesRef ref) =>
    LibraryPreferences(ref.watch(preferenceStoreProvider));
