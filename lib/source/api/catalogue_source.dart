import 'package:flutteryomi/domain/source/model/filter_list.dart';
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

  /// Returns the list of filters for the source.
  FilterList getFilterList();
}
