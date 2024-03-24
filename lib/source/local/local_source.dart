import 'dart:convert';
import 'dart:io';

import 'package:archive/archive_io.dart';
import 'package:collection/collection.dart';
import 'package:dartx/dartx_io.dart' hide IterableLastOrNull;
import 'package:flutteryomi/l10n/l10n.dart';
import 'package:logger/logger.dart';
import 'package:path/path.dart' as p;
import 'package:riverpod/riverpod.dart';
import 'package:xml/xml.dart';

import 'package:flutteryomi/core/metadata/comic_info.dart';
import 'package:flutteryomi/core/metadata/manga_details.dart';
import 'package:flutteryomi/core/storage/directory_extensions.dart';
import 'package:flutteryomi/core/util/system/image_util.dart';
import 'package:flutteryomi/domain/chapter/service/chapter_recognition.dart';
import 'package:flutteryomi/domain/manga/model/manga.dart';
import 'package:flutteryomi/domain/source/model/domain_source.dart'
    as domain_source;
import 'package:flutteryomi/domain/source/model/filter_list.dart';
import 'package:flutteryomi/domain/source/model/mangas_page.dart';
import 'package:flutteryomi/domain/source/model/page.dart';
import 'package:flutteryomi/domain/source/model/schapter.dart';
import 'package:flutteryomi/domain/source/model/smanga.dart';
import 'package:flutteryomi/source/api/catalogue_source.dart';
import 'package:flutteryomi/source/api/source.dart';
import 'package:flutteryomi/source/api/unmetered_source.dart';
import 'package:flutteryomi/source/local/filter/order_by.dart';
import 'package:flutteryomi/source/local/image/local_cover_manager.dart';
import 'package:flutteryomi/source/local/io/archive.dart' as local_archive;
import 'package:flutteryomi/source/local/io/format.dart';
import 'package:flutteryomi/source/local/io/local_source_file_system.dart';

//TODO
class LocalSource implements CatalogueSource, UnmeteredSource {
  LocalSource({
    required this.ref,
    required this.fileSystem,
    required this.coverManager,
    required this.logger,
  });

  // Terrible but necessary for localization
  final Ref ref;
  final LocalSourceFileSystem fileSystem;
  final LocalCoverManager coverManager;
  final Logger logger;

  late final _popularFilters = [OrderByPopular(ref)];
  late final _latestFilters = [OrderByLatest(ref)];

  static const localSourceId = 0;
  // Point to Mihon for now
  static const helpUrl = "https://mihon.app/docs/guides/local-source/";

  static const _latestThreshold = Duration(days: 7);

  @override
  int get id => localSourceId;

  @override
  String get lang => 'other';

  @override
  String get name {
    final localizations = ref.read(appLocalizationsProvider);
    return localizations.local_source;
  }

  @override
  String toString() => name;

  @override
  bool get supportsLatest => true;

  // Browse related
  @override
  Future<MangasPage> getPopularManga(int page) =>
      getSearchManga(page, "", _popularFilters);

  @override
  Future<MangasPage> getLatestUpdates(int page) =>
      getSearchManga(page, "", _latestFilters);

