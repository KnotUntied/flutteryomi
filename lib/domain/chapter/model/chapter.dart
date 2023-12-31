import 'package:dartx/dartx.dart';
import 'package:drift/drift.dart';

import 'package:flutteryomi/data/drift/data/chapters.drift.dart' as drift;

// Drift already generates convenient classes
// Typedef here so dependents will depend on domain instead of data
typedef Chapter = drift.Chapter;

extension ChapterUtils on Chapter {
  bool get isRecognizedNumber => chapterNumber >= 0.0;

  // I don't know why this function is needed
  Chapter copyFrom(Chapter other) => other.copyWith(
        name: other.name,
        url: other.url,
        dateUpload: other.dateUpload,
        chapterNumber: other.chapterNumber,
        scanlator: other.scanlator.isNullOrBlank
            ? Value(other.scanlator)
            : const Value(null),
      );

  static Chapter create() => Chapter(
        id: -1,
        mangaId: -1,
        read: false,
        bookmark: false,
        lastPageRead: 0,
        dateFetch: DateTime.fromMillisecondsSinceEpoch(0, isUtc: true),
        sourceOrder: 0,
        url: "",
        name: "",
        dateUpload: DateTime.fromMillisecondsSinceEpoch(-1, isUtc: true),
        chapterNumber: -1.0,
        scanlator: null,
        lastModifiedAt: DateTime.fromMillisecondsSinceEpoch(0, isUtc: true),
      );
}
