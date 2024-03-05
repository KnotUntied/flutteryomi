import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:flutteryomi/data/database.dart';
import 'package:flutteryomi/data/drift/views/updates_view.drift.dart';
import 'package:flutteryomi/domain/manga/model/manga_cover.dart';
import 'package:flutteryomi/domain/updates/model/updates_with_relations.dart';
import 'package:flutteryomi/domain/updates/repository/updates_repository.dart';

part 'updates_repository_impl.g.dart';

class UpdatesRepositoryImpl implements UpdatesRepository {
  UpdatesRepositoryImpl({required this.db});
  final Database db;

  @override
  Future<List<UpdatesWithRelations>> awaitWithRead(bool read, DateTime after, int limit) =>
      db.updatesViewDrift
          .getUpdatesByReadStatus(read: read, after: after, limit: limit)
          .map((row) => _mapUpdatesWithRelations(row))
          .get();

  @override
  Stream<List<UpdatesWithRelations>> subscribeAll(DateTime after, int limit) =>
      db.updatesViewDrift
          .getRecentUpdates(after: after, limit: limit)
          .map((row) => _mapUpdatesWithRelations(row))
          .watch();

  @override
  Stream<List<UpdatesWithRelations>> subscribeWithRead(bool read, DateTime after, int limit) =>
      db.updatesViewDrift
          .getUpdatesByReadStatus(read: read, after: after, limit: limit)
          .map((row) => _mapUpdatesWithRelations(row))
          .watch();

  UpdatesWithRelations _mapUpdatesWithRelations(UpdatesViewData row) => UpdatesWithRelations(
    mangaId: row.mangaId,
    mangaTitle: row.mangaTitle,
    chapterId: row.chapterId,
    chapterName: row.chapterName,
    scanlator: row.scanlator,
    read: row.read,
    bookmark: row.bookmark,
    lastPageRead: row.lastPageRead,
    sourceId: row.source,
    dateFetch: row.dateFetch,
    coverData: MangaCover(
      mangaId: row.mangaId,
      sourceId: row.source,
      isMangaFavorite: row.favorite,
      url: row.thumbnailUrl,
      lastModified: row.coverLastModified,
    ),
  );
}

@riverpod
UpdatesRepository updatesRepositoryImpl(UpdatesRepositoryImplRef ref) =>
    UpdatesRepositoryImpl(
      db: ref.watch(databaseProvider),
    );
