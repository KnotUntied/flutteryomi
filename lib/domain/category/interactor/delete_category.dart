import 'package:collection/collection.dart';
import 'package:drift/drift.dart';
import 'package:logger/logger.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:flutteryomi/core/util/system/logger.dart';
import 'package:flutteryomi/domain/category/model/category_update.dart';
import 'package:flutteryomi/domain/category/repository/category_repository.dart';

part 'delete_category.g.dart';

class DeleteCategory {
  final CategoryRepository repository;
  final Logger logger;
  DeleteCategory({
    required this.repository,
    required this.logger,
  });

  Future<void> await_(int categoryId) async {
    try {
      await repository.delete(categoryId);
    } catch (e) {
      logger.e(e);
      rethrow;
    }

    final categories = await repository.getAll();
    final updates = categories //
        .mapIndexed((index, category) => CategoryUpdate(
              id: Value(category.id),
              sort: Value(index),
            ))
        .toList();

    try {
      repository.updatePartialMultiple(updates);
    } catch (e) {
      logger.e(e);
      rethrow;
    }
  }
}

@riverpod
DeleteCategory deleteCategory(DeleteCategoryRef ref) => DeleteCategory(
      repository: ref.watch(categoryRepositoryProvider),
      logger: ref.watch(loggerProvider),
    );
