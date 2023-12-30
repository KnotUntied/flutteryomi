import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:flutteryomi/domain/category/interactor/create_category_with_name.dart';
import 'package:flutteryomi/domain/category/interactor/get_categories.dart';
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

  Future<void> createCategory(String name) async {
    final createCategoryWithName = ref.watch(createCategoryWithNameProvider);
    await AsyncValue.guard(() => createCategoryWithName.await_(name));
  }

  Future<void> deleteCategory(int categoryId) async {
    //await AsyncValue.guard(() => deleteCategory.await_(categoryId));
  }

  Future<void> sortAlphabetically() async {
    //await AsyncValue.guard(() => reorderCategory.sortAlphabetically());
  }

  Future<void> moveUp(Category category) async {
    //await AsyncValue.guard(() => reorderCategory.moveUp(category));
  }

  Future<void> moveDown(Category category) async {
    //await AsyncValue.guard(() => reorderCategory.moveDown(category));
  }

  Future<void> renameCategory(Category category, String name) async {
    //await AsyncValue.guard(() => renameCategory.await_(categoryId));
  }
}
