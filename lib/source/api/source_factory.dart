import 'package:flutteryomi/domain/source/model/source.dart';

/// A factory for creating sources at runtime.
abstract interface class SourceFactory {
  /// Create a new copy of the sources
  List<Source> createSources();
}