import 'package:flutteryomi/domain/track/model/track.dart';

class TrackSearch extends Track {
  TrackSearch({
    super.id = -1,
    super.mangaId = 0,
    super.trackerId = 0,
    super.remoteId = 0,
    super.libraryId = -1,
    required super.title,
    super.lastChapterRead = 0.0,
    super.totalChapters = 0,
    super.score = -1.0,
    super.status = 0,
    required super.startDate,
    required super.finishDate,
    required super.remoteUrl,
  });

  String coverUrl = "";

  String summary = "";

  String publishingStatus = "";

  String publishingType = "";

  // Dunno what this is for
  String startingDate = "";

  static TrackSearch create(int serviceId) => TrackSearch(
        trackerId: serviceId,
        title: '',
        startDate: DateTime.fromMillisecondsSinceEpoch(0, isUtc: true),
        finishDate: DateTime.fromMillisecondsSinceEpoch(0, isUtc: true),
        remoteUrl: '',
      );
}

//typedef TrackSearch = Track;
