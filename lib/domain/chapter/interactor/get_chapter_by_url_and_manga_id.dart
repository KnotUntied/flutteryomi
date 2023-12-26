import 'package:flutteryomi/domain/chapter/model/chapter.dart';
import 'package:flutteryomi/domain/chapter/repository/chapter_repository.dart';

class GetChapterByUrlAndMangaId {
  final ChapterRepository chapterRepository;

  GetChapterByUrlAndMangaId(this.chapterRepository);

  Future<Chapter?> await_(String url, int sourceId) async {
    try {
      return await chapterRepository.getChapterByUrlAndMangaId(url, sourceId);
    } catch (e) {
      //Logger().e(e);
      return null;
    }
  }
}
