import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:flutteryomi/domain/chapter/model/chapter.dart';
import 'package:flutteryomi/domain/manga/model/manga.dart';
import 'package:flutteryomi/domain/source/model/page.dart';

part 'download.freezed.dart';

//TODO
@unfreezed
class Download with _$Download {
  Download._();
  const factory Download(
    //HttpSource source,
    Manga manga,
    Chapter chapter, [
    List<Page>? pages,
  ]) = _Download;

  int get totalProgress {
    //if (pages == null) return 0;
    //return pages?.sum(Page::progress).average().toInt();
    return 0;
  }

  int get downloadedImages {
    //if (pages == null) return 0;
    //return pages?.where((it) => it.status == PageState.ready).length;
    return 0;
  }

  int get status {
    return 0;
  }

  int get progress {
    return 0;
  }

  //static Download? fromChapterId({
  //  chapterId: Long,
  //  getChapter: GetChapter,
  //  getManga: GetManga,
  //  sourceManager: SourceManager,
  //}) {
  //  final chapter = getChapter.await(chapterId) ?? return null
  //  final manga = getManga.await(chapter.mangaId) ?? return null
  //  final source = (sourceManager.get(manga.source) as HttpSource?) ?? return null

  //  return Download(source, manga, chapter);
  //}
}

enum DownloadState {
  notDownloaded,
  queue,
  downloading,
  downloaded,
  error,
}
