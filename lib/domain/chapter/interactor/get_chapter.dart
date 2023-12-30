import 'package:logger/logger.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:flutteryomi/core/util/system/logger.dart';
import 'package:flutteryomi/domain/chapter/model/chapter.dart';
import 'package:flutteryomi/domain/chapter/repository/chapter_repository.dart';

part 'get_chapter.g.dart';

class GetChapter {
  final ChapterRepository repository;
  final Logger logger;

  GetChapter(this.repository, this.logger);

  Future<Chapter?> await_(int id) async {
    try {
      return await repository.getChapterById(id);
    } catch (e) {
      logger.e(e);
      return null;
    }
  }
}

@riverpod
GetChapter getChapter(GetChapterRef ref) => GetChapter(
      ref.watch(chapterRepositoryProvider),
      ref.watch(loggerProvider),
    );
