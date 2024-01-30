import 'package:logger/logger.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:flutteryomi/core/util/system/logger.dart';
import 'package:flutteryomi/domain/track/repository/track_repository.dart';

part 'delete_track.g.dart';

class DeleteTrack {
  DeleteTrack({
    required this.logger,
    required this.repository,
  });
  final Logger logger;
  final TrackRepository repository;

  Future<void> await_(int mangaId, int syncId) async {
    try {
      await repository.delete(mangaId, syncId);
    } catch (e) {
      logger.e(e);
    }
  }
}

@riverpod
DeleteTrack deleteTrack(DeleteTrackRef ref) => DeleteTrack(
      logger: ref.watch(loggerProvider),
      repository: ref.watch(trackRepositoryProvider),
    );
