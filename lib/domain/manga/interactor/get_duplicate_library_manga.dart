import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:flutteryomi/domain/manga/model/manga.dart';
import 'package:flutteryomi/domain/manga/repository/manga_repository.dart';

part 'get_duplicate_library_manga.g.dart';

class GetDuplicateLibraryManga {
  final MangaRepository repository;
  GetDuplicateLibraryManga(this.repository);

  Future<List<Manga>> await_(Manga manga) => repository
      .getDuplicateLibraryManga(manga.id, manga.title.toLowerCase());
}

@riverpod
GetDuplicateLibraryManga getDuplicateLibraryManga(
  GetDuplicateLibraryMangaRef ref,
) =>
    GetDuplicateLibraryManga(ref.watch(mangaRepositoryProvider));
