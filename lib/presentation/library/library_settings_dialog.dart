import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutteryomi/core/preference/tri_state.dart';
import 'package:flutteryomi/domain/base/base_preferences.dart';

import 'package:flutteryomi/domain/category/model/category.dart';
import 'package:flutteryomi/domain/library/model/library_display_mode.dart';
import 'package:flutteryomi/domain/library/model/library_sort_mode.dart';
import 'package:flutteryomi/domain/library/service/library_preferences.dart';
import 'package:flutteryomi/presentation/components/settings_items.dart';
import 'package:flutteryomi/presentation/components/tabbed_dialog.dart';
import 'package:flutteryomi/presentation/library/library_settings_screen_model.dart';

//TODO
class LibrarySettingsDialog extends StatelessWidget {
  const LibrarySettingsDialog({
    super.key,
    required this.screenModel,
    this.category,
  });

  final LibrarySettingsScreenModel screenModel;
  final Category? category;

  @override
  Widget build(BuildContext context) {
    final lang = AppLocalizations.of(context);
    return TabbedDialog(
      tabTitles: [
        lang.action_filter,
        lang.action_sort,
        lang.pref_category_display,
      ],
      content: [
        _FilterPage(screenModel: screenModel),
        _SortPage(category: category, screenModel: screenModel),
        _DisplayPage(screenModel: screenModel),
      ],
    );
  }
}

class _FilterPage extends ConsumerWidget {
  const _FilterPage({super.key, required this.screenModel});

  final LibrarySettingsScreenModel screenModel;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final lang = AppLocalizations.of(context);
    final preferences = ref.watch(basePreferencesProvider);
    final libraryPreferences = ref.watch(libraryPreferencesProvider);
    final downloadedOnly = preferences.downloadedOnly().get();
    final autoUpdateMangaRestrictions =
        libraryPreferences.autoUpdateMangaRestrictions().get();
    final trackers = ref.watch(librarySettingsScreenModelProvider);
    return ListView(
      children: [
        TriStateItem(
          label: lang.label_downloaded,
          state: downloadedOnly
              ? TriState.enabledIs
              : libraryPreferences.filterDownloaded().get(),
          enabled: !downloadedOnly,
          onClick: (_) =>
              screenModel.toggleFilter(libraryPreferences.filterDownloaded),
        ),
        TriStateItem(
          label: lang.action_filter_unread,
          state: libraryPreferences.filterUnread().get(),
          onClick: (_) =>
              screenModel.toggleFilter(libraryPreferences.filterUnread),
        ),
        TriStateItem(
          label: lang.label_started,
          state: libraryPreferences.filterStarted().get(),
          onClick: (_) =>
              screenModel.toggleFilter(libraryPreferences.filterStarted),
        ),
        TriStateItem(
          label: lang.action_filter_bookmarked,
          state: libraryPreferences.filterBookmarked().get(),
          onClick: (_) =>
              screenModel.toggleFilter(libraryPreferences.filterBookmarked),
        ),
        TriStateItem(
          label: lang.completed,
          state: libraryPreferences.filterCompleted().get(),
          onClick: (_) =>
              screenModel.toggleFilter(libraryPreferences.filterCompleted),
        ),
        if (autoUpdateMangaRestrictions
            .contains(LibraryPreferences.mangaOutsideReleasePeriod))
          TriStateItem(
            label: lang.action_filter_interval_custom,
            state: libraryPreferences.filterIntervalCustom().get(),
            onClick: (_) => screenModel
                .toggleFilter(libraryPreferences.filterIntervalCustom),
          ),
        if (trackers.length == 1)
          TriStateItem(
            label: lang.action_filter_tracked,
            state: libraryPreferences.filterTracking(trackers[0].id).get(),
            onClick: (_) => screenModel.toggleTracker(trackers[0].id),
          )
        else if (trackers.length > 1) ...[
          HeadingItem(lang.action_filter_tracked),
          ...trackers.map((service) {
            final filterTracker =
                libraryPreferences.filterTracking(service.id).get();
            return TriStateItem(
              label: service.name,
              state: filterTracker,
              onClick: (_) => screenModel.toggleTracker(service.id),
            );
          })
        ],
      ],
    );
  }
}

