import 'package:flutteryomi/data/drift/data/manga_sync.drift.dart';

abstract interface class TrackRepository {
  Future<MangaSyncData?> getTrackById(int id);
  Future<List<MangaSyncData>> getTracksByMangaId(int mangaId);
  Stream<List<MangaSyncData>> getTracksAsStream();
  Stream<List<MangaSyncData>> getTracksByMangaIdAsStream(int mangaId);
  Future<void> delete(int mangaId, int syncId);
  Future<void> insert(MangaSyncData track);
  Future<void> insertAll(List<MangaSyncData> tracks);
}
