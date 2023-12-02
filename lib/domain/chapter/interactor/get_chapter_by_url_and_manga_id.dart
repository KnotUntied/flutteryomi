import 'package:flutteryomi/data/drift/data/chapters.drift.dart';
import 'package:flutteryomi/domain/chapter/repository/chapter_repository.dart';

class GetChapterByUrlAndMangaId {
  final ChapterRepository chapterRepository;

  GetChapterByUrlAndMangaId(this.chapterRepository);

  Future<Chapter?> await_(String url, int mangaId) async {
    try {
      return await chapterRepository.getChapterByUrlAndMangaId(url, mangaId);
    } catch (e) {
      //Logger().e(e);
      return null;
    }
  }
}
