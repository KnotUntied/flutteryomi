import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:flutteryomi/domain/download/model/download.dart';
import 'package:flutteryomi/domain/ui/ui_preferences.dart';
import 'package:flutteryomi/presentation/components/app_bar.dart';
import 'package:flutteryomi/presentation/components/date_text.dart';
import 'package:flutteryomi/presentation/components/list_group_header.dart';
import 'package:flutteryomi/presentation/manga/components/chapter_download_indicator.dart';
import 'package:flutteryomi/presentation/manga/components/manga_bottom_action_menu.dart';
import 'package:flutteryomi/presentation/screens/empty_screen.dart';
import 'package:flutteryomi/presentation/screens/loading_screen.dart';
import 'package:flutteryomi/presentation/updates/updates_dialog.dart';
import 'package:flutteryomi/presentation/updates/updates_ui_item.dart';
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
      appBar: _UpdatesAppBar(
        onUpdateLibrary: screenModel.updateLibrary,
        actionModeCounter:
            state.unwrapPrevious().valueOrNull?.selected.length ?? 0,
        onSelectAll: () => screenModel.toggleAllSelection(true),
        onInvertSelection: screenModel.invertSelection,
        onCancelActionMode: () => screenModel.toggleAllSelection(false),
      ),
      body: state.when(
        loading: () => const LoadingScreen(),
        // TODO: Error handling
        error: (error, stackTrace) {
          debugPrintStack(
            label: error.toString(),
            stackTrace: stackTrace,
          );
          return const LoadingScreen();
        },
        data: (data) => data.items.isEmpty
            ? EmptyScreen(message: lang.information_no_recent)
            : UpdatesScreenContent(
                state: data,
                lastUpdated: data.lastUpdated,
                onClickCover: (item) {
                  //TODO
                  //Navigator.push(
                  //  context,
                  //  MaterialPageRoute(
                  //    builder: (context) => MangaScreen(item.update.mangaId),
                  //  ),
                  //);
                },
                onUpdateLibrary: screenModel.updateLibrary,
                onDownloadChapter: screenModel.downloadChapters,
                onUpdateSelected: screenModel.toggleSelection,
                // TODO
                onOpenChapter: (item) {},
              ),
      ),
      bottomNavigationBar: _UpdatesBottomBar(
        selected: state.unwrapPrevious().valueOrNull?.selected.toList() ?? [],
        onDownloadChapter: (items, action) =>
            screenModel.downloadChapters(items, action),
        onMultiBookmarkClicked: screenModel.bookmarkUpdates,
        onMultiMarkAsReadClicked: screenModel.markUpdatesRead,
        onMultiDeleteClicked: (updatesItem) => showDialog(
          context: context,
          builder: (context) => UpdatesDeleteConfirmationDialog(
            onConfirm: () => screenModel.deleteChapters(updatesItem),
          ),
        ),
      ),
    );
  }
}

class UpdatesScreenContent extends ConsumerWidget {
  const UpdatesScreenContent({
    super.key,
    required this.state,
    required this.lastUpdated,
    required this.onClickCover,
    required this.onUpdateLibrary,
    required this.onDownloadChapter,
    required this.onUpdateSelected,
    required this.onOpenChapter,
  });

  final UpdatesScreenState state;
  final DateTime lastUpdated;
  final ValueChanged<UpdatesItem> onClickCover;
  final bool Function() onUpdateLibrary;
  final Function(List<UpdatesItem>, ChapterDownloadAction) onDownloadChapter;
  final Function(UpdatesItem, bool, bool, bool) onUpdateSelected;
  final ValueChanged<UpdatesItem> onOpenChapter;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final lang = AppLocalizations.of(context);
    final preferences = ref.watch(uiPreferencesProvider);
    final relativeTime = preferences.relativeTime().get();
    final dateFormat = preferences.dateFormat().get();

    final uiModels = state.getUiModel();
    final selectionMode = state.selectionMode;
    final onClickUpdate = onOpenChapter;
    return RefreshIndicator.adaptive(
      onRefresh: () async => onUpdateLibrary(),
      notificationPredicate: !state.selectionMode ? (_) => true : (_) => false,
      child: ListView.builder(
        itemCount: uiModels.length + 1,
        itemBuilder: (_, index) {
          if (index == 0) {
            return UpdatesLastUpdatedItem(
              key: const Key('updates-lastUpdated'),
              lastUpdated: lastUpdated,
            );
          }
          final item = uiModels[index - 1];
          return switch (item) {
            Header() => ListGroupHeader(
                relativeDateText(
                  context: context,
                  date: item.date,
                  relativeTime: relativeTime,
                  dateFormat: dateFormat,
                ),
                key: Key('updates-${item.hashCode}'),
              ),
            Item() => UpdatesUiItem(
                key: Key(
                  'updates-${item.item.update.mangaId}-${item.item.update.chapterId}',
                ),
                update: item.item.update,
                selected: item.item.selected,
                readProgress: (!item.item.update.read &&
                        item.item.update.lastPageRead > 0)
                    ? lang.chapter_progress(item.item.update.lastPageRead + 1)
                    : null,
                onLongClick: () {
                  onUpdateSelected(item.item, !item.item.selected, true, true);
                },
                onClick: () => selectionMode
                    ? onUpdateSelected(
                        item.item, !item.item.selected, true, false)
                    : onClickUpdate(item.item),
                onClickCover: !selectionMode //
                    ? () => onClickCover(item.item)
                    : null,
                onDownloadChapter: !selectionMode
                    ? (action) => onDownloadChapter([item.item], action)
                    : null,
                downloadStateProvider: item.item.downloadStateProvider,
                downloadProgressProvider: item.item.downloadProgressProvider,
              ),
          };
        },
      ),
    );
  }
}

class _UpdatesAppBar extends StatelessWidget implements PreferredSizeWidget {
  const _UpdatesAppBar({
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
  final void Function(List<UpdatesItem>, ChapterDownloadAction)
      onDownloadChapter;
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
      onMarkAsUnreadClicked: selected.any(
        (it) => it.update.read || it.update.lastPageRead > 0,
      )
          ? () => onMultiMarkAsReadClicked(selected, false)
          : null,
      onDownloadClicked: selected.any(
        (it) => it.downloadStateProvider() != DownloadState.downloaded,
      )
          ? () => onDownloadChapter(selected, ChapterDownloadAction.start)
          : null,
      onDeleteClicked: selected.any(
        (it) => it.downloadStateProvider() == DownloadState.downloaded,
      )
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
