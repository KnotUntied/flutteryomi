import 'dart:io';

import 'package:path/path.dart' as p;

class Archive {
  static const _supportedArchiveTypes = ["zip", "cbz", "rar", "cbr", "epub"];

  bool isSupported(File file) =>
      _supportedArchiveTypes.contains(p.extension(file.path));
}
