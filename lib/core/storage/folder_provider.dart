import 'dart:io';

import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

class FolderProvider {
  Future<Directory?> directory() async {
    final Directory? dir = Platform.isAndroid
        ? await getExternalStorageDirectory()
        : await getApplicationDocumentsDirectory();
    return dir != null
        ? Directory(p.join(dir.absolute.path, 'Flutteryomi'))
        : null;
  }

  Future<String?> path() async {
    final Directory? dir = await directory();
    return dir?.absolute.path;
  }
}
