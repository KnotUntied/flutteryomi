import 'dart:collection';

import 'package:dartx/dartx_io.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:flutteryomi/core/util/system/logger.dart';
import 'package:flutteryomi/domain/source/interactor/get_enabled_sources.dart';
import 'package:flutteryomi/domain/source/interactor/toggle_source.dart';
import 'package:flutteryomi/domain/source/interactor/toggle_source_pin.dart';
import 'package:flutteryomi/domain/source/model/domain_source.dart';
import 'package:flutteryomi/domain/source/model/pin.dart';
import 'package:flutteryomi/presentation/browse/source/sources.dart';

part 'sources_screen_model.freezed.dart';
part 'sources_screen_model.g.dart';

@riverpod
class SourcesScreenModel extends _$SourcesScreenModel {
  @override
  Stream<SourcesScreenState> build({
    required int mangaId,
    required bool isFromSource,
  }) {
    final getEnabledSources = ref.watch(getEnabledSourcesProvider);
    final logger = ref.watch(loggerProvider);
    return getEnabledSources.subscribe().handleError((it) {
      logger.e(it);
      //_events.send(Event.FailedFetchingSources)
    }).asyncMap(_collectLatestSources);
  }

  SourcesScreenState _collectLatestSources(List<Source> sources) {
    final map = SplayTreeMap<String, List<Source>>(
      (d1, d2) {
        // Sources without a lang defined will be placed at the end
        if (d1 == lastUsedKey && d2 != lastUsedKey) {
          return -1;
        } else if (d2 == lastUsedKey && d1 != lastUsedKey) {
          return 1;
        } else if (d1 == pinnedKey && d2 != pinnedKey) {
          return -1;
        } else if (d2 == pinnedKey && d1 != pinnedKey) {
          return 1;
        } else if (d1 == "" && d2 != "") {
          return 1;
        } else if (d2 == "" && d1 != "") {
          return -1;
        } else {
          return d1.compareTo(d2);
        }
      },
    );
    final byLang = map
      ..addAll(
        sources.groupBy((it) {
          if (it.isUsedLast) {
            return lastUsedKey;
          } else if (it.pin.contains(Pin.actual)) {
            return pinnedKey;
          } else {
            return it.lang;
          }
        }),
      );
    return SourcesScreenState(
      items: byLang
          .toList()
          .flatMap((it) => [
                SourceUiModelHeader(it.first),
                ...it.second.map((source) => SourceUiModelItem(source)),
              ])
          .toList(),
    );
  }

  Future<void> toggleSource(Source source) async {
    final toggleSourceInteractor = ref.watch(toggleSourceProvider);
    await toggleSourceInteractor.await_(source);
  }

  Future<void> togglePin(Source source) async {
    final toggleSourcePin = ref.watch(toggleSourcePinProvider);
    await toggleSourcePin.await_(source);
  }

  static const pinnedKey = 'pinned';
  static const lastUsedKey = 'last_used';
}

@freezed
class SourcesScreenState with _$SourcesScreenState {
  const SourcesScreenState._();
  const factory SourcesScreenState({
    required List<SourceUiModel> items,
  }) = _SourcesScreenState;

  bool get isEmpty => items.isEmpty;
}
