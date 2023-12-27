import 'package:drift/drift.dart';

import 'package:flutteryomi/data/database.dart';
import 'package:flutteryomi/data/drift/data/manga_sync.drift.dart';
import 'package:flutteryomi/domain/track/model/track.dart';
import 'package:flutteryomi/domain/track/repository/track_repository.dart';

class TrackRepositoryImpl implements TrackRepository {
  TrackRepositoryImpl({required this.db});
  final Database db;

  @override
  Future<Track?> getTrackById(int id) async =>
      await db.mangaSyncDrift.getTrackById(id: id).getSingleOrNull();

  @override
  Future<List<Track>> getTracksByMangaId(int mangaId) async =>
      await db.mangaSyncDrift.getTracksByMangaId(mangaId: mangaId).get();

  @override
  Stream<List<Track>> getTracksAsStream() =>
      db.mangaSyncDrift.getTracks().watch();

  @override
  Stream<List<Track>> getTracksByMangaIdAsStream(int mangaId) =>
      db.mangaSyncDrift.getTracksByMangaId(mangaId: mangaId).watch();

  @override
  Future<void> delete(int mangaId, int syncId) async =>
      await (db.delete(db.mangaSync,)
            ..where(
              (it) => it.mangaId.equals(mangaId) & it.syncId.equals(syncId),
            ))
          .go();

  @override
  Future<void> insert(Track track) async => await db
      .into(
        db.mangaSync,
      )
      .insert(
        MangaSyncCompanion.insert(
          mangaId: track.mangaId,
          syncId: track.syncId,
          remoteId: track.remoteId,
          title: track.title,
          lastChapterRead: track.lastChapterRead,
          totalChapters: track.totalChapters,
          status: track.status,
          score: track.score,
          remoteUrl: track.remoteUrl,
          startDate: track.startDate,
          finishDate: track.finishDate,
        ),
      );

  @override
  Future<void> insertAll(List<Track> tracks) async {
    await db.batch((batch) {
      batch.insertAll(
        db.mangaSync,
        tracks.map(
          (track) => MangaSyncCompanion.insert(
            mangaId: track.mangaId,
            syncId: track.syncId,
            remoteId: track.remoteId,
            title: track.title,
            lastChapterRead: track.lastChapterRead,
            totalChapters: track.totalChapters,
            status: track.status,
            score: track.score,
            remoteUrl: track.remoteUrl,
            startDate: track.startDate,
            finishDate: track.finishDate,
          ),
        ),
      );
    });
  }
}