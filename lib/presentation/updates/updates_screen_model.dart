import 'dart:collection';

import 'package:dartx/dartx.dart';
// Alias to prevent conflict with Freezed
import 'package:drift/drift.dart' as drift;
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:flutteryomi/core/util/collection_utils.dart';
import 'package:flutteryomi/domain/chapter/interactor/get_chapter.dart';
import 'package:flutteryomi/domain/chapter/interactor/set_read_status.dart';
import 'package:flutteryomi/domain/chapter/interactor/update_chapter.dart';
import 'package:flutteryomi/domain/chapter/model/chapter_update.dart';
import 'package:flutteryomi/domain/download/model/download.dart';
import 'package:flutteryomi/domain/download/download_manager.dart';
import 'package:flutteryomi/domain/library/service/library_preferences.dart';
import 'package:flutteryomi/domain/manga/interactor/get_manga.dart';
import 'package:flutteryomi/domain/source/service/source_manager.dart';
import 'package:flutteryomi/domain/updates/interactor/get_updates.dart';
import 'package:flutteryomi/domain/updates/model/updates_with_relations.dart';
import 'package:flutteryomi/presentation/manga/components/chapter_download_indicator.dart';
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
        .map((it) => UpdatesScreenState(
              items: const [],
              lastUpdated: lastUpdated,
              selectedChapterIds: HashSet(),
            ));
  }

  // TODO: Forward messages to toast/snackbar

  //TODO
  bool updateLibrary() {
    return true;
    //final started = LibraryUpdateJob.startNow(Injekt.get<Application>())
    //screenModelScope.launch {
    //    _events.send(Event.LibraryUpdateTriggered(started))
    //}
    //return started;
  }

  /// Update [download] status of chapters.
  Future<void> _updateDownloadState(Download download) async {
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
  }

  Future<void> downloadChapters(
      List<UpdatesItem> items, ChapterDownloadAction action) async {
    if (items.isEmpty) return;
    final downloadManager = ref.watch(downloadManagerProvider);
    if (action == ChapterDownloadAction.start) {
      await _downloadChapters(items);
      if (items
          .any((it) => it.downloadStateProvider() == DownloadState.error)) {
        downloadManager.startDownloads();
      }
    } else if (action == ChapterDownloadAction.startNow) {
      final chapterId = items.singleOrNull?.update.chapterId;
      if (chapterId == null) return;
      _startDownloadingNow(chapterId);
    } else if (action == ChapterDownloadAction.cancel) {
      final chapterId = items.singleOrNull?.update.chapterId;
      if (chapterId == null) return;
      await _cancelDownload(chapterId);
    } else if (action == ChapterDownloadAction.delete) {
      await deleteChapters(items);
    }
    await toggleAllSelection(false);
  }

  //TODO
  void _startDownloadingNow(int chapterId) {
    final downloadManager = ref.watch(downloadManagerProvider);
    downloadManager.startDownloadNow(chapterId);
  }

  //TODO
  Future<void> _cancelDownload(int chapterId) async {
    final downloadManager = ref.watch(downloadManagerProvider);
    final activeDownload = downloadManager.getQueuedDownloadOrNull(chapterId);
    if (activeDownload == null) return;
    //downloadManager.cancelQueuedDownloads([activeDownload]);
    //updateDownloadState(activeDownload.apply { status = DownloadState.notDownloaded });
  }

  //TODO
  /// Mark the selected [updates] list as [read]/unread.
  Future<void> markUpdatesRead(List<UpdatesItem> updates, bool read) async {
    final setReadStatus = ref.watch(setReadStatusProvider);
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
        .map(
          (it) => ChapterUpdate(
            id: drift.Value(it.update.chapterId),
            bookmark: drift.Value(bookmark),
          ),
        )
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
      final source = await sourceManager.get(manga.source);
      if (source == null) continue;
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
    final downloadManager = ref.watch(downloadManagerProvider);
    final updateEntries = updatesItem //
        .groupBy((it) => it.update.mangaId)
        .entries;
    for (final entry in updateEntries) {
      final mangaId = entry.key;
      final updates = entry.value;
      final manga = await getManga.await_(mangaId);
      if (manga != null) {
        final source = await sourceManager.get(manga.source);
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

class UpdatesScreenState extends Equatable {
  UpdatesScreenState({
    required this.items,
    required this.lastUpdated,
    this.selectedPositions = const [-1, -1],
    // Can't use HashSet as a default param :(
    required this.selectedChapterIds,
  });

  final List<UpdatesItem> items;
  final DateTime lastUpdated;
  final List<int> selectedPositions;
  final HashSet<int> selectedChapterIds;

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

  @override
  List<Object?> get props =>
      [items, lastUpdated, selectedPositions, selectedChapterIds];

  UpdatesScreenState copyWith({
    List<UpdatesItem>? items,
    DateTime? lastUpdated,
    List<int>? selectedPositions,
    HashSet<int>? selectedChapterIds,
  }) =>
      UpdatesScreenState(
        items: items ?? this.items,
        lastUpdated: lastUpdated ?? this.lastUpdated,
        selectedPositions: selectedPositions ?? this.selectedPositions,
        selectedChapterIds: selectedChapterIds ?? this.selectedChapterIds,
      );
}

@freezed
class UpdatesItem with _$UpdatesItem {
  const factory UpdatesItem({
    required UpdatesWithRelations update,
    required DownloadState Function() downloadStateProvider,
    required int Function() downloadProgressProvider,
    @Default(false) bool selected,
  }) = _UpdatesItem;
}

extension _UpdatesWithRelationsToUpdateItems on List<UpdatesWithRelations> {
  List<UpdatesItem> toUpdateItems(
    DownloadManager downloadManager,
    HashSet<int> selectedChapterIds,
  ) =>
      map((update) {
        final activeDownload =
            downloadManager.getQueuedDownloadOrNull(update.chapterId);
        final downloaded = downloadManager.isChapterDownloaded(
          update.chapterName,
          update.scanlator,
          update.mangaTitle,
          update.sourceId,
        );
        DownloadState downloadState;
        if (activeDownload != null) {
          downloadState = activeDownload.status;
        } else if (downloaded) {
          downloadState = DownloadState.downloaded;
        } else {
          downloadState = DownloadState.notDownloaded;
        }
        return UpdatesItem(
          update: update,
          downloadStateProvider: () => downloadState,
          downloadProgressProvider: () => activeDownload?.progress ?? 0,
          selected: selectedChapterIds.contains(update.chapterId),
        );
      }).toList();
}
