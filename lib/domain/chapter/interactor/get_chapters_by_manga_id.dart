import 'package:flutteryomi/data/drift/data/chapters.drift.dart';
import 'package:flutteryomi/domain/chapter/repository/chapter_repository.dart';

class GetChaptersByMangaId {
  final ChapterRepository chapterRepository;

  GetChaptersByMangaId(this.chapterRepository);

  Future<List<Chapter>> await_(int mangaId, {bool applyScanlatorFilter = false}) async {
    try {
      return await chapterRepository.getChapterByMangaId(mangaId, applyScanlatorFilter: applyScanlatorFilter);
    } catch (e) {
      //Logger().e(e);
      return [];
    }
  }
}
