import 'package:logger/logger.dart';

import 'package:flutteryomi/domain/track/model/track.dart';
import 'package:flutteryomi/domain/track/repository/track_repository.dart';

class GetTracks {
  GetTracks({
    required this.logger,
    required this.repository,
  });
  final Logger logger;
  final TrackRepository repository;

  Future<Track?> awaitOne(int id) async {
    try {
      return await repository.getTrackById(id);
    } catch (e) {
      logger.e(e);
      return null;
    }
  }

  Future<List<Track>> await_(int mangaId) async {
    try {
      return await repository.getTracksByMangaId(mangaId);
    } catch (e) {
      logger.e(e);
      return [];
    }
  }

  Stream<List<Track>> subscribe(int mangaId) => repository.getTracksByMangaIdAsStream(mangaId);
}
