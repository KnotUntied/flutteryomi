import 'package:dartx/dartx.dart';
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

part 'sync_chapter_progress_with_track.g.dart';

class SyncChapterProgressWithTrack {
  SyncChapterProgressWithTrack({
    required this.logger,
    required this.updateChapter,
    required this.insertTrack,
    required this.getChaptersByMangaId,
  });

  final Logger logger;
  final UpdateChapter updateChapter;
  final InsertTrack insertTrack;
  final GetChaptersByMangaId getChaptersByMangaId;

  //TODO
  Future<void> await_(int mangaId, Track remoteTrack, Tracker tracker) async {
    //if (tracker !is EnhancedTracker) return;

    final chapters = await getChaptersByMangaId.await_(mangaId);
    final sortedChapters = chapters
        .sortedBy((it) => it.chapterNumber)
        .where((it) => it.isRecognizedNumber);

    final chapterUpdates = sortedChapters
        .where((chapter) => chapter.chapterNumber <= remoteTrack.lastChapterRead && !chapter.read)
        .map((it) => it.copyWith(read: true).toChapterUpdate());

    // only take into account continuous reading
    final localLastRead = sortedChapters.takeWhile((it) => it.read).lastOrNull?.chapterNumber ?? 0;
    final updatedTrack = remoteTrack.copyWith(lastChapterRead: localLastRead);

    try {
      tracker.update(updatedTrack);
      await updateChapter.awaitAll(chapterUpdates.toList());
      await insertTrack.await_(updatedTrack);
    } catch (e) {
      logger.w(e);
    }
  }
}

@riverpod
SyncChapterProgressWithTrack syncChapterProgressWithTrack(
  SyncChapterProgressWithTrackRef ref,
) => SyncChapterProgressWithTrack(
      logger: ref.watch(loggerProvider),
      updateChapter: ref.watch(updateChapterProvider),
      insertTrack: ref.watch(insertTrackProvider),
      getChaptersByMangaId: ref.watch(getChaptersByMangaIdProvider),
    );
