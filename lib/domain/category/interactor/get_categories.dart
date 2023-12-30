import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:flutteryomi/domain/category/model/category.dart';
import 'package:flutteryomi/domain/category/repository/category_repository.dart';

part 'get_categories.g.dart';

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

@riverpod
GetCategories getCategories(GetCategoriesRef ref) =>
    GetCategories(ref.watch(categoryRepositoryProvider));
