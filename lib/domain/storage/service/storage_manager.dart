import 'dart:io';

import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:flutteryomi/domain/storage/service/storage_preferences.dart';

part 'storage_manager.g.dart';

class StorageManager {
  final StoragePreferences storagePreferences;
  StorageManager({
    required this.storagePreferences,
  });

  Directory? _getBaseDir(String uri) {
    final dir = Directory(uri);
    return dir.existsSync() ? dir : null;
  }

  Future<Directory?> getAutomaticBackupsDirectory() async {
    final dir = await storagePreferences.baseStorageDirectory();
    final baseDir = _getBaseDir(dir.get() + _automaticBackupsPath);
    return baseDir?.create();
  }

  Future<Directory?> getDownloadsDirectory() async {
    final dir = await storagePreferences.baseStorageDirectory();
    final baseDir = _getBaseDir(dir.get() + _downloadsPath);
    return baseDir?.create();
  }

  Future<Directory?> getLocalSourceDirectory() async {
    final dir = await storagePreferences.baseStorageDirectory();
    final baseDir = _getBaseDir(dir.get() + _localSourcePath);
    return baseDir?.create();
  }
}

@riverpod
StorageManager storageManager(StorageManagerRef ref) => StorageManager(
      storagePreferences: ref.watch(storagePreferencesProvider),
    );

const _automaticBackupsPath = "autobackup";
const _downloadsPath = "downloads";
const _localSourcePath = "local";
