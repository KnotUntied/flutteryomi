import 'package:dartx/dartx.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:flutteryomi/domain/chapter/interactor/get_chapter.dart';
import 'package:flutteryomi/domain/chapter/model/chapter.dart';
import 'package:flutteryomi/domain/manga/interactor/get_manga.dart';
import 'package:flutteryomi/domain/manga/model/manga.dart';
import 'package:flutteryomi/domain/source/model/page.dart';
import 'package:flutteryomi/domain/source/service/source_manager.dart';
import 'package:flutteryomi/source/api/online/http_source.dart';

part 'download.freezed.dart';

//TODO
@unfreezed
class Download with _$Download {
  Download._();
  factory Download(
    HttpSource source,
    Manga manga,
    Chapter chapter, [
    List<Page>? pages,
  ]) = _Download;

  int get totalProgress => pages?.sumBy((it) => it.progress) ?? 0;

  int get downloadedImages =>
      pages?.count((it) => it.status == PageState.ready) ?? 0;

  DownloadState get status {
    return DownloadState.notDownloaded;
  }

  int get progress {
    if (pages == null || pages!.isEmpty) return 0;
    return pages!.map((it) => it.progress).average().toInt();
  }

  static Future<Download?> fromChapterId({
    required int chapterId,
    required GetChapter getChapter,
    required GetManga getManga,
    required SourceManager sourceManager,
  }) async {
    final chapter = await getChapter.await_(chapterId);
    if (chapter == null) return null;
    final manga = await getManga.await_(chapter.mangaId);
    if (manga == null) return null;
    final source = (sourceManager.get(manga.source) as HttpSource?);
    if (source == null) return null;

    return Download(source, manga, chapter);
  }
}

enum DownloadState {
  notDownloaded,
  queue,
  downloading,
  downloaded,
  error,
}