  @override
  Future<MangasPage> getSearchManga(
      int page, String query, FilterList filters) async {
    final lastModifiedLimit = Duration(
      milliseconds: filters == _latestFilters
          ? DateTime.now().millisecondsSinceEpoch -
              _latestThreshold.inMilliseconds
          : 0,
    );

    var mangaDirs = await fileSystem.getFilesInBaseDirectory()
      // Filter out files that are hidden and is not a folder
      ..where((it) => it is Directory && !it.name.startsWith('.'))
          .distinctBy((it) => it.name)
          .where((it) {
        if (lastModifiedLimit.inMilliseconds == 0 && query.isBlank) {
          return true;
        } else if (lastModifiedLimit.inMilliseconds == 0) {
          return p
              .basename(it.path)
              .orEmpty()
              .toLowerCase()
              .contains(query.toLowerCase());
        } else {
          return FileStat.statSync(it.name)
                  .modified
                  .millisecondsSinceEpoch >=
              lastModifiedLimit.inMilliseconds;
        }
      });

    for (final filter in filters) {
      switch (filter) {
        case OrderByPopular():
          mangaDirs = filter.state!.ascending
              ? mangaDirs.sortedWith((a, b) => compareAsciiLowerCase(
                    a.name.toLowerCase().orEmpty(),
                    b.name.toLowerCase().orEmpty(),
                  ))
              : mangaDirs.sortedWith((a, b) => -compareAsciiLowerCase(
                    a.name.toLowerCase().orEmpty(),
                    b.name.toLowerCase().orEmpty(),
                  ));
        case OrderByLatest():
          mangaDirs = filter.state!.ascending
              ? mangaDirs.sortedByCompare(
                  (it) => FileStat.statSync(it.name)
                      .modified
                      .millisecondsSinceEpoch,
                  (a, b) => a - b,
                )
              : mangaDirs.sortedByDescending(
                  (it) => FileStat.statSync(it.name)
                      .modified
                      .millisecondsSinceEpoch,
                );
        default:
          break;
      }
    }

    final mangas = await Future.wait(
      mangaDirs.map(
        (mangaDir) async {
          final name = mangaDir.name.orEmpty();

          // Try to find the cover
          final file = await coverManager.find(name);
          final thumbnailUrl = file?.uri.toString();
          return SManga(
            title: name,
            url: name,
            thumbnailUrl: thumbnailUrl,
          );
        },
      ),
    );

    return MangasPage(mangas: mangas, hasNextPage: false);
  }

  // Manga details related
  @override
  Future<SManga> getMangaDetails(SManga manga) async {
    final file = await coverManager.find(manga.url);
    if (file != null) manga.thumbnailUrl = file.uri.toString();

    // Augment manga details based on metadata files
    try {
      final mangaDir = await fileSystem.getMangaDirectory(manga.url);
      if (mangaDir == null) {
        throw Exception("${manga.url} is not a valid directory");
      }
      final mangaDirFiles = mangaDir.listSync().whereType<File>();

      final comicInfoFileRef = mangaDirFiles
          .firstWhereOrNull((it) => it.name == comicInfoFile);
      final noXmlFile = mangaDirFiles
          .firstWhereOrNull((it) => it.name == ".noxml");
      final legacyJsonDetailsFile = mangaDirFiles
          .firstWhereOrNull((it) => it.extension == ".json");

      if (comicInfoFileRef != null) {
        // Top level ComicInfo.xml
        await noXmlFile?.delete();
        _setMangaDetailsFromComicInfoFile(comicInfoFileRef, manga);
      } else if (legacyJsonDetailsFile != null) {
        // Old custom JSON format
        // Mihon TODO: remove support for this entirely after a while
        final input = await legacyJsonDetailsFile.readAsString();
        final Map<String, Object?> map = jsonDecode(input);
        final details = MangaDetails.fromJson(map);
        if (details.title != null) manga.title = details.title!;
        if (details.author != null) manga.author = details.author;
        if (details.artist != null) manga.artist = details.artist;
        if (details.description != null) {
          manga.description = details.description;
        }
        if (details.genre != null) manga.genre = details.genre!.join();
        if (details.status != null) manga.status = details.status!;
        // Replace with ComicInfo.xml file
        final comicInfo = manga.getComicInfo();
        final comicInfoFileRef =
            await mangaDir.file(comicInfoFile).create(recursive: true);
        final document = XmlDocument();
        document.children.add(comicInfo.toXmlElement());
        await comicInfoFileRef.writeAsString(document.toXmlString());
        await legacyJsonDetailsFile.delete();
      } else if (noXmlFile == null) {
        // Copy ComicInfo.xml from chapter archive to top level if found
        final chapterArchives = mangaDirFiles
            .where((it) => local_archive.Archive.isSupported(it))
            .toList();

        final copiedFile =
            _copyComicInfoFileFromArchive(chapterArchives, mangaDir);
        if (copiedFile != null) {
          _setMangaDetailsFromComicInfoFile(copiedFile, manga);
        } else {
          // Avoid re-scanning
          await mangaDir.file('.noxml').create(recursive: true);
        }
      }
    } catch (e) {
      logger.e(
        "Error setting manga details from local metadata for ${manga.title}",
        e,
      );
    }

    return manga;
  }

