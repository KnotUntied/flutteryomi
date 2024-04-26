import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:flutteryomi/core/preference/tri_state.dart';
import 'package:flutteryomi/domain/manga/model/manga.dart';
import 'package:flutteryomi/presentation/components/settings_items.dart';
import 'package:flutteryomi/presentation/theme/color_scheme.dart'
    as color_scheme;

class ChapterSettingsDialog extends StatelessWidget {
  const ChapterSettingsDialog({
    super.key,
    this.manga,
    required this.onDownloadFilterChanged,
    required this.onUnreadFilterChanged,
    required this.onBookmarkedFilterChanged,
    required this.scanlatorFilterActive,
    required this.onScanlatorFilterClicked,
    required this.onSortModeChanged,
    required this.onDisplayModeChanged,
    required this.onSetAsDefault,
    required this.onResetToDefault,
  });

  final Manga? manga;
  final ValueChanged<TriState> onDownloadFilterChanged;
  final ValueChanged<TriState> onUnreadFilterChanged;
  final ValueChanged<TriState> onBookmarkedFilterChanged;
  final bool scanlatorFilterActive;
  final VoidCallback onScanlatorFilterClicked;
  final ValueChanged<int> onSortModeChanged;
  final ValueChanged<int> onDisplayModeChanged;
  final void Function(bool applyToExistingManga) onSetAsDefault;
  final VoidCallback onResetToDefault;

