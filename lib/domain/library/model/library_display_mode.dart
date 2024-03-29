import 'package:equatable/equatable.dart';

sealed class LibraryDisplayMode extends Equatable {
  static String serializer(LibraryDisplayMode value) => value.serialize();

  static final values = {CompactGrid(), ComfortableGrid(), ListMode(), CoverOnlyGrid()};
  static final default_ = CompactGrid();

  static LibraryDisplayMode deserialize(String serialized) =>
      switch (serialized) {
        "COMFORTABLE_GRID" => ComfortableGrid(),
        "COMPACT_GRID" => CompactGrid(),
        "COVER_ONLY_GRID" => CoverOnlyGrid(),
        "LIST" => ListMode(),
        _ => default_,
      };

  String serialize() => switch (this) {
    CompactGrid() => "COMPACT_GRID",
    ComfortableGrid() => "COMFORTABLE_GRID",
    ListMode() => "LIST",
    CoverOnlyGrid() => "COVER_ONLY_GRID",
  };

  @override
  List<Object?> get props => const [];

  @override
  bool get stringify => true;
}

class CompactGrid extends LibraryDisplayMode {}
class ComfortableGrid extends LibraryDisplayMode {}
class ListMode extends LibraryDisplayMode {}
class CoverOnlyGrid extends LibraryDisplayMode {}
