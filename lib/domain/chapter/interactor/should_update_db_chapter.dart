import 'package:flutteryomi/domain/chapter/model/chapter.dart';

class ShouldUpdateDbChapter {
  ShouldUpdateDbChapter();
  bool await_(Chapter dbChapter, Chapter sourceChapter) =>
      dbChapter.scanlator != sourceChapter.scanlator ||
      dbChapter.name != sourceChapter.name ||
      dbChapter.dateUpload != sourceChapter.dateUpload ||
      dbChapter.chapterNumber != sourceChapter.chapterNumber ||
      dbChapter.sourceOrder != sourceChapter.sourceOrder;
}
