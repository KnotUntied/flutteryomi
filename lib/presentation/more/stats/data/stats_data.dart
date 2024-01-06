import 'package:freezed_annotation/freezed_annotation.dart';

part 'stats_data.freezed.dart';

@freezed
class StatsData with _$StatsData {
  const factory StatsData.overview({
    required int libraryMangaCount,
    required int completedMangaCount,
    required int totalReadDuration,
  }) = Overview;
  const factory StatsData.titles({
    required int globalUpdateItemCount,
    required int startedMangaCount,
    required int localMangaCount,
  }) = Titles;
  const factory StatsData.chapters({
    required int totalChapterCount,
    required int readChapterCount,
    required int downloadCount,
  }) = Chapters;
  const factory StatsData.trackers({
    required int trackedTitleCount,
    required double meanScore,
    required int trackerCount,
  }) = Trackers;
}
