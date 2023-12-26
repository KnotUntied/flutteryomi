import 'package:flutteryomi/domain/manga/model/manga.dart';
import 'package:flutteryomi/domain/manga/repository/manga_repository.dart';

class NetworkToLocalManga {
  final MangaRepository repository;
  NetworkToLocalManga(this.repository);

  Future<Manga?> await_(Manga manga) async {
    final Manga? localManga = await _getManga(manga.url, manga.source);
    if (localManga == null) {
      final int? id = await _insertManga(manga);
      return manga.copyWith(id: id!);
    } else if (!localManga.favorite) {
      return localManga.copyWith(title: manga.title);
    } else {
      return localManga;
    }
  }

  Future<Manga?> _getManga(String url, int sourceId) async =>
      await repository.getMangaByUrlAndSourceId(url, sourceId);

  Future<int?> _insertManga(Manga manga) async =>
      await repository.insert(manga);
}
