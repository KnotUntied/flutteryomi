import 'dart:io';

abstract class FolderProvider {
  Future<Directory?> directory();
  Future<String?> path();
}
