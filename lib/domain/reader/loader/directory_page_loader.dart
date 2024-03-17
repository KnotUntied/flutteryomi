import 'dart:io';

import 'package:collection/collection.dart';
import 'package:dartx/dartx.dart';

import 'package:flutteryomi/core/util/system/image_util.dart';
import 'package:flutteryomi/domain/reader/loader/page_loader.dart';
import 'package:flutteryomi/domain/reader/model/reader_page.dart';
import 'package:flutteryomi/domain/source/model/page.dart';

/// Loader used to load a chapter from a directory given on [directory].
class DirectoryPageLoader extends PageLoader {
  DirectoryPageLoader(this.directory);

  final Directory directory;

  @override
  bool get isLocal => true;

  @override
  Future<List<ReaderPage>> getPages() async => directory
      .listSync()
      .whereType<File>()
      .where(
        (it) => ImageUtil.isImage(
          it.path,
          headerBytes: it.openSync().readSync(32),
        ),
      )
      .sortedWith((f1, f2) => compareAsciiLowerCaseNatural(f1.path, f2.path))
      .mapIndexed((i, entry) => ReaderPage(i)
        ..stream = entry.openRead
        ..status = PageState.ready)
      .toList();

  @override
  Future<void> loadPage(ReaderPage page) async {}

  @override
  void retryPage(ReaderPage page) {}
}