  File? _copyComicInfoFileFromArchive(
    List<File> chapterArchives,
    Directory folder,
  ) {
    for (final chapter in chapterArchives) {
      switch (Format.valueOf(chapter.path)) {
        case Zip():
          final inputStream = InputFileStream(chapter.path);
          final archive = ZipDecoder().decodeBuffer(inputStream);
          final file = archive.findFile(comicInfoFile);
          if (file != null) return _copyComicInfoFileFromZip(file, folder);

        //TODO
        case Rar():
          return null;
        //JunrarArchive(chapter.openInputStream()).use { rar ->
        //    rar.fileHeaders.firstOrNull { it.fileName == comicInfoFile }?.let { file ->
        //        rar.getInputStream(file).buffered().use { stream ->
        //            return _copyComicInfoFile(stream, folder)
        //        }
        //    }
        //}
      }
    }
    return null;
  }

  File? _copyComicInfoFileFromZip(
    ArchiveFile comicInfoFileRef,
    Directory folder,
  ) {
    final path = p.join(folder.path, comicInfoFile);
    final outputStream = OutputFileStream(path);
    comicInfoFileRef.writeContent(outputStream);
    outputStream.close();
    return File(path);
  }

  File? _copyComicInfoFile(File comicInfoFileRef, Directory folder) =>
      comicInfoFileRef.copySync(p.join(folder.path, comicInfoFile));

  void _setMangaDetailsFromComicInfoFile(File file, SManga manga) async {
    final document = XmlDocument.parse(await file.readAsString());
    final comicInfo = ComicInfo.fromXmlElement(document.rootElement);
    manga.copyFromComicInfo(comicInfo);
  }

  // Chapters
  @override
  Future<List<SChapter>> getChapterList(SManga manga) async {
    final files = await fileSystem.getFilesInMangaDirectory(manga.url);
    final chapters = files
        // Only keep supported formats
        .where((it) =>
            it is Directory ||
            (it is File && local_archive.Archive.isSupported(it)))
        .map((chapterFile) {
      final chapter = SChapter.create()
        ..url = "${manga.url}/${chapterFile.name}"
        ..name = (chapterFile is Directory
                ? chapterFile.name
                : chapterFile.nameWithoutExtension)
            .orEmpty()
        ..dateUpload = FileStat.statSync(chapterFile.path).modified;
      chapter.chapterNumber = ChapterRecognition.parseChapterNumber(
        manga.title,
        chapter.name,
        chapter.chapterNumber,
      );
      final format = Format.valueOf(chapterFile.path);
      if (format is Epub) {
        //TODO
        //EpubFile(format.file.openReadOnlyChannel(context)).use { epub ->
        //  epub.fillMetadata(manga, this);
        //}
      }
      return chapter;
    }).sortedWith((c1, c2) {
      final c = c2.chapterNumber.compareTo(c1.chapterNumber);
      return c == 0 ? compareAsciiLowerCaseNatural(c2.name, c1.name) : c;
    });

    // Copy the cover from the first chapter found if not available
    if (manga.thumbnailUrl.isNullOrBlank) {
      final chapter = chapters.lastOrNull;
      if (chapter != null) _updateCover(chapter, manga);
    }

    return chapters;
  }

  @override
  FilterList getFilterList() => [OrderByPopular(ref)];

  // Unused stuff
  @override
  Future<List<Page>> getPageList(SChapter chapter) =>
      throw UnsupportedError('Unused');

