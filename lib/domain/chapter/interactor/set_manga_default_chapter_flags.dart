import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:flutteryomi/domain/library/service/library_preferences.dart';
import 'package:flutteryomi/domain/manga/interactor/get_favorites.dart';
import 'package:flutteryomi/domain/manga/interactor/set_manga_chapter_flags.dart';
import 'package:flutteryomi/domain/manga/model/manga.dart';

part 'set_manga_default_chapter_flags.g.dart';

class SetMangaDefaultChapterFlags {
  final LibraryPreferences preferences;
  final GetFavorites getFavorites;
  final SetMangaChapterFlags setMangaChapterFlags;

  SetMangaDefaultChapterFlags(
    this.preferences,
    this.getFavorites,
    this.setMangaChapterFlags,
  );

  Future<void> await_(Manga manga) => setMangaChapterFlags.awaitSetAllFlags(
        mangaId: manga.id,
        unreadFilter: preferences.filterChapterByRead().get(),
        downloadedFilter: preferences.filterChapterByDownloaded().get(),
        bookmarkedFilter: preferences.filterChapterByBookmarked().get(),
        sortingMode: preferences.sortChapterBySourceOrNumber().get(),
        sortingDirection:
            preferences.sortChapterByAscendingOrDescending().get(),
        displayMode: preferences.displayChapterByNameOrNumber().get(),
      );

  Future<void> awaitAll() async {
    final favorites = await getFavorites.await_();
    for (final it in favorites) {
      await await_(it);
    }
  }
}

@riverpod
SetMangaDefaultChapterFlags setMangaDefaultChapterFlags(
  SetMangaDefaultChapterFlagsRef ref,
) =>
    SetMangaDefaultChapterFlags(
      ref.watch(libraryPreferencesProvider),
      ref.watch(getFavoritesProvider),
      ref.watch(setMangaChapterFlagsProvider),
    );
