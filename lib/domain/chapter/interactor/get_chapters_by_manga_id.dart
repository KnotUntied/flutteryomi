import 'package:logger/logger.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:flutteryomi/core/util/system/logger.dart';
import 'package:flutteryomi/domain/chapter/model/chapter.dart';
import 'package:flutteryomi/domain/chapter/repository/chapter_repository.dart';

part 'get_chapters_by_manga_id.g.dart';

class GetChaptersByMangaId {
  final ChapterRepository repository;
  final Logger logger;

  GetChaptersByMangaId(this.repository, this.logger);

  Future<List<Chapter>> await_(
    int mangaId, {
    bool applyScanlatorFilter = false,
  }) async {
    try {
      return await repository.getChapterByMangaId(
        mangaId,
        applyScanlatorFilter: applyScanlatorFilter,
      );
    } catch (e) {
      logger.e(e);
      return [];
    }
  }
}

@riverpod
GetChaptersByMangaId getChaptersByMangaId(GetChaptersByMangaIdRef ref) =>
    GetChaptersByMangaId(
      ref.watch(chapterRepositoryProvider),
      ref.watch(loggerProvider),
    );
