import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutteryomi/presentation/library/components/library_settings_dialog.dart';

import 'package:flutteryomi/presentation/library/components/library_content.dart';
import 'package:flutteryomi/presentation/library/components/library_toolbar.dart';
import 'package:flutteryomi/presentation/manga/components/manga_bottom_action_menu.dart';
import 'package:flutteryomi/presentation/manga/manga_screen_constants.dart';

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
      length: 5,
      //length: categories.length,
      child: Scaffold(
        appBar: LibraryToolbar(
          hasActiveFilters: false,
          selectedCount: 0,
          title: LibraryToolbarTitle(lang.label_library, null),
          onClickUnselectAll: () {},
          onClickSelectAll: () {},
          onClickInvertSelection: () {},
          onClickFilter: () {
            showModalBottomSheet<void>(
              context: context,
              isScrollControlled: true,
              useSafeArea: true,
              builder: (BuildContext context) => const LibrarySettingsDialog(),
            );
          },
          onClickRefresh: () {},
          onClickGlobalUpdate: () {},
          onClickOpenRandomManga: () {},
          onSearchQueryChange: (String? value) {},
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
        bottomNavigationBar: LibraryBottomActionMenu(
          visible: true,
          onChangeCategoryClicked: () {},
          onMarkAsReadClicked: () {},
          onMarkAsUnreadClicked: () {},
          onDownloadClicked: (DownloadAction downloadAction) {},
          onDeleteClicked: () {},
        ),
      ),
    );
  }
}
