import 'package:flutteryomi/domain/library/model/library_manga.dart';
import 'package:flutteryomi/domain/manga/repository/manga_repository.dart';

class GetLibraryManga {
  final MangaRepository repository;
  GetLibraryManga(this.repository);

  Future<List<LibraryManga>> await_() async =>
      await repository.getLibraryManga();

  Stream<List<LibraryManga>> subscribe() =>
      repository.getLibraryMangaAsStream();
}
