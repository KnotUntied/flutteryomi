import 'package:dartx/dartx.dart';
import 'package:drift/drift.dart';
import 'package:flutteryomi/core/preference/tri_state.dart';
import 'package:flutteryomi/data/drift/data/mangas.drift.dart' as drift;
import 'package:flutteryomi/data/source/update_strategy.dart';
import 'package:flutteryomi/domain/download/service/download_preferences.dart';
import 'package:flutteryomi/domain/reader/setting/reader_orientation.dart';
import 'package:flutteryomi/domain/reader/setting/reading_mode.dart';
import 'package:flutteryomi/domain/source/model/smanga.dart';

// Drift already generates convenient classes
// Typedef here so dependents will depend on domain instead of data
typedef Manga = drift.Manga;

extension MangaUtils on Manga {
  DateTime? get expectedNextUpdate =>
      status != SManga.completed ? nextUpdate : null;
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

  /// Call before updating [thumbnailUrl] to ensure old cover can be cleared from cache
  //Manga prepUpdateCover(CoverCache coverCache, SManga remoteManga, bool refreshSameUrl) {
  //  final newUrl = remoteManga.thumbnailUrl;
  //  // Never refresh covers if the new url is null, as the current url has possibly become invalid
  //  // Never refresh covers if the url is empty to avoid "losing" existing covers
  //  if (newUrl.isNullOrEmpty) return this;

  //  if (!refreshSameUrl && thumbnailUrl == newUrl) return this;

  //  if (isLocal()) {
  //    return copyWith(coverLastModified: DateTime.now());
  //  } else if (hasCustomCover(coverCache)) {
  //    coverCache.deleteFromCache(this, false);
  //    return this;
  //  } else {
  //    coverCache.deleteFromCache(this, false);
  //    return copyWith(coverLastModified: DateTime.now());
  //  }
  //}

  //Manga removeCovers([CoverCache coverCache]) {
  Manga removeCovers([int coverCache = 0]) {
    return this;
    //if (isLocal()) return this;
    //return coverCache.deleteFromCache(this, true) > 0
    //    ? copyWith(coverLastModified: DateTime.now())
    //    : this;
  }

  bool shouldDownloadNewChapters(
      List<int> dbCategories, DownloadPreferences preferences) {
    if (!favorite) return false;

    final categories = dbCategories.isNotEmpty ? dbCategories : const [0];

    // Boolean to determine if user wants to automatically download new chapters.
    final downloadNewChapters = preferences.downloadNewChapters().get();
    if (!downloadNewChapters) return false;

    final includedCategories = preferences
        .downloadNewChapterCategories()
        .get()
        .map((it) => it.toInt());
    final excludedCategories = preferences
        .downloadNewChapterCategoriesExclude()
        .get()
        .map((it) => it.toInt());

    // Default: Download from all categories
    if (includedCategories.isEmpty && excludedCategories.isEmpty) return true;

    // In excluded category
    if (categories.any((it) => excludedCategories.contains(it))) return false;

    // Included category not selected
    if (includedCategories.isEmpty) return true;

    // In included category
    return categories.any((it) => includedCategories.contains(it));
  }

  //Future<void> editCover(
  //  LocalCoverManager coverManager,
  //  InputStream stream,
  //  UpdateManga updateManga,
  //  CoverCache coverCache,
  //) {
  //  if (isLocal()) {
  //    coverManager.update(toSManga(), stream);
  //    updateManga.awaitUpdateCoverLastModified(id);
  //  } else if (favorite) {
  //    coverCache.setCustomCoverToCache(this, stream);
  //    updateManga.awaitUpdateCoverLastModified(id);
  //  }
  //}
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