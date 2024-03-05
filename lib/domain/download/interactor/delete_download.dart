import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:flutteryomi/domain/chapter/model/chapter.dart';
import 'package:flutteryomi/domain/download/download_manager.dart';
import 'package:flutteryomi/domain/manga/model/manga.dart';
import 'package:flutteryomi/domain/source/service/source_manager.dart';

part 'delete_download.g.dart';

class DeleteDownload {
  final SourceManager sourceManager;
  final DownloadManager downloadManager;
  DeleteDownload({
    required this.sourceManager,
    required this.downloadManager,
  });

  Future<void> awaitAll(Manga manga, List<Chapter> chapters) async {
    final source = sourceManager.get(manga.source);
    if (source != null) downloadManager.deleteChapters(chapters, manga, source);
  }
}

@riverpod
DeleteDownload deleteDownload(DeleteDownloadRef ref) => DeleteDownload(
      sourceManager: ref.watch(sourceManagerProvider),
      downloadManager: ref.watch(downloadManagerProvider),
    );
