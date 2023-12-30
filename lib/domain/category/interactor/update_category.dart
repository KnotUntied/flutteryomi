import 'package:logger/logger.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:flutteryomi/core/util/system/logger.dart';
import 'package:flutteryomi/domain/category/model/category_update.dart';
import 'package:flutteryomi/domain/category/repository/category_repository.dart';

part 'update_category.g.dart';

class UpdateCategory {
  final CategoryRepository repository;
  final Logger logger;
  UpdateCategory({
    required this.repository,
    required this.logger,
  });

  Future<void> await_(CategoryUpdate payload) async {
    try {
      repository.updatePartial(payload);
    } catch (e) {
      logger.e(e);
      rethrow;
    }
  }
}

@riverpod
UpdateCategory updateCategory(UpdateCategoryRef ref) => UpdateCategory(
      repository: ref.watch(categoryRepositoryProvider),
      logger: ref.watch(loggerProvider),
    );
