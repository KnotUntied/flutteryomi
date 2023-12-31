import 'dart:collection';

import 'package:dartx/dartx.dart';
import 'package:drift/drift.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:flutteryomi/core/util/collection_utils.dart';
import 'package:flutteryomi/domain/chapter/interactor/get_chapter.dart';
import 'package:flutteryomi/domain/chapter/interactor/set_read_status.dart';
import 'package:flutteryomi/domain/chapter/interactor/update_chapter.dart';
import 'package:flutteryomi/domain/chapter/model/chapter_update.dart';
import 'package:flutteryomi/domain/download/model/download_manager.dart';
import 'package:flutteryomi/domain/library/service/library_preferences.dart';
import 'package:flutteryomi/domain/manga/interactor/get_manga.dart';
import 'package:flutteryomi/domain/source/service/source_manager.dart';
import 'package:flutteryomi/domain/updates/interactor/get_updates.dart';
import 'package:flutteryomi/domain/updates/model/updates_with_relations.dart';
import 'package:flutteryomi/presentation/updates/updates.dart';
import 'package:flutteryomi/presentation/util/lang/date_extensions.dart';

part 'updates_screen_model.freezed.dart';
part 'updates_screen_model.g.dart';

//TODO
@riverpod
class UpdatesScreenModel extends _$UpdatesScreenModel {
  @override
  Stream<UpdatesScreenState> build() {
    final libraryPreferences = ref.watch(libraryPreferencesProvider);
    final lastUpdated = DateTime.fromMillisecondsSinceEpoch(
      libraryPreferences.lastUpdatedTimestamp().get(),
    );
    final limit = DateTime.now().subtract(const Duration(days: 90));
    final getUpdates = ref.watch(getUpdatesProvider);
    // TODO: Combine with download streams
    return getUpdates //
        .subscribe(limit)
        .distinct()
        .map((it) => UpdatesScreenState(items: [], lastUpdated: lastUpdated));
  }

  // TODO: Forward messages to toast/snackbar

  bool updateLibrary() {
    return true;
    //final started = LibraryUpdateJob.startNow(Injekt.get<Application>())
    //screenModelScope.launch {
    //    _events.send(Event.LibraryUpdateTriggered(started))
    //}
    //return started;
  }

  /// Update [download] status of chapters.
  //Future<void> _updateDownloadState(Download download) {
  //  mutableState.update { state ->
  //    final newItems = state.items.mutate { list ->
  //      val modifiedIndex = list.indexOfFirst { it.update.chapterId == download.chapter.id }
  //      if (modifiedIndex < 0) return@mutate

  //      val item = list[modifiedIndex]
  //      list[modifiedIndex] = item.copy(
  //        downloadStateProvider = { download.status },
  //        downloadProgressProvider = { download.progress },
  //      )
  //    }
  //    state.copyWith(items: newItems);
  //  }
  //}

  //Future<void> downloadChapters(List<UpdatesItem> items, ChapterDownloadAction action) async {
  //  if (items.isEmpty) return;
  //  switch (action) {
  //    ChapterDownloadAction.start => {
  //      await _downloadChapters(items);
  //      if (items.any((it) => it.downloadStateProvider() == DownloadState.error)) {
  //        downloadManager.startDownloads();
  //      }
  //    },
  //    ChapterDownloadAction.startNow => {
  //      final chapterId = items.singleOrNull()?.update?.chapterId;
  //      if (chapterId == null) return;
  //      await startDownloadingNow(chapterId);
  //    },
  //    ChapterDownloadAction.cancel => {
  //      final chapterId = items.singleOrNull()?.update?.chapterId;
  //      if (chapterId == null) return;
  //      await cancelDownload(chapterId);
  //    },
  //    ChapterDownloadAction.delete => await deleteChapters(items),
  //  };
  //  await toggleAllSelection(false);
  //}

  Future<void> _startDownloadingNow(int chapterId) async {
    //await downloadManager.startDownloadNow(chapterId);
  }

  Future<void> _cancelDownload(int chapterId) async {
    //final activeDownload = downloadManager.getQueuedDownloadOrNull(chapterId);
    //if (activeDownload == null) return;
    //downloadManager.cancelQueuedDownloads(listOf(activeDownload));
    //updateDownloadState(activeDownload.apply { status = DownloadState.notDownloaded });
  }

  //TODO
  /// Mark the selected [updates] list as [read]/unread.
  Future<void> markUpdatesRead(List<UpdatesItem> updates, bool read) async {
    //final setReadStatus = ref.watch(setReadStatusProvider);
    //await setReadStatus.await_(
    //  read: read,
    //  chapters: updates
    //      .mapNotNull((it) async => await getChapter.await_(it.update.chapterId))
    //);
    await toggleAllSelection(false);
  }

