import 'package:riverpod/riverpod.dart';

import 'package:flutteryomi/core/util/system/logger.dart';
import 'package:flutteryomi/data/drift/data/manga_sync.drift.dart';
import 'package:flutteryomi/domain/track/repository/track_repository.dart';

class InsertTrack {
  InsertTrack({
    required this.repository,
    required this.ref,
  });
  final Ref ref;
  final TrackRepository repository;
  late final logger = ref.read(loggerProvider);

  Future<void> await_(MangaSyncData track) async {
    try {
      await repository.insert(track);
    } catch (e) {
      logger.e(e);
    }
  }

  Future<void> awaitAll(List<MangaSyncData> tracks) async {
    try {
      await repository.insertAll(tracks);
    } catch (e) {
      logger.e(e);
    }
  }
}
