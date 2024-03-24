import 'dart:io';

import 'package:dartx/dartx_io.dart';
import 'package:path_provider/path_provider.dart';

class FolderProvider {
  Future<Directory?> directory() async {
    final Directory? dir = Platform.isAndroid
        ? await getExternalStorageDirectory()
        : await getApplicationDocumentsDirectory();
    return dir?.subdir('Flutteryomi');
  }

  Future<String?> path() async {
    final Directory? dir = await directory();
    return dir?.absolute.path;
  }
}
