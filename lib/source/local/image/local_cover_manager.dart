import 'dart:io';

import 'package:archive/archive_io.dart';
import 'package:collection/collection.dart';
import 'package:dartx/dartx_io.dart';
import 'package:path/path.dart' as p;
import 'package:quiver/strings.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:flutteryomi/core/util/system/image_util.dart';
import 'package:flutteryomi/core/storage/disk_util.dart';
import 'package:flutteryomi/domain/source/model/smanga.dart';
import 'package:flutteryomi/source/local/io/local_source_file_system.dart';

part 'local_cover_manager.g.dart';

const _defaultCoverName = "cover.jpg";

class LocalCoverManager {
  LocalCoverManager({required this.fileSystem});

  final LocalSourceFileSystem fileSystem;

  Future<File?> find(String mangaUrl) async {
    final files = await fileSystem.getFilesInMangaDirectory(mangaUrl);
    return files
        // Get all file whose names start with "cover"
        .where((it) => it is File
            && equalsIgnoreCase(it.nameWithoutExtension, 'cover'))
        // Get the first actual image
        .firstWhereOrNull((it) => ImageUtil.isImage(it.name))
        as File?;
  }

  Future<File?> update(SManga manga, File file) async {
    final directory = await fileSystem.getMangaDirectory(manga.url);
    if (directory == null) return null;

    final targetFileRef = await find(manga.url)
        ?? await directory.file(_defaultCoverName).create(recursive: true);
    final targetFile = await file.copy(targetFileRef.path);

    DiskUtil.createNoMediaFile(directory);

    manga.thumbnailUrl = targetFile.uri.toString();
    return targetFile;
  }

  Future<File?> updateFromArchive(SManga manga, ArchiveFile file) async {
    final directory = await fileSystem.getMangaDirectory(manga.url);
    if (directory == null) return null;

    final targetFile = await find(manga.url)
        ?? await directory.file(_defaultCoverName).create(recursive: true);
    final outputStream = OutputFileStream(targetFile.path);
    file.writeContent(outputStream);
    outputStream.close();

    DiskUtil.createNoMediaFile(directory);

    manga.thumbnailUrl = targetFile.uri.toString();
    return targetFile;
  }
}

@riverpod
LocalCoverManager localCoverManager(LocalCoverManagerRef ref) =>
    LocalCoverManager(
      fileSystem: ref.watch(localSourceFileSystemProvider),
    );
