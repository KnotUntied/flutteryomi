import 'package:collection/collection.dart';
import 'package:dartx/dartx_io.dart' hide IterableWhereNot;
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutteryomi/domain/category/interactor/get_categories.dart';
import 'package:flutteryomi/domain/category/interactor/reset_category_flags.dart';
import 'package:flutteryomi/domain/category/model/category.dart';
import 'package:flutteryomi/domain/library/service/library_preferences.dart';
import 'package:flutteryomi/presentation/category/category.dart';
import 'package:flutteryomi/presentation/category/category_extensions.dart';
import 'package:flutteryomi/presentation/more/settings/preference.dart';
import 'package:flutteryomi/presentation/more/settings/screen/commons.dart';
import 'package:flutteryomi/presentation/more/settings/screen/searchable_settings.dart';
import 'package:flutteryomi/presentation/more/settings/widget/tri_state_list_dialog.dart';

//TODO
class SettingsLibraryScreen extends ConsumerWidget {
  const SettingsLibraryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final lang = AppLocalizations.of(context);
    final libraryPreferences = ref.watch(libraryPreferencesProvider);
    final getCategories = ref.watch(getCategoriesProvider);
    return StreamBuilder<List<Category>>(
      stream: getCategories.subscribe(),
      builder: (context, snapshot) {
        final allCategories = snapshot.data ?? const [];
        return SearchableSettings(
          title: lang.pref_category_library,
          getPreferences: () => [
            _getCategoriesGroup(
                context, ref, allCategories, libraryPreferences),
            _getGlobalUpdateGroup(context, allCategories, libraryPreferences),
            _getChapterSwipeActionsGroup(context, libraryPreferences),
          ],
        );
      },
    );
  }

  PreferenceGroup _getCategoriesGroup(
    BuildContext context,
    WidgetRef ref,
    List<Category> allCategories,
    LibraryPreferences libraryPreferences,
  ) {
    final lang = AppLocalizations.of(context);
    final resetCategoryFlags = ref.read(resetCategoryFlagsProvider);
    final userCategoriesCount = allCategories
        .whereNot((it) => it.isSystemCategory)
        .length;

    final defaultCategory = libraryPreferences.defaultCategory().get();
    final selectedCategory = allCategories
        .firstWhereOrNull((it) => it.id == defaultCategory);

    // For default category
    final ids = [
      libraryPreferences.defaultCategory().defaultValue(),
      ...allCategories.map((it) => it.id),
    ];
    final labels = [
      lang.default_category_summary,
      ...allCategories.map((it) => it.visualName(context)),
    ];

    return PreferenceGroup(
      title: lang.categories,
      preferenceItems: [
        TextPreference(
          title: lang.action_edit_categories,
          subtitle: lang.num_categories(userCategoriesCount),
          onClick: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const CategoryScreen(),
            ),
          ),
        ),
        ListPreference(
          pref: libraryPreferences.defaultCategory(),
          title: lang.default_category,
          subtitle: selectedCategory?.visualName(context)
              ?? lang.default_category_summary,
          entries: Map.fromIterables(ids, labels),
        ),
        SwitchPreference(
          pref: libraryPreferences.categorizedDisplaySettings(),
          title: lang.categorized_display_settings,
          onValueChanged: (it) async {
            if (!it) await resetCategoryFlags.await_();
            return true;
          },
        ),
      ],
    );
  }

  PreferenceGroup _getGlobalUpdateGroup(
    BuildContext context,
    List<Category> allCategories,
    LibraryPreferences libraryPreferences,
  ) {
    final lang = AppLocalizations.of(context);
    final autoUpdateIntervalPref = libraryPreferences.autoUpdateInterval();
    final autoUpdateCategoriesPref = libraryPreferences.updateCategories();
    final autoUpdateCategoriesExcludePref =
        libraryPreferences.updateCategoriesExclude();

    final autoUpdateInterval = autoUpdateIntervalPref.get();

    final included = autoUpdateCategoriesPref.get();
    final excluded = autoUpdateCategoriesExcludePref.get();

    return PreferenceGroup(
      title: lang.pref_category_library_update,
      preferenceItems: [
        //ListPreference(
        //  pref: autoUpdateIntervalPref,
        //  title: lang.pref_library_update_interval,
        //  entries: {
        //    0: lang.update_never,
        //    12: lang.update_12hour,
        //    24: lang.update_24hour,
        //    48: lang.update_48hour,
        //    72: lang.update_72hour,
        //    168: lang.update_weekly,
        //  },
        //  onValueChanged: (it) async {
        //    LibraryUpdateJob.setupTask(context, it);
        //    return true;
        //  },
        //),
        //MultiSelectListPreference(
        //  pref: libraryPreferences.autoUpdateDeviceRestrictions(),
        //  enabled: autoUpdateInterval > 0,
        //  title: lang.pref_library_update_restriction,
        //  subtitle: lang.restrictions,
        //  entries: {
        //    LibraryPreferences.deviceOnlyOnWifi: lang.connected_to_wifi,
        //    LibraryPreferences.deviceNetworkNotMetered: lang.network_not_metered,
        //    LibraryPreferences.deviceCharging: lang.charging,
        //  },
        //  onValueChanged: (it) async {
        //    // Post to event looper to allow the preference to be updated.
        //    //ContextCompat.getMainExecutor(context).execute { LibraryUpdateJob.setupTask(context) };
        //    return true;
        //  },
        //),
        TextPreference(
          title: lang.categories,
          subtitle: getCategoriesLabel(
            context,
            allCategories: allCategories,
            included: included,
            excluded: excluded,
          ),
          onClick: () => showAdaptiveDialog(
            context: context,
            builder: (context) {
              return TriStateListDialog(
                title: lang.categories,
                message: lang.pref_library_update_categories_details,
                items: allCategories,
                initialChecked: included
                    .mapNotNull(
                      (id) => allCategories.firstWhereOrNull(
                        (it) => it.id.toString() == id,
                      ),
                    )
                    .toList(),
                initialInversed: excluded
                    .mapNotNull(
                      (id) => allCategories.firstWhereOrNull(
                        (it) => it.id.toString() == id,
                      ),
                    )
                    .toList(),
                itemLabel: (it) => it.visualName(context),
                onValueChanged: (newIncluded, newExcluded) {
                  autoUpdateCategoriesPref.set(
                    newIncluded.map((it) => it.id.toString()).toSet(),
                  );
                  autoUpdateCategoriesExcludePref.set(
                    newExcluded.map((it) => it.id.toString()).toSet(),
                  );
                },
              );
            },
          ),
        ),
        SwitchPreference(
          pref: libraryPreferences.autoUpdateMetadata(),
          title: lang.pref_library_update_refresh_metadata,
          subtitle: lang.pref_library_update_refresh_metadata_summary,
        ),
        MultiSelectListPreference(
          pref: libraryPreferences.autoUpdateMangaRestrictions(),
          title: lang.pref_library_update_smart_update,
          entries: {
            LibraryPreferences.mangaHasUnread:
                lang.pref_update_only_completely_read,
            LibraryPreferences.mangaNonRead: lang.pref_update_only_started,
            LibraryPreferences.mangaNonCompleted:
                lang.pref_update_only_non_completed,
            LibraryPreferences.mangaOutsideReleasePeriod:
                lang.pref_update_only_in_release_period,
          },
        ),
        SwitchPreference(
          pref: libraryPreferences.newShowUpdatesCount(),
          title: lang.pref_library_update_show_tab_badge,
        ),
      ],
    );
  }

  PreferenceGroup _getChapterSwipeActionsGroup(
    BuildContext context,
    LibraryPreferences libraryPreferences,
  ) {
    final lang = AppLocalizations.of(context);
    return PreferenceGroup(
      title: lang.pref_chapter_swipe,
      preferenceItems: [
        ListPreference(
          pref: libraryPreferences.swipeToStartAction(),
          title: lang.pref_chapter_swipe_start,
          entries: {
            ChapterSwipeAction.disabled: lang.disabled,
            ChapterSwipeAction.toggleBookmark: lang.action_bookmark,
            ChapterSwipeAction.toggleRead: lang.action_mark_as_read,
            ChapterSwipeAction.download: lang.action_download,
          },
        ),
        ListPreference(
          pref: libraryPreferences.swipeToEndAction(),
          title: lang.pref_chapter_swipe_end,
          entries: {
            ChapterSwipeAction.disabled: lang.disabled,
            ChapterSwipeAction.toggleBookmark: lang.action_bookmark,
            ChapterSwipeAction.toggleRead: lang.action_mark_as_read,
            ChapterSwipeAction.download: lang.action_download,
          },
        ),
      ],
    );
  }
}
