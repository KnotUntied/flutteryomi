import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:flutteryomi/domain/category/interactor/create_category_with_name.dart';
import 'package:flutteryomi/domain/category/interactor/delete_category.dart';
import 'package:flutteryomi/domain/category/interactor/get_categories.dart';
import 'package:flutteryomi/domain/category/interactor/rename_category.dart';
import 'package:flutteryomi/domain/category/interactor/reorder_category.dart';
import 'package:flutteryomi/domain/category/model/category.dart';

part 'category_screen_model.g.dart';

@riverpod
class CategoryScreenModel extends _$CategoryScreenModel {
  @override
  Stream<List<Category>> build() {
    final getCategories = ref.watch(getCategoriesProvider);
    return getCategories //
        .subscribe()
        .map<List<Category>>(
          (categories) => categories //
              .where((it) => !it.isSystemCategory)
              .toList(),
        );
  }

  // TODO: Forward errors to toast/snackbar
  Future<void> createCategory(String name) async {
    final createCategoryWithName = ref.watch(createCategoryWithNameProvider);
    await AsyncValue.guard(() => createCategoryWithName.await_(name));
  }

  Future<void> deleteCategory(int categoryId) async {
    final deleteCategory = ref.watch(deleteCategoryProvider);
    await AsyncValue.guard(() => deleteCategory.await_(categoryId));
  }

  Future<void> sortAlphabetically() async {
    final reorderCategory = ref.watch(reorderCategoryProvider);
    await AsyncValue.guard(() => reorderCategory.sortAlphabetically());
  }

  Future<void> moveUp(Category category) async {
    final reorderCategory = ref.watch(reorderCategoryProvider);
    await AsyncValue.guard(() => reorderCategory.moveUp(category));
  }

  Future<void> moveDown(Category category) async {
    final reorderCategory = ref.watch(reorderCategoryProvider);
    await AsyncValue.guard(() => reorderCategory.moveDown(category));
  }

  Future<void> renameCategory(Category category, String name) async {
    final renameCategory = ref.watch(renameCategoryProvider);
    await AsyncValue.guard(() => renameCategory.awaitWithCategory(category, name));
  }
}
