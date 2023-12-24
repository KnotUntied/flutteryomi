import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:flutteryomi/domain/manga/model/manga_cover.dart';

part 'updates_with_relations.freezed.dart';

@freezed
class UpdatesWithRelations with _$UpdatesWithRelations {
  const factory UpdatesWithRelations({
    required int mangaId,
    required String mangaTitle,
    required int chapterId,
    required String chapterName,
    String? scanlator,
    required bool read,
    required bool bookmark,
    required int lastPageRead,
    required int sourceId,
    required DateTime dateFetch,
    required MangaCover coverData,
  }) = _UpdatesWithRelations;
}
