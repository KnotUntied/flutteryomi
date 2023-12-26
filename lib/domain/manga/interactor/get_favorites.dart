import 'package:flutteryomi/domain/manga/model/manga.dart';
import 'package:flutteryomi/domain/manga/repository/manga_repository.dart';

class GetFavorites {
  final MangaRepository repository;
  GetFavorites(this.repository);

  Future<List<Manga>> await_() async => await repository.getFavorites();

  Stream<List<Manga>> subscribe(int sourceId) =>
      repository.getFavoritesBySourceId(sourceId);
}
