import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutteryomi/presentation/components/settings_items.dart';

import 'package:flutteryomi/presentation/components/download_dropdown_menu.dart';
import 'package:flutteryomi/presentation/manga/components/manga_screen_constants.dart';
import 'package:flutteryomi/presentation/theme/color_scheme.dart'
    as color_scheme;

class ChapterSettingsDialog extends StatelessWidget {
  const ChapterSettingsDialog({
    super.key,
    required this.onDismissRequest,
    //this.manga,
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

  final VoidCallback onDismissRequest;
  //final Manga? manga;
  final ValueChanged<bool?> onDownloadFilterChanged;
  final ValueChanged<bool?> onUnreadFilterChanged;
  final ValueChanged<bool?> onBookmarkedFilterChanged;
  final bool scanlatorFilterActive;
  final VoidCallback onScanlatorFilterClicked;
  final ValueChanged<int> onSortModeChanged;
  final ValueChanged<int> onDisplayModeChanged;
  final Function(bool applyToExistingManga) onSetAsDefault;
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
                builder: (BuildContext context, MenuController controller,
                    Widget? child) {
                  return IconButton(
                    onPressed: () {
                      controller.isOpen
                          ? controller.close()
                          : controller.open();
                    },
                    icon: Icon(Icons.adaptive.more_outlined),
                  );
                },
                menuChildren: [
                  MenuItemButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) =>
                            SetAsDefaultDialog(onConfirm: onSetAsDefault),
                      );
                    },
                    child: Text(lang.set_chapter_settings_as_default),
                  ),
                  MenuItemButton(
                    onPressed: onResetToDefault,
                    child: Text(lang.action_reset),
                  ),
                ],
              )
            ],
          ),
          Expanded(
            child: TabBarView(
              children: [
                _FilterPage(
                  downloadFilter: false,
                  onDownloadFilterChanged: onDownloadFilterChanged,
                  unreadFilter: false,
                  onUnreadFilterChanged: onUnreadFilterChanged,
                  bookmarkedFilter: false,
                  onBookmarkedFilterChanged: onBookmarkedFilterChanged,
                  scanlatorFilterActive: scanlatorFilterActive,
                  onScanlatorFilterClicked: onScanlatorFilterClicked,
                ),
                _SortPage(
                  sortingMode: 0,
                  sortDescending: false,
                  onItemSelected: onSortModeChanged,
                ),
                _DisplayPage(
                  displayMode: 0,
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
    this.downloadFilter,
    this.onDownloadFilterChanged,
    this.unreadFilter,
    required this.onUnreadFilterChanged,
    this.bookmarkedFilter,
    required this.onBookmarkedFilterChanged,
    required this.scanlatorFilterActive,
    required this.onScanlatorFilterClicked,
  });

  final bool? downloadFilter;
  final ValueChanged<bool?>? onDownloadFilterChanged;
  final bool? unreadFilter;
  final ValueChanged<bool?> onUnreadFilterChanged;
  final bool? bookmarkedFilter;
  final ValueChanged<bool?> onBookmarkedFilterChanged;
  final bool scanlatorFilterActive;
  final VoidCallback onScanlatorFilterClicked;

  @override
  Widget build(BuildContext context) {
    final lang = AppLocalizations.of(context);
    return ListView(
      children: [
        TriStateItem(
          label: lang.label_downloaded,
          state: true,
          enabled: true,
          onClick: (bool? x) {},
        ),
        TriStateItem(
          label: lang.action_filter_unread,
          state: true,
          onClick: (bool? x) {},
        ),
        TriStateItem(
          label: lang.label_started,
          state: true,
          onClick: (bool? x) {},
        ),
        ListTile(
          leading: Icon(
            Icons.people_alt_outlined,
            color: scanlatorFilterActive ? color_scheme.active(context) : null,
          ),
          title: Text(lang.scanlator),
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
    //final Map<String, >items = ;
    return ListView(
      children: [
        SortItem(
          label: lang.sort_by_source,
          sortDescending: false,
          onClick: () {},
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
    return ListView(
      children: [
        HeadingItem(lang.show_title),
      ],
    );
  }
}

class SetAsDefaultDialog extends StatefulWidget {
  const SetAsDefaultDialog({
    super.key,
    required this.onConfirm,
  });

  final Function(bool optionalChecked) onConfirm;

  @override
  State<SetAsDefaultDialog> createState() => _SetAsDefaultDialogState();
}

class _SetAsDefaultDialogState extends State<SetAsDefaultDialog> {
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
            onChanged: (bool? value) {
              setState(() {
                optionalChecked = value!;
              });
            },
            title: Text(lang.also_set_chapter_settings_for_library),
          ),
        ],
      ),
      actions: [
        TextButton(
          child: Text(lang.action_cancel),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        TextButton(
          child: Text(lang.action_ok),
          onPressed: () {
            widget.onConfirm(optionalChecked);
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
