import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:flutteryomi/domain/manga/model/manga_cover.dart';

part 'history_with_relations.freezed.dart';

@freezed
class HistoryWithRelations with _$HistoryWithRelations {
  const factory HistoryWithRelations({
    required int id,
    required int chapterId,
    required int mangaId,
    required String title,
    required double chapterNumber,
    DateTime? readAt,
    required int readDuration,
    required MangaCover coverData,
  }) = _HistoryWithRelations;
}
