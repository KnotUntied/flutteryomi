import 'package:flutteryomi/domain/manga/model/manga.dart';
import 'package:flutteryomi/domain/manga/repository/manga_repository.dart';

class GetMangaByUrlAndSourceId {
  final MangaRepository repository;
  GetMangaByUrlAndSourceId(this.repository);

  Future<Manga?> await_(String url, int sourceId) async =>
      await repository.getMangaByUrlAndSourceId(url, sourceId);

  Stream<Manga?> subscribe(String url, int sourceId) =>
      repository.getMangaByUrlAndSourceIdAsStream(url, sourceId);
}
