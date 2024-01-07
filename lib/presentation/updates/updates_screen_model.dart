import 'dart:collection';

import 'package:collection/collection.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:flutteryomi/core/util/collection_utils.dart';
import 'package:flutteryomi/domain/library/service/library_preferences.dart';
import 'package:flutteryomi/domain/updates/interactor/get_updates.dart';
import 'package:flutteryomi/domain/updates/model/updates_with_relations.dart';
import 'package:flutteryomi/presentation/updates/updates.dart';
import 'package:flutteryomi/presentation/util/lang/date_extensions.dart';

part 'updates_screen_model.freezed.dart';
part 'updates_screen_model.g.dart';

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
    //return getUpdates //
    //    .subscribe(limit)
    //    .distinct();
  }

  // TODO: Forward messages to toast/snackbar
  //Future<void> removeFromHistory(HistoryWithRelations history) async {
  //  final removeHistory = ref.watch(removeHistoryProvider);
  //  await AsyncValue.guard(() => removeHistory.await_(history));
  //}

  //Future<void> removeAllFromHistory(int mangaId) async {
  //  final removeHistory = ref.watch(removeHistoryProvider);
  //  await AsyncValue.guard(() => removeHistory.awaitById(mangaId));
  //}

  //Future<void> removeAllHistory() async {
  //  final removeHistory = ref.watch(removeHistoryProvider);
  //  await AsyncValue.guard(() => removeHistory.awaitAll());
  //}

  //Future<void> updateSearchQuery(String? query) async {
  //  state = const AsyncValue.loading();
  //  state = await AsyncValue.guard(
  //    () async => UpdatesScreenState(
  //      searchQuery: query,
  //      list: state.value?.list,
  //    ),
  //  );
  //}

  Future<void> invertSelection() async {
    final previousState = state.valueOrNull;
    final newSelectedChapterIds = previousState?.selectedChapterIds;
    final newItems = previousState?.items.map((it) {
      newSelectedChapterIds?.addOrRemove(it.update.chapterId, !it.selected);
      return it.copyWith(selected: !it.selected);
    }).toList();
    final newState = previousState?.copyWith(
      items: newItems!,
      selectedPositions: [-1, -1],
      selectedChapterIds: newSelectedChapterIds!,
    );
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async => newState!);
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

//extension _UpdatesWithRelationsToUpdateItems on List<UpdatesWithRelations> {
//  List<UpdatesItem> toUpdateItems(HashSet<int> selectedChapterIds) =>
//      this.map((update) {
//        // TODO: Fetch downloads
//        return UpdatesItem(
//          update: update,
//          selected: selectedChapterIds.contains(update.chapterId),
//        );
//      }).toList();
//}
