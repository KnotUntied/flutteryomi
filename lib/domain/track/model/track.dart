//import 'package:equatable/equatable.dart';
//import 'package:freezed_annotation/freezed_annotation.dart';

//part 'track.freezed.dart';

import 'package:flutteryomi/data/drift/data/manga_sync.drift.dart';

// Drift already generates convenient classes
// Typedef here so dependents will depend on domain instead of data
typedef Track = MangaSyncData;

// Though Drift generates a compatible data class MangaSyncData,
// here, we'll try a separate data class.
// Currently done in an attempt to address the vague error:
// type 'Null' is not a subtype of type 'InterfaceElement' in type cast

//class Track extends Equatable {
//  const Track({
//    required this.id,
//    required this.mangaId,
//    required this.trackerId,
//    required this.remoteId,
//    this.libraryId,
//    required this.title,
//    required this.lastChapterRead,
//    required this.totalChapters,
//    required this.score,
//    required this.status,
//    required this.startDate,
//    required this.finishDate,
//    required this.remoteUrl,
//  });

//  final int id;
//  final int mangaId;
//  final int trackerId;
//  final int remoteId;
//  final int? libraryId;
//  final String title;
//  final double lastChapterRead;
//  final int totalChapters;
//  final int status;
//  final double score;
//  final String remoteUrl;
//  final DateTime startDate;
//  final DateTime finishDate;

//  @override
//  List<Object?> get props => [
//    id,
//    mangaId,
//    trackerId,
//    remoteId,
//    libraryId,
//    title,
//    lastChapterRead,
//    totalChapters,
//    score,
//    status,
//    startDate,
//    finishDate,
//    remoteUrl,
//  ];
//}

//@freezed
//class Track with _$Track {
//  const factory Track({
//    required int id,
//    required int mangaId,
//    required int trackerId,
//    required int remoteId,
//    int? libraryId,
//    required String title,
//    required double lastChapterRead,
//    required int totalChapters,
//    required int status,
//    required double score,
//    required String remoteUrl,
//    required int startDate,
//    required int finishDate,
//  }) = _Track;
//}
