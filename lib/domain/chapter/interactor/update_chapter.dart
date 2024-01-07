import 'package:logger/logger.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:flutteryomi/core/util/system/logger.dart';
import 'package:flutteryomi/domain/chapter/model/chapter_update.dart';
import 'package:flutteryomi/domain/chapter/repository/chapter_repository.dart';

part 'update_chapter.g.dart';

class UpdateChapter {
  final ChapterRepository repository;
  final Logger logger;

  UpdateChapter(this.repository, this.logger);

  Future<void> await_(ChapterUpdate chapterUpdate) async {
    try {
      await repository.update(chapterUpdate);
    } catch (e) {
      logger.e(e);
    }
  }

  Future<void> awaitAll(List<ChapterUpdate> chapterUpdates) async {
    try {
      await repository.updateAll(chapterUpdates);
    } catch (e) {
      logger.e(e);
    }
  }
}

@riverpod
UpdateChapter updateChapter(UpdateChapterRef ref) => UpdateChapter(
      ref.watch(chapterRepositoryProvider),
      ref.watch(loggerProvider),
    );
