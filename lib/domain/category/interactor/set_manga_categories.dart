import 'package:logger/logger.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:flutteryomi/core/util/system/logger.dart';
import 'package:flutteryomi/domain/manga/repository/manga_repository.dart';

part 'set_manga_categories.g.dart';

class SetMangaCategories {
  final MangaRepository repository;
  final Logger logger;
  SetMangaCategories({
    required this.repository,
    required this.logger,
  });

  Future<void> await_(int mangaId, List<int> categoryIds) async {
    try {
      await repository.setMangaCategories(mangaId, categoryIds);
    } catch (e) {
      logger.e(e);
      rethrow;
    }
  }
}

@riverpod
SetMangaCategories setMangaCategories(SetMangaCategoriesRef ref) =>
    SetMangaCategories(
      repository: ref.watch(mangaRepositoryProvider),
      logger: ref.watch(loggerProvider),
    );
