import 'package:collection/collection.dart';
import 'package:dartx/dartx_io.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutteryomi/domain/category/interactor/get_categories.dart';
import 'package:flutteryomi/domain/category/model/category.dart';
import 'package:flutteryomi/domain/download/service/download_preferences.dart';
import 'package:flutteryomi/presentation/category/category_extensions.dart';
import 'package:flutteryomi/presentation/more/settings/preference.dart';
import 'package:flutteryomi/presentation/more/settings/screen/commons.dart';
import 'package:flutteryomi/presentation/more/settings/screen/searchable_settings.dart';
import 'package:flutteryomi/presentation/more/settings/widget/tri_state_list_dialog.dart';

class SettingsDownloadScreen extends ConsumerWidget {
  const SettingsDownloadScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final lang = AppLocalizations.of(context);
    final downloadPreferences = ref.watch(downloadPreferencesProvider);
    final getCategories = ref.watch(getCategoriesProvider);
    return StreamBuilder<List<Category>>(
        stream: getCategories.subscribe(),
        builder: (context, snapshot) {
          final allCategories = snapshot.data ?? const [];
          return SearchableSettings(
            title: lang.pref_category_downloads,
            getPreferences: () => [
              SwitchPreference(
                pref: downloadPreferences.downloadOnlyOverWifi(),
                title: lang.connected_to_wifi,
              ),
              SwitchPreference(
                pref: downloadPreferences.saveChaptersAsCBZ(),
                title: lang.save_chapter_as_cbz,
              ),
              SwitchPreference(
                pref: downloadPreferences.splitTallImages(),
                title: lang.split_tall_images,
                subtitle: lang.split_tall_images_summary,
              ),
              _getDeleteChaptersGroup(
                context,
                downloadPreferences,
                allCategories,
              ),
              _getAutoDownloadGroup(
                  context, downloadPreferences, allCategories),
              _getDownloadAheadGroup(context, downloadPreferences),
            ],
          );
        });
  }

  PreferenceGroup _getDeleteChaptersGroup(
    BuildContext context,
    DownloadPreferences downloadPreferences,
    List<Category> categories,
  ) {
    final lang = AppLocalizations.of(context);
    return PreferenceGroup(
      title: lang.pref_category_delete_chapters,
      preferenceItems: [
        SwitchPreference(
          pref: downloadPreferences.removeAfterMarkedAsRead(),
          title: lang.pref_remove_after_marked_as_read,
        ),
        ListPreference(
          pref: downloadPreferences.removeAfterReadSlots(),
          title: lang.pref_remove_after_read,
          entries: {
            -1: lang.disabled,
            0: lang.last_read_chapter,
            1: lang.second_to_last,
            2: lang.third_to_last,
            3: lang.fourth_to_last,
            4: lang.fifth_to_last,
          },
        ),
        SwitchPreference(
          pref: downloadPreferences.removeBookmarkedChapters(),
          title: lang.pref_remove_bookmarked_chapters,
        ),
        MultiSelectListPreference(
          pref: downloadPreferences.removeExcludeCategories(),
          title: lang.pref_remove_exclude_categories,
          entries: categories
              .associate((it) => MapEntry(
                    it.id.toString(),
                    it.visualName(context),
                  ))
              .toMap(),
        ),
      ],
    );
  }

  PreferenceGroup _getAutoDownloadGroup(
    BuildContext context,
    DownloadPreferences downloadPreferences,
    List<Category> allCategories,
  ) {
    final lang = AppLocalizations.of(context);
    final downloadNewChaptersPref = downloadPreferences.downloadNewChapters();
    final downloadNewChapterCategoriesPref =
        downloadPreferences.downloadNewChapterCategories();
    final downloadNewChapterCategoriesExcludePref =
        downloadPreferences.downloadNewChapterCategoriesExclude();

    final downloadNewChapters = downloadNewChaptersPref.get();
    final included = downloadNewChapterCategoriesPref.get();
    final excluded = downloadNewChapterCategoriesExcludePref.get();

    return PreferenceGroup(
      title: lang.pref_category_auto_download,
      preferenceItems: [
        SwitchPreference(
          pref: downloadNewChaptersPref,
          title: lang.pref_download_new,
        ),
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
                message: lang.pref_download_new_categories_details,
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
                  downloadNewChapterCategoriesPref.set(
                    newIncluded.map((it) => it.id.toString()).toSet(),
                  );
                  downloadNewChapterCategoriesExcludePref.set(
                    newExcluded.map((it) => it.id.toString()).toSet(),
                  );
                  Navigator.pop(context);
                },
              );
            },
          ),
          enabled: downloadNewChapters,
        ),
      ],
    );
  }

  PreferenceGroup _getDownloadAheadGroup(
    BuildContext context,
    DownloadPreferences downloadPreferences,
  ) {
    final lang = AppLocalizations.of(context);

    return PreferenceGroup(
      title: lang.download_ahead,
      preferenceItems: [
        ListPreference(
          pref: downloadPreferences.autoDownloadWhileReading(),
          title: lang.auto_download_while_reading,
          entries: [0, 2, 3, 5, 10]
              .associateWith((it) =>
                  it == 0 ? lang.disabled : lang.next_unread_chapters(it))
              .toMap(),
        ),
        InfoPreference(title: lang.download_ahead_info),
      ],
    );
  }
}
