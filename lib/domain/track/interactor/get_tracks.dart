import 'package:riverpod/riverpod.dart';

import 'package:flutteryomi/core/util/system/logger.dart';
import 'package:flutteryomi/data/drift/data/manga_sync.drift.dart';
import 'package:flutteryomi/domain/track/repository/track_repository.dart';

class GetTracks {
  GetTracks({
    required this.repository,
    required this.ref,
  });
  final Ref ref;
  final TrackRepository repository;
  late final logger = ref.read(loggerProvider);

  Future<MangaSyncData?> awaitOne(int id) async {
    try {
      return await repository.getTrackById(id);
    } catch (e) {
      logger.e(e);
      return null;
    }
  }

  Future<List<MangaSyncData>> await_(int mangaId) async {
    try {
      return await repository.getTracksByMangaId(mangaId);
    } catch (e) {
      logger.e(e);
      return [];
    }
  }

  Stream<List<MangaSyncData>> subscribe(int mangaId) => repository.getTracksByMangaIdAsStream(mangaId);
}
