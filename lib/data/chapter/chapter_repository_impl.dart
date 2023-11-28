import 'package:drift/drift.dart';
import 'package:riverpod/riverpod.dart';

import 'package:flutteryomi/data/database.dart';
import 'package:flutteryomi/data/drift/data/chapters.drift.dart';
import 'package:flutteryomi/domain/chapter/repository/chapter_repository.dart';

class ChapterRepositoryImpl implements ChapterRepository {
  ChapterRepositoryImpl(this.ref);
  final Ref ref;
  late final db = ref.read(AppDatabase.provider);

  @override
  Future<List<Chapter>> addAll(List<Chapter> chapters) async {
    try {
      List<Chapter> returnedChapters = [];
      await db.transaction(() async {
        for (var chapter in chapters) {
          returnedChapters.add(await db
              .into(db.chapters)
              .insertReturning(ChaptersCompanion.insert(
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
              )));
        }
      });
      return returnedChapters;
    } catch (e) {
      //logcat(LogPriority.ERROR, e);
      return [];
    }
  }

  @override
  Future<void> update(ChaptersCompanion chapterUpdate) async =>
      await (db.update(db.chapters)
            ..where((c) => c.id.equals(chapterUpdate.id.value)))
          .write(chapterUpdate);

  @override
  Future<void> updateAll(List<ChaptersCompanion> chapterUpdates) async =>
      await db.transaction(() async {
        for (var update in chapterUpdates) {
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
      //logcat(LogPriority.ERROR, e);
    }
  }

  @override
  Future<List<Chapter>> getChapterByMangaId(
          {required int mangaId, bool applyScanlatorFilter = false}) async =>
      await db.chaptersDrift
          .getChaptersByMangaId(
              mangaId: mangaId, applyScanlatorFilter: applyScanlatorFilter)
          .get();

  @override
  Future<List<String>> getScanlatorsByMangaId(int mangaId) async =>
      await (db.chaptersDrift.getScanlatorsByMangaId(mangaId: mangaId).get()
          as Future<List<String>>);

  @override
  Stream<List<String>> getScanlatorsByMangaIdAsStream(int mangaId) =>
      (db.chaptersDrift.getScanlatorsByMangaId(mangaId: mangaId).watch()
          as Stream<List<String>>);

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
          {required int mangaId, bool applyScanlatorFilter = false}) =>
      db.chaptersDrift
          .getChaptersByMangaId(
              mangaId: mangaId, applyScanlatorFilter: applyScanlatorFilter)
          .watch();

  @override
  Future<Chapter?> getChapterByUrlAndMangaId(String url, int mangaId) async =>
      await db.chaptersDrift
          .getChapterByUrlAndMangaId(chapterUrl: url, mangaId: mangaId)
          .getSingleOrNull();
}