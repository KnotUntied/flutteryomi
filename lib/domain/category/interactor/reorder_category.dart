import 'package:collection/collection.dart';
import 'package:drift/drift.dart';
import 'package:logger/logger.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:flutteryomi/core/util/system/logger.dart';
import 'package:flutteryomi/domain/category/model/category.dart';
import 'package:flutteryomi/domain/category/model/category_update.dart';
import 'package:flutteryomi/domain/category/repository/category_repository.dart';

part 'reorder_category.g.dart';

class ReorderCategory {
  final CategoryRepository repository;
  final Logger logger;
  ReorderCategory({
    required this.repository,
    required this.logger,
  });

  Future<void> moveUp(Category category) async =>
      await await_(category, MoveTo.up);

  Future<void> moveDown(Category category) async =>
      await await_(category, MoveTo.down);

  Future<void> await_(Category category, MoveTo moveTo) async {
    final categories = await repository.getAll();
    final categoryList = categories //
        .whereNot((it) => it.isSystemCategory)
        .toList();

    final currentIndex = categoryList.indexWhere((it) => it.id == category.id);
    if (currentIndex == -1) {
      return;
    }

    final newPosition = switch (moveTo) {
        MoveTo.up => currentIndex - 1,
        MoveTo.down => currentIndex + 1,
    };

    try {
      categoryList.swap(currentIndex, newPosition);
      final updates = categoryList //
          .mapIndexed((index, category) => CategoryUpdate(
                id: Value(category.id),
                sort: Value(index),
              ))
          .toList();
      repository.updatePartialMultiple(updates);
    } catch (e) {
      logger.e(e);
      rethrow;
    }
  }

  Future<void> sortAlphabetically() async {
    final categories = await repository.getAll();
    final updates = categories //
        .sortedBy((category) => category.name)
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
ReorderCategory reorderCategory(ReorderCategoryRef ref) => ReorderCategory(
      repository: ref.watch(categoryRepositoryProvider),
      logger: ref.watch(loggerProvider),
    );

enum MoveTo { up, down }
