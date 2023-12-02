import 'package:flutteryomi/data/drift/data/categories.drift.dart';
import 'package:flutteryomi/domain/category/repository/category_repository.dart';

class GetCategories {
  final CategoryRepository repository;

  GetCategories(this.repository);

  Stream<List<Category>> subscribe([int? mangaId]) => mangaId != null
      ? repository.getCategoriesByMangaIdAsStream(mangaId)
      : repository.getAllAsStream();

  Future<List<Category>> await_([int? mangaId]) async => mangaId != null
      ? await repository.getCategoriesByMangaId(mangaId)
      : await repository.getAll();
}
