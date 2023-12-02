import 'package:flutteryomi/data/drift/data/chapters.drift.dart';
import 'package:flutteryomi/domain/chapter/repository/chapter_repository.dart';

class UpdateChapter {
  final ChapterRepository repository;

  UpdateChapter(this.repository);

  Future<void> await_(ChaptersCompanion chapterUpdate) async {
    try {
      await repository.update(chapterUpdate);
    } catch (e) {
      //Logger().e(e);
    }
  }

  Future<void> awaitAll(List<ChaptersCompanion> chapterUpdates) async {
    try {
      await repository.updateAll(chapterUpdates);
    } catch (e) {
      //Logger().e(e);
    }
  }
}
