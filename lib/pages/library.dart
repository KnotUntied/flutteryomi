import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:flutteryomi/models/utils/manga_cover.dart' as manga_cover_data;
import 'package:flutteryomi/widgets/list_heading.dart';
import 'package:flutteryomi/widgets/library/library_compact_grid.dart';
import 'package:flutteryomi/widgets/library/manga_item.dart';
import 'package:flutteryomi/widgets/manga/manga_cover.dart';

class LibraryPage extends StatefulWidget {
  const LibraryPage({super.key});

  @override
  State<LibraryPage> createState() => _LibraryPageState();
}

class _LibraryPageState extends State<LibraryPage>
    with AutomaticKeepAliveClientMixin<LibraryPage> {
  //val isLoading: Boolean = true,
  //val library: LibraryMap = emptyMap(),
  //val searchQuery: String? = null,
  //val selection: List<LibraryManga> = emptyList(),
  //val hasActiveFilters: Boolean = false,
  //val showCategoryTabs: Boolean = false,
  //val showMangaCount: Boolean = false,
  //val showMangaContinueButton: Boolean = false,
  //val dialog: Dialog? = null,
  final String? searchQuery = null;

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
            tabs: <Widget>[
              Tab(text: lang.label_default),
              Tab(text: lang.label_default),
            ],
          ),
        ),
        body: RefreshIndicator.adaptive(
          onRefresh: () async {  },
          child: TabBarView(
            children: [
              LibraryCompactGrid(
                showTitle: true,
                columns: 3,
                onGlobalSearchClicked: () {  },
              ),
              LibraryCompactGrid(
                showTitle: true,
                columns: 3,
                onGlobalSearchClicked: () {  },
              ),
            ],
          ),
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
        ListHeading(lang.badges_header),
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
