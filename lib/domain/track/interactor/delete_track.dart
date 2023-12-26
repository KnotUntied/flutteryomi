import 'package:logger/logger.dart';

import 'package:flutteryomi/domain/track/repository/track_repository.dart';

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
