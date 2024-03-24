import 'dart:io';

import 'package:dartx/dartx_io.dart';
import 'package:logger/logger.dart';
import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:flutteryomi/core/storage/disk_util.dart';
import 'package:flutteryomi/core/storage/directory_extensions.dart';
import 'package:flutteryomi/core/util/system/logger.dart';
import 'package:flutteryomi/domain/chapter/model/chapter.dart';
import 'package:flutteryomi/domain/manga/model/manga.dart';
import 'package:flutteryomi/domain/storage/service/storage_manager.dart';
import 'package:flutteryomi/source/api/source.dart';
import 'package:flutteryomi/l10n/l10n.dart';

part 'download_provider.g.dart';

/// This class is used to provide the directories where the downloads should be saved.
/// It uses the following path scheme: /<root downloads dir>/<source name>/<manga>/<chapter>
class DownloadProvider {
  DownloadProvider({
    required this.ref,
    required this.logger,
    required this.storageManager,
  });

  final Ref ref;
  final Logger logger;
  final StorageManager storageManager;

  /// Returns the download directory for a manga. For internal use only.
  Future<Directory> getMangaDir(String mangaTitle, Source source) async {
    final lang = ref.read(appLocalizationsProvider);
    final downloadsDir = await storageManager.getDownloadsDirectory();
    try {
      return downloadsDir!
          .subdir(
            getSourceDirName(source),
            getMangaDirName(mangaTitle),
          )
          .create(recursive: true);
    } catch (e) {
      logger.e("Invalid download directory", e);
      throw Exception(
        lang.invalid_location(downloadsDir?.path ?? ""),
      );
    }
  }

  /// Returns the download directory for a source if it exists.
  Future<Directory?> findSourceDir(Source source) async {
    final downloadsDir = await storageManager.getDownloadsDirectory();
    return downloadsDir?.findDir(getSourceDirName(source), true);
  }

  /// Returns the download directory for a manga if it exists.
  Future<Directory?> findMangaDir({
    required String mangaTitle,
    required Source source,
  }) async {
    final sourceDir = await findSourceDir(source);
    return sourceDir?.findDir(getMangaDirName(mangaTitle), true);
  }

  /// Returns the download directory for a chapter if it exists.
  Future<Directory?> findChapterDir({
    required String chapterName,
    String? chapterScanlator,
    required String mangaTitle,
    required Source source,
  }) async {
    final mangaDir = await findMangaDir(
      mangaTitle: mangaTitle,
      source: source,
    );
    return getValidChapterDirNames(
      chapterName: chapterName,
      chapterScanlator: chapterScanlator,
    ).mapNotNull((it) => mangaDir?.findDir(it, true)).firstOrNull;
  }

  /// Returns a list of downloaded directories for the chapters that exist.
  Future<(Directory?, List<Directory>)> findChapterDirs({
    required List<Chapter> chapters,
    required Manga manga,
    required Source source,
  }) async {
    final mangaDir = await findMangaDir(
      mangaTitle: manga.title,
      source: source,
    );
    if (mangaDir == null) return (null, const <Directory>[]);
    return (
      mangaDir,
      chapters
          .mapNotNull(
            (chapter) => getValidChapterDirNames(
              chapterName: chapter.name,
              chapterScanlator: chapter.scanlator,
            ).mapNotNull((it) => mangaDir.findDir(it, true)).firstOrNull,
          )
          .toList(),
    );
  }

  /// Returns the download directory name for a source.
  String getSourceDirName(Source source) =>
      DiskUtil.buildValidFilename(source.toString());

  /// Returns the download directory name for a manga.
  String getMangaDirName(String mangaTitle) =>
      DiskUtil.buildValidFilename(mangaTitle);

  /// Returns the chapter directory name for a chapter.
  String getChapterDirName(String chapterName, String? chapterScanlator) {
    final newChapterName = _sanitizeChapterName(chapterName);
    return DiskUtil.buildValidFilename(
      !chapterScanlator.isNullOrBlank
          ? "${chapterScanlator}_$newChapterName"
          : newChapterName,
    );
  }

  /// Return the new name for the chapter (in case it's empty or blank)
  String _sanitizeChapterName(String chapterName) =>
      chapterName.isBlank ? 'Chapter' : chapterName;

  bool isChapterDirNameChanged(Chapter oldChapter, Chapter newChapter) {
    if (oldChapter.name != newChapter.name) return true;
    final oldScanlator =
        oldChapter.scanlator.isNotNullOrBlank ? oldChapter.scanlator : null;
    final newScanlator =
        newChapter.scanlator.isNotNullOrBlank ? newChapter.scanlator : null;
    return oldScanlator != newScanlator;
  }

  /// Returns valid downloaded chapter directory names.
  List<String> getValidChapterDirNames({
    required String chapterName,
    String? chapterScanlator,
  }) {
    final chapterDirName = getChapterDirName(chapterName, chapterScanlator);
    return [
      // Folder of images
      chapterDirName,
      // Archived chapters
      "$chapterDirName.cbz",
      if (chapterScanlator.isNullOrBlank) ...[
        // Previously null scanlator fields were converted to "" due to a bug
        "_$chapterDirName",
        "_$chapterDirName.cbz",
      ] else
        // Legacy chapter directory name used in v0.9.2 and before
        DiskUtil.buildValidFilename(chapterName),
    ];
  }
}

@riverpod
DownloadProvider downloadProvider(DownloadProviderRef ref) => DownloadProvider(
      ref: ref,
      logger: ref.watch(loggerProvider),
      storageManager: ref.watch(storageManagerProvider),
    );
