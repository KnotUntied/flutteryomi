import 'package:flutteryomi/data/database.dart';
import 'package:flutteryomi/domain/category/model/category.dart';
import 'package:flutteryomi/domain/category/model/category_update.dart';
import 'package:flutteryomi/domain/category/repository/category_repository.dart';

class CategoryRepositoryImpl implements CategoryRepository {
  CategoryRepositoryImpl({required this.db});
  final Database db;

  @override
  Future<Category?> get(int id) async =>
      await db.categoriesDrift.getCategory(id: id).getSingleOrNull();

  @override
  Future<List<Category>> getAll() async =>
      await db.categoriesDrift.getCategories().get();

  @override
  Stream<List<Category>> getAllAsStream() =>
      db.categoriesDrift.getCategories().watch();

  @override
  Future<List<Category>> getCategoriesByMangaId(int mangaId) async =>
      await db.categoriesDrift.getCategoriesByMangaId(mangaId: mangaId).get();

  @override
  Stream<List<Category>> getCategoriesByMangaIdAsStream(int mangaId) =>
      db.categoriesDrift.getCategoriesByMangaId(mangaId: mangaId).watch();

  @override
  Future<void> insert(Category category) async =>
      await db.into(db.categories).insert(
            CategoryUpdate.insert(
              name: category.name,
              sort: category.sort,
              flags: category.flags,
            ),
          );

  @override
  Future<void> updatePartial(CategoryUpdate update) async =>
      await (db.update(db.categories)
            ..where((c) => c.id.equals(update.id.value)))
          .write(update);

  @override
  Future<void> updatePartialMultiple(List<CategoryUpdate> updates) async =>
      await db.transaction(() async {
        for (var update in updates) {
          await (db.update(db.categories)
                ..where((c) => c.id.equals(update.id.value)))
              .write(update);
        }
      });

  @override
  Future<void> updateAllFlags(int? flags) async =>
      await db.categoriesDrift.updateAllFlags(flags);

  @override
  Future<void> delete(int categoryId) async =>
      await (db.delete(db.categories)..where((c) => c.id.equals(categoryId)))
          .go();
}
