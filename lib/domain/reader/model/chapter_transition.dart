import 'package:flutteryomi/domain/reader/model/reader_chapter.dart';

sealed class ChapterTransition {
  ChapterTransition(this.from, [this.to]);

  final ReaderChapter from;
  final ReaderChapter? to;


  @override
  bool operator ==(Object other) {
    if (this == other) return true;
    if (other is! ChapterTransition) return false;
    if (from == other.from && to == other.to) return true;
    if (from == other.to && to == other.from) return true;
    return false;
  }

  @override
  int get hashCode {
    var result = from.hashCode;
    result = 31 * result + (to?.hashCode ?? 0);
    return result;
  }

  @override
  String toString() => "ChapterTransition(from=${from.chapter.url}, to=${to?.chapter.url})";
}

class ChapterTransitionPrev extends ChapterTransition {
  ChapterTransitionPrev(super.from, [super.to]);

  @override
  String toString() => "ChapterTransitionPrev(from=${from.chapter.url}, to=${to?.chapter.url})";
}

class ChapterTransitionNext extends ChapterTransition {
  ChapterTransitionNext(super.from, [super.to]);

  @override
  String toString() => "ChapterTransitionNext(from=${from.chapter.url}, to=${to?.chapter.url})";
}
