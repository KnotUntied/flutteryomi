import 'package:flutteryomi/data/drift/data/mangas.drift.dart';
import 'package:flutteryomi/data/source/update_strategy.dart';

extension MangaUtils on Manga {
  int get sorting => chapterFlags & chapterSortingMask;
  int get displayMode => chapterFlags & chapterDisplayMask;
  int get unreadFilterRaw => chapterFlags & chapterUnreadMask;
  int get downloadedFilterRaw => chapterFlags & chapterDownloadedMask;
  int get bookmarkedFilterRaw => chapterFlags & chapterBookmarkedMask;

  bool? get unreadFilter => switch (unreadFilterRaw) {
        chapterShowUnread => true,
        chapterShowRead => false,
        _ => null,
      };

  bool? get bookmarkedFilter => switch (unreadFilterRaw) {
        chapterShowBookmarked => true,
        chapterShowNotBookmarked => false,
        _ => null,
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

  Manga create() => Manga(
        id: -1,
        url: "",
        title: "",
        source: -1,
        favorite: false,
        lastUpdate: DateTime.fromMillisecondsSinceEpoch(0, isUtc: true),
        nextUpdate: DateTime.fromMillisecondsSinceEpoch(0, isUtc: true),
        calculateInterval: 0,
        dateAdded: DateTime.fromMillisecondsSinceEpoch(0, isUtc: true),
        viewer: 0,
        chapterFlags: 0,
        coverLastModified: DateTime.fromMillisecondsSinceEpoch(0, isUtc: true),
        artist: null,
        author: null,
        description: null,
        genre: null,
        status: 0,
        thumbnailUrl: null,
        updateStrategy: UpdateStrategy.alwaysUpdate as int,
        initialized: false,
        lastModifiedAt: DateTime.fromMillisecondsSinceEpoch(0, isUtc: true),
        favoriteModifiedAt: null,
      );
}
