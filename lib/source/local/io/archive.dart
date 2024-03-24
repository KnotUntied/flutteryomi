import 'dart:io';

import 'package:dartx/dartx_io.dart';

abstract class Archive {
  static const _supportedArchiveTypes = {
    ".zip",
    ".cbz",
    ".rar",
    ".cbr",
    ".epub",
  };

  static bool isSupported(File file) =>
      _supportedArchiveTypes.contains(file.extension);
}
