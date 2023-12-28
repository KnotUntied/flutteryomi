import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:flutteryomi/domain/category/interactor/create_category_with_name.dart';
import 'package:flutteryomi/domain/category/interactor/get_categories.dart';
import 'package:flutteryomi/domain/category/model/category.dart';

part 'category_screen_model.g.dart';

@riverpod
class CategoryScreenModel extends _$CategoryScreenModel {
  // TODO: Stream-based loading
  //@override
  //Stream<List<Category>> build() {
  //  final getCategories = ref.watch(getCategoriesProvider);
  //  return getCategories //
  //      .subscribe()
  //      .map(
  //        (categories) => categories //
  //            .where((it) => !it.isSystemCategory)
  //            .toList(),
  //      );
  //}
  @override
  Future<List<Category>> build() async {
    final getCategories = ref.watch(getCategoriesProvider);
    final categories = await getCategories.await_();
    return categories.where((it) => !it.isSystemCategory).toList();
  }

  //@override
  //FutureOr<void> build() {}

  Future<void> createCategory(String name) async {
    final createCategoryWithName = ref.watch(createCategoryWithNameProvider);
    await createCategoryWithName.await_(name);
    //state = await AsyncValue.guard(() => createCategoryWithName.await_(name));
  }

  Future<void> deleteCategory(int categoryId) async {
    //state = await AsyncValue.guard(() => deleteCategory.await_(categoryId));
  }

  Future<void> sortAlphabetically() async {
    //state = await AsyncValue.guard(() => reorderCategory.sortAlphabetically());
  }

  Future<void> moveUp(Category category) async {
    //state = await AsyncValue.guard(() => reorderCategory.moveUp(category));
  }

  Future<void> moveDown(Category category) async {
    //state = await AsyncValue.guard(() => reorderCategory.moveDown(category));
  }

  Future<void> renameCategory(Category category, String name) async {
    //state = await AsyncValue.guard(() => renameCategory.await_(categoryId));
  }

  // Not sure if these are needed
  //Future<void> showDialog(CategoryDialog dialog) async {
  //state = const AsyncLoading();
  //}

  //Future<void> dismissDialog() async {
  //state = const AsyncLoading();
  //}
}
