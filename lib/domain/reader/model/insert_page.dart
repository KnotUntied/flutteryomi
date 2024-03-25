import 'package:flutteryomi/domain/reader/model/reader_chapter.dart';
import 'package:flutteryomi/domain/reader/model/reader_page.dart';
import 'package:flutteryomi/domain/source/model/page.dart';

class InsertPage extends ReaderPage {
  InsertPage(this.parent) : super(parent.index, parent.url, parent.imageUrl) {
    status = PageState.ready;
    stream = parent.stream;
  }

  final ReaderPage parent;

  @override
  ReaderChapter get chapter => parent.chapter;
}
