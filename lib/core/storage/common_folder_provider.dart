import 'dart:io';
import 'package:path_provider/path_provider.dart';

import 'package:flutteryomi/core/storage/folder_provider.dart';

class CommonFolderProvider implements FolderProvider {
  @override
  Future<Directory?> directory() async {
    final Directory? dir = Platform.isAndroid
        ? await getExternalStorageDirectory()
        : await getApplicationDocumentsDirectory();
    return dir != null
        ? Directory('${dir.absolute.path}${Platform.pathSeparator}Flutteryomi')
        : null;
  }

  @override
  Future<String?> path() async {
    final Directory? dir = await directory();
    return dir?.absolute.path;
  }
}
