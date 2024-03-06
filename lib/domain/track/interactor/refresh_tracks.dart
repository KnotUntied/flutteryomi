import 'package:dartx/dartx.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:flutteryomi/data/track/tracker.dart';
import 'package:flutteryomi/data/track/tracker_manager.dart';
import 'package:flutteryomi/domain/track/interactor/get_tracks.dart';
import 'package:flutteryomi/domain/track/interactor/insert_track.dart';
import 'package:flutteryomi/domain/track/interactor/sync_chapter_progress_with_track.dart';

part 'refresh_tracks.g.dart';

class RefreshTracks {
  RefreshTracks({
    required this.getTracks,
    required this.trackerManager,
    required this.insertTrack,
    required this.syncChapterProgressWithTrack,
  });

  final GetTracks getTracks;
  final InsertTrack insertTrack;
  final SyncChapterProgressWithTrack syncChapterProgressWithTrack;
  final TrackerManager trackerManager;

  /// Fetches updated tracking data from all logged in trackers.
  ///
  /// Returns failed updates.
  Future<List<Pair<Tracker?, Exception>>> await_(int mangaId) async {
    final tracks = await getTracks.await_(mangaId);
    final loggedInTracks = { for (final it in tracks) it : trackerManager.get(it.trackerId) }
        .filter((e) => e.value.isLoggedIn == true);
    final trackErrors = <Pair<Tracker, Exception>>[];
    for (final entry in loggedInTracks.entries) {
      final track = entry.key;
      final service = entry.value;
      try {
        final updatedTrack = await service.refresh(track);
        await insertTrack.await_(updatedTrack);
        await syncChapterProgressWithTrack.await_(mangaId, updatedTrack, service);
      } on Exception catch (e) {
        trackErrors.add(Pair(service, e));
      }
    }
    return trackErrors;
  }
}

@riverpod
RefreshTracks refreshTracks(RefreshTracksRef ref) => RefreshTracks(
      getTracks: ref.watch(getTracksProvider),
      trackerManager: ref.watch(trackerManagerProvider),
      insertTrack: ref.watch(insertTrackProvider),
      syncChapterProgressWithTrack: ref.watch(syncChapterProgressWithTrackProvider),
    );
