import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:flutteryomi/domain/track/model/track.dart';

part 'track_repository.g.dart';

abstract interface class TrackRepository {
  Future<Track?> getTrackById(int id);
  Future<List<Track>> getTracksByMangaId(int mangaId);
  Stream<List<Track>> getTracksAsStream();
  Stream<List<Track>> getTracksByMangaIdAsStream(int mangaId);
  Future<void> delete(int mangaId, int trackerId);
  Future<void> insert(Track track);
  Future<void> insertAll(List<Track> tracks);
}

// Override this in the main method
@riverpod
TrackRepository trackRepository(TrackRepositoryRef ref) =>
    throw UnimplementedError();
