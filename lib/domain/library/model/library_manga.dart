import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:flutteryomi/data/drift/data/mangas.drift.dart';

part 'library_manga.freezed.dart';

@freezed
class LibraryManga with _$LibraryManga {
  const LibraryManga._();
  const factory LibraryManga({
    required Manga manga,
    required int category,
    required int totalChapters,
    required int readCount,
    required int bookmarkCount,
    required DateTime latestUpload,
    required DateTime chapterFetchedAt,
    required DateTime lastRead,
  }) = _LibraryManga;

  int get id => manga.id;

  int get unreadCount => totalChapters - readCount;
  bool get hasBookmarks => bookmarkCount > 0;
  bool get hasStarted => readCount > 0;
}
