import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:flutteryomi/domain/chapter/model/chapter.dart';

part 'should_update_db_chapter.g.dart';

class ShouldUpdateDbChapter {
  ShouldUpdateDbChapter();
  bool await_(Chapter dbChapter, Chapter sourceChapter) =>
      dbChapter.scanlator != sourceChapter.scanlator ||
      dbChapter.name != sourceChapter.name ||
      dbChapter.dateUpload != sourceChapter.dateUpload ||
      dbChapter.chapterNumber != sourceChapter.chapterNumber ||
      dbChapter.sourceOrder != sourceChapter.sourceOrder;
}

@riverpod
ShouldUpdateDbChapter shouldUpdateDbChapter(ShouldUpdateDbChapterRef ref) =>
    ShouldUpdateDbChapter();
