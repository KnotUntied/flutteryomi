import 'package:flutteryomi/domain/reader/model/reader_chapter.dart';
import 'package:flutteryomi/domain/source/model/page.dart';

class ReaderPage extends Page {
  ReaderPage(
    super.index, [
    super.url = '',
    super.imageUrl,
  ]);

  late ReaderChapter chapter;
}
