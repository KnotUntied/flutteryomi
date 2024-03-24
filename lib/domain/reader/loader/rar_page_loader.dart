import 'dart:io';

import 'package:archive/archive_io.dart';
import 'package:collection/collection.dart';
import 'package:dartx/dartx.dart';

import 'package:flutteryomi/core/util/system/image_util.dart';
import 'package:flutteryomi/domain/reader/loader/page_loader.dart';
import 'package:flutteryomi/domain/reader/model/reader_page.dart';
import 'package:flutteryomi/domain/source/model/page.dart';

//TODO
/// Loader used to load a chapter from a .rar or .cbr file.
class RarPageLoader extends PageLoader {
  RarPageLoader(this.channel);

  final InputStreamBase channel;
  late final _rar = ZipDecoder().decodeBuffer(channel);

  @override
  bool get isLocal => true;

  @override
  Future<List<ReaderPage>> getPages() async => _rar.files
      .where((it) {
        if (!it.isFile) return false;
        final os = OutputFileStream(
          Directory.systemTemp.createTempSync().path,
        );
        it.writeContent(os);
        return ImageUtil.isImage(it.name, headerBytes: os.subset(0, 32));
      })
      .sortedWith((f1, f2) => compareAsciiLowerCaseNatural(f1.name, f2.name))
      .mapIndexed((i, entry) {
        //TODO: Avoid decompressing twice
        final os = OutputFileStream(
          Directory.systemTemp.createTempSync().path,
        );
        entry.writeContent(os);
        return ReaderPage(i)
          ..stream = File(os.path).openRead
          ..status = PageState.ready;
      })
      .toList();

  @override
  Future<void> loadPage(ReaderPage page) async {
    assert(!isRecycled);
  }

  @override
  void retryPage(ReaderPage page) {}

  @override
  void recycle() {
    super.recycle();
    isRecycled = true;
  }
}
