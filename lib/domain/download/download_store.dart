import 'dart:convert';

import 'package:dartx/dartx.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:flutteryomi/domain/chapter/interactor/get_chapter.dart';
import 'package:flutteryomi/domain/download/model/download.dart';
import 'package:flutteryomi/domain/manga/interactor/get_manga.dart';
import 'package:flutteryomi/domain/manga/model/manga.dart';
import 'package:flutteryomi/domain/source/service/source_manager.dart';
import 'package:flutteryomi/source/api/online/http_source.dart';
import 'package:hive/hive.dart';

part 'download_store.freezed.dart';

/// This class is used to persist active downloads across application restarts.
class DownloadStore {
  DownloadStore({
    required this.sourceManager,
    required this.getManga,
    required this.getChapter,
  });

  final SourceManager sourceManager;
  final GetManga getManga;
  final GetChapter getChapter;

  /// Counter used to keep the queue order.
  int _counter = 0;

  // shared_preferences is a singleton and has no support for separate files/locations
  // Use hive instead
  /// Adds a list of [downloads] to the store.
  void addAll(List<Download> downloads) async {
    final preferences = await Hive.openBox('active_downloads');
    preferences.putAll(
      {for (final it in downloads) _getKey(it): _serialize(it)},
    );
  }

  /// Removes a [download] from the store.
  void remove(Download download) async {
    final preferences = await Hive.openBox('active_downloads');
    preferences.delete(_getKey(download));
  }

  /// Removes a list of [downloads] from the store.
  void removeAll(List<Download> downloads) async {
    final preferences = await Hive.openBox('active_downloads');
    preferences.deleteAll(
      downloads.map((it) => _getKey(it)),
    );
  }

  /// Removes all the downloads from the store.
  void clear() async {
    final preferences = await Hive.openBox('active_downloads');
    preferences.clear();
  }

  /// Returns the preference's key for the given [download].
  String _getKey(Download download) => download.chapter.id.toString();

  /// Returns the list of downloads to restore. It should be called in a background thread.
  Future<List<Download>> restore() async {
    final preferences = await Hive.openBox('active_downloads');
    final objs = preferences.keys.nonNulls
        .mapNotNull((it) => _deserialize(it as String))
        .sortedBy((it) => it.order);

    final downloads = <Download>[];
    if (objs.isNotEmpty) {
      final cachedManga = <int, Manga?>{};
      for (final obj in objs) {
        final (mangaId, chapterId) = (obj.mangaId, obj.chapterId);
        var manga = cachedManga[mangaId];
        if (manga == null) {
          final fetchedManga = await getManga.await_(mangaId);
          manga = cachedManga.putIfAbsent(mangaId, () => fetchedManga);
        }
        if (manga == null) continue;
        final source = sourceManager.get(manga.source) as HttpSource?;
        if (source == null) continue;
        final chapter = await getChapter.await_(chapterId);
        if (chapter == null) continue;
        downloads.add(
          Download(source, manga, chapter),
        );
      }
    }

    // Clear the store, downloads will be added again immediately.
    clear();
    return downloads;
  }

  /// Converts a [download] to a string.
  String _serialize(Download download) {
    final obj = DownloadObject(
      download.manga.id,
      download.chapter.id,
      _counter++,
    );
    return jsonEncode(obj);
  }

  /// Restore a download from a [string].
  DownloadObject? _deserialize(String string) {
    try {
      return jsonDecode(string);
    } on Exception catch (_) {
      return null;
    }
  }
}

/// Class used for download serialization
///
/// [order] refers to the order of the download in the queue.
@freezed
class DownloadObject with _$DownloadObject {
  const DownloadObject._();
  const factory DownloadObject(
    int mangaId,
    int chapterId,
    int order,
  ) = _DownloadObject;
}