  /// Bookmarks the given list of chapters [updates].
  Future<void> bookmarkUpdates(List<UpdatesItem> updates, bool bookmark) async {
    final updateChapter = ref.watch(updateChapterProvider);
    final chapterUpdates = updates
        .filterNot((it) => it.update.bookmark == bookmark)
        .map((it) => ChapterUpdate(
            id: Value(it.update.chapterId), bookmark: Value(bookmark)))
        .toList();
    await updateChapter.awaitAll(chapterUpdates);
    await toggleAllSelection(false);
  }

  /// Downloads the given list of chapters [updatesItem] with the manager.
  Future<void> _downloadChapters(List<UpdatesItem> updatesItem) async {
    final getManga = ref.watch(getMangaProvider);
    final sourceManager = ref.watch(sourceManagerProvider);
    final getChapter = ref.watch(getChapterProvider);
    final downloadManager = ref.watch(downloadManagerProvider);
    final groupedUpdates =
        updatesItem.groupBy((it) => it.update.mangaId).values;
    for (final updates in groupedUpdates) {
      final mangaId = updates.first.update.mangaId;
      final manga = await getManga.await_(mangaId);
      if (manga == null) continue;
      // Don't download if source isn't available
      //TODO
      //final source = await sourceManager.get(manga.source);
      //if (source == null) continue;
      //final chapters = updates
      //    .mapNotNull((it) async => await getChapter.await_(it.update.chapterId)).toList();
      //TODO
      //downloadManager.downloadChapters(manga, chapters);
    }
  }

  /// Delete selected chapters [updatesItem]
  Future<void> deleteChapters(List<UpdatesItem> updatesItem) async {
    final getManga = ref.watch(getMangaProvider);
    final sourceManager = ref.watch(sourceManagerProvider);
    final getChapter = ref.watch(getChapterProvider);
    //final downloadManager = ref.watch(downloadManagerProvider);
    final updateEntries = updatesItem //
        .groupBy((it) => it.update.mangaId)
        .entries;
    for (final entry in updateEntries) {
      final mangaId = entry.key;
      final updates = entry.value;
      final manga = await getManga.await_(mangaId);
      if (manga != null) {
        //final source = await sourceManager.get(manga.source);
        //if (source != null) {
        //  final chapters = updates.mapNotNull((it) async => await getChapter.await_(it.update.chapterId));
        //  //TODO
        //  await downloadManager.deleteChapters(chapters, manga, source);
        //}
      }
    }
    await toggleAllSelection(false);
  }

  Future<void> toggleSelection(
    UpdatesItem item,
    bool selected, [
    bool userSelected = false,
    bool fromLongPress = false,
  ]) async {
    final previousState = state.valueOrNull;
    if (previousState != null) {
      final newState = _applyToggleSelection(
        previousState.copyWith(),
        item,
        selected,
        userSelected,
        fromLongPress,
      );
      state = const AsyncValue.loading();
      state = await AsyncValue.guard(() async => newState);
    }
  }

  // No scope functions in Dart, e.g., apply. Make do with extra function :(
  UpdatesScreenState _applyToggleSelection(
    UpdatesScreenState state,
    UpdatesItem item,
    bool selected,
    bool userSelected,
    bool fromLongPress,
  ) {
    final selectedIndex = state.items
        .indexWhere((it) => it.update.chapterId == item.update.chapterId);
    if (selectedIndex < 0) return state;

    final selectedItem = state.items[selectedIndex];
    if (selectedItem.selected == selected) return state;

    // Mutables
    final items = state.items.toList();
    final selectedPositions = state.selectedPositions.toList(growable: false);
    final selectedChapterIds = HashSet.of(state.selectedChapterIds);

    final firstSelection = items.none((it) => it.selected);
    items[selectedIndex] = selectedItem.copyWith(selected: selected);
    selectedChapterIds.addOrRemove(item.update.chapterId, selected);

    if (selected && userSelected && fromLongPress) {
      if (firstSelection) {
        selectedPositions[0] = selectedIndex;
        selectedPositions[1] = selectedIndex;
      } else {
        // Try to select the items in-between when possible
        IntRange range;
        if (selectedIndex < selectedPositions[0]) {
          range = IntRange(selectedIndex + 1, selectedPositions[0]);
          selectedPositions[0] = selectedIndex;
        } else if (selectedIndex > selectedPositions[1]) {
          range = IntRange(selectedPositions[1] + 1, selectedIndex);
          selectedPositions[1] = selectedIndex;
        } else {
          // Just select itself
          range = IntRange(0, -1);
        }

        for (final it in range) {
          final inbetweenItem = items[it];
          if (!inbetweenItem.selected) {
            selectedChapterIds.add(inbetweenItem.update.chapterId);
            items[it] = inbetweenItem.copyWith(selected: true);
          }
        }
      }
    } else if (userSelected && !fromLongPress) {
      if (!selected) {
        if (selectedIndex == selectedPositions[0]) {
          selectedPositions[0] = items.indexWhere((it) => it.selected);
        } else if (selectedIndex == selectedPositions[1]) {
          selectedPositions[1] = items.lastIndexWhere((it) => it.selected);
        }
      } else {
        if (selectedIndex < selectedPositions[0]) {
          selectedPositions[0] = selectedIndex;
        } else if (selectedIndex > selectedPositions[1]) {
          selectedPositions[1] = selectedIndex;
        }
      }
    }
    return state.copyWith(
      items: items,
      selectedPositions: selectedPositions,
      selectedChapterIds: selectedChapterIds,
    );
  }