class _SortPage extends ConsumerWidget {
  const _SortPage({super.key, this.category, required this.screenModel});

  final Category? category;
  final LibrarySettingsScreenModel screenModel;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final lang = AppLocalizations.of(context);
    final trackers = ref.watch(librarySettingsScreenModelProvider);
    final sortingMode = category?.librarySort.type;
    final sortDescending = !(category?.librarySort.isAscending ?? true);
    final trackerSortOption =
        (title: lang.action_sort_tracker_score, mode: Type.trackerMean);
    final items = [
      (title: lang.action_sort_alpha, mode: Type.alphabetical),
      (title: lang.action_sort_total, mode: Type.totalChapters),
      (title: lang.action_sort_last_read, mode: Type.lastRead),
      (title: lang.action_sort_last_manga_update, mode: Type.lastUpdate),
      (title: lang.action_sort_unread_count, mode: Type.unreadCount),
      (title: lang.action_sort_latest_chapter, mode: Type.latestChapter),
      (title: lang.action_sort_chapter_fetch_date, mode: Type.chapterFetchDate),
      (title: lang.action_sort_date_added, mode: Type.dateAdded),
      if (trackers.isNotEmpty) trackerSortOption,
    ];
    return ListView(
      children: items
          .map((it) => SortItem(
                label: it.title,
                sortDescending: sortingMode == it.mode ? sortDescending : null,
                onClick: () {
                  final isTogglingDirection = sortingMode == it.mode;
                  final direction = isTogglingDirection
                      ? (sortDescending
                          ? Direction.ascending
                          : Direction.descending)
                      : (sortDescending
                          ? Direction.descending
                          : Direction.ascending);
                  screenModel.setSort(category, it.mode, direction);
                },
              ))
          .toList(),
    );
  }
}

class _DisplayPage extends ConsumerWidget {
  const _DisplayPage({super.key, required this.screenModel});

  final LibrarySettingsScreenModel screenModel;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final lang = AppLocalizations.of(context);
    final libraryPreferences = ref.watch(libraryPreferencesProvider);
    final displayMode = libraryPreferences.displayMode().get();
    final columnPreference = MediaQuery.orientationOf(context) == Orientation.landscape
        ? libraryPreferences.landscapeColumns()
        : libraryPreferences.portraitColumns();
    final columns = columnPreference.get();
    final displayModes = [
      (title: lang.action_display_grid, mode: CompactGrid()),
      (title: lang.action_display_comfortable_grid, mode: ComfortableGrid()),
      (title: lang.action_display_cover_only_grid, mode: CoverOnlyGrid()),
      (title: lang.action_display_list, mode: ListMode()),
    ];
    return ListView(
      children: [
        SettingsChipRow(
          label: lang.action_display_mode,
          content: displayModes
              .map((it) => FilterChip(
                    selected: displayMode == it.mode,
                    onSelected: (_) => screenModel.setDisplayMode(it.mode),
                    label: Text(it.title),
                  ))
              .toList(),
        ),
        if (displayMode != ListMode()) 
          SliderItem(
            label: lang.pref_library_columns,
            max: 10,
            value: columns,
            valueText: columns > 0
                ? lang.pref_library_columns_per_row(columns)
                : lang.label_default,
            onChange: (it) => columnPreference.set(it),
          ),
        HeadingItem(lang.overlay_header),
        CheckboxItem(
          label: lang.action_display_download_badge,
          pref: libraryPreferences.downloadBadge(),
        ),
        CheckboxItem(
          label: lang.action_display_local_badge,
          pref: libraryPreferences.localBadge(),
        ),
        CheckboxItem(
          label: lang.action_display_language_badge,
          pref: libraryPreferences.languageBadge(),
        ),
        CheckboxItem(
          label: lang.action_display_show_continue_reading_button,
          pref: libraryPreferences.showContinueReadingButton(),
        ),
        HeadingItem(lang.tabs_header),
        CheckboxItem(
          label: lang.action_display_show_tabs,
          pref: libraryPreferences.categoryTabs(),
        ),
        CheckboxItem(
          label: lang.action_display_show_number_of_items,
          pref: libraryPreferences.categoryNumberOfItems(),
        ),
      ],
    );
  }
}
