import 'dart:convert';
import 'dart:io';

import 'package:crypto/crypto.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

//TODO
abstract class DiskUtil {
  /// Returns the root folders of all the available external storages.
  static List<File> getExternalStorages(BuildContext context)
      //=> ContextCompat.getExternalFilesDirs(context, null)
      //    .whereNotNull()
      //    .mapNotNull((it) {
      //      final file = File(it.absolutePath.substringBefore("/Android/"));
      //      final state = Environment.getExternalStorageState(file);
      //      return state == Environment.MEDIA_MOUNTED || state == Environment.MEDIA_MOUNTED_READ_ONLY
      //          ? file
      //          : null;
      //    });
      => [];

  static String hashKeyForDisk(String key) => md5.convert(utf8.encode(key)).toString();

  static int getDirectorySize(FileSystemEntity f) {
    int size = 0;
    //if (f is Directory) {
    //  for (file in f.listFiles().orEmpty()) {
    //    size += getDirectorySize(file);
    //  }
    //} else {
    //  size = f.length();
    //}
    return size;
  }

  /// Gets the total space for the disk that a file path points to, in bytes.
  static int getTotalStorageSpace(File file) {
    //try {
    //  final stat = StatFs(file.absolutePath);
    //  return stat.blockCountLong * stat.blockSizeLong;
    //} catch (_) {
      return -1;
    //}
  }

  /// Gets the available space for the disk that a file path points to, in bytes.
  static int getAvailableStorageSpace(File file) {
    //try {
    //  final stat = StatFs(file.absolutePath);
    //  return stat.availableBlocksLong * stat.blockSizeLong;
    //} catch (_) {
      return -1;
    //}
  }

  /// Gets the available space for the disk that a file path points to, in bytes.
  //int getAvailableStorageSpace(File f) {
  //  try {
  //    final stat = StatFs(f.uri.path);
  //    return stat.availableBlocksLong * stat.blockSizeLong;
  //  } catch (_) {
  //    return -1;
  //  }
  //}

  /// Don't display downloaded chapters in gallery apps creating `.nomedia`.
  static void createNoMediaFile([Directory? dir]) async {
    if (dir != null && await dir.exists()) {
      final nomedia = File(p.join(dir.path, nomediaFile));
      if (!await nomedia.exists()) {
        await nomedia.create();
        scanMedia(dir.path);
      }
    }
  }

  /// Scans the given file so that it can be shown in gallery apps, for example.
  static void scanMedia(String path) async {
    if (Platform.isAndroid) {
      await const MethodChannel('media_scanner').invokeMethod('refreshGallery', {"path": path});
    }
  }

  /// Mutate the given filename to make it valid for a FAT filesystem,
  /// replacing any invalid characters with "_". This method doesn't allow hidden files (starting
  /// with a dot), but you can manually add it later.
  static String buildValidFilename(String origName) {
    //final name = origName.trim('.', ' ');
    //if (name.isEmpty) return "(invalid)";
    //final sb = StringBuilder(name.length);
    //name.forEach((c) {
    //  if (_isValidFatFilenameChar(c)) {
    //    sb.append(c);
    //  } else {
    //    sb.append('_');
    //  }
    //});
    //// Even though vfat allows 255 UCS-2 chars, we might eventually write to
    //// ext4 through a FUSE layer, so use that limit minus 15 reserved characters.
    //return sb.toString().take(240);
    return '';
  }

  /// Returns true if the given character is a valid filename character, false otherwise.
  static bool _isValidFatFilenameChar(String c) {
    //if (0x00.toChar() <= c && c <= 0x1f.toChar()) return false;
    //return switch (c) {
    //  '"' || '*' || '/' || ':' || '<' || '>' || '?' || '\\' || '|' || 0x7f.toChar() => false,
    //  _ => true,
    //};
    return false;
  }

  static const nomediaFile = ".nomedia";

  // Safe theoretical max filename size is 255 bytes and 1 char = 2-4 bytes (UTF-8)
  static const maxFileNameBytes = 250;
}
