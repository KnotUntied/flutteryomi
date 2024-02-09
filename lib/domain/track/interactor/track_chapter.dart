import 'package:dartx/dartx.dart';
import 'package:flutteryomi/data/track/tracker_manager.dart';
import 'package:flutteryomi/domain/track/interactor/get_tracks.dart';
import 'package:logger/logger.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:flutteryomi/core/util/system/logger.dart';
import 'package:flutteryomi/data/track/tracker.dart';
import 'package:flutteryomi/domain/chapter/interactor/get_chapters_by_manga_id.dart';
import 'package:flutteryomi/domain/chapter/interactor/update_chapter.dart';
import 'package:flutteryomi/domain/chapter/model/chapter.dart';
import 'package:flutteryomi/domain/chapter/model/chapter_update.dart';
import 'package:flutteryomi/domain/track/interactor/insert_track.dart';
import 'package:flutteryomi/domain/track/model/track.dart';

part 'track_chapter.g.dart';

//TODO
class TrackChapter {
  TrackChapter({
    required this.logger,
    required this.getTracks,
    required this.trackerManager,
    required this.insertTrack,
    //required this.delayedTrackingStore,
  });

  final Logger logger;
  final GetTracks getTracks;
  final TrackerManager trackerManager;
  final InsertTrack insertTrack;
  //final DelayedTrackingStore delayedTrackingStore;

  Future<void> await_(int mangaId, double chapterNumber) async {
    final tracks = await getTracks.await_(mangaId);
    if (tracks.isEmpty) return;

    final availableTracks = await Future.wait(
      tracks.mapNotNull((track) async {
        final service = trackerManager.get(track.trackerId);
        if (!service.isLoggedIn || chapterNumber <= track.lastChapterRead) return null;
        try {
          final refreshedTrack = await service.refresh(track);
          final updatedTrack = refreshedTrack.copyWith(lastChapterRead: chapterNumber);
          service.update(updatedTrack, true);
          await insertTrack.await_(updatedTrack);
          //delayedTrackingStore.remove(track.id);
        } catch (e) {
          //delayedTrackingStore.add(track.id, chapterNumber);
          //DelayedTrackingUpdateJob.setupTask(context);
          rethrow;
        }
      }),
    );
    availableTracks.mapNotNull((it) {
      try {
        it;
        return null;
      } catch (e) {
        return e;
      }
    }).forEach((it) => logger.w(it));
  }
}

@riverpod
TrackChapter trackChapter(TrackChapterRef ref) => TrackChapter(
      logger: ref.watch(loggerProvider),
      getTracks: ref.watch(getTracksProvider),
      trackerManager: ref.watch(trackerManagerProvider),
      insertTrack: ref.watch(insertTrackProvider),
      //delayedTrackingStore: ref.watch(delayedTrackingStoreProvider),
    );
