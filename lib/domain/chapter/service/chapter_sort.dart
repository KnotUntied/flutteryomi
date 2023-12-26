import 'package:flutteryomi/domain/manga/model/manga.dart';
import 'package:flutteryomi/domain/chapter/model/chapter.dart';

int Function(Chapter, Chapter) getChapterSort(
    {required Manga manga, bool? sortDescending}) {
  sortDescending = sortDescending ?? manga.sortDescending();
  return switch (manga.sorting) {
    MangaUtils.chapterSortingSource => sortDescending
        ? (c1, c2) => c1.sourceOrder.compareTo(c2.sourceOrder)
        : (c2, c1) => c2.sourceOrder.compareTo(c1.sourceOrder),
    MangaUtils.chapterSortingNumber => sortDescending
        ? (c1, c2) => c1.chapterNumber.compareTo(c2.chapterNumber)
        : (c2, c1) => c2.chapterNumber.compareTo(c1.chapterNumber),
    MangaUtils.chapterSortingUploadDate => sortDescending
        ? (c1, c2) => c1.dateUpload.compareTo(c2.dateUpload)
        : (c2, c1) => c2.dateUpload.compareTo(c1.dateUpload),
    MangaUtils.chapterSortingAlphabet => sortDescending
        ? (c1, c2) => c1.name.compareTo(c2.name)
        : (c2, c1) => c2.name.compareTo(c1.name),
    _ => throw UnimplementedError(
        'Invalid chapter sorting method: ${manga.sorting}'),
  };
}
