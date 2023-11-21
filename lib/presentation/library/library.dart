import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:flutteryomi/data/utils/manga_cover.dart' as manga_cover_data;
import 'package:flutteryomi/presentation/components/list_heading.dart';
import 'package:flutteryomi/presentation/components/tab_text.dart';
import 'package:flutteryomi/presentation/library/components/library_content.dart';
import 'package:flutteryomi/presentation/library/components/library_toolbar.dart';
import 'package:flutteryomi/presentation/library/components/manga_item.dart';

class LibraryTab extends StatefulWidget {
  const LibraryTab({super.key});

  @override
  State<LibraryTab> createState() => _LibraryTabState();
}

class _LibraryTabState extends State<LibraryTab>
    with AutomaticKeepAliveClientMixin<LibraryTab> {

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final lang = AppLocalizations.of(context);
    return DefaultTabController(
      length: 2,
      //length: categories.length,
      child: Scaffold(
        appBar: AppBar(
          title: Text(lang.label_library),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.filter_list),
              onPressed: () {
                showModalBottomSheet<void>(
                  context: context,
                  isScrollControlled: true,
                  useSafeArea: true,
                  builder: (BuildContext context) {
                    return DefaultTabController(
                        length: 3,
                        child: Column(
                          children: <Widget>[
                            TabBar(
                              tabAlignment: TabAlignment.fill,
                              tabs: <Widget>[
                                Tab(text: lang.action_filter),
                                Tab(text: lang.action_sort),
                                Tab(text: lang.pref_category_display),
                              ],
                            ),
                            const Expanded(
                              child: TabBarView(
                                children: <Widget>[
                                  LibrarySettingsFilterView(),
                                  LibrarySettingsFilterView(),
                                  LibrarySettingsDisplayView(),
                                ],
                              ),
                            ),
                          ],
                        ));
                  },
                );
              },
            ),
            MenuAnchor(
              builder: (BuildContext context, MenuController controller,
                  Widget? child) {
                return IconButton(
                  onPressed: () {
                    if (controller.isOpen) {
                      controller.close();
                    } else {
                      controller.open();
                    }
                  },
                  icon: Icon(Icons.adaptive.more_outlined),
                );
              },
              menuChildren: <MenuItemButton>[
                MenuItemButton(
                  onPressed: () => {},
                  child: Text(lang.pref_category_library_update),
                ),
                MenuItemButton(
                  onPressed: () => {},
                  child: Text(lang.action_open_random_manga),
                ),
              ],
            ),
          ],
          bottom: TabBar(
            isScrollable: true,
            tabAlignment: TabAlignment.start,
            tabs: [
              //hacky way to have text and pill
              Tab(
                icon: TabText(
                  text: lang.label_default,
                  badgeCount: 7,
                ),
              ),
              Tab(
                icon: TabText(
                  text: lang.label_default,
                  badgeCount: 7,
                ),
              ),
            ],
          ),
        ),
        body: LibraryContent(
          hasActiveFilters: false,
          onChangeCurrentPage: (int value) {},
          onMangaClicked: (int value) {},
          onGlobalSearchClicked: () {},
        ),
      ),
    );
  }
}

class LibrarySettingsCheckboxListTile extends StatelessWidget {
  const LibrarySettingsCheckboxListTile({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile.adaptive(
      controlAffinity: ListTileControlAffinity.leading,
      title: Text(title),
      value: false,
      onChanged: (bool? value) {},
    );
  }
}

class LibrarySettingsFilterView extends StatelessWidget {
  const LibrarySettingsFilterView({super.key});

  @override
  Widget build(BuildContext context) {
    final lang = AppLocalizations.of(context);
    return ListView(
      children: <LibrarySettingsCheckboxListTile>[
        LibrarySettingsCheckboxListTile(
          title: lang.label_downloaded,
        ),
        LibrarySettingsCheckboxListTile(
          title: lang.action_filter_unread,
        ),
        LibrarySettingsCheckboxListTile(
          title: lang.label_started,
        ),
        LibrarySettingsCheckboxListTile(
          title: lang.action_filter_bookmarked,
        ),
        LibrarySettingsCheckboxListTile(
          title: lang.completed,
        ),
        LibrarySettingsCheckboxListTile(
          title: lang.action_filter_tracked,
        ),
      ],
    );
  }
}

class LibrarySettingsDisplayView extends StatelessWidget {
  const LibrarySettingsDisplayView({super.key});

  @override
  Widget build(BuildContext context) {
    final lang = AppLocalizations.of(context);
    return ListView(
      children: <Widget>[
        ListHeading(lang.action_display_mode),
        //ListHeading(lang.badges_header),
        LibrarySettingsCheckboxListTile(
          title: lang.action_display_download_badge,
        ),
        LibrarySettingsCheckboxListTile(
          title: lang.action_display_local_badge,
        ),
        LibrarySettingsCheckboxListTile(
          title: lang.action_display_language_badge,
        ),
        ListHeading(lang.tabs_header),
        LibrarySettingsCheckboxListTile(
          title: lang.action_display_show_tabs,
        ),
        LibrarySettingsCheckboxListTile(
          title: lang.action_display_show_number_of_items,
        ),
        ListHeading(lang.other_source),
        LibrarySettingsCheckboxListTile(
          title: lang.action_display_show_continue_reading_button,
        ),
      ],
    );
  }
}
