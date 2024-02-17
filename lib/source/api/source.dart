import 'package:flutteryomi/domain/source/model/page.dart';
import 'package:flutteryomi/domain/source/model/schapter.dart';
import 'package:flutteryomi/domain/source/model/smanga.dart';

/// A basic interface for creating a source. It could be an online source, a local source, etc.
abstract class Source {
  Source({
    required this.id,
    required this.name,
    this.lang = "",
  });

  /// ID for the source. Must be unique.
  final int id;
  /// Name of the source.
  final String name;
  final String lang;

  /// Get the updated details for a [manga].
  Future<SManga> getMangaDetails(SManga manga);

  /// Get all the available chapters for a [manga].
  Future<List<SChapter>> getChapterList(SManga manga);

  /// Get the list of pages a [chapter] has. Pages should be returned
  /// in the expected order; the index is ignored.
  Future<List<Page>> getPageList(SChapter chapter);
}
