import 'package:dartx/dartx.dart';
import 'package:drift/drift.dart';
import 'package:flutteryomi/data/drift/data/mangas.drift.dart';
import 'package:flutteryomi/domain/manga/interactor/fetch_interval.dart';
import 'package:flutteryomi/domain/manga/repository/manga_repository.dart';

class UpdateManga {
  final MangaRepository repository;
  final FetchInterval fetchInterval;
  UpdateManga(this.repository, this.fetchInterval);

  Future<bool> await_(MangasCompanion mangaUpdate) async =>
      await repository.update(mangaUpdate);

  Future<bool> awaitAll(List<MangasCompanion> mangaUpdates) async =>
      await repository.updateAll(mangaUpdates);

  // TODO awaitUpdateFromSource

  Future<bool> awaitUpdateFetchInterval(
    Manga manga, {
    DateTime? dateTime,
    Pair<int, int>? window,
  }) async {
    dateTime ??= DateTime.now();
    window ??= fetchInterval.getWindow(dateTime);
    MangasCompanion? mangaUpdate = await fetchInterval.toMangaUpdateOrNull(
      manga,
      dateTime,
      window,
    );
    return mangaUpdate != null ? await repository.update(mangaUpdate) : false;
  }

  Future<bool> awaitUpdateLastUpdate(int mangaId) async =>
      await repository.update(
        MangasCompanion(
          id: Value(mangaId),
          lastUpdate: Value(DateTime.now()),
        ),
      );

  Future<bool> awaitUpdateCoverLastModified(int mangaId) async =>
      await repository.update(
        MangasCompanion(
          id: Value(mangaId),
          coverLastModified: Value(DateTime.now()),
        ),
      );

  Future<bool> awaitUpdateFavorite(int mangaId, bool favorite) async =>
      await repository.update(
        MangasCompanion(
          id: Value(mangaId),
          favorite: Value(favorite),
          dateAdded: Value(
            switch (favorite) {
              true => DateTime.now(),
              false => DateTime.fromMillisecondsSinceEpoch(0, isUtc: true),
            },
          ),
        ),
      );
}
