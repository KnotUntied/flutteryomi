import 'package:async/async.dart';
import 'package:dartx/dartx.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:flutteryomi/domain/chapter/model/chapter.dart';
import 'package:flutteryomi/domain/chapter/repository/chapter_repository.dart';
import 'package:flutteryomi/domain/manga/model/manga.dart';
import 'package:flutteryomi/domain/manga/repository/manga_repository.dart';

part 'get_manga_with_chapters.g.dart';

class GetMangaWithChapters {
  final MangaRepository mangaRepository;
  final ChapterRepository chapterRepository;
  GetMangaWithChapters({
    required this.mangaRepository,
    required this.chapterRepository,
  });

  Stream<Pair<Manga, List<Chapter>>> subscribe(
    int id, {
    bool applyScanlatorFilter = false,
  }) =>
      StreamZip(
        [
          mangaRepository.getMangaByIdAsStream(id),
          chapterRepository.getChapterByMangaIdAsStream(
            id,
            applyScanlatorFilter: applyScanlatorFilter,
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
    bool applyScanlatorFilter = false,
  }) async =>
      await chapterRepository.getChapterByMangaId(
        id,
        applyScanlatorFilter: applyScanlatorFilter,
      );
}

@riverpod
GetMangaWithChapters getMangaWithChapters(GetMangaWithChaptersRef ref) =>
    GetMangaWithChapters(
      mangaRepository: ref.watch(mangaRepositoryProvider),
      chapterRepository: ref.watch(chapterRepositoryProvider),
    );
