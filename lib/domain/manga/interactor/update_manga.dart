import 'package:dartx/dartx.dart';
import 'package:drift/drift.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:flutteryomi/domain/manga/model/manga.dart';
import 'package:flutteryomi/domain/manga/model/manga_update.dart';
import 'package:flutteryomi/domain/manga/interactor/fetch_interval.dart';
import 'package:flutteryomi/domain/manga/repository/manga_repository.dart';

part 'update_manga.g.dart';

class UpdateManga {
  final MangaRepository repository;
  final FetchInterval fetchInterval;
  UpdateManga(this.repository, this.fetchInterval);

  Future<bool> await_(MangaUpdate mangaUpdate) async =>
      await repository.update(mangaUpdate);

  Future<bool> awaitAll(List<MangaUpdate> mangaUpdates) async =>
      await repository.updateAll(mangaUpdates);

  // TODO awaitUpdateFromSource

  Future<bool> awaitUpdateFetchInterval(
    Manga manga, {
    DateTime? dateTime,
    Pair<int, int>? window,
  }) async {
    dateTime ??= DateTime.now();
    window ??= fetchInterval.getWindow(dateTime);
    MangaUpdate? mangaUpdate = await fetchInterval.toMangaUpdateOrNull(
      manga,
      dateTime,
      window,
    );
    return mangaUpdate != null ? await repository.update(mangaUpdate) : false;
  }

  Future<bool> awaitUpdateLastUpdate(int mangaId) async =>
      await repository.update(
        MangaUpdate(
          id: Value(mangaId),
          lastUpdate: Value(DateTime.now()),
        ),
      );

  Future<bool> awaitUpdateCoverLastModified(int mangaId) async =>
      await repository.update(
        MangaUpdate(
          id: Value(mangaId),
          coverLastModified: Value(DateTime.now()),
        ),
      );

  Future<bool> awaitUpdateFavorite(int mangaId, bool favorite) async =>
      await repository.update(
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
