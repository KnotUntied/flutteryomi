import 'package:flutteryomi/domain/chapter/model/chapter.dart';
import 'package:flutteryomi/domain/chapter/model/chapter_update.dart';

abstract interface class ChapterRepository {
  Future<List<Chapter>> addAll(List<Chapter> chapters);
  Future<void> update(ChapterUpdate chapterUpdate);
  Future<void> updateAll(List<ChapterUpdate> chapterUpdates);
  Future<void> removeChaptersWithIds(List<int> chapterIds);
  Future<List<Chapter>> getChapterByMangaId(
      int mangaId, {bool applyScanlatorFilter = false});
  Future<List<String>> getScanlatorsByMangaId(int mangaId);
  Stream<List<String>> getScanlatorsByMangaIdAsStream(int mangaId);
  Future<List<Chapter>> getBookmarkedChaptersByMangaId(int mangaId);
  Future<Chapter?> getChapterById(int id);
  Stream<List<Chapter>> getChapterByMangaIdAsStream(
      int mangaId, {bool applyScanlatorFilter = false});
  Future<Chapter?> getChapterByUrlAndMangaId(String url, int mangaId);
}
