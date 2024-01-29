import 'dart:collection';

import 'package:collection/collection.dart';
import 'package:dartx/dartx.dart';
// Alias to prevent conflict with Freezed
import 'package:drift/drift.dart' as drift;
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:flutteryomi/core/util/collection_utils.dart';
import 'package:flutteryomi/domain/chapter/interactor/get_chapter.dart';
import 'package:flutteryomi/domain/chapter/interactor/set_read_status.dart';
import 'package:flutteryomi/domain/chapter/interactor/update_chapter.dart';
import 'package:flutteryomi/domain/chapter/model/chapter.dart';
import 'package:flutteryomi/domain/chapter/model/chapter_update.dart';
import 'package:flutteryomi/domain/chapter/service/chapter_sort.dart';
import 'package:flutteryomi/domain/download/download_manager.dart';
import 'package:flutteryomi/domain/download/model/download.dart';
import 'package:flutteryomi/domain/library/service/library_preferences.dart';
import 'package:flutteryomi/domain/manga/interactor/get_manga.dart';
import 'package:flutteryomi/domain/manga/model/manga.dart';
import 'package:flutteryomi/domain/manga/model/tri_state.dart';
import 'package:flutteryomi/domain/source/service/source_manager.dart';
import 'package:flutteryomi/domain/updates/interactor/get_updates.dart';
import 'package:flutteryomi/domain/updates/model/updates_with_relations.dart';
import 'package:flutteryomi/presentation/manga/components/chapter_download_indicator.dart';
import 'package:flutteryomi/presentation/updates/updates.dart';
import 'package:flutteryomi/presentation/util/lang/date_extensions.dart';

//part 'manga_screen_model.freezed.dart';
//part 'manga_screen_model.g.dart';

sealed class ChapterList {}

class ChapterListMissingCount extends Equatable implements ChapterList {
  const ChapterListMissingCount({required this.id, required this.count});

  final String id;
  final int count;

  @override
  List<Object?> get props => [id, count];
}

class ChapterListItem extends Equatable implements ChapterList {
  ChapterListItem({
    required this.chapter,
    required this.downloadState,
    required this.downloadProgress,
    this.selected = false,
  });

  final Chapter chapter;
  final DownloadState downloadState;
  final int downloadProgress;
  final bool selected;

  late final id = chapter.id;
  late final isDownloaded = downloadState == DownloadState.downloaded;

  @override
  List<Object?> get props => [chapter, downloadState, downloadProgress, selected];
}


extension _ChapterListItemsUtils on List<ChapterListItem> {
  /// Applies the view filters to the list of chapters obtained from the database.
  /// Returns an observable of the list of chapters filtered and sorted.
  List<ChapterListItem> applyFilters(Manga manga) {
    //TODO: Support for isLocal
    //final isLocalManga = manga.isLocal();
    final isLocalManga = true;
    final unreadFilter = manga.unreadFilter;
    final downloadedFilter = manga.downloadedFilter;
    final bookmarkedFilter = manga.bookmarkedFilter;

    return where((it) => applyFilter(unreadFilter, () => !it.chapter.read))
        .where((it) => applyFilter(bookmarkedFilter, () => it.chapter.bookmark))
        .where((it) => applyFilter(downloadedFilter, () => it.isDownloaded || isLocalManga))
        .sortedWith((i1, i2) => getChapterSort(manga: manga)(i1.chapter, i2.chapter));
  }

  Chapter? getNextUnread(Manga manga) {
    final chapters = applyFilters(manga);
    return manga.sortDescending()
        ? chapters.lastWhereOrNull((it) => !it.chapter.read)?.chapter
        : chapters.firstWhereOrNull((it) => !it.chapter.read)?.chapter;
  }
}
