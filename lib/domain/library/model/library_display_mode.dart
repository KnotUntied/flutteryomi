//enum LibraryDisplayMode {
//  compactGrid,
//  comfortableGrid,
//  list,
//  coverOnlyGrid,
//}

class LibraryDisplayMode {
  static final compactGrid = LibraryDisplayMode();
  static final comfortableGrid = LibraryDisplayMode();
  static final list = LibraryDisplayMode();
  static final coverOnlyGrid = LibraryDisplayMode();

  static final values = {
    compactGrid,
    comfortableGrid,
    list,
    coverOnlyGrid,
  };

  static LibraryDisplayMode deserialize(String serialized) =>
      switch (serialized) {
        "COMFORTABLE_GRID" => comfortableGrid,
        "COMPACT_GRID" => compactGrid,
        "COVER_ONLY_GRID" => coverOnlyGrid,
        "LIST" => list,
        _ => compactGrid,
      };

  String serialize() {
    if (this == comfortableGrid) {
      return "COMFORTABLE_GRID";
    } else if (this == compactGrid) {
      return "COMPACT_GRID";
    } else if (this == coverOnlyGrid) {
      return "COVER_ONLY_GRID";
    } else if (this == list) {
      return "LIST";
    } else {
      return "COMPACT_GRID";
    }
  }
}
