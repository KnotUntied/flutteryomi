import 'package:flutteryomi/data/drift/data/chapters.drift.dart';
import 'package:flutteryomi/domain/chapter/repository/chapter_repository.dart';

class UpdateChapter {
  final ChapterRepository chapterRepository;

  UpdateChapter(this.chapterRepository);

  Future<void> await_(ChaptersCompanion chapterUpdate) async {
    try {
      await chapterRepository.update(chapterUpdate);
    } catch (e) {
      //Logger().e(e);
    }
  }

  Future<void> awaitAll(List<ChaptersCompanion> chapterUpdates) async {
    try {
      await chapterRepository.updateAll(chapterUpdates);
    } catch (e) {
      //Logger().e(e);
    }
  }
}
