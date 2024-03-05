import 'package:drift/drift.dart';
import 'package:logger/logger.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:flutteryomi/core/util/system/logger.dart';
import 'package:flutteryomi/domain/category/model/category.dart';
import 'package:flutteryomi/domain/category/model/category_update.dart';
import 'package:flutteryomi/domain/category/repository/category_repository.dart';

part 'rename_category.g.dart';

class RenameCategory {
  final CategoryRepository repository;
  final Logger logger;
  RenameCategory({
    required this.repository,
    required this.logger,
  });

  Future<void> await_(int categoryId, String name) async {
    final update = CategoryUpdate(
      id: Value(categoryId),
      name: Value(name),
    );

    try {
      repository.updatePartial(update);
    } catch (e) {
      logger.e(e);
      rethrow;
    }
  }

  Future<void> awaitWithCategory(Category category, String name) =>
      await_(category.id, name);
}

@riverpod
RenameCategory renameCategory(RenameCategoryRef ref) => RenameCategory(
      repository: ref.watch(categoryRepositoryProvider),
      logger: ref.watch(loggerProvider),
    );
