// TODO
import 'package:dartx/dartx.dart';

import 'package:flutteryomi/domain/source/model/page.dart';
import 'package:flutteryomi/domain/source/model/schapter.dart';
import 'package:flutteryomi/domain/source/model/smanga.dart';
import 'package:flutteryomi/domain/source/model/source.dart';

// Currently cannot extend or implement a Freezed class
//class StubSource implements Source {
class StubSource {
  StubSource({
    required this.id,
    required this.lang,
    required this.name,
  });

  final int id;
  final String lang;
  final String name;

  late final bool _isInvalid = name.isBlank || lang.isBlank;

  Future<SManga> getMangaDetails(SManga manga) =>
      throw SourceNotInstalledException();

  Future<List<SChapter>> getChapterList(SManga manga) =>
      throw SourceNotInstalledException();

  Future<List<Page>> getPageList(SChapter chapter) =>
      throw SourceNotInstalledException();

  @override
  String toString() => !_isInvalid ? "$name (${lang.toUpperCase()})" : id.toString();

  static StubSource from(Source source) => StubSource(
    id: source.id,
    lang: source.lang,
    name: source.name,
  );
}

class SourceNotInstalledException implements Exception {}
