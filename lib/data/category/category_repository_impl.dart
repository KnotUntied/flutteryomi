import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:flutteryomi/data/database.dart';
import 'package:flutteryomi/domain/category/model/category.dart';
import 'package:flutteryomi/domain/category/model/category_update.dart';
import 'package:flutteryomi/domain/category/repository/category_repository.dart';

part 'category_repository_impl.g.dart';

class CategoryRepositoryImpl implements CategoryRepository {
  CategoryRepositoryImpl({required this.db});
  final Database db;

  @override
  Future<Category?> get(int id) =>
      db.categoriesDrift.getCategory(id: id).getSingleOrNull();

  @override
  Future<List<Category>> getAll() =>
      db.categoriesDrift.getCategories().get();

  @override
  Stream<List<Category>> getAllAsStream() =>
      db.categoriesDrift.getCategories().watch();

  @override
  Future<List<Category>> getCategoriesByMangaId(int mangaId) =>
      db.categoriesDrift.getCategoriesByMangaId(mangaId: mangaId).get();

  @override
  Stream<List<Category>> getCategoriesByMangaIdAsStream(int mangaId) =>
      db.categoriesDrift.getCategoriesByMangaId(mangaId: mangaId).watch();

  @override
  Future<void> insert(Category category) => db //
      .into(db.categories)
      .insert(
        CategoryUpdate.insert(
          name: category.name,
          sort: category.sort,
          flags: category.flags,
        ),
      );

  @override
  Future<void> updatePartial(CategoryUpdate update) =>
      (db.update(db.categories)
            ..where((c) => c.id.equals(update.id.value)))
          .write(update);

  @override
  Future<void> updatePartialMultiple(List<CategoryUpdate> updates) =>
      db.transaction(() async {
        for (final update in updates) {
          await (db.update(db.categories)
                ..where((c) => c.id.equals(update.id.value)))
              .write(update);
        }
      });

  @override
  Future<void> updateAllFlags(int? flags) =>
      db.categoriesDrift.updateAllFlags(flags);

  @override
  Future<void> delete(int categoryId) =>
      (db.delete(db.categories)..where((c) => c.id.equals(categoryId)))
          .go();
}

@riverpod
CategoryRepository categoryRepositoryImpl(CategoryRepositoryImplRef ref) =>
    CategoryRepositoryImpl(
      db: ref.watch(databaseProvider),
    );
