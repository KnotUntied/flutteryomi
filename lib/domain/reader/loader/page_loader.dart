import 'package:flutter/widgets.dart';

import 'package:flutteryomi/domain/reader/model/reader_page.dart';

/// A loader used to load pages into the reader. Any open resources must be cleaned up when the
/// method [recycle] is called.
abstract class PageLoader {
  /// Whether this loader has been already recycled.
  bool isRecycled = false;

  bool get isLocal;

  /// Returns the list of pages of a chapter.
  Future<List<ReaderPage>> getPages();

  /// Loads the page. May also preload other pages.
  /// Progress of the page loading should be followed via [page.statusStream].
  /// [loadPage] is not currently guaranteed to complete, so it should be launched asynchronously.
  Future<void> loadPage(ReaderPage page);

  /// Retries the given [page] in case it failed to load. This method only makes sense when an
  /// online source is used.
  void retryPage(ReaderPage page);

  /// Recycles this loader. Implementations must override this method to clean up any active
  /// resources.
  @mustCallSuper
  void recycle() {
    isRecycled = true;
  }
}
