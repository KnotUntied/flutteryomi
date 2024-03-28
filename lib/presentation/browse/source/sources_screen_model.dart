import 'package:async/async.dart';
import 'package:collection/collection.dart';
import 'package:dartx/dartx.dart'
    hide
        IterableFirstOrNull,
        IterableNone,
        IterableWhereNot,
        IterableWhereNotNull;
// Alias to prevent conflict with Freezed
import 'package:drift/drift.dart' as drift;
import 'package:flutter/widgets.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:rxdart/rxdart.dart';

import 'package:flutteryomi/core/preference/tri_state.dart';
import 'package:flutteryomi/core/util/collection_utils.dart';
import 'package:flutteryomi/core/util/system/logger.dart';
import 'package:flutteryomi/data/track/tracker_manager.dart';
import 'package:flutteryomi/domain/category/interactor/get_categories.dart';
import 'package:flutteryomi/domain/category/interactor/set_manga_categories.dart';
import 'package:flutteryomi/domain/category/model/category.dart';
import 'package:flutteryomi/domain/chapter/interactor/get_available_scanlators.dart';
import 'package:flutteryomi/domain/chapter/interactor/set_manga_default_chapter_flags.dart';
import 'package:flutteryomi/domain/chapter/interactor/set_read_status.dart';
import 'package:flutteryomi/domain/chapter/interactor/sync_chapters_with_source.dart';
import 'package:flutteryomi/domain/chapter/interactor/update_chapter.dart';
import 'package:flutteryomi/domain/chapter/model/chapter.dart';
import 'package:flutteryomi/domain/chapter/model/chapter_update.dart';
import 'package:flutteryomi/domain/chapter/service/chapter_sort.dart';
import 'package:flutteryomi/domain/chapter/service/missing_chapters.dart';
import 'package:flutteryomi/domain/download/download_manager.dart';
import 'package:flutteryomi/domain/download/model/download.dart';
import 'package:flutteryomi/domain/download/service/download_preferences.dart';
import 'package:flutteryomi/domain/library/service/library_preferences.dart';
import 'package:flutteryomi/domain/manga/interactor/fetch_interval.dart';
import 'package:flutteryomi/domain/manga/interactor/get_duplicate_library_manga.dart';
import 'package:flutteryomi/domain/manga/interactor/get_excluded_scanlators.dart';
import 'package:flutteryomi/domain/manga/interactor/get_manga_with_chapters.dart';
import 'package:flutteryomi/domain/manga/interactor/set_excluded_scanlators.dart';
import 'package:flutteryomi/domain/manga/interactor/set_manga_chapter_flags.dart';
import 'package:flutteryomi/domain/manga/interactor/update_manga.dart';
import 'package:flutteryomi/domain/manga/model/manga.dart';
import 'package:flutteryomi/domain/manga/model/tri_state.dart';
import 'package:flutteryomi/domain/manga/repository/manga_repository.dart';
import 'package:flutteryomi/domain/source/service/source_manager.dart';
import 'package:flutteryomi/domain/track/interactor/add_tracks.dart';
import 'package:flutteryomi/domain/track/interactor/get_tracks.dart';
import 'package:flutteryomi/domain/track/model/track_item.dart';
import 'package:flutteryomi/presentation/browse/source/sources.dart';
import 'package:flutteryomi/presentation/manga/components/chapter_download_indicator.dart';
import 'package:flutteryomi/presentation/manga/manga_screen_constants.dart';
import 'package:flutteryomi/source/api/source.dart';
import 'package:flutteryomi/source/local/local_source.dart';

part 'sources_screen_model.freezed.dart';
part 'sources_screen_model.g.dart';

@riverpod
class SourcesScreenModel extends _$SourcesScreenModel {
  @override
  Stream<SourcesScreenState> build({
    required int mangaId,
    required bool isFromSource,
  }) {
    //final getEnabledSources = ref.watch(getEnabledSourcesProvider);
    //final logger = ref.watch(loggerProvider);
    return const Stream.empty();
  }

  //void _collectLatestSources(List<Source> sources) {
  //  mutableState.update { state ->
  //    val map = TreeMap<String, MutableList<Source>> { d1, d2 ->
  //        // Sources without a lang defined will be placed at the end
  //        when {
  //            d1 == lastUsedKey && d2 != lastUsedKey -> -1
  //            d2 == lastUsedKey && d1 != lastUsedKey -> 1
  //            d1 == pinnedKey && d2 != pinnedKey -> -1
  //            d2 == pinnedKey && d1 != pinnedKey -> 1
  //            d1 == "" && d2 != "" -> 1
  //            d2 == "" && d1 != "" -> -1
  //            else -> d1.compareTo(d2)
  //        }
  //    }
  //    val byLang = sources.groupByTo(map) {
  //        when {
  //            it.isUsedLast -> lastUsedKey
  //            Pin.Actual in it.pin -> pinnedKey
  //            _ -> it.lang
  //        }
  //    }

  //    state.copyWith(
  //      isLoading: false,
  //      items: byLang
  //          .flatMap {
  //              listOf(
  //                  SourceUiModel.Header(it.key),
  //                  *it.value.map { source ->
  //                      SourceUiModel.Item(source)
  //                  }.toTypedArray(),
  //              )
  //          }
  //          .toList(),
  //    )
  //  }
  //}

  //void toggleSource(Source source) async {
  //  final toggleSourceInteractor = ref.watch(toggleSourceProvider);
  //  await toggleSourceInteractor.await_(source);
  //}

  //void togglePin(Source source) async {
  //  final toggleSourcePin = ref.watch(toggleSourcePinProvider);
  //  await toggleSourcePin.await_(source);
  //}

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
