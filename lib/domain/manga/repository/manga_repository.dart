import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:flutteryomi/domain/library/model/library_manga.dart';
import 'package:flutteryomi/domain/manga/model/manga.dart';
import 'package:flutteryomi/domain/manga/model/manga_update.dart';

part 'manga_repository.g.dart';

abstract interface class MangaRepository {
  Future<Manga> getMangaById(int id);
  Stream<Manga> getMangaByIdAsStream(int id);
  Future<Manga?> getMangaByUrlAndSourceId(String url, int sourceId);
  Stream<Manga?> getMangaByUrlAndSourceIdAsStream(String url, int sourceId);
  Future<List<Manga>> getFavorites();
  Future<List<LibraryManga>> getLibraryManga();
  Stream<List<LibraryManga>> getLibraryMangaAsStream();
  Stream<List<Manga>> getFavoritesBySourceId(int sourceId);
  Future<List<Manga>> getDuplicateLibraryManga(int id, String title);
  Future<bool> resetViewerFlags();
  Future<void> setMangaCategories(int mangaId, List<int> categoryIds);
  Future<int?> insert(Manga manga);
  Future<bool> update(MangaUpdate update);
  Future<bool> updateAll(List<MangaUpdate> mangaUpdates);
}

@riverpod
MangaRepository mangaRepository(MangaRepositoryRef ref) {
  // * Override this in the main method
  throw UnimplementedError();
}
