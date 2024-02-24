import 'dart:convert';
import 'dart:io';

import 'package:archive/archive_io.dart';
import 'package:collection/collection.dart';
import 'package:dartx/dartx.dart' hide IterableLastOrNull;
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:logger/logger.dart';
import 'package:path/path.dart' as p;
import 'package:xml/xml.dart';

import 'package:flutteryomi/core/metadata/comic_info.dart';
import 'package:flutteryomi/core/metadata/manga_details.dart';
import 'package:flutteryomi/core/util/system/image_util.dart';
import 'package:flutteryomi/domain/chapter/service/chapter_recognition.dart';
import 'package:flutteryomi/domain/manga/model/manga.dart';
import 'package:flutteryomi/domain/source/model/domain_source.dart' as domain_source;
import 'package:flutteryomi/domain/source/model/filter.dart';
import 'package:flutteryomi/domain/source/model/filter_list.dart';
import 'package:flutteryomi/domain/source/model/mangas_page.dart';
import 'package:flutteryomi/domain/source/model/page.dart' as page;
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
    required this.context,
    required this.fileSystem,
    required this.coverManager,
    required this.logger,
  });

  // Terrible but necessary for localization
  final BuildContext context;
  final LocalSourceFileSystem fileSystem;
  final LocalCoverManager coverManager;
  final Logger logger;

  late final _popularFilters = [OrderByPopular(context)];
  late final _latestFilters = [OrderByLatest(context)];

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
    final localizations = AppLocalizations.of(context);
    return localizations.local_source;
  }

  @override
  String toString() => name;

  @override
  bool get supportsLatest => true;

  // Browse related
  @override
  Future<MangasPage> getPopularManga(int page) => getSearchManga(page, "", _popularFilters);

  @override
  Future<MangasPage> getLatestUpdates(int page) => getSearchManga(page, "", _latestFilters);

  @override
  Future<MangasPage> getSearchManga(int page, String query, FilterList filters) async {
    final lastModifiedLimit = Duration(
      milliseconds: filters == _latestFilters
          ? DateTime.now().millisecondsSinceEpoch - _latestThreshold.inMilliseconds
          : 0,
    );

    var mangaDirs = await fileSystem.getFilesInBaseDirectory()
        // Filter out files that are hidden and is not a folder
        ..where((it) => it is Directory && !p.basename(it.path).startsWith('.'))
        .distinctBy((it) => p.basename(it.path))
        .where((it) {
          if (lastModifiedLimit.inMilliseconds == 0 && query.isBlank) {
            return true;
          } else if (lastModifiedLimit.inMilliseconds == 0) {
            return p.basename(it.path).orEmpty().toLowerCase().contains(query.toLowerCase());
          } else {
            return FileStat.statSync(
              p.basename(it.path),
            ).modified.millisecondsSinceEpoch >= lastModifiedLimit.inMilliseconds;
          }
        });

    for (final filter in filters) {
      switch (filter) {
        case OrderByPopular():
          mangaDirs = filter.state!.ascending
              ? mangaDirs.sortedWith((a, b) => compareAsciiLowerCase(
                  p.basename(a.path).toLowerCase().orEmpty(),
                  p.basename(b.path).toLowerCase().orEmpty(),
                ))
              : mangaDirs.sortedWith((a, b) => -compareAsciiLowerCase(
                  p.basename(a.path).toLowerCase().orEmpty(),
                  p.basename(b.path).toLowerCase().orEmpty(),
                ));
        case OrderByLatest():
          mangaDirs = filter.state!.ascending
              ? mangaDirs.sortedByCompare(
                  (it) => FileStat.statSync(p.basename(it.path)).modified.millisecondsSinceEpoch,
                  (a, b) => a - b,
                )
              : mangaDirs.sortedByDescending(
                  (it) => FileStat.statSync(p.basename(it.path)).modified.millisecondsSinceEpoch,
                );
        default:
          break;
      }
    }

    final mangas = await Future.wait(
      mangaDirs.map(
        (mangaDir) async {
          final name = p.basename(mangaDir.path).orEmpty();

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
      if (mangaDir == null) throw Exception("${manga.url} is not a valid directory");
      final mangaDirFiles = mangaDir.listSync().whereType<File>();

      final comicInfoFileRef = mangaDirFiles
          .firstWhereOrNull((it) => p.basename(it.path) == comicInfoFile);
      final noXmlFile = mangaDirFiles
          .firstWhereOrNull((it) => p.basename(it.path) == ".noxml");
      final legacyJsonDetailsFile = mangaDirFiles
          .firstWhereOrNull((it) => p.extension(it.path) == ".json");

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
        if (details.description != null) manga.description = details.description;
        if (details.genre != null) manga.genre = details.genre!.join();
        if (details.status != null) manga.status = details.status!;
        // Replace with ComicInfo.xml file
        final comicInfo = manga.getComicInfo();
        final comicInfoFileRef = await File(p.join(mangaDir.path, comicInfoFile)).create(recursive: true);
        final document = XmlDocument();
        document.children.add(comicInfo.toXmlElement());
        await comicInfoFileRef.writeAsString(document.toXmlString());
        await legacyJsonDetailsFile.delete();
      } else if (noXmlFile == null) {
        // Copy ComicInfo.xml from chapter archive to top level if found
        final chapterArchives = mangaDirFiles
            .where((it) => local_archive.Archive.isSupported(it))
            .toList();

        final copiedFile = _copyComicInfoFileFromArchive(chapterArchives, mangaDir);
        if (copiedFile != null) {
          _setMangaDetailsFromComicInfoFile(copiedFile, manga);
        } else {
          // Avoid re-scanning
          await File(p.join(mangaDir.path, '.noxml')).create(recursive: true);
        }
      }
    } catch (e) {
      //logger.e(e, message: "Error setting manga details from local metadata for ${manga.title}");
    }

    return manga;
  }

  File? _copyComicInfoFileFromArchive(List<File> chapterArchives, Directory folder) {
    for (final chapter in chapterArchives) {
      switch (Format.valueOf(chapter.path)) {
        case Zip():
          //ZipFile(chapter.openReadOnlyChannel(context)).use { zip: ZipFile ->
          //    zip.getEntry(comicInfoFile)?.let { comicInfoFile ->
          //        zip.getInputStream(comicInfoFile).buffered().use { stream ->
          //            return _copyComicInfoFile(stream, folder)
          //        }
          //    }
          //}
        case Rar():
          return null;
          //JunrarArchive(chapter.openInputStream()).use { rar ->
          //    rar.fileHeaders.firstOrNull { it.fileName == comicInfoFile }?.let { comicInfoFile ->
          //        rar.getInputStream(comicInfoFile).buffered().use { stream ->
          //            return _copyComicInfoFile(stream, folder)
          //        }
          //    }
          //}
      }
    }
    return null;
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
        .where((it) => it is Directory || (it is File && local_archive.Archive.isSupported(it)))
        .map((chapterFile) {
          final chapter = SChapter.create()
              ..url = "${manga.url}/${p.basename(chapterFile.path)}"
              ..name = (chapterFile is Directory
                  ? p.basename(chapterFile.path)
                  : p.basenameWithoutExtension(chapterFile.path)).orEmpty()
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
        })
        .sortedWith((c1, c2) {
          final c = c2.chapterNumber.compareTo(c1.chapterNumber);
          return c == 0
              ? compareAsciiLowerCaseNatural(c2.name, c1.name)
              : c;
        });

    // Copy the cover from the first chapter found if not available
    if (manga.thumbnailUrl.isNullOrBlank) {
      final chapter = chapters.lastOrNull;
      if (chapter != null) {
        await _updateCover(chapter, manga);
      }
    }

    //return chapters;
    return [];
  }

  @override
  FilterList getFilterList() => [OrderByPopular(context)];

  // Unused stuff
  @override
  Future<List<page.Page>> getPageList(SChapter chapter) => throw UnsupportedError('Unused');

  Future<Format> getFormat(SChapter chapter) async {
    final lang = AppLocalizations.of(context);
    final dir = await fileSystem.getBaseDirectory();
    try {
    //  final (mangaDirName, chapterName) = chapter.url.split('/', limit: 2);
      final dir = await fileSystem.getBaseDirectory();
    //  final file = dir
    //      ?.findFile(mangaDirName, true)
    //      ?.findFile(chapterName, true);
    //  if (file != null) {
    //    return Format.valueOf(file);
    //  } else {
    //    throw Exception(lang.chapter_not_found);
    //  }
      return FormatDirectory(dir!);
    } on UnknownFormatException {
      throw Exception(lang.local_invalid_format);
    } catch (e) {
      rethrow;
    }
  }

  Future<File?> _updateCover(SChapter chapter, SManga manga) async {
    final format = await getFormat(chapter);
    try {
      switch (format) {
        case FormatDirectory():
          final entry = format.dir.listSync()
              .sortedWith((f1, f2) => compareAsciiLowerCaseNatural(f1.path, f2.path))
              .whereType<File>()
              .firstWhereOrNull((it) => ImageUtil.isImage(p.basename(it.path), it));

          //if (entry != null) coverManager.update(manga, it.openInputStream());
          return entry;
        case Zip():
          final inputStream = InputFileStream('test.zip');
          final zip = ZipDecoder().decodeBuffer(inputStream);
          final entry = zip.files
              .sortedWith((f1, f2) => compareAsciiLowerCaseNatural(f1.name, f2.name))
              .firstWhereOrNull((it) => it.isFile && ImageUtil.isImage(it.name, zip.getInputStream(it)));

          //if (entry != null) coverManager.update(manga, zip.getInputStream(it));
          //return entry;
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
