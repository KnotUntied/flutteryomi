import 'package:collection/collection.dart';
import 'package:flutteryomi/domain/chapter/model/chapter.dart';
import 'package:flutteryomi/domain/chapter/model/chapter_filter.dart';
import 'package:flutteryomi/domain/download/download_manager.dart';
import 'package:flutteryomi/domain/manga/model/manga.dart';

extension ChaptersGetNextUnread on List<Chapter> {
  Chapter? getNextUnread(Manga manga, DownloadManager downloadManager) {
    final chapters = applyFilters(manga, downloadManager);
    return manga.sortDescending()
        ? chapters.lastWhereOrNull((it) => !it.read)
        : chapters.firstWhereOrNull((it) => !it.read);
  }
}
