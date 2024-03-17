import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:flutteryomi/domain/reader/model/reader_chapter.dart';

part 'viewer_chapters.freezed.dart';

@freezed
class ViewerChapters with _$ViewerChapters {
  ViewerChapters._();
  factory ViewerChapters({
    required ReaderChapter currChapter,
    ReaderChapter? prevChapter,
    ReaderChapter? nextChapter,
  }) = _ViewerChapters;

  void ref() {
    currChapter.ref();
    prevChapter?.ref();
    nextChapter?.ref();
  }

  void unref() {
    currChapter.unref();
    prevChapter?.unref();
    nextChapter?.unref();
  }
}
