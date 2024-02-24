import 'dart:io';

import 'package:path/path.dart' as p;

abstract class Archive {
  static const _supportedArchiveTypes = {".zip", ".cbz", ".rar", ".cbr", ".epub"};

  static bool isSupported(File file) =>
      _supportedArchiveTypes.contains(p.extension(file.path));
}
