import 'package:logger/logger.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:flutteryomi/core/util/system/logger.dart';
import 'package:flutteryomi/domain/chapter/model/chapter.dart';
import 'package:flutteryomi/domain/chapter/repository/chapter_repository.dart';

part 'get_chapter_by_url_and_manga_id.g.dart';

class GetChapterByUrlAndMangaId {
  final ChapterRepository chapterRepository;
  final Logger logger;

  GetChapterByUrlAndMangaId(this.chapterRepository, this.logger);

  Future<Chapter?> await_(String url, int sourceId) async {
    try {
      return await chapterRepository.getChapterByUrlAndMangaId(url, sourceId);
    } catch (e) {
      logger.e(e);
      return null;
    }
  }
}

@riverpod
GetChapterByUrlAndMangaId getChapterByUrlAndMangaId(
  GetChapterByUrlAndMangaIdRef ref,
) =>
    GetChapterByUrlAndMangaId(
      ref.watch(chapterRepositoryProvider),
      ref.watch(loggerProvider),
    );
