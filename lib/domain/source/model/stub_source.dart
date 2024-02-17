import 'package:dartx/dartx.dart';

import 'package:flutteryomi/domain/source/model/page.dart';
import 'package:flutteryomi/domain/source/model/schapter.dart';
import 'package:flutteryomi/domain/source/model/smanga.dart';
import 'package:flutteryomi/source/api/source.dart';

class StubSource extends Source {
  StubSource({
    required super.id,
    super.lang,
    required super.name,
  });

  late final bool _isInvalid = name.isBlank || lang.isBlank;

  @override
  Future<SManga> getMangaDetails(SManga manga) =>
      throw SourceNotInstalledException();

  @override
  Future<List<SChapter>> getChapterList(SManga manga) =>
      throw SourceNotInstalledException();

  @override
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
