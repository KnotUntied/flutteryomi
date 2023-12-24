import 'package:flutteryomi/data/drift/data/mangas.drift.dart';
import 'package:flutteryomi/data/source/update_strategy.dart';
import 'package:flutteryomi/domain/reader/setting/reader_orientation.dart';
import 'package:flutteryomi/domain/reader/setting/reading_mode.dart';

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

  int get readingMode => viewer & ReadingMode.mask;
  int get readerOrientation => viewer & ReaderOrientation.mask;
}

//val Manga.downloadedFilter: TriState
//    get() {
//        if (forceDownloaded()) return TriState.ENABLED_IS
//        return when (downloadedFilterRaw) {
//            Manga.CHAPTER_SHOW_DOWNLOADED -> TriState.ENABLED_IS
//            Manga.CHAPTER_SHOW_NOT_DOWNLOADED -> TriState.ENABLED_NOT
//            else -> TriState.DISABLED
//        }
//    }
//fun Manga.chaptersFiltered(): Boolean {
//    return unreadFilter != TriState.DISABLED ||
//        downloadedFilter != TriState.DISABLED ||
//        bookmarkedFilter != TriState.DISABLED
//}
//fun Manga.forceDownloaded(): Boolean {
//    return favorite && Injekt.get<BasePreferences>().downloadedOnly().get()
//}

//fun Manga.toSManga(): SManga = SManga.create().also {
//    it.url = url
//    it.title = title
//    it.artist = artist
//    it.author = author
//    it.description = description
//    it.genre = genre.orEmpty().joinToString()
//    it.status = status.toInt()
//    it.thumbnail_url = thumbnailUrl
//    it.initialized = initialized
//}

//fun Manga.copyFrom(other: SManga): Manga {
//    val author = other.author ?: author
//    val artist = other.artist ?: artist
//    val description = other.description ?: description
//    val genres = if (other.genre != null) {
//        other.getGenres()
//    } else {
//        genre
//    }
//    val thumbnailUrl = other.thumbnail_url ?: thumbnailUrl
//    return this.copy(
//        author = author,
//        artist = artist,
//        description = description,
//        genre = genres,
//        thumbnailUrl = thumbnailUrl,
//        status = other.status.toLong(),
//        updateStrategy = other.update_strategy,
//        initialized = other.initialized && initialized,
//    )
//}

//fun SManga.toDomainManga(sourceId: Long): Manga {
//    return Manga.create().copy(
//        url = url,
//        title = title,
//        artist = artist,
//        author = author,
//        description = description,
//        genre = getGenres(),
//        status = status.toLong(),
//        thumbnailUrl = thumbnail_url,
//        updateStrategy = update_strategy,
//        initialized = initialized,
//        source = sourceId,
//    )
//}

//fun Manga.hasCustomCover(coverCache: CoverCache = Injekt.get()): Boolean {
//    return coverCache.getCustomCoverFile(id).exists()
//}

///**
// * Creates a ComicInfo instance based on the manga and chapter metadata.
// */
//fun getComicInfo(manga: Manga, chapter: Chapter, chapterUrl: String, categories: List<String>?) = ComicInfo(
//    title = ComicInfo.Title(chapter.name),
//    series = ComicInfo.Series(manga.title),
//    number = chapter.chapterNumber.takeIf { it >= 0 }?.let {
//        if ((it.rem(1) == 0.0)) {
//            ComicInfo.Number(it.toInt().toString())
//        } else {
//            ComicInfo.Number(it.toString())
//        }
//    },
//    web = ComicInfo.Web(chapterUrl),
//    summary = manga.description?.let { ComicInfo.Summary(it) },
//    writer = manga.author?.let { ComicInfo.Writer(it) },
//    penciller = manga.artist?.let { ComicInfo.Penciller(it) },
//    translator = chapter.scanlator?.let { ComicInfo.Translator(it) },
//    genre = manga.genre?.let { ComicInfo.Genre(it.joinToString()) },
//    publishingStatus = ComicInfo.PublishingStatusTachiyomi(
//        ComicInfoPublishingStatus.toComicInfoValue(manga.status),
//    ),
//    categories = categories?.let { ComicInfo.CategoriesTachiyomi(it.joinToString()) },
//    inker = null,
//    colorist = null,
//    letterer = null,
//    coverArtist = null,
//    tags = null,
//)
