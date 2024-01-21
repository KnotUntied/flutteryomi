import 'dart:async';

import 'package:dartx/dartx.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:flutteryomi/domain/category/interactor/get_categories.dart';
import 'package:flutteryomi/domain/download/download_manager.dart';
import 'package:flutteryomi/domain/history/interactor/get_total_read_duration.dart';
import 'package:flutteryomi/domain/library/model/library_manga.dart';
import 'package:flutteryomi/domain/library/service/library_preferences.dart';
import 'package:flutteryomi/domain/manga/interactor/get_library_manga.dart';
import 'package:flutteryomi/domain/source/model/smanga.dart';
import 'package:flutteryomi/domain/track/model/track.dart';
import 'package:flutteryomi/presentation/more/stats/data/stats_data.dart';

part 'stats_screen_model.freezed.dart';
part 'stats_screen_model.g.dart';

@riverpod
class StatsScreenModel extends _$StatsScreenModel {
  //TODO
  //var loggedInTrackers;

  @override
  Future<StatsScreenState> build() async {
    final downloadManager = ref.watch(downloadManagerProvider);
    final getLibraryManga = ref.watch(getLibraryMangaProvider);
    final getTotalReadDuration = ref.watch(getTotalReadDurationProvider);
    //TODO
    //final getTracks = ref.watch(getTracksProvider);
    final preferences = ref.watch(libraryPreferencesProvider);
    //TODO
    //final trackerManager = ref.watch(trackerManagerProvider);
    final getCategories = ref.watch(getCategoriesProvider);
    //TODO
    //loggedInTrackers = trackerManager.trackers.where((it) => it.isLoggedIn);

    final libraryManga = await getLibraryManga.await_();

    final distinctLibraryManga = libraryManga.distinctBy((it) => it.id).toList();

    //TODO
    //final mangaTrackMap = await _getMangaTrackMap(distinctLibraryManga);
    //final scoredMangaTrackerMap = _getScoredMangaTrackMap(mangaTrackMap);

    //final meanScore = _getTrackMeanScore(scoredMangaTrackerMap);

    final overviewStatData = Overview(
      libraryMangaCount: distinctLibraryManga.length,
      completedMangaCount: distinctLibraryManga.count(
        (it) => it.manga.status.toInt() == SManga.completed && it.unreadCount == 0,
      ),
      totalReadDuration: await getTotalReadDuration.await_(),
    );

    final titlesStatData = Titles(
      globalUpdateItemCount: _getGlobalUpdateItemCount(libraryManga),
      startedMangaCount: distinctLibraryManga.count((it) => it.hasStarted),
      //localMangaCount: distinctLibraryManga.count((it) => it.manga.isLocal()),
      localMangaCount: 0,
    );

    final chaptersStatData = Chapters(
      totalChapterCount: distinctLibraryManga.sumBy((it) => it.totalChapters),
      readChapterCount: distinctLibraryManga.sumBy((it) => it.readCount),
      downloadCount: 0,
      //TODO
      //downloadCount: downloadManager.getDownloadCount(),
    );

    const trackersStatData = Trackers(
      trackedTitleCount: 0,
      meanScore: 0,
      trackerCount: 0,
      //TODO
      //trackedTitleCount: mangaTrackMap.count((it) => it.value.isNotEmpty),
      //meanScore: meanScore,
      //trackerCount: loggedInTrackers.length,
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
    final includedCategories = preferences.updateCategories().get().map((it) => int.parse(it));
    final includedManga = includedCategories.isNotEmpty
        ? libraryManga.where((it) => includedCategories.contains(it.category))
        : libraryManga;

    final excludedCategories = preferences.updateCategoriesExclude().get().map((it) => int.parse(it));
    final excludedMangaIds = excludedCategories.isNotEmpty
        ? libraryManga.mapNotNull((manga) => excludedCategories.contains(manga.category) ? manga.id : null).toList()
        : [];

    final updateRestrictions = preferences.autoUpdateMangaRestrictions().get();
    return includedManga
        .filterNot((it) => excludedMangaIds.contains(it.manga.id))
        .distinctBy((it) => it.manga.id)
        .count((it) => !(
          (updateRestrictions.contains(LibraryPreferences.mangaNonCompleted) && it.manga.status == SManga.completed) ||
          (updateRestrictions.contains(LibraryPreferences.mangaHasUnread) && it.unreadCount != 0) ||
          (updateRestrictions.contains(LibraryPreferences.mangaNonRead) && it.totalChapters > 0 && !it.hasStarted)
        ));
  }

  //TODO
  //Future<Map<int, List<Track>>> _getMangaTrackMap(List<LibraryManga> libraryManga) async {
  //  final loggedInTrackerIds = loggedInTrackers.map((it) => it.id).toHashSet();
  //  final getTracks = ref.watch(getTracksProvider);
  //  return libraryManga.associate((manga) {
  //    final tracks = await getTracks.await_(manga.id)
  //        .filter((it) => loggedInTrackerIds.contains(it.trackerId));

  //    return MapEntry(manga.id, tracks);
  //  });
  //}

  //TODO
  //Map<int, List<Track>> _getScoredMangaTrackMap(Map<int, List<Track>> mangaTrackMap) =>
  //    mangaTrackMap.mapNotNull((mangaId, tracks) {
  //      final trackList = tracks.mapNotNull((track) => track.score > 0.0 ? track : null);
  //      if (trackList.isEmpty) return@mapNotNull null;
  //      return MapEntry(mangaId, trackList);
  //    }).toMap();

  //TODO
  //double _getTrackMeanScore(Map<int, List<Track>> scoredMangaTrackMap) =>
  //    scoredMangaTrackMap
  //        .map((_, tracks) => tracks.map(::get10PointScore).average())
  //        .where((it) => !it.isNaN)
  //        .average();

  //TODO
  //double _get10PointScore(Track track) {
  //  final trackerManager = ref.watch(trackerManagerProvider);
  //  final service = trackerManager.get(track.trackerId)!;
  //  return service.get10PointScore(track);
  //}
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