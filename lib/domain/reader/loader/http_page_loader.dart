import 'dart:io';

import 'package:archive/archive_io.dart';
import 'package:collection/collection.dart';
import 'package:dartx/dartx.dart';

import 'package:flutteryomi/core/util/system/image_util.dart';
import 'package:flutteryomi/domain/chapter/model/chapter.dart';
import 'package:flutteryomi/domain/reader/loader/page_loader.dart';
import 'package:flutteryomi/domain/reader/model/reader_chapter.dart';
import 'package:flutteryomi/domain/reader/model/reader_page.dart';
import 'package:flutteryomi/domain/source/model/page.dart';
import 'package:flutteryomi/source/api/online/http_source.dart';

//TODO
/// Loader used to load chapters from an online source.
class HttpPageLoader extends PageLoader {
  HttpPageLoader({
    required this.chapter,
    required this.source,
    //required this.chapterCache,
  });

  final ReaderChapter chapter;
  final HttpSource source;

  @override
  bool get isLocal => false;

  /// Returns the page list for a chapter. It tries to return the page list from the local cache,
  /// otherwise fallbacks to network.
  @override
  Future<List<ReaderPage>> getPages() async {
    throw UnimplementedError();
    //final pages;
    //try {
    //  //pages = chapterCache.getPageListFromCache(chapter.chapter.toDomainChapter()!);
    //} catch (e) {
    //  //if (e is CancellationException) rethrow;
    //  pages = await source.getPageList(chapter.chapter.toSChapter());
    //}
    //return pages.mapIndexed((index, page) =>
    //    // Don't trust sources and use our own indexing
    //    ReaderPage(index, page.url, page.imageUrl));
  }

  /// Loads a page through the queue. Handles re-enqueueing pages if they were evicted from the cache.
  @override
  Future<void> loadPage(ReaderPage page) async {
    throw UnimplementedError();
    //final imageUrl = page.imageUrl;

    //// Check if the image has been deleted
    //if (page.status == PageState.ready && imageUrl != null && !chapterCache.isImageInCache(imageUrl)) {
    //  page.status = PageState.queue;
    //}

    //// Automatically retry failed pages when subscribed to this page
    //if (page.status == PageState.error) {
    //  page.status = PageState.queue;
    //}

    //final queuedPages = <PriorityPage>[];
    //if (page.status == PageState.queue) {
    //  queuedPages += PriorityPage(page, 1).also { queue.offer(it) };
    //}
    //queuedPages += preloadNextPages(page, preloadSize);

    //suspendCancellableCoroutine<Nothing> { continuation ->
    //  continuation.invokeOnCancellation {
    //    queuedPages.forEach {
    //      if (it.page.status == PageState.queue) {
    //        queue.remove(it)
    //      }
    //    }
    //  }
    //}
  }

  @override
  void retryPage(ReaderPage page) {}

  @override
  void recycle() {
    super.recycle();
    isRecycled = true;
  }
}
