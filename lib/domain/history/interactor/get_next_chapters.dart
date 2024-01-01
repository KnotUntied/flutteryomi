import 'dart:math';

import 'package:dartx/dartx.dart';
import 'package:flutteryomi/domain/chapter/service/chapter_sort.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:flutteryomi/domain/chapter/interactor/get_chapters_by_manga_id.dart';
import 'package:flutteryomi/domain/chapter/model/chapter.dart';
import 'package:flutteryomi/domain/history/repository/history_repository.dart';
import 'package:flutteryomi/domain/manga/interactor/get_manga.dart';

part 'get_next_chapters.g.dart';

class GetNextChapters {
  final GetChaptersByMangaId getChaptersByMangaId;
  final GetManga getManga;
  final HistoryRepository repository;
  GetNextChapters({
    required this.getChaptersByMangaId,
    required this.getManga,
    required this.repository,
  });

  Future<List<Chapter>> await_([bool onlyUnread = true]) async {
    final history = await repository.getLastHistory();
    return history == null
        ? []
        : await awaitFromChapterId(
            history.mangaId,
            history.chapterId,
            onlyUnread,
          );
  }

  Future<List<Chapter>> awaitByMangaId(
    int mangaId, [
    bool onlyUnread = true,
  ]) async {
    final manga = await getManga.await_(mangaId);
    if (manga == null) return [];
    List<Chapter> chapters = await getChaptersByMangaId.await_(
      mangaId,
      applyScanlatorFilter: true,
    );
    chapters = chapters.sortedWith(
      getChapterSort(manga: manga, sortDescending: false),
    );

    return onlyUnread ? chapters.whereNot((it) => it.read).toList() : chapters;
  }

  Future<List<Chapter>> awaitFromChapterId(
    int mangaId,
    int fromChapterId, [
    bool onlyUnread = true,
  ]) async {
    final chapters = await awaitByMangaId(mangaId, onlyUnread);
    final currChapterIndex = chapters.indexWhere(
      (it) => it.id == fromChapterId,
    );
    final nextChapters = chapters.sublist(
      max(0, currChapterIndex),
      chapters.length,
    );

    if (onlyUnread) return nextChapters;

    // The "next chapter" is either:
    // - The current chapter if it isn't completely read
    // - The chapters after the current chapter if the current one is completely read
    final fromChapter = chapters.elementAtOrNull(currChapterIndex);
    return (fromChapter != null && !fromChapter.read)
        ? nextChapters
        : nextChapters.drop(1);
  }
}

@riverpod
GetNextChapters getNextChapters(GetNextChaptersRef ref) => GetNextChapters(
      getChaptersByMangaId: ref.watch(getChaptersByMangaIdProvider),
      getManga: ref.watch(getMangaProvider),
      repository: ref.watch(historyRepositoryProvider),
    );
