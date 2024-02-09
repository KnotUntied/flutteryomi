import 'package:dartx/dartx.dart';
import 'package:logger/logger.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:flutteryomi/core/util/system/logger.dart';
import 'package:flutteryomi/data/track/tracker.dart';
import 'package:flutteryomi/domain/chapter/interactor/get_chapters_by_manga_id.dart';
import 'package:flutteryomi/domain/history/interactor/get_history.dart';
import 'package:flutteryomi/domain/manga/model/manga.dart';
import 'package:flutteryomi/domain/source/model/source.dart';
import 'package:flutteryomi/domain/track/interactor/get_tracks.dart';
import 'package:flutteryomi/domain/track/interactor/insert_track.dart';
import 'package:flutteryomi/domain/track/interactor/sync_chapter_progress_with_track.dart';
import 'package:flutteryomi/domain/track/model/track.dart';

part 'add_tracks.g.dart';

class AddTracks {
  AddTracks({
    required this.logger,
    required this.getHistory,
    required this.getTracks,
    required this.insertTrack,
    required this.syncChapterProgressWithTrack,
    required this.getChaptersByMangaId,
  });

  final Logger logger;
  final GetHistory getHistory;
  final GetTracks getTracks;
  final InsertTrack insertTrack;
  final SyncChapterProgressWithTrack syncChapterProgressWithTrack;
  final GetChaptersByMangaId getChaptersByMangaId;

  // Mihon TODO: update all trackers based on common data
  Future<void> bind(Tracker tracker, Track item, int mangaId) async {
    final allChapters = await getChaptersByMangaId.await_(mangaId);
    final hasReadChapters = allChapters.any((it) => it.read);
    tracker.bind(item, hasReadChapters);

    var track = item;

    await insertTrack.await_(track);

    // Mihon TODO: merge into [SyncChapterProgressWithTrack]?
    // Update chapter progress if newer chapters marked read locally
    if (hasReadChapters) {
      final latestLocalReadChapterNumber = allChapters
          .sortedBy((it) => it.chapterNumber)
          .takeWhile((it) => it.read)
          .lastOrNull
          ?.chapterNumber ?? -1.0;

      if (latestLocalReadChapterNumber > track.lastChapterRead) {
        track = track.copyWith(
          lastChapterRead: latestLocalReadChapterNumber,
        );
        //Wait for interactor
        //tracker.setRemoteLastChapterRead(track.toDbTrack(), latestLocalReadChapterNumber.toInt());
      }

      if (track.startDate <= 0) {
        final firstReadChapter = await getHistory.await_(mangaId);
        final firstReadChapterDate = firstReadChapter
            .sortedBy((it) => it.readAt?.millisecondsSinceEpoch ?? -1)
            .firstOrNull
            ?.readAt;

        if (firstReadChapterDate != null) {
          track = track.copyWith(
            startDate: firstReadChapterDate,
          );
          //Wait for interactor
          //tracker.setRemoteStartDate(track.toDbTrack(), firstReadChapterDate);
        }
      }
    }

    await syncChapterProgressWithTrack.await_(mangaId, track, tracker);
  }

  Future<void> bindEnhancedTrackers(Manga manga, Source source) async {
    final tracks = await getTracks.await_(manga.id);
    tracks
        //.whereType<EnhancedTracker>()
        //.where((it) => it.accept(source))
        .forEach((service) async {
          try {
            //final track = service.match(manga);
            //if (track != null) {
            //  track.manga_id = manga.id;
            //  (service as Tracker).bind(track);
            //  await insertTrack.await_(track.toDomainTrack()!);

            //  await syncChapterProgressWithTrack.await_(
            //    manga.id,
            //    track.toDomainTrack()!,
            //    service,
            //  );
            //}
          } catch (e) {
            logger.w("Could not match manga: ${manga.title} with service $service", e);
          }
        });
  }
}

@riverpod
AddTracks addTracks(AddTracksRef ref) => AddTracks(
      logger: ref.watch(loggerProvider),
      getHistory: ref.watch(getHistoryProvider),
      getTracks: ref.watch(getTracksProvider),
      insertTrack: ref.watch(insertTrackProvider),
      syncChapterProgressWithTrack: ref.watch(syncChapterProgressWithTrackProvider),
      getChaptersByMangaId: ref.watch(getChaptersByMangaIdProvider),
    );
