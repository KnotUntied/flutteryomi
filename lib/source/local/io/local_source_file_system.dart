import 'dart:io';

import 'package:path/path.dart' as p;
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:flutteryomi/domain/storage/service/storage_manager.dart';

part 'local_source_file_system.g.dart';

class LocalSourceFileSystem {
  final StorageManager storageManager;
  LocalSourceFileSystem({
    required this.storageManager,
  });

  Future<Directory?> getBaseDirectory() => storageManager.getLocalSourceDirectory();

  Future<List<FileSystemEntity>> getFilesInBaseDirectory() async {
    final dir = await getBaseDirectory();
    return dir?.listSync() ?? [];
  }

  Future<Directory?> getMangaDirectory(String name) async {
    final dir = await getBaseDirectory();
    if (dir != null) {
      return await FileSystemEntity.isDirectory(p.join(dir.path, name))
          ? Directory(name)
          : null;
    } else {
      return null;
    }
  }

  Future<List<FileSystemEntity>> getFilesInMangaDirectory(String name) async {
    final dir = await getMangaDirectory(name);
    return dir?.listSync() ?? [];
  }
}

@riverpod
LocalSourceFileSystem localSourceFileSystem(LocalSourceFileSystemRef ref) => LocalSourceFileSystem(
      storageManager: ref.watch(storageManagerProvider),
    );
