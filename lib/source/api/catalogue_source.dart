import 'package:flutteryomi/domain/source/model/filter_list.dart';
import 'package:flutteryomi/domain/source/model/mangas_page.dart';
import 'package:flutteryomi/source/api/source.dart';

/// A factory for creating sources at runtime.
abstract class CatalogueSource extends Source {
  CatalogueSource({
    required super.id,
    required super.name,
    /// An ISO 639-1 compliant language code (two letters in lower case).
    super.lang,
    required this.supportsLatest,
  });

  /// Whether the source has support for latest updates.
  final bool supportsLatest;

  /// Get a page with a list of manga.
  Future<MangasPage> getPopularManga(int page);

  /// Get a page with a list of manga.
  Future<MangasPage> getSearchManga(int page, String query, FilterList filters);

  /// Get a page with a list of latest manga updates.
  Future<MangasPage> getLatestUpdates(int page);

  /// Returns the list of filters for the source.
  FilterList getFilterList();
}
