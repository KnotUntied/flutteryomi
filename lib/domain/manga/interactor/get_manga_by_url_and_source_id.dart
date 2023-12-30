import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:flutteryomi/domain/manga/model/manga.dart';
import 'package:flutteryomi/domain/manga/repository/manga_repository.dart';

part 'get_manga_by_url_and_source_id.g.dart';

class GetMangaByUrlAndSourceId {
  final MangaRepository repository;
  GetMangaByUrlAndSourceId(this.repository);

  Future<Manga?> await_(String url, int sourceId) async =>
      await repository.getMangaByUrlAndSourceId(url, sourceId);

  Stream<Manga?> subscribe(String url, int sourceId) =>
      repository.getMangaByUrlAndSourceIdAsStream(url, sourceId);
}

@riverpod
GetMangaByUrlAndSourceId getMangaByUrlAndSourceId(
  GetMangaByUrlAndSourceIdRef ref,
) =>
    GetMangaByUrlAndSourceId(ref.watch(mangaRepositoryProvider));
