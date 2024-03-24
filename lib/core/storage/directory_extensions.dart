import 'dart:io';

import 'package:collection/collection.dart';
import 'package:dartx/dartx_io.dart';
import 'package:quiver/strings.dart';

extension DirectoryExtensions on Directory {
  File? findFile(String displayName, [bool ignoreCase = false]) {
    if (ignoreCase) {
      return listSync()
          .whereType<File>()
          .firstWhereOrNull((it) => equalsIgnoreCase(it.name, displayName));
    } else {
      final file = this.file(displayName);
      return containsSync(file) ? file : null;
    }
  }

  Directory? findDir(String displayName, [bool ignoreCase = false]) {
    if (ignoreCase) {
      return listSync()
          .whereType<Directory>()
          .firstWhereOrNull((it) => equalsIgnoreCase(it.name, displayName));
    } else {
      final dir = subdir(displayName);
      return containsSync(dir) ? dir : null;
    }
  }
}
