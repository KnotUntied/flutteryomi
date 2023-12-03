import 'package:flutteryomi/data/drift/data/mangas.drift.dart';
import 'package:flutteryomi/domain/manga/repository/manga_repository.dart';

class GetDuplicateLibraryManga {
  final MangaRepository repository;
  GetDuplicateLibraryManga(this.repository);

  Future<List<Manga>> await_(Manga manga) async => await repository
      .getDuplicateLibraryManga(manga.id, manga.title.toLowerCase());
}