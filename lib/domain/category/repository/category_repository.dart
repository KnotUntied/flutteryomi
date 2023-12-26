import 'package:flutteryomi/domain/category/model/category.dart';
import 'package:flutteryomi/domain/category/model/category_update.dart';

abstract interface class CategoryRepository {
  Future<Category?> get(int id);
  Future<List<Category>> getAll();
  Stream<List<Category>> getAllAsStream();
  Future<List<Category>> getCategoriesByMangaId(int mangaId);
  Stream<List<Category>> getCategoriesByMangaIdAsStream(int mangaId);
  Future<void> insert(Category category);
  Future<void> updatePartial(CategoryUpdate update);
  // Dart does not support function overload,
  // i.e., same function name, different params :(
  // https://github.com/dart-lang/language/issues/1122
  Future<void> updatePartialMultiple(List<CategoryUpdate> updates);
  Future<void> updateAllFlags(int? flags);
  Future<void> delete(int categoryId);
}
