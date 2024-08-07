import 'package:drift/drift.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:flutteryomi/domain/manga/model/manga.dart';
import 'package:flutteryomi/domain/manga/model/manga_update.dart';
import 'package:flutteryomi/domain/manga/repository/manga_repository.dart';

part 'set_manga_chapter_flags.g.dart';

class SetMangaChapterFlags {
  final MangaRepository repository;
  SetMangaChapterFlags(this.repository);

  Future<bool> awaitSetDownloadedFilter(Manga manga, int flag) =>
      repository.update(
        MangaUpdate(
          id: Value(manga.id),
          chapterFlags: Value(
            manga.chapterFlags.setFlag(flag, MangaUtils.chapterDownloadedMask),
          ),
        ),
      );

  Future<bool> awaitSetUnreadFilter(Manga manga, int flag) => repository.update(
        MangaUpdate(
          id: Value(manga.id),
          chapterFlags: Value(
            manga.chapterFlags.setFlag(flag, MangaUtils.chapterUnreadMask),
          ),
        ),
      );

  Future<bool> awaitSetBookmarkFilter(Manga manga, int flag) =>
      repository.update(MangaUpdate(
        id: Value(manga.id),
        chapterFlags: Value(
          manga.chapterFlags.setFlag(flag, MangaUtils.chapterBookmarkedMask),
        ),
      ));

  Future<bool> awaitSetDisplayMode(Manga manga, int flag) =>
      repository.update(MangaUpdate(
        id: Value(manga.id),
        chapterFlags: Value(
          manga.chapterFlags.setFlag(flag, MangaUtils.chapterDisplayMask),
        ),
      ));

  Future<bool> awaitSetSortingModeOrFlipOrder(Manga manga, int flag) {
    int newFlags = manga.chapterFlags;
    if (manga.sorting == flag) {
      final orderFlag = manga.sortDescending()
          ? MangaUtils.chapterSortAsc
          : MangaUtils.chapterSortDesc;
      newFlags = newFlags.setFlag(orderFlag, MangaUtils.chapterSortDirMask);
    } else {
      newFlags = newFlags
          .setFlag(flag, MangaUtils.chapterSortingMask)
          .setFlag(MangaUtils.chapterSortAsc, MangaUtils.chapterSortDirMask);
    }
    return repository.update(
      MangaUpdate(id: Value(manga.id), chapterFlags: Value(newFlags)),
    );
  }

  Future<bool> awaitSetAllFlags({
    required int mangaId,
    required int unreadFilter,
    required int downloadedFilter,
    required int bookmarkedFilter,
    required int sortingMode,
    required int sortingDirection,
    required int displayMode,
  }) =>
      repository.update(
        MangaUpdate(
          id: Value(mangaId),
          chapterFlags: Value(
            0
                .setFlag(unreadFilter, MangaUtils.chapterUnreadMask)
                .setFlag(downloadedFilter, MangaUtils.chapterDownloadedMask)
                .setFlag(bookmarkedFilter, MangaUtils.chapterBookmarkedMask)
                .setFlag(sortingMode, MangaUtils.chapterSortingMask)
                .setFlag(sortingDirection, MangaUtils.chapterSortDirMask)
                .setFlag(displayMode, MangaUtils.chapterDisplayMask),
          ),
        ),
      );
}

@riverpod
SetMangaChapterFlags setMangaChapterFlags(SetMangaChapterFlagsRef ref) =>
    SetMangaChapterFlags(ref.watch(mangaRepositoryProvider));

extension _SetFlag on int {
  int setFlag(int flag, int mask) => this & ~mask | (flag & mask);
}
