import 'package:riverpod/riverpod.dart';

import 'package:flutteryomi/core/util/system/logger.dart';
import 'package:flutteryomi/domain/track/repository/track_repository.dart';

class DeleteTrack {
  DeleteTrack({
    required this.repository,
    required this.ref,
  });
  final Ref ref;
  final TrackRepository repository;
  late final logger = ref.read(loggerProvider);

  Future<void> await_(int mangaId, int syncId) async {
    try {
      await repository.delete(mangaId, syncId);
    } catch (e) {
      logger.e(e);
    }
  }
}
