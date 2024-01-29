import 'package:dartx/dartx.dart';

import 'package:flutteryomi/domain/chapter/model/chapter.dart';
import 'package:flutteryomi/domain/chapter/service/chapter_sort.dart';
import 'package:flutteryomi/domain/download/download_manager.dart';
import 'package:flutteryomi/domain/manga/model/manga.dart';
import 'package:flutteryomi/domain/manga/model/tri_state.dart';


extension ChaptersApplyFilters on List<Chapter> {
  /// Applies the view filters to the list of chapters obtained from the database.
  /// Returns an observable of the list of chapters filtered and sorted.
  List<Chapter> applyFilters(Manga manga, DownloadManager downloadManager) {
    final isLocalManga = manga.isLocal();
    final unreadFilter = manga.unreadFilter;
    final downloadedFilter = manga.downloadedFilter;
    final bookmarkedFilter = manga.bookmarkedFilter;

    return where((chapter) => applyFilter(unreadFilter, () => !chapter.read))
        .where((chapter) => applyFilter(bookmarkedFilter, () => chapter.bookmark))
        .where((chapter) => applyFilter(
          downloadedFilter,
          () {
            final downloaded = downloadManager.isChapterDownloaded(
              chapter.name,
              chapter.scanlator,
              manga.title,
              manga.source,
            )
            return downloaded || isLocalManga;
          },
        ))
        .sortedWith(getChapterSort(manga: manga));
  }
}
