import 'package:freezed_annotation/freezed_annotation.dart';

part 'track.freezed.dart';

@freezed
class Track with _$Track {
  factory Track({
    required int id,
    required int mangaId,
    required int syncId,
    required int remoteId,
    int? libraryId,
    required String title,
    required double lastChapterRead,
    required int totalChapters,
    required int status,
    required double score,
    required String remoteUrl,
    required int startDate,
    required int finishDate,
  }) = _Track;
}
