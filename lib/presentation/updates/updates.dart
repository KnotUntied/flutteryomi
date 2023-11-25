import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:flutteryomi/presentation/components/app_bar.dart';
import 'package:flutteryomi/presentation/components/empty_screen.dart';
import 'package:flutteryomi/presentation/manga/components/manga_bottom_action_menu.dart';

class UpdatesTab extends StatefulWidget {
  const UpdatesTab({super.key});

  @override
  State<UpdatesTab> createState() => _UpdatesTabState();
}

class _UpdatesTabState extends State<UpdatesTab> {
  @override
  Widget build(BuildContext context) {
    return UpdatesScreen(
      lastUpdated: DateTime.now(),
      relativeTime: true,
      onSelectAll: (bool x) {},
      onInvertSelection: () {},
      onUpdateLibrary: () => true,
    );
  }
}

class UpdatesScreen extends StatelessWidget {
  const UpdatesScreen({
    super.key,
    //required this.state,
    required this.lastUpdated,
    required this.relativeTime,
    //required this.onClickCover,
    required this.onSelectAll,
    required this.onInvertSelection,
    required this.onUpdateLibrary,
    //required this.onDownloadChapter,
    //required this.onMultiBookmarkClicked,
    //required this.onMultiMarkAsReadClicked,
    //required this.onMultiDeleteClicked,
    //required this.onUpdateSelected,
    //required this.onOpenChapter,
  });

  //final UpdatesScreenModel.State state;
  final DateTime lastUpdated;
  final bool relativeTime;
  //final ValueChanged<UpdatesItem> onClickCover;
  final ValueChanged<bool> onSelectAll;
  final VoidCallback onInvertSelection;
  final bool Function() onUpdateLibrary;
  //final Function(List<UpdatesItem>, ChapterDownloadAction) onDownloadChapter;
  //final Function(List<UpdatesItem>, bool bookmark) onMultiBookmarkClicked;
  //final Function(List<UpdatesItem>, bool read) onMultiMarkAsReadClicked;
  //final ValueChanged<List<UpdatesItem>> onMultiDeleteClicked;
  //final Function(UpdatesItem, bool, bool, bool) onUpdateSelected;
  //final ValueChanged<UpdatesItem> onOpenChapter;

  @override
  Widget build(BuildContext context) {
    final lang = AppLocalizations.of(context);
    Widget body;
    //if (state.isLoading) {
    //  body = LoadingScreen();
    //} else if (state.items.isEmpty) {
    //  body = EmptyScreen(message: lang.information_no_recent);
    //} else {
    //  body = <real body here>;
    //}
    body = RefreshIndicator(
      onRefresh: () async {},
      child: ListView(
        children: [
          ListTile(
            title: Text(
              lang.updates_last_update_info(
                  lang.updates_last_update_info_just_now),
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .copyWith(fontStyle: FontStyle.italic),
            ),
          ),
        ],
      ),
    );
    return Scaffold(
      appBar: UpdatesAppBar(
        onUpdateLibrary: onUpdateLibrary,
        // TEMP
        actionModeCounter: 0,
        onSelectAll: () {
          onSelectAll(true);
        },
        onInvertSelection: onInvertSelection,
        onCancelActionMode: () {
          onSelectAll(false);
        },
      ),
      body: body,
      bottomNavigationBar: const UpdatesBottomBar(),
    );
  }
}

class UpdatesAppBar extends StatelessWidget implements PreferredSizeWidget {
  const UpdatesAppBar({
    super.key,
    required this.onUpdateLibrary,
    required this.actionModeCounter,
    required this.onSelectAll,
    required this.onInvertSelection,
    required this.onCancelActionMode,
  });

  final VoidCallback onUpdateLibrary;
  final int actionModeCounter;
  final VoidCallback onSelectAll;
  final VoidCallback onInvertSelection;
  final VoidCallback onCancelActionMode;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    final lang = AppLocalizations.of(context);
    return ActionAppBarWithCounter(
      title: lang.label_recent_updates,
      actions: [
        AppBarAction(
          iconData: Icons.refresh_outlined,
          onClick: onUpdateLibrary,
          title: lang.action_update_library,
        ),
      ],
      actionModeCounter: actionModeCounter,
      onCancelActionMode: onCancelActionMode,
      actionModeActions: [
        AppBarAction(
          iconData: Icons.select_all_outlined,
          onClick: onSelectAll,
          title: lang.action_select_all,
        ),
        AppBarAction(
          iconData: Icons.flip_to_back_outlined,
          onClick: onInvertSelection,
          title: lang.action_select_inverse,
        ),
      ],
    );
  }
}

class UpdatesBottomBar extends StatelessWidget {
  const UpdatesBottomBar({
    super.key,
    //required this.selected,
    //required this.onDownloadChapter,
    //required this.onMultiBookmarkClicked,
    //required this.onMultiMarkAsReadClicked,
    //required this.onMultiDeleteClicked,
  });

  //final List<UpdatesItem> selected;
  //final Function(List<UpdatesItem>, ChapterDownloadAction) onDownloadChapter;
  //final Function(List<UpdatesItem>, bool bookmark) onMultiBookmarkClicked;
  //final Function(List<UpdatesItem>, bool read) onMultiMarkAsReadClicked;
  //final ValueChanged<List<UpdatesItem>> onMultiDeleteClicked;

  @override
  Widget build(BuildContext context) {
    return const MangaBottomActionMenu(
      visible: true,
    );
  }
}
