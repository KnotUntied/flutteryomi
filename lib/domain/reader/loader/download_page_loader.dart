import 'dart:io';

import 'package:collection/collection.dart';
import 'package:dartx/dartx.dart';

import 'package:flutteryomi/core/util/system/image_util.dart';
import 'package:flutteryomi/domain/download/download_manager.dart';
import 'package:flutteryomi/domain/download/download_provider.dart';
import 'package:flutteryomi/domain/manga/model/manga.dart';
import 'package:flutteryomi/domain/reader/loader/page_loader.dart';
import 'package:flutteryomi/domain/reader/loader/zip_page_loader.dart';
import 'package:flutteryomi/domain/reader/model/reader_chapter.dart';
import 'package:flutteryomi/domain/reader/model/reader_page.dart';
import 'package:flutteryomi/domain/source/model/domain_source.dart';
import 'package:flutteryomi/domain/source/model/page.dart';

//TODO
/// Loader used to load a chapter from the downloaded chapters.
class DownloadPageLoader extends PageLoader {
  DownloadPageLoader({
    required this.chapter,
    required this.manga,
    required this.source,
    required this.downloadManager,
    required this.downloadProvider,
  });

  final ReaderChapter chapter;
  final Manga manga;
  final Source source;
  final DownloadManager downloadManager;
  final DownloadProvider downloadProvider;

  ZipPageLoader? _zipPageLoader;

  @override
  bool get isLocal => true;

  @override
  Future<List<ReaderPage>> getPages() async {
    //TODO
    throw UnimplementedError();
  }

  @override
  Future<void> loadPage(ReaderPage page) async => _zipPageLoader?.loadPage(page);

  @override
  void retryPage(ReaderPage page) {}
}