  Future<Format> getFormat(SChapter chapter) async {
    final lang = ref.read(appLocalizationsProvider);
    try {
      final [mangaDirName, chapterName] = chapter.url.partialSplit('/', 2);
      final file = (await fileSystem.getBaseDirectory())
          ?.findDir(mangaDirName, true)
          ?.findFile(chapterName, true);
      if (file != null) {
        return Format.valueOf(file.path);
      } else {
        throw Exception(lang.chapter_not_found);
      }
    } on UnknownFormatException {
      throw Exception(lang.local_invalid_format);
    } catch (e) {
      rethrow;
    }
  }

  //TODO
  void _updateCover(SChapter chapter, SManga manga) async {
    final format = await getFormat(chapter);
    try {
      switch (format) {
        case FormatDirectory():
          final entry = format.dir
              .listSync()
              .sortedWith(
                  (f1, f2) => compareAsciiLowerCaseNatural(f1.path, f2.path))
              .whereType<File>()
              .firstWhereOrNull((it) => ImageUtil.isImage(
                    it.path,
                    headerBytes: it.openSync().readSync(32),
                  ));

          if (entry != null) coverManager.update(manga, entry);
        case Zip():
          final inputStream = InputFileStream(format.file.path);
          final zip = ZipDecoder().decodeBuffer(inputStream);
          final entry = zip.files
              .sortedWith(
                  (f1, f2) => compareAsciiLowerCaseNatural(f1.name, f2.name))
              .firstWhereOrNull((it) {
            if (!it.isFile) return false;
            final os = OutputFileStream(
              Directory.systemTemp.createTempSync().path,
            );
            it.writeContent(os);
            return ImageUtil.isImage(os.path, headerBytes: os.subset(0, 32));
          });

          if (entry != null) coverManager.updateFromArchive(manga, entry);
        case Rar():
        //JunrarArchive(format.file.openInputStream()).use { archive ->
        //  final entry = archive.fileHeaders
        //      .sortedWith { f1, f2 -> f1.fileName.compareToCaseInsensitiveNaturalOrder(f2.fileName) }
        //      .find { !it.isDirectory && ImageUtil.isImage(it.fileName) { archive.getInputStream(it) } }

        //  if (entry != null) coverManager.update(manga, archive.getInputStream(it));
        //  return entry;
        //}
        case Epub():
        //EpubFile(format.file.openReadOnlyChannel(context)).use { epub ->
        //  final entry = epub.getImagesFromPages().firstOrNull();
        //  if (entry != null) {
        //    epub.getEntry(entry);
        //    coverManager.update(manga, epub.getInputStream(it));
        //  }
        //  return entry;
        //}
      }
      return null;
    } catch (e) {
      logger.e("Error updating cover for ${manga.title}", e);
      return null;
    }
  }
}

extension MangaIsLocal on Manga {
  bool isLocal() => source == LocalSource.localSourceId;
}

extension SourceIsLocal on Source {
  bool isLocal() => id == LocalSource.localSourceId;
}

extension DomainSourceIsLocal on domain_source.Source {
  bool isLocal() => id == LocalSource.localSourceId;
}

// Taken from https://stackoverflow.com/a/76039017
// and dartbag by extension
extension _PartialSplit on String {
  /// A version of [String.split] that limits splitting to return a [List]
  /// of at most [count] items.
  ///
  /// [count] must be non-negative. If [count] is 0, returns an empty
  /// [List].
  ///
  /// If splitting this [String] would result in more than [count] items,
  /// the final element will contain the unsplit remainder of this [String].
  ///
  /// If splitting this [String] would result in fewer than [count] items,
  /// returns a [List] with only the split substrings.
  List<String> partialSplit(Pattern pattern, int count) {
    assert(count >= 0);

    const result = <String>[];

    if (count == 0) return result;

    int offset = 0;
    final matches = pattern.allMatches(this);
    for (final match in matches) {
      if (result.length + 1 == count) break;

      if (match.end - match.start == 0 && match.start == offset) continue;

      result.add(substring(offset, match.start));
      offset = match.end;
    }
    result.add(substring(offset));

    return result;
  }
}
