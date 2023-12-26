import 'package:flutteryomi/domain/track/model/track.dart';

abstract interface class TrackRepository {
  Future<Track?> getTrackById(int id);
  Future<List<Track>> getTracksByMangaId(int mangaId);
  Stream<List<Track>> getTracksAsStream();
  Stream<List<Track>> getTracksByMangaIdAsStream(int mangaId);
  Future<void> delete(int mangaId, int syncId);
  Future<void> insert(Track track);
  Future<void> insertAll(List<Track> tracks);
}
