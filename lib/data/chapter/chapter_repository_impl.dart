import 'package:drift/drift.dart';
import 'package:logger/logger.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:flutteryomi/core/util/system/logger.dart';
import 'package:flutteryomi/data/database.dart';
import 'package:flutteryomi/domain/chapter/model/chapter.dart';
import 'package:flutteryomi/domain/chapter/model/chapter_update.dart';
import 'package:flutteryomi/domain/chapter/repository/chapter_repository.dart';

part 'chapter_repository_impl.g.dart';

class ChapterRepositoryImpl implements ChapterRepository {
  ChapterRepositoryImpl({required this.db, required this.logger});
  final Database db;
  final Logger logger;

  @override
  Future<List<Chapter>> addAll(List<Chapter> chapters) async {
    try {
      List<Chapter> returnedChapters = [];
      await db.transaction(() async {
        for (final chapter in chapters) {
          returnedChapters.add(
            await db //
                .into(db.chapters)
                .insertReturning(
                  ChapterUpdate.insert(
                    mangaId: chapter.mangaId,
                    url: chapter.url,
                    name: chapter.name,
                    scanlator: Value(chapter.scanlator),
                    read: chapter.read,
                    bookmark: chapter.bookmark,
                    lastPageRead: chapter.lastPageRead,
                    chapterNumber: chapter.chapterNumber,
                    sourceOrder: chapter.sourceOrder,
                    dateFetch: chapter.dateFetch,
                    dateUpload: chapter.dateUpload,
                  ),
                ),
          );
        }
      });
      return returnedChapters;
    } catch (e) {
      logger.e(e);
      return [];
    }
  }

  @override
  Future<void> update(ChapterUpdate chapterUpdate) async =>
      await (db.update(db.chapters)
            ..where((c) => c.id.equals(chapterUpdate.id.value)))
          .write(chapterUpdate);

  @override
  Future<void> updateAll(List<ChapterUpdate> chapterUpdates) async =>
      await db.transaction(() async {
        for (final update in chapterUpdates) {
          await (db.update(db.chapters)
                ..where((c) => c.id.equals(update.id.value)))
              .write(update);
        }
      });

  @override
  Future<void> removeChaptersWithIds(List<int> chapterIds) async {
    try {
      await db.chaptersDrift.removeChaptersWithIds(chapterIds: chapterIds);
    } catch (e) {
      logger.e(e);
    }
  }

  @override
  Future<List<Chapter>> getChapterByMangaId(
    int mangaId, {
    bool applyScanlatorFilter = false,
  }) async =>
      await db.chaptersDrift
          .getChaptersByMangaId(
            mangaId: mangaId,
            applyScanlatorFilter: applyScanlatorFilter,
          )
          .get();

  @override
  Future<List<String>> getScanlatorsByMangaId(int mangaId) async =>
      (await db.chaptersDrift.getScanlatorsByMangaId(mangaId: mangaId).get())
          .map((it) => it ?? '')
          .toList();

  @override
  Stream<List<String>> getScanlatorsByMangaIdAsStream(int mangaId) =>
      db.chaptersDrift
          .getScanlatorsByMangaId(mangaId: mangaId)
          .watch()
          .map((it) => it.map((it2) => it2 ?? '').toList());

  @override
  Future<List<Chapter>> getBookmarkedChaptersByMangaId(int mangaId) async =>
      await db.chaptersDrift
          .getBookmarkedChaptersByMangaId(mangaId: mangaId)
          .get();

  @override
  Future<Chapter?> getChapterById(int id) async =>
      await db.chaptersDrift.getChapterById(id: id).getSingleOrNull();

  @override
  Stream<List<Chapter>> getChapterByMangaIdAsStream(
    int mangaId, {
    bool applyScanlatorFilter = false,
  }) =>
      db.chaptersDrift
          .getChaptersByMangaId(
            mangaId: mangaId,
            applyScanlatorFilter: applyScanlatorFilter,
          )
          .watch();

  @override
  Future<Chapter?> getChapterByUrlAndMangaId(String url, int mangaId) async =>
      await db.chaptersDrift
          .getChapterByUrlAndMangaId(chapterUrl: url, mangaId: mangaId)
          .getSingleOrNull();
}

@riverpod
ChapterRepository chapterRepositoryImpl(ChapterRepositoryImplRef ref) =>
    ChapterRepositoryImpl(
      db: ref.watch(databaseProvider),
      logger: ref.watch(loggerProvider),
    );
