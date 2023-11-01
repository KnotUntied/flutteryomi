import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:flutteryomi/database.dart';

part 'manga_cover.freezed.dart';

@freezed
class MangaCover with _$MangaCover {
  factory MangaCover({
    required int mangaId,
    required int sourceId,
    required bool isMangaFavorite,
    String? url,
    required int lastModified,
  }) = _MangaCover;
}

extension NumberParsing on Manga {
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