  Future<void> toggleAllSelection(bool selected) async {
    final previousState = state.valueOrNull;
    if (previousState != null) {
      final newSelectedChapterIds =
          HashSet.of(previousState.selectedChapterIds);
      final newItems = previousState.items.map((it) {
        newSelectedChapterIds.addOrRemove(it.update.chapterId, selected);
        return it.copyWith(selected: selected);
      }).toList();
      final newState = previousState.copyWith(
        items: newItems,
        selectedPositions: [-1, -1],
        selectedChapterIds: newSelectedChapterIds,
      );
      state = const AsyncValue.loading();
      state = await AsyncValue.guard(() async => newState);
    }
  }

  Future<void> invertSelection() async {
    final previousState = state.valueOrNull;
    if (previousState != null) {
      final newSelectedChapterIds =
          HashSet.of(previousState.selectedChapterIds);
      final newItems = previousState.items.map((it) {
        newSelectedChapterIds.addOrRemove(it.update.chapterId, !it.selected);
        return it.copyWith(selected: !it.selected);
      }).toList();
      final newState = previousState.copyWith(
        items: newItems,
        selectedPositions: [-1, -1],
        selectedChapterIds: newSelectedChapterIds,
      );
      state = const AsyncValue.loading();
      state = await AsyncValue.guard(() async => newState);
    }
  }

  void resetNewUpdatesCount() {
    final libraryPreferences = ref.watch(libraryPreferencesProvider);
    libraryPreferences.newUpdatesCount().set(0);
  }
}

@freezed
class UpdatesScreenState with _$UpdatesScreenState {
  UpdatesScreenState._();
  factory UpdatesScreenState.def({
    required List<UpdatesItem> items,
    required DateTime lastUpdated,
    required List<int> selectedPositions,
    required HashSet<int> selectedChapterIds,
  }) = _UpdatesScreenState;
  factory UpdatesScreenState({
    required List<UpdatesItem> items,
    required DateTime lastUpdated,
    List<int>? selectedPositions,
    HashSet<int>? selectedChapterIds,
  }) {
    return _UpdatesScreenState(
      items: items,
      lastUpdated: lastUpdated,
      selectedPositions: selectedPositions ?? [-1, -1],
      selectedChapterIds: selectedChapterIds ?? HashSet(),
    );
  }

  late final selected = items.where((it) => it.selected);
  late final selectionMode = selected.isNotEmpty;

  List<UpdatesUiModel> getUiModel() => items
      .map((it) => UpdatesUiModel.item(it))
      .toList()
      .insertSeparators((before, after) {
        final beforeDate = (before as Item?)?.item.update.dateFetch.dateOnly ??
            DateTime.fromMillisecondsSinceEpoch(0);
        final afterDate = (after as Item?)?.item.update.dateFetch.dateOnly ??
            DateTime.fromMillisecondsSinceEpoch(0);
        if (beforeDate.millisecondsSinceEpoch !=
                afterDate.millisecondsSinceEpoch &&
            afterDate.millisecondsSinceEpoch != 0) {
          return UpdatesUiModel.header(afterDate);
        } else {
          return null;
        }
      })
      .whereNotNull()
      .toList();
}

@freezed
class UpdatesItem with _$UpdatesItem {
  const factory UpdatesItem({
    required UpdatesWithRelations update,
    //TODO
    //DownloadState Function() downloadStateProvider,
    //int Function() downloadProgressProvider,
    @Default(false) bool selected,
  }) = _UpdatesItem;
}

extension _UpdatesWithRelationsToUpdateItems on List<UpdatesWithRelations> {
  List<UpdatesItem> toUpdateItems(HashSet<int> selectedChapterIds) =>
      map((update) {
        // TODO: Fetch downloads
        //final activeDownload = downloadManager.getQueuedDownloadOrNull(update.chapterId);
        //final downloaded = downloadManager.isChapterDownloaded(
        //  update.chapterName,
        //  update.scanlator,
        //  update.mangaTitle,
        //  update.sourceId,
        //);
        //var downloadState;
        //final downloadState = when {
        //  activeDownload != null -> activeDownload.status
        //  downloaded -> Download.State.DOWNLOADED
        //  else -> Download.State.NOT_DOWNLOADED
        //};
        return UpdatesItem(
          update: update,
          selected: selectedChapterIds.contains(update.chapterId),
        );
      }).toList();
}
