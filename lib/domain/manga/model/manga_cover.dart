import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:flutteryomi/data/drift/data/mangas.drift.dart';

part 'manga_cover.freezed.dart';

@freezed
class MangaCover with _$MangaCover {
  const factory MangaCover({
    required int mangaId,
    required int sourceId,
    required bool isMangaFavorite,
    String? url,
    required DateTime lastModified,
  }) = _MangaCover;
}

extension MangaCoverMethods on Manga {
  MangaCover asMangaCover() {
    return MangaCover(
      mangaId: id,
      sourceId: source,
      isMangaFavorite: favorite,
      url: thumbnailUrl,
      lastModified: coverLastModified,
    );
  }
}
