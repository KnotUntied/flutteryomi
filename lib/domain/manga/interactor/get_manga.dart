import 'package:flutteryomi/domain/manga/model/manga.dart';
import 'package:flutteryomi/domain/manga/repository/manga_repository.dart';

class GetManga {
  final MangaRepository repository;
  GetManga(this.repository);

  Future<Manga?> await_(int id) async {
    try {
      return await repository.getMangaById(id);
    } catch (e) {
      //logger
      return null;
    }
  }

  Stream<Manga> subscribe(int id) => repository.getMangaByIdAsStream(id);
}
