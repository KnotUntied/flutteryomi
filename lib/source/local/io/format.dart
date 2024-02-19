import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:path/path.dart' as p;
import 'package:quiver/strings.dart';

part 'format.freezed.dart';

@freezed
sealed class Format with _$Format {
  const Format._();
  const factory Format.directory(Directory dir) = FormatDirectory;
  const factory Format.zip(File file) = Zip;
  const factory Format.rar(File file) = Rar;
  const factory Format.epub(File file) = Epub;

  static Future<Format> valueOf(String filePath) async {
    final extension = p.extension(filePath);
    if (await FileSystemEntity.isDirectory(filePath)) {
      return FormatDirectory(Directory(filePath));
    } else if (equalsIgnoreCase(extension, ".zip") || equalsIgnoreCase(extension, ".cbz")) {
      return Zip(File(filePath));
    } else if (equalsIgnoreCase(extension, ".rar") || equalsIgnoreCase(extension, ".cbr")) {
      return Rar(File(filePath));
    } else if (equalsIgnoreCase(extension, ".epub")) {
      return Epub(File(filePath));
    } else {
      throw UnknownFormatException();
    }
  }
}

class UnknownFormatException implements Exception {}
