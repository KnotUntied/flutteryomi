import 'package:async/async.dart';
import 'package:dartx/dartx.dart';
import 'package:flutteryomi/domain/chapter/model/chapter.dart';
import 'package:flutteryomi/domain/chapter/repository/chapter_repository.dart';
import 'package:flutteryomi/domain/manga/model/manga.dart';
import 'package:flutteryomi/domain/manga/repository/manga_repository.dart';

class GetMangaByUrlAndSourceId {
  final MangaRepository mangaRepository;
  final ChapterRepository chapterRepository;
  GetMangaByUrlAndSourceId({
    required this.mangaRepository,
    required this.chapterRepository,
  });

  Future<Stream<Pair<Manga, List<Chapter>>>> subscribe(
    int id, {
    bool applyScanlationFilter = false,
  }) async =>
      StreamZip(
        [
          mangaRepository.getMangaByIdAsStream(id),
          chapterRepository.getChapterByMangaIdAsStream(
            id,
            applyScanlatorFilter: applyScanlationFilter,
          ),
        ],
      ).map(
        (values) => Pair(
          values.first as Manga,
          values.second as List<Chapter>,
        ),
      );

  Future<Manga> awaitManga(int id) async =>
      await mangaRepository.getMangaById(id);

  Future<List<Chapter>> awaitChapters(
    int id, {
    bool applyScanlationFilter = false,
  }) async =>
      await chapterRepository.getChapterByMangaId(
        id,
        applyScanlatorFilter: applyScanlationFilter,
      );
}
