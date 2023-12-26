import 'package:flutteryomi/domain/chapter/model/chapter.dart';
import 'package:flutteryomi/domain/chapter/repository/chapter_repository.dart';

class GetChaptersByMangaId {
  final ChapterRepository repository;

  GetChaptersByMangaId(this.repository);

  Future<List<Chapter>> await_(int mangaId,
      {bool applyScanlatorFilter = false}) async {
    try {
      return await repository.getChapterByMangaId(mangaId,
          applyScanlatorFilter: applyScanlatorFilter);
    } catch (e) {
      //Logger().e(e);
      return [];
    }
  }
}
