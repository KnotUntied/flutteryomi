import 'package:flutteryomi/domain/chapter/model/chapter_update.dart';
import 'package:flutteryomi/domain/chapter/repository/chapter_repository.dart';

class UpdateChapter {
  final ChapterRepository repository;

  UpdateChapter(this.repository);

  Future<void> await_(ChapterUpdate chapterUpdate) async {
    try {
      await repository.update(chapterUpdate);
    } catch (e) {
      //Logger().e(e);
    }
  }

  Future<void> awaitAll(List<ChapterUpdate> chapterUpdates) async {
    try {
      await repository.updateAll(chapterUpdates);
    } catch (e) {
      //Logger().e(e);
    }
  }
}
