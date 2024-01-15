import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:flutteryomi/domain/download/model/download.dart';
import 'package:flutteryomi/presentation/components/app_bar.dart';
import 'package:flutteryomi/presentation/manga/components/chapter_download_indicator.dart';
import 'package:flutteryomi/presentation/manga/components/manga_bottom_action_menu.dart';
import 'package:flutteryomi/presentation/screens/loading_screen.dart';
import 'package:flutteryomi/presentation/updates/updates_screen_model.dart';

part 'updates.freezed.dart';

class UpdatesTab extends ConsumerWidget {
  const UpdatesTab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final lang = AppLocalizations.of(context);
    final screenModel = ref.watch(updatesScreenModelProvider.notifier);
    final state = ref.watch(updatesScreenModelProvider);
    return Scaffold(
      //appBar: SearchToolbar(
      //  titleContent: Text(lang.history),
      //  searchQuery: state.valueOrNull?.searchQuery,
      //  onChangeSearchQuery: screenModel.updateSearchQuery,
      //  actions: [
      //    AppBarAction(
      //      title: lang.pref_clear_history,
      //      iconData: Icons.delete_sweep_outlined,
      //      onClick: () => showDialog(
      //        context: context,
      //        builder: (BuildContext context) => HistoryDeleteAllDialog(
      //          onDelete: screenModel.removeAllHistory,
      //        ),
      //      ),
      //    ),
      //  ],
      //),
      body: state.when(
        loading: () => const LoadingScreen(),
        // TODO: Error handling
        error: (Object error, StackTrace stackTrace) {
          debugPrintStack(
            label: error.toString(),
            stackTrace: stackTrace,
          );
          return const LoadingScreen();
        },
        data: (data) {
          //if (data.list == null) {
            return const LoadingScreen();
          //} else if (data.list!.isEmpty) {
          //  return EmptyScreen(
          //    message: !data.searchQuery.isNullOrEmpty
          //        ? lang.no_results_found
          //        : lang.information_no_recent_manga,
          //  );
          //} else {
          //  return _HistoryScreenContent(
          //    history: data.list!,
          //    onClickCover: (mangaId) {
          //      //TODO
          //      //Navigator.push(
          //      //  context,
          //      //  MaterialPageRoute(
          //      //    builder: (context) => MangaScreen(mangaId),
          //      //  ),
          //      //);
          //    },
          //    onClickResume: (history) {
          //      //TODO
          //      //screenModel.getNextChapterForManga(
          //      //  history.mangaId,
          //      //  history.chapterId,
          //      //);
          //    },
          //    onClickDelete: (item) => showDialog(
          //      context: context,
          //      builder: (BuildContext context) => HistoryDeleteDialog(
          //        onDelete: (all) => all
          //            ? screenModel.removeAllFromHistory(item.mangaId)
          //            : screenModel.removeFromHistory(item),
          //      ),
          //    ),
          //  );
          //}
        },
      ),
    );
  }
}

class UpdatesScreen extends StatelessWidget {
  const UpdatesScreen({
    super.key,
    required this.state,
    required this.lastUpdated,
    required this.relativeTime,
    required this.onClickCover,
    required this.onSelectAll,
    required this.onInvertSelection,
    required this.onUpdateLibrary,
    required this.onDownloadChapter,
    required this.onMultiBookmarkClicked,
    required this.onMultiMarkAsReadClicked,
    required this.onMultiDeleteClicked,
    required this.onUpdateSelected,
    required this.onOpenChapter,
  });

  final UpdatesScreenState state;
  final DateTime lastUpdated;
  final bool relativeTime;
  final ValueChanged<UpdatesItem> onClickCover;
  final ValueChanged<bool> onSelectAll;
  final VoidCallback onInvertSelection;
  final bool Function() onUpdateLibrary;
  final Function(List<UpdatesItem>, ChapterDownloadAction) onDownloadChapter;
  final Function(List<UpdatesItem>, bool bookmark) onMultiBookmarkClicked;
  final Function(List<UpdatesItem>, bool read) onMultiMarkAsReadClicked;
  final ValueChanged<List<UpdatesItem>> onMultiDeleteClicked;
  final Function(UpdatesItem, bool, bool, bool) onUpdateSelected;
  final ValueChanged<UpdatesItem> onOpenChapter;

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
      bottomNavigationBar: const _UpdatesBottomBar(),
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

class _UpdatesBottomBar extends StatelessWidget {
  const _UpdatesBottomBar({
    super.key,
    required this.selected,
    required this.onDownloadChapter,
    required this.onMultiBookmarkClicked,
    required this.onMultiMarkAsReadClicked,
    required this.onMultiDeleteClicked,
  });

  final List<UpdatesItem> selected;
  final void Function(List<UpdatesItem>, ChapterDownloadAction) onDownloadChapter;
  final void Function(List<UpdatesItem>, bool bookmark) onMultiBookmarkClicked;
  final void Function(List<UpdatesItem>, bool read) onMultiMarkAsReadClicked;
  final ValueChanged<List<UpdatesItem>> onMultiDeleteClicked;

  @override
  Widget build(BuildContext context) {
    return MangaBottomActionMenu(
      visible: selected.isNotEmpty,
      onBookmarkClicked: selected.any((it) => !it.update.bookmark)
          ? () => onMultiBookmarkClicked(selected, true)
          : null,
      onRemoveBookmarkClicked: selected.every((it) => it.update.bookmark)
          ? () => onMultiBookmarkClicked(selected, false)
          : null,
      onMarkAsReadClicked: selected.any((it) => !it.update.read)
          ? () => onMultiMarkAsReadClicked(selected, true)
          : null,
      onMarkAsUnreadClicked: selected.any((it) => it.update.read || it.update.lastPageRead > 0)
          ? () => onMultiMarkAsReadClicked(selected, false)
          : null,
      onDownloadClicked: selected.any((it) => it.downloadStateProvider() != DownloadState.downloaded)
          ? () => onDownloadChapter(selected, ChapterDownloadAction.start)
          : null,
      onDeleteClicked: selected.any((it) => it.downloadStateProvider() == DownloadState.downloaded)
          ? () => onMultiDeleteClicked(selected)
          : null,
    );
  }
}

@freezed
sealed class UpdatesUiModel with _$UpdatesUiModel {
  const factory UpdatesUiModel.header(DateTime date) = Header;
  const factory UpdatesUiModel.item(UpdatesItem item) = Item;
}
