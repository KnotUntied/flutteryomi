import 'package:flutteryomi/source/api/source.dart';

/// A factory for creating sources at runtime.
abstract interface class SourceFactory {
  /// Create a new copy of the sources
  List<Source> createSources();
}