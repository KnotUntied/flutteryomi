import 'dart:async';

import 'package:dartx/dartx.dart';
import 'package:equatable/equatable.dart';
import 'package:rxdart/rxdart.dart' hide DebounceExtensions;
import 'package:stream_transform/stream_transform.dart';

import 'package:flutteryomi/domain/chapter/interactor/get_chapter.dart';
import 'package:flutteryomi/domain/chapter/model/chapter.dart';
import 'package:flutteryomi/domain/manga/interactor/get_manga.dart';
import 'package:flutteryomi/domain/manga/model/manga.dart';
import 'package:flutteryomi/domain/source/model/page.dart';
import 'package:flutteryomi/domain/source/service/source_manager.dart';
import 'package:flutteryomi/source/api/online/http_source.dart';

// ignore: must_be_immutable
class Download extends Equatable {
  Download(
    this.source,
    this.manga,
    this.chapter, [
    this.pages,
  ]);

  final HttpSource source;
  final Manga manga;
  final Chapter chapter;
  List<Page>? pages;

  int get totalProgress => pages?.sumBy((it) => it.progress) ?? 0;

  int get downloadedImages =>
      pages?.count((it) => it.status == PageState.ready) ?? 0;

  final _statusStream = BehaviorSubject.seeded(DownloadState.notDownloaded);

  ValueStream<DownloadState> get statusStream => _statusStream.stream;
  DownloadState get status => _statusStream.value;
  set status(value) => _statusStream.add(value);

  Stream<int> get progressStream async* {
    if (pages == null) {
      yield 0;
      while (pages == null) {
        await Future.delayed(const Duration(milliseconds: 50));
      }
    }
    final progressStreams = pages!.map((it) => it.progressStream);
    yield* Rx.combineLatestList(progressStreams)
        .map((it) => it.average().toInt())
        .distinct()
        .debounce(const Duration(milliseconds: 50));
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

  @override
  List<Object?> get props => [source, manga, chapter, pages];

  @override
  bool get stringify => true;
}

enum DownloadState {
  notDownloaded,
  queue,
  downloading,
  downloaded,
  error,
}
