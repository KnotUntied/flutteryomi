import 'package:flutteryomi/data/drift/data/chapters.drift.dart';
import 'package:flutteryomi/domain/chapter/repository/chapter_repository.dart';

class GetChapter {
  final ChapterRepository repository;

  GetChapter(this.repository);

  Future<Chapter?> await_(int id) async {
    try {
      return await repository.getChapterById(id);
    } catch (e) {
      //Logger().e(e);
      return null;
    }
  }
}