  @override
  Widget build(BuildContext context) {
    final lang = AppLocalizations.of(context);
    return DefaultTabController(
      length: 3,
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: TabBar(
                  tabAlignment: TabAlignment.fill,
                  tabs: <Tab>[
                    Tab(text: lang.action_filter),
                    Tab(text: lang.action_sort),
                    Tab(text: lang.pref_category_display),
                  ],
                ),
              ),
              MenuAnchor(
                builder: (context, controller, child) {
                  return IconButton(
                    onPressed: () => controller.isOpen
                        ? controller.close()
                        : controller.open(),
                    icon: Icon(Icons.adaptive.more_outlined),
                  );
                },
                menuChildren: [
                  MenuItemButton(
                    onPressed: () => showAdaptiveDialog(
                      context: context,
                      builder: (context) => _SetAsDefaultDialog(
                        onConfirmed: onSetAsDefault,
                      ),
                    ),
                    child: Text(lang.set_chapter_settings_as_default),
                  ),
                  MenuItemButton(
                    onPressed: onResetToDefault,
                    child: Text(lang.action_reset),
                  ),
                ],
              ),
            ],
          ),
          Expanded(
            child: TabBarView(
              children: [
                _FilterPage(
                  downloadFilter: manga?.downloadedFilter ?? TriState.disabled,
                  onDownloadFilterChanged: manga?.forceDownloaded() == true
                      ? null
                      : onDownloadFilterChanged,
                  unreadFilter: manga?.unreadFilter ?? TriState.disabled,
                  onUnreadFilterChanged: onUnreadFilterChanged,
                  bookmarkedFilter: manga?.bookmarkedFilter ?? TriState.disabled,
                  onBookmarkedFilterChanged: onBookmarkedFilterChanged,
                  scanlatorFilterActive: scanlatorFilterActive,
                  onScanlatorFilterClicked: onScanlatorFilterClicked,
                ),
                _SortPage(
                  sortingMode: manga?.sorting ?? 0,
                  sortDescending: manga?.sortDescending() ?? false,
                  onItemSelected: onSortModeChanged,
                ),
                _DisplayPage(
                  displayMode: manga?.displayMode ?? 0,
                  onItemSelected: onDisplayModeChanged,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _FilterPage extends StatelessWidget {
  const _FilterPage({
    super.key,
    required this.downloadFilter,
    this.onDownloadFilterChanged,
    required this.unreadFilter,
    required this.onUnreadFilterChanged,
    required this.bookmarkedFilter,
    required this.onBookmarkedFilterChanged,
    required this.scanlatorFilterActive,
    required this.onScanlatorFilterClicked,
  });

  final TriState downloadFilter;
  final ValueChanged<TriState>? onDownloadFilterChanged;
  final TriState unreadFilter;
  final ValueChanged<TriState> onUnreadFilterChanged;
  final TriState bookmarkedFilter;
  final ValueChanged<TriState> onBookmarkedFilterChanged;
  final bool scanlatorFilterActive;
  final VoidCallback onScanlatorFilterClicked;

  @override
  Widget build(BuildContext context) {
    final lang = AppLocalizations.of(context);
    return ListView(
      children: [
        TriStateItem(
          label: lang.label_downloaded,
          state: downloadFilter,
          onClick: onDownloadFilterChanged,
        ),
        TriStateItem(
          label: lang.action_filter_unread,
          state: unreadFilter,
          onClick: onUnreadFilterChanged,
        ),
        TriStateItem(
          label: lang.label_started,
          state: bookmarkedFilter,
          onClick: onBookmarkedFilterChanged,
        ),
        ListTile(
          leading: Icon(
            Icons.people_alt_outlined,
            color: scanlatorFilterActive ? color_scheme.active(context) : null,
          ),
          title: Text(
            lang.scanlator,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          onTap: onScanlatorFilterClicked,
        ),
      ],
    );
  }
}

class _SortPage extends StatelessWidget {
  const _SortPage({
    super.key,
    required this.sortingMode,
    required this.sortDescending,
    required this.onItemSelected,
  });

  final int sortingMode;
  final bool sortDescending;
  final ValueChanged<int> onItemSelected;

  @override
  Widget build(BuildContext context) {
    final lang = AppLocalizations.of(context);
    final sortMap = {
      lang.sort_by_source: MangaUtils.chapterSortingSource,
      lang.sort_by_number: MangaUtils.chapterSortingNumber,
      lang.sort_by_upload_date: MangaUtils.chapterSortingUploadDate,
      lang.action_sort_alpha: MangaUtils.chapterSortingAlphabet,
    };
    return ListView(
      children: [
        for (final entry in sortMap.entries)
          SortItem(
            label: entry.key,
            sortDescending: sortingMode == entry.value ? sortDescending : null,
            onClick: () => onItemSelected(entry.value),
          ),
      ],
    );
  }
}

class _DisplayPage extends StatelessWidget {
  const _DisplayPage({
    super.key,
    required this.displayMode,
    required this.onItemSelected,
  });

  final int displayMode;
  final ValueChanged<int> onItemSelected;

  @override
  Widget build(BuildContext context) {
    final lang = AppLocalizations.of(context);
    final displayMap = {
      lang.show_title: MangaUtils.chapterDisplayName,
      lang.show_chapter_number: MangaUtils.chapterDisplayNumber,
    };
    return ListView(
      children: [
        for (final entry in displayMap.entries)
          RadioListTile<int>(
            title: Text(entry.key),
            value: entry.value,
            groupValue: displayMode,
            onChanged: (v) => onItemSelected(v!),
          ),
      ],
    );
  }
}

class _SetAsDefaultDialog extends StatefulWidget {
  const _SetAsDefaultDialog({
    super.key,
    required this.onConfirmed,
  });

  final ValueChanged<bool> onConfirmed;

  @override
  State<_SetAsDefaultDialog> createState() => _SetAsDefaultDialogState();
}

class _SetAsDefaultDialogState extends State<_SetAsDefaultDialog> {
  bool optionalChecked = false;

  @override
  Widget build(BuildContext context) {
    final lang = AppLocalizations.of(context);
    return AlertDialog.adaptive(
      title: Text(lang.chapter_settings),
      content: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 12.0),
            child: Text(lang.confirm_set_chapter_settings),
          ),
          CheckboxListTile(
            value: optionalChecked,
            onChanged: (value) => setState(() => optionalChecked = value!),
            title: Text(lang.also_set_chapter_settings_for_library),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: Navigator.of(context).pop,
          child: Text(lang.action_cancel),
        ),
        TextButton(
          onPressed: () {
            widget.onConfirmed(optionalChecked);
            Navigator.pop(context);
          },
          child: Text(lang.action_ok),
        ),
      ],
    );
  }
}
