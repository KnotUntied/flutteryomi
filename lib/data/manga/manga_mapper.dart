import 'package:flutteryomi/domain/library/model/library_manga.dart';
import 'package:flutteryomi/domain/manga/model/manga.dart';

class MangaMapper {
  static Manga mapManga(dynamic row) => Manga(
    id: row.id,
    source: row.source,
    favorite: row.favorite,
    lastUpdate: row.lastUpdate ?? DateTime.fromMillisecondsSinceEpoch(0, isUtc: true),
    nextUpdate: row.nextUpdate ?? DateTime.fromMillisecondsSinceEpoch(0, isUtc: true),
    fetchInterval: row.fetchInterval.toInt(),
    dateAdded: row.dateAdded,
    viewerFlags: row.viewerFlags,
    chapterFlags: row.chapterFlags,
    coverLastModified: row.coverLastModified,
    url: row.url,
    title: row.title,
    artist: row.artist,
    author: row.author,
    description: row.description,
    genre: row.genre,
    status: row.status,
    thumbnailUrl: row.thumbnailUrl,
    updateStrategy: row.updateStrategy,
    initialized: row.initialized,
    lastModifiedAt: row.lastModifiedAt,
    favoriteModifiedAt: row.favoriteModifiedAt,
  );

  static LibraryManga mapLibraryManga(dynamic row) => LibraryManga(
    manga: mapManga(row),
    category: row.category,
    totalChapters: row.totalCount,
    readCount: row.readCount.toInt(),
    bookmarkCount: row.bookmarkCount.toInt(),
    latestUpload: row.latestUpload,
    chapterFetchedAt: row.chapterFetchedAt,
    lastRead: row.lastRead,
  );
}
