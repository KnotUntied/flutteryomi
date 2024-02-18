import 'dart:async';

import 'package:dartx/dartx.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:flutteryomi/data/track/tracker_manager.dart';
import 'package:flutteryomi/domain/download/download_manager.dart';
import 'package:flutteryomi/domain/history/interactor/get_total_read_duration.dart';
import 'package:flutteryomi/domain/library/model/library_manga.dart';
import 'package:flutteryomi/domain/library/service/library_preferences.dart';
import 'package:flutteryomi/domain/manga/interactor/get_library_manga.dart';
import 'package:flutteryomi/domain/source/model/smanga.dart';
import 'package:flutteryomi/domain/track/interactor/get_tracks.dart';
import 'package:flutteryomi/domain/track/model/track.dart';
import 'package:flutteryomi/presentation/more/stats/data/stats_data.dart';
import 'package:flutteryomi/source/local/local_source.dart';

part 'stats_screen_model.freezed.dart';
part 'stats_screen_model.g.dart';

@riverpod
class StatsScreenModel extends _$StatsScreenModel {
  @override
  Future<StatsScreenState> build() async {
    final downloadManager = ref.watch(downloadManagerProvider);
    final getLibraryManga = ref.watch(getLibraryMangaProvider);
    final getTotalReadDuration = ref.watch(getTotalReadDurationProvider);
    final trackerManager = ref.watch(trackerManagerProvider);
    final loggedInTrackers =
        trackerManager.trackers.where((it) => it.isLoggedIn);

    final libraryManga = await getLibraryManga.await_();

    final distinctLibraryManga =
        libraryManga.distinctBy((it) => it.id).toList();

    final mangaTrackMap = await _getMangaTrackMap(distinctLibraryManga);
    final scoredMangaTrackerMap = _getScoredMangaTrackMap(mangaTrackMap);

    final meanScore = _getTrackMeanScore(scoredMangaTrackerMap);

    final overviewStatData = Overview(
      libraryMangaCount: distinctLibraryManga.length,
      completedMangaCount: distinctLibraryManga.count(
        (it) =>
            it.manga.status.toInt() == SManga.completed && it.unreadCount == 0,
      ),
      totalReadDuration: await getTotalReadDuration.await_(),
    );

    final titlesStatData = Titles(
      globalUpdateItemCount: _getGlobalUpdateItemCount(libraryManga),
      startedMangaCount: distinctLibraryManga.count((it) => it.hasStarted),
      localMangaCount: distinctLibraryManga.count((it) => it.manga.isLocal()),
    );

    final chaptersStatData = Chapters(
      totalChapterCount: distinctLibraryManga.sumBy((it) => it.totalChapters),
      readChapterCount: distinctLibraryManga.sumBy((it) => it.readCount),
      downloadCount: downloadManager.getDownloadCount(),
    );

    final trackersStatData = Trackers(
      trackedTitleCount: mangaTrackMap.count((it) => it.value.isNotEmpty),
      meanScore: meanScore,
      trackerCount: loggedInTrackers.length,
    );

    return StatsScreenState(
      overview: overviewStatData,
      titles: titlesStatData,
      chapters: chaptersStatData,
      trackers: trackersStatData,
    );
  }

  int _getGlobalUpdateItemCount(List<LibraryManga> libraryManga) {
    final preferences = ref.watch(libraryPreferencesProvider);
    final includedCategories =
        preferences.updateCategories().get().map((it) => int.parse(it));
    final includedManga = includedCategories.isNotEmpty
        ? libraryManga.where((it) => includedCategories.contains(it.category))
        : libraryManga;

    final excludedCategories =
        preferences.updateCategoriesExclude().get().map((it) => int.parse(it));
    final excludedMangaIds = excludedCategories.isNotEmpty
        ? libraryManga
            .mapNotNull((manga) =>
                excludedCategories.contains(manga.category) ? manga.id : null)
            .toList()
        : [];

    final updateRestrictions = preferences.autoUpdateMangaRestrictions().get();
    return includedManga
        .whereNot((it) => excludedMangaIds.contains(it.manga.id))
        .distinctBy((it) => it.manga.id)
        .count(
          (it) => !((updateRestrictions
                      .contains(LibraryPreferences.mangaNonCompleted) &&
                  it.manga.status == SManga.completed) ||
              (updateRestrictions.contains(LibraryPreferences.mangaHasUnread) &&
                  it.unreadCount != 0) ||
              (updateRestrictions.contains(LibraryPreferences.mangaNonRead) &&
                  it.totalChapters > 0 &&
                  !it.hasStarted)),
        );
  }

  Future<Map<int, List<Track>>> _getMangaTrackMap(
      List<LibraryManga> libraryManga) async {
    final trackerManager = ref.watch(trackerManagerProvider);
    final loggedInTrackers =
        trackerManager.trackers.where((it) => it.isLoggedIn);
    final loggedInTrackerIds = loggedInTrackers.map((it) => it.id).toHashSet();
    final getTracks = ref.watch(getTracksProvider);
    final map = <int, List<Track>>{};
    for (final manga in libraryManga) {
      final tracks = await getTracks.await_(manga.id);
      final entry = MapEntry(
        manga.id,
        tracks
            .where((it) => loggedInTrackerIds.contains(it.trackerId))
            .toList(),
      );
      map[entry.key] = entry.value;
    }
    return map;
  }

  Map<int, List<Track>> _getScoredMangaTrackMap(
    Map<int, List<Track>> mangaTrackMap,
  ) {
    return mangaTrackMap.map((mangaId, tracks) {
      final trackList = tracks
          .mapNotNull((track) => track.score > 0.0 ? track : null)
          .toList();
      if (trackList.isEmpty) return MapEntry(mangaId, const <Track>[]);
      return MapEntry(mangaId, trackList);
    }).filter((e) => e.value.isEmpty);
  }

  double _getTrackMeanScore(Map<int, List<Track>> scoredMangaTrackMap) =>
      scoredMangaTrackMap.values
          .map((tracks) =>
              tracks.map((track) => _get10PointScore(track)).average())
          .where((it) => !it.isNaN)
          .average();

  double _get10PointScore(Track track) {
    final trackerManager = ref.watch(trackerManagerProvider);
    final service = trackerManager.get(track.trackerId);
    return service.get10PointScore(track);
  }
}

@freezed
class StatsScreenState with _$StatsScreenState {
  const factory StatsScreenState({
    required Overview overview,
    required Titles titles,
    required Chapters chapters,
    required Trackers trackers,
  }) = _StatsScreenState;
}
