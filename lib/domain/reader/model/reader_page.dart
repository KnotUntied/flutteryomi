import 'package:flutteryomi/domain/reader/model/reader_chapter.dart';
import 'package:flutteryomi/domain/source/model/page.dart';

// ignore: must_be_immutable
class ReaderPage extends Page {
  ReaderPage(
    super.index, [
    super.url = '',
    super.imageUrl,
    this.stream,
  ]);

  Stream<List<int>> Function()? stream;

  late final ReaderChapter chapter;
}
