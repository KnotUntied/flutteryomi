import 'package:flutteryomi/domain/history/model/history_with_relations.dart';
import 'package:flutteryomi/domain/manga/model/manga_cover.dart';

class HistoryMapper {
  static HistoryWithRelations mapHistoryWithRelations(dynamic row) => HistoryWithRelations(
    id: row.historyId,
    chapterId: row.chapterId,
    mangaId: row.mangaId,
    title: row.title,
    chapterNumber: row.chapterNumber,
    readAt: row.readAt,
    readDuration: row.readDuration,
    coverData: MangaCover(
      mangaId: row.mangaId,
      sourceId: row.sourceId,
      isMangaFavorite: row.isFavorite,
      url: row.thumbnailUrl,
      lastModified: row.coverLastModified,
    ),
  );
}
