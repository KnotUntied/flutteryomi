import 'package:drift/drift.dart';
import 'package:flutteryomi/core/preference/tri_state.dart';
import 'package:flutteryomi/data/drift/data/mangas.drift.dart' as drift;
import 'package:flutteryomi/data/source/update_strategy.dart';
import 'package:flutteryomi/domain/reader/setting/reader_orientation.dart';
import 'package:flutteryomi/domain/reader/setting/reading_mode.dart';
import 'package:flutteryomi/domain/source/model/smanga.dart';

// Drift already generates convenient classes
// Typedef here so dependents will depend on domain instead of data
typedef Manga = drift.Manga;

extension MangaUtils on Manga {
  int get sorting => chapterFlags & chapterSortingMask;
  int get displayMode => chapterFlags & chapterDisplayMask;
  int get unreadFilterRaw => chapterFlags & chapterUnreadMask;
  int get downloadedFilterRaw => chapterFlags & chapterDownloadedMask;
  int get bookmarkedFilterRaw => chapterFlags & chapterBookmarkedMask;

  TriState get unreadFilter => switch (unreadFilterRaw) {
        chapterShowUnread => TriState.enabledIs,
        chapterShowRead => TriState.enabledNot,
        _ => TriState.disabled,
      };

  TriState get bookmarkedFilter => switch (unreadFilterRaw) {
        chapterShowBookmarked => TriState.enabledIs,
        chapterShowNotBookmarked => TriState.enabledNot,
        _ => TriState.disabled,
      };

  bool sortDescending() => chapterFlags & chapterSortDirMask == chapterSortDesc;

  static const int showAll = 0x00000000;

  static const int chapterSortDesc = 0x00000000;
  static const int chapterSortAsc = 0x00000001;
  static const int chapterSortDirMask = 0x00000001;

  static const int chapterShowUnread = 0x00000002;
  static const int chapterShowRead = 0x00000004;
  static const int chapterUnreadMask = 0x00000006;

  static const int chapterShowDownloaded = 0x00000008;
  static const int chapterShowNotDownloaded = 0x00000010;
  static const int chapterDownloadedMask = 0x00000018;

  static const int chapterShowBookmarked = 0x00000020;
  static const int chapterShowNotBookmarked = 0x00000040;
  static const int chapterBookmarkedMask = 0x00000060;

  static const int chapterSortingSource = 0x00000000;
  static const int chapterSortingNumber = 0x00000100;
  static const int chapterSortingUploadDate = 0x00000200;
  static const int chapterSortingAlphabet = 0x00000300;
  static const int chapterSortingMask = 0x00000300;

  static const int chapterDisplayName = 0x00000000;
  static const int chapterDisplayNumber = 0x00100000;
  static const int chapterDisplayMask = 0x00100000;

  static Manga create() => Manga(
        id: -1,
        url: "",
        title: "",
        source: -1,
        favorite: false,
        lastUpdate: DateTime.fromMillisecondsSinceEpoch(0, isUtc: true),
        nextUpdate: DateTime.fromMillisecondsSinceEpoch(0, isUtc: true),
        fetchInterval: 0,
        dateAdded: DateTime.fromMillisecondsSinceEpoch(0, isUtc: true),
        viewerFlags: 0,
        chapterFlags: 0,
        coverLastModified: DateTime.fromMillisecondsSinceEpoch(0, isUtc: true),
        artist: null,
        author: null,
        description: null,
        genre: null,
        status: 0,
        thumbnailUrl: null,
        updateStrategy: UpdateStrategy.alwaysUpdate.index,
        initialized: false,
        lastModifiedAt: DateTime.fromMillisecondsSinceEpoch(0, isUtc: true),
        favoriteModifiedAt: null,
      );

  int get readingMode => viewerFlags & ReadingMode.mask;
  int get readerOrientation => viewerFlags & ReaderOrientation.mask;
  TriState get downloadedFilter => forceDownloaded()
      ? TriState.enabledIs
      : switch (downloadedFilterRaw) {
          chapterShowDownloaded => TriState.enabledIs,
          chapterShowNotDownloaded => TriState.enabledNot,
          _ => TriState.disabled,
        };
  bool chaptersFiltered() =>
      unreadFilter != TriState.disabled ||
      downloadedFilter != TriState.disabled ||
      bookmarkedFilter != TriState.disabled;
  // TODO: Figure this one out
  //bool forceDownloaded() => favorite && Injekt.get<BasePreferences>().downloadedOnly().get();
  //Probably this one
  //bool forceDownloaded(BasePreferences prefs) => favorite && prefs.downloadedOnly().get();
  bool forceDownloaded() => favorite;

  SManga toSManga() => SManga(
        url: url,
        title: title,
        artist: artist,
        author: author,
        description: description,
        genre: genre?.join() ?? [].join(),
        status: status,
        thumbnailUrl: thumbnailUrl,
        initialized: initialized,
      );

  Manga copyFrom(SManga other) => copyWith(
        author: Value(other.author ?? author),
        artist: Value(other.artist ?? artist),
        description: Value(other.description ?? description),
        genre: Value(other.genre != null ? other.getGenres() : genre),
        thumbnailUrl: Value(other.thumbnailUrl ?? thumbnailUrl),
        status: other.status,
        updateStrategy: other.updateStrategy.index,
        initialized: other.initialized && initialized,
      );

  //TODO
  //bool hasCustomCover(CoverCache coverCache) =>
  //    coverCache.getCustomCoverFile(id).exists();
}

extension SMangaToDomainManga on SManga {
  Manga toDomainManga(int sourceId) => MangaUtils.create().copyWith(
        url: url,
        title: title,
        artist: Value(artist),
        author: Value(author),
        description: Value(description),
        genre: Value(getGenres()),
        status: status,
        thumbnailUrl: Value(thumbnailUrl),
        updateStrategy: updateStrategy.index,
        initialized: initialized,
        source: sourceId,
      );
}

/// Creates a ComicInfo instance based on the manga and chapter metadata.
// TODO: getComicInfo