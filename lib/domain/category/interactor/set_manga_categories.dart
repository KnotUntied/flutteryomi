import 'package:flutteryomi/domain/manga/repository/manga_repository.dart';

class SetMangaCategories {
  final MangaRepository repository;

  SetMangaCategories(this.repository);

  Future<void> await_(int mangaId, List<int> categoryIds) async {
    try {
      await repository.setMangaCategories(mangaId, categoryIds);
    } catch (e) {
      //Logger().e(e);
    }
  }
}
