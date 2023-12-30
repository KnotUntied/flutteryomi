import 'package:drift/drift.dart';
import 'package:logger/logger.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:flutteryomi/core/util/system/logger.dart';
import 'package:flutteryomi/data/database.dart';
import 'package:flutteryomi/data/drift/data/mangas_categories.drift.dart';
import 'package:flutteryomi/data/manga/manga_mapper.dart';
import 'package:flutteryomi/domain/library/model/library_manga.dart';
import 'package:flutteryomi/domain/manga/model/manga.dart';
import 'package:flutteryomi/domain/manga/model/manga_update.dart';
import 'package:flutteryomi/domain/manga/repository/manga_repository.dart';

part 'manga_repository_impl.g.dart';

class MangaRepositoryImpl implements MangaRepository {
  MangaRepositoryImpl({required this.db, required this.logger});
  final Database db;
  final Logger logger;

  @override
  Future<Manga> getMangaById(int id) async =>
      await db.mangasDrift.getMangaById(id: id).getSingle();

  @override
  Stream<Manga> getMangaByIdAsStream(int id) =>
      db.mangasDrift.getMangaById(id: id).watchSingle();

  @override
  Future<Manga?> getMangaByUrlAndSourceId(String url, int sourceId) async =>
      await db.mangasDrift
          .getMangaByUrlAndSource(url: url, source: sourceId)
          .getSingle();

  @override
  Stream<Manga?> getMangaByUrlAndSourceIdAsStream(String url, int sourceId) =>
      db.mangasDrift
          .getMangaByUrlAndSource(url: url, source: sourceId)
          .watchSingle();

  @override
  Future<List<Manga>> getFavorites() async =>
      await db.mangasDrift.getFavorites().get();

  @override
  Future<List<LibraryManga>> getLibraryManga() async =>
      await db.libraryViewDrift
          .library()
          .map((row) => MangaMapper.mapLibraryManga(row))
          .get();

  @override
  Stream<List<LibraryManga>> getLibraryMangaAsStream() => db.libraryViewDrift
      .library()
      .map((row) => MangaMapper.mapLibraryManga(row))
      .watch();

  @override
  Stream<List<Manga>> getFavoritesBySourceId(int sourceId) =>
      db.mangasDrift.getFavoriteBySourceId(sourceId: sourceId).watch();

  @override
  Future<List<Manga>> getDuplicateLibraryManga(int id, String title) async =>
      await db.mangasDrift.getDuplicateLibraryManga(id: id, title: title).get();

  @override
  Future<bool> resetViewerFlags() async {
    try {
      await db.mangasDrift.resetViewerFlags();
      return true;
    } catch (e) {
      logger.e(e);
      return false;
    }
  }

  @override
  Future<void> setMangaCategories(int mangaId, List<int> categoryIds) async {
    await db.transaction(() async {
      await db.mangasCategoriesDrift.deleteMangaCategoryByMangaId(
        mangaId: mangaId,
      );
      for (final categoryId in categoryIds) {
        await db //
            .into(db.mangasCategories)
            .insert(
              MangasCategoriesCompanion.insert(
                mangaId: mangaId,
                categoryId: categoryId,
              ),
            );
      }
    });
  }

  @override
  Future<int?> insert(Manga manga) async {
    int? lastInsertedRowId;
    await db.transaction(() async {
      Manga? lastInsertedRow = await db //
          .into(db.mangas)
          .insertReturningOrNull(
            MangaUpdate.insert(
              source: manga.source,
              url: manga.url,
              artist: Value(manga.artist),
              author: Value(manga.author),
              description: Value(manga.description),
              genre: Value(manga.genre),
              title: manga.title,
              status: manga.status,
              thumbnailUrl: Value(manga.thumbnailUrl),
              favorite: manga.favorite,
              lastUpdate: Value(manga.lastUpdate),
              nextUpdate: Value(manga.nextUpdate),
              fetchInterval: Value(manga.fetchInterval),
              initialized: manga.initialized,
              viewerFlags: manga.viewerFlags,
              chapterFlags: manga.chapterFlags,
              coverLastModified: manga.coverLastModified,
              dateAdded: manga.dateAdded,
              updateStrategy: Value(manga.updateStrategy),
            ),
          );
      lastInsertedRowId = lastInsertedRow?.id;
    });
    return lastInsertedRowId;
  }

  @override
  Future<bool> update(MangaUpdate update) async {
    try {
      await (db.update(db.mangas)..where((c) => c.id.equals(update.id.value)))
          .write(update);
      return true;
    } catch (e) {
      logger.e(e);
      return false;
    }
  }

  @override
  Future<bool> updateAll(List<MangaUpdate> mangaUpdates) async {
    try {
      await db.transaction(() async {
        for (final update in mangaUpdates) {
          await (db.update(db.mangas)
                ..where((c) => c.id.equals(update.id.value)))
              .write(update);
        }
      });
      return true;
    } catch (e) {
      logger.e(e);
      return false;
    }
  }
}

@riverpod
MangaRepository mangaRepositoryImpl(MangaRepositoryImplRef ref) =>
    MangaRepositoryImpl(
      db: ref.watch(databaseProvider),
      logger: ref.watch(loggerProvider),
    );
