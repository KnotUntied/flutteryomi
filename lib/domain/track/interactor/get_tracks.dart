import 'package:logger/logger.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:flutteryomi/core/util/system/logger.dart';
import 'package:flutteryomi/domain/track/model/track.dart';
import 'package:flutteryomi/domain/track/repository/track_repository.dart';

part 'get_tracks.g.dart';

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

@riverpod
GetTracks getTracks(GetTracksRef ref) => GetTracks(
      logger: ref.watch(loggerProvider),
      repository: ref.watch(trackRepositoryProvider),
    );
