import 'package:dartx/dartx.dart';
import 'package:drift/drift.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:flutteryomi/domain/manga/model/manga.dart';
import 'package:flutteryomi/domain/manga/model/manga_update.dart';
import 'package:flutteryomi/domain/manga/interactor/fetch_interval.dart';
import 'package:flutteryomi/domain/manga/repository/manga_repository.dart';
import 'package:flutteryomi/domain/source/model/smanga.dart';

part 'update_manga.g.dart';

class UpdateManga {
  final MangaRepository repository;
  final FetchInterval fetchInterval;
  UpdateManga(this.repository, this.fetchInterval);

  Future<bool> await_(MangaUpdate mangaUpdate) =>
      repository.update(mangaUpdate);

  Future<bool> awaitAll(List<MangaUpdate> mangaUpdates) =>
      repository.updateAll(mangaUpdates);

  // TODO
  Future<bool> awaitUpdateFromSource(
    Manga localManga,
    SManga remoteManga,
    bool manualFetch,
    //CoverCache coverCache,
  ) {
    String remoteTitle;
    try {
      remoteTitle = remoteManga.title;
      //UninitializedPropertyAccessException
    } catch (_) {
      remoteTitle = '';
    }

    // if the manga isn't a favorite, set its title from source and update in db
    final title = (remoteTitle.isEmpty || localManga.favorite) //
        ? null
        : remoteTitle;

    DateTime? coverLastModified;
    // Never refresh covers if the url is empty to avoid "losing" existing covers
    if (remoteManga.thumbnailUrl.isNullOrEmpty) {
      coverLastModified = null;
      //} else if (!manualFetch &&
      //    localManga.thumbnailUrl == remoteManga.thumbnailUrl) {
      //  coverLastModified = null;
      //} else if (localManga.isLocal()) {
      //  coverLastModified = DateTime.now();
      //} else if (localManga.hasCustomCover(coverCache)) {
      //  coverCache.deleteFromCache(localManga, false);
      //  coverLastModified = null;
      //} else {
      //  coverCache.deleteFromCache(localManga, false);
      //  coverLastModified = DateTime.now();
    }

    final thumbnailUrl = remoteManga.thumbnailUrl.isNotNullOrEmpty
        ? remoteManga.thumbnailUrl
        : null;

    return repository.update(
      MangaUpdate(
        id: Value(localManga.id),
        title: title != null ? Value(title) : const Value.absent(),
        coverLastModified: coverLastModified != null
            ? Value(coverLastModified)
            : const Value.absent(),
        author: Value(remoteManga.author),
        artist: Value(remoteManga.artist),
        description: Value(remoteManga.description),
        genre: Value(remoteManga.getGenres()),
        thumbnailUrl: Value(thumbnailUrl),
        status: Value(remoteManga.status),
        updateStrategy: Value(remoteManga.updateStrategy.index),
        initialized: const Value(true),
      ),
    );
  }

  Future<bool> awaitUpdateFetchInterval(
    Manga manga, [
    DateTime? dateTime,
    Pair<int, int>? window,
  ]) async {
    dateTime ??= DateTime.now();
    window ??= fetchInterval.getWindow(dateTime);
    MangaUpdate? mangaUpdate = await fetchInterval.toMangaUpdateOrNull(
      manga,
      dateTime,
      window,
    );
    return mangaUpdate != null ? await repository.update(mangaUpdate) : false;
  }

  Future<bool> awaitUpdateLastUpdate(int mangaId) => repository.update(
        MangaUpdate(
          id: Value(mangaId),
          lastUpdate: Value(DateTime.now()),
        ),
      );

  Future<bool> awaitUpdateCoverLastModified(int mangaId) => repository.update(
        MangaUpdate(
          id: Value(mangaId),
          coverLastModified: Value(DateTime.now()),
        ),
      );

  Future<bool> awaitUpdateFavorite(int mangaId, bool favorite) =>
      repository.update(
        MangaUpdate(
          id: Value(mangaId),
          favorite: Value(favorite),
          dateAdded: Value(
            favorite
                ? DateTime.now()
                : DateTime.fromMillisecondsSinceEpoch(0, isUtc: true),
          ),
        ),
      );
}

@riverpod
UpdateManga updateManga(UpdateMangaRef ref) => UpdateManga(
      ref.watch(mangaRepositoryProvider),
      ref.watch(fetchIntervalProvider),
    );
