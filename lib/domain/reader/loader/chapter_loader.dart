//import 'package:flutteryomi/domain/download/download_provider.dart';
//import 'package:flutteryomi/domain/reader/loader/download_page_loader.dart';
//import 'package:riverpod/riverpod.dart';

//import 'package:flutteryomi/core/util/system/logger.dart';
//import 'package:flutteryomi/domain/download/download_manager.dart';
//import 'package:flutteryomi/domain/manga/model/manga.dart';
//import 'package:flutteryomi/domain/reader/loader/directory_page_loader.dart';
//import 'package:flutteryomi/domain/reader/loader/page_loader.dart';
//import 'package:flutteryomi/domain/reader/loader/zip_page_loader.dart';
//import 'package:flutteryomi/domain/reader/model/reader_chapter.dart';
//import 'package:flutteryomi/domain/reader/model/reader_page.dart';
//import 'package:flutteryomi/domain/source/model/domain_source.dart';
//import 'package:flutteryomi/domain/source/model/page.dart';
//import 'package:flutteryomi/domain/source/model/stub_source.dart';
//import 'package:flutteryomi/l10n/l10n.dart';
//import 'package:flutteryomi/source/api/online/http_source.dart';
//import 'package:flutteryomi/source/local/io/format.dart';
//import 'package:flutteryomi/source/local/local_source.dart';

///// Loader used to retrieve the [PageLoader] for a given chapter.
//class ChapterLoader {
//  ChapterLoader({
//    required this.ref,
//    required this.manga,
//    required this.source,
//  });

//  final Ref ref;
//  final Manga manga;
//  final Source source;

//  /// Assigns the chapter's page loader and loads the its pages. Returns immediately if the chapter
//  /// is already loaded.
//  Future<void> loadChapter(ReaderChapter chapter) async {
//    final lang = ref.read(appLocalizationsProvider);
//    final logger = ref.read(loggerProvider);
//    if (_chapterIsReady(chapter)) return;

//    chapter.state = const ReaderChapterStateLoading();
//    logger.i("Loading pages for ${chapter.chapter.name}");
//    try {
//      final loader = _getPageLoader(chapter);
//      chapter.pageLoader = loader;

//      final pages = await loader.getPages();
//      for (final page in pages) {
//        page.chapter = chapter;
//      }

//      if (pages.isEmpty) throw Exception(lang.page_list_empty_error);

//      // If the chapter is partially read, set the starting page to the last the user read
//      // otherwise use the requested page.
//      if (!chapter.chapter.read) {
//        chapter.requestedPage = chapter.chapter.lastPageRead;
//      }

//      chapter.state = ReaderChapterStateLoaded(pages);
//    } on Exception catch (e) {
//      chapter.state = ReaderChapterStateError(e);
//      rethrow;
//    }
//  }

//  /// Checks [chapter] to be loaded based on present pages and loader in addition to state.
//  bool _chapterIsReady(ReaderChapter chapter) =>
//      chapter.state is ReaderChapterStateLoaded && chapter.pageLoader != null;

//  /// Returns the page loader to use for this [chapter].
//  PageLoader _getPageLoader(ReaderChapter chapter) {
//    final lang = ref.read(appLocalizationsProvider);
//    final downloadManager = ref.read(downloadManagerProvider);
//    final downloadProvider = ref.read(downloadProviderProvider);
//    final dbChapter = chapter.chapter;
//    final isDownloaded = downloadManager.isChapterDownloaded(
//      dbChapter.name,
//      dbChapter.scanlator,
//      manga.title,
//      manga.source,
//      skipCache: true,
//    );
//    if (isDownloaded) {
//      return DownloadPageLoader(
//        chapter: chapter,
//        manga: manga,
//        source: source,
//        downloadManager: downloadManager,
//        downloadProvider: downloadProvider,
//      );
//    } else if (source is LocalSource) {
//      final format = source.getFormat(chapter.chapter);
//      switch (format) {
//        case FormatDirectory():
//          return DirectoryPageLoader(format.dir);
//        case Zip():
//          return ZipPageLoader(format.file.openReadOnlyChannel(context));
//        //case Rar():
//          //try {
//          //  return RarPageLoader(format.file.openInputStream());
//          //} on UnsupportedRarV5Exception catch (e) {
//          //  throw Exception(lang.loader_rar5_error);
//          //}
//        //case Epub():
//        //  return EpubPageLoader(format.file.openReadOnlyChannel(context));
//      }
//    } else if (source is HttpSource) {
//      return HttpPageLoader(chapter, source);
//    } else if (source is StubSource) {
//      throw UnimplementedError(lang.source_not_installed(source.toString()));
//    } else {
//      throw UnimplementedError(lang.loader_not_implemented_error);
//    }
//  }
//}
