import 'package:flutteryomi/data/drift/data/categories.drift.dart';

abstract interface class CategoryRepository {
  Future<Category?> get(int id);
  Future<List<Category>> getAll();
  Stream<List<Category>> getAllAsStream();
  Future<List<Category>> getCategoriesByMangaId(int mangaId);
  Stream<List<Category>> getCategoriesByMangaIdAsStream(int mangaId);
  Future<void> insert(Category category);
  Future<void> updatePartial(CategoriesCompanion update);
  // Dart does not support function overload,
  // i.e., same function name, different params :(
  // https://github.com/dart-lang/language/issues/1122
  Future<void> updatePartialMultiple(List<CategoriesCompanion> updates);
  Future<void> updateAllFlags(int? flags);
  Future<void> delete(int categoryId);
}
