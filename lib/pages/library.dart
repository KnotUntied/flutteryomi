import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:flutteryomi/widgets/list_heading.dart';


class LibraryPage extends StatefulWidget {
  const LibraryPage({super.key});

  @override
  State<LibraryPage> createState() => _LibraryPageState();
}

class _LibraryPageState extends State<LibraryPage> with AutomaticKeepAliveClientMixin<LibraryPage> {
  //final String _query = '';

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final lang = AppLocalizations.of(context);
    return DefaultTabController(
      length: 1,
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
                      child: Container(
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
                        ),
                      )
                    );
                  },
                );
              },
            ),
            MenuAnchor(
              builder: (BuildContext context, MenuController controller, Widget? child) {
                return IconButton(
                  onPressed: () {
                    if (controller.isOpen) {
                      controller.close();
                    } else {
                      controller.open();
                    }
                  },
                  icon: const Icon(Icons.more_vert),
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
          // Flutter issue; use workaround for now
          // https://github.com/flutter/flutter/issues/117722
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(kTextTabBarHeight),
            child: Align(
              alignment: Alignment.centerLeft,
              child: TabBar(
                dividerColor: Colors.transparent,
                isScrollable: true,
                tabAlignment: TabAlignment.start,
                tabs: <Widget>[
                  Tab(text: lang.label_default),
                ],
              ),
            ),
          ),
        ),
        //body: TabBarView(
        //children: myTabs.map((Tab tab) {
        //  return Center(
        //    child: Text(
        //      'This is the tab',
        //      style: const TextStyle(fontSize: 36),
        //    ),
        //  );
        //}).toList(),
        //),
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
    return CheckboxListTile(
      controlAffinity: ListTileControlAffinity.leading,
      title: Text(title),
      value: false,
      onChanged: (bool? value) {  },
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
