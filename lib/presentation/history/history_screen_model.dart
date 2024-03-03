import 'dart:async';

import 'package:collection/collection.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:flutteryomi/core/util/collection_utils.dart';
import 'package:flutteryomi/domain/chapter/model/chapter.dart';
import 'package:flutteryomi/domain/history/interactor/get_history.dart';
import 'package:flutteryomi/domain/history/interactor/get_next_chapters.dart';
import 'package:flutteryomi/domain/history/interactor/remove_history.dart';
import 'package:flutteryomi/domain/history/model/history_with_relations.dart';
import 'package:flutteryomi/presentation/history/history.dart';
import 'package:flutteryomi/presentation/util/lang/date_extensions.dart';

part 'history_screen_model.freezed.dart';
part 'history_screen_model.g.dart';

@riverpod
class HistoryScreenModel extends _$HistoryScreenModel {
  @override
  Stream<HistoryScreenState> build() {
    final getHistory = ref.watch(getHistoryProvider);
    final query = state.valueOrNull?.searchQuery;
    return getHistory //
        .subscribe(query ?? '')
        .map((item) => HistoryScreenState(
              searchQuery: query,
              list: item.toHistoryUiModels(),
            ));
  }

  Future<Chapter?> getNextChapter() async {
    final getNextChapters = ref.watch(getNextChaptersProvider);
    final chapters = await getNextChapters.await_(onlyUnread: false);
    return chapters.firstOrNull;
  }

  // TODO: Forward messages to toast/snackbar
  void removeFromHistory(HistoryWithRelations history) async {
    final removeHistory = ref.watch(removeHistoryProvider);
    await AsyncValue.guard(() => removeHistory.await_(history));
  }

  void removeAllFromHistory(int mangaId) async {
    final removeHistory = ref.watch(removeHistoryProvider);
    await AsyncValue.guard(() => removeHistory.awaitById(mangaId));
  }

  void removeAllHistory() async {
    final removeHistory = ref.watch(removeHistoryProvider);
    await AsyncValue.guard(() => removeHistory.awaitAll());
  }

  void updateSearchQuery(String? query) async {
    state = await AsyncValue.guard(
      () async => HistoryScreenState(
        searchQuery: query,
        list: state.value?.list,
      ),
    );
  }
}

@freezed
class HistoryScreenState with _$HistoryScreenState {
  const factory HistoryScreenState({
    String? searchQuery,
    List<HistoryUiModel>? list,
  }) = _HistoryScreenState;
}

extension HistoryWithRelationsToHistoryUiModel on List<HistoryWithRelations> {
  List<HistoryUiModel> toHistoryUiModels() =>
      map((it) => HistoryUiModel.item(it))
          .insertSeparators(insertHistorySeparators)
          .whereNotNull()
          .toList();

  HistoryUiModel? insertHistorySeparators(
    HistoryUiModel? before,
    HistoryUiModel? after,
  ) {
    final beforeDate = (before as Item?)?.item.readAt?.dateOnly ??
        DateTime.fromMillisecondsSinceEpoch(0, isUtc: true);
    final afterDate = (after as Item?)?.item.readAt?.dateOnly ??
        DateTime.fromMillisecondsSinceEpoch(0, isUtc: true);
    if (beforeDate.millisecondsSinceEpoch != afterDate.millisecondsSinceEpoch &&
        afterDate.millisecondsSinceEpoch != 0) {
      return HistoryUiModel.header(afterDate);
    }
    // Return null to avoid adding a separator between two items.
    return null;
  }
}
