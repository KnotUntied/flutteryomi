import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:flutteryomi/domain/library/model/library_manga.dart';
import 'package:flutteryomi/domain/manga/repository/manga_repository.dart';

part 'get_library_manga.g.dart';

class GetLibraryManga {
  final MangaRepository repository;
  GetLibraryManga(this.repository);

  Future<List<LibraryManga>> await_() =>
      repository.getLibraryManga();

  Stream<List<LibraryManga>> subscribe() =>
      repository.getLibraryMangaAsStream();
}

@riverpod
GetLibraryManga getLibraryManga(GetLibraryMangaRef ref) =>
    GetLibraryManga(ref.watch(mangaRepositoryProvider));
