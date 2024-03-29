import 'package:logger/logger.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:flutteryomi/core/util/system/logger.dart';
import 'package:flutteryomi/domain/track/model/track.dart';
import 'package:flutteryomi/domain/track/repository/track_repository.dart';

part 'insert_track.g.dart';

class InsertTrack {
  InsertTrack({
    required this.logger,
    required this.repository,
  });
  final Logger logger;
  final TrackRepository repository;

  Future<void> await_(Track track) async {
    try {
      await repository.insert(track);
    } catch (e) {
      logger.e(e);
    }
  }

  Future<void> awaitAll(List<Track> tracks) async {
    try {
      await repository.insertAll(tracks);
    } catch (e) {
      logger.e(e);
    }
  }
}

@riverpod
InsertTrack insertTrack(InsertTrackRef ref) => InsertTrack(
      logger: ref.watch(loggerProvider),
      repository: ref.watch(trackRepositoryProvider),
    );
