import 'dart:io';

import 'package:collection/collection.dart';
import 'package:path/path.dart' as p;
import 'package:quiver/strings.dart';

import 'package:flutteryomi/core/util/system/image_util.dart';
import 'package:flutteryomi/domain/source/model/smanga.dart';
import 'package:flutteryomi/source/local/io/local_source_file_system.dart';

const _defaultCoverName = "cover.jpg";

class LocalCoverManager {
  LocalCoverManager({
    required this.fileSystem,
  });

  final LocalSourceFileSystem fileSystem;

  Future<File?> find(String mangaUrl) async {
    final files = await fileSystem.getFilesInMangaDirectory(mangaUrl);
    return files
        // Get all file whose names start with "cover"
        .where((it) => FileSystemEntity.isFileSync(it.path)
            && equalsIgnoreCase(p.basenameWithoutExtension(it.path), 'cover'))
        // Get the first actual image
        .firstWhereOrNull((it) => ImageUtil.isImage(p.basename(it.path)))
        as File?;
  }

  //TODO
  Future<File?> update(SManga manga) async {
    final directory = await fileSystem.getMangaDirectory(manga.url);
    if (directory == null) return null;

    //final targetFile = find(manga.url) ?? directory.createFile(_defaultCoverName)!;

    //inputStream.use { input ->
    //    targetFile.openOutputStream().use { output ->
    //        input.copyTo(output)
    //    }
    //}

    //DiskUtil.createNoMediaFile(directory, context);

    //manga.thumbnailUrl = targetFile.uri.toString();
    //return targetFile;
    return null;
  }
}
