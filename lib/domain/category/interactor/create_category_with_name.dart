import 'package:dartx/dartx.dart';
import 'package:logger/logger.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:flutteryomi/core/util/system/logger.dart';
import 'package:flutteryomi/domain/category/model/category.dart';
import 'package:flutteryomi/domain/category/repository/category_repository.dart';
import 'package:flutteryomi/domain/library/model/library_sort_mode.dart';
import 'package:flutteryomi/domain/library/service/library_preferences.dart';

part 'create_category_with_name.g.dart';

class CreateCategoryWithName {
  final CategoryRepository repository;
  final LibraryPreferences preferences;
  final Logger logger;
  CreateCategoryWithName({
    required this.repository,
    required this.logger,
    required this.preferences,
  });

  int get _initialFlags {
    final sort = preferences.sortingMode().get();
    return sort.type.flag | sort.direction.flag;
  }

  Future<void> await_(String name) async {
    final categories = await repository.getAll();
    final nextOrder = categories.maxBy((it) => it.sort)?.sort.plus(1) ?? 0;
    final newCategory = Category(
      id: 0,
      name: name,
      sort: nextOrder,
      flags: _initialFlags,
    );

    try {
      await repository.insert(newCategory);
    } catch (e) {
      logger.e(e);
      rethrow;
    }
  }
}

@riverpod
CreateCategoryWithName createCategoryWithName(CreateCategoryWithNameRef ref) =>
    CreateCategoryWithName(
      repository: ref.watch(categoryRepositoryProvider),
      preferences: ref.watch(libraryPreferencesProvider),
      logger: ref.watch(loggerProvider),
    );
