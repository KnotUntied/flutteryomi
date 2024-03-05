import 'package:drift/drift.dart';
import 'package:flutteryomi/domain/library/model/flag.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:flutteryomi/domain/category/model/category.dart';
import 'package:flutteryomi/domain/category/model/category_update.dart';
import 'package:flutteryomi/domain/category/repository/category_repository.dart';
import 'package:flutteryomi/domain/library/model/library_sort_mode.dart';
import 'package:flutteryomi/domain/library/service/library_preferences.dart';

part 'set_sort_mode_for_category.g.dart';

class SetSortModeForCategory {
  final CategoryRepository repository;
  final LibraryPreferences preferences;
  SetSortModeForCategory({
    required this.repository,
    required this.preferences,
  });

  Future<void> await_(int? categoryId, Type type, Direction direction) async {
    final category = categoryId != null //
        ? await repository.get(categoryId)
        : null;
    final flags = (category?.flags ?? 0).addFlag(type).addFlag(direction);
    if (category != null && preferences.categorizedDisplaySettings().get()) {
      repository.updatePartial(
        CategoryUpdate(
          id: Value(category.id),
          flags: Value(flags),
        ),
      );
    } else {
      preferences.sortingMode().set(LibrarySort(type, direction));
      repository.updateAllFlags(flags);
    }
  }

  Future<void> awaitWithCategory(
    Category? category,
    Type type,
    Direction direction,
  ) =>
      await_(category?.id, type, direction);
}

@riverpod
SetSortModeForCategory setSortModeForCategory(SetSortModeForCategoryRef ref) =>
    SetSortModeForCategory(
      repository: ref.watch(categoryRepositoryProvider),
      preferences: ref.watch(libraryPreferencesProvider),
    );
