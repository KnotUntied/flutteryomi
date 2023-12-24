enum ReadingMode {
  // stringRes and iconRes belong to presentation
  default_(0x00000000),
  leftToRight(0x00000001, Direction.horizontal, ViewerType.pager),
  rightToLeft(0x00000002, Direction.horizontal, ViewerType.pager),
  vertical(0x00000003, Direction.vertical, ViewerType.pager),
  webtoon(0x00000004, Direction.vertical, ViewerType.webtoon),
  continuousVertical(0x00000005, Direction.vertical, ViewerType.webtoon);

  const ReadingMode(this.flagValue, [this.direction, this.type]);

  final int flagValue;
  final Direction? direction;
  final ViewerType? type;

  static const mask = 0x00000007;

  static ReadingMode fromPreference(int? preference) => values.firstWhere(
        (it) => it.flagValue == preference,
        orElse: () => default_,
      );

  static bool isPagerType(int preference) => fromPreference(preference).type == ViewerType.pager;

  // TODO
  // toViewer belongs to presentation
}

enum Direction { horizontal, vertical }

enum ViewerType { pager, webtoon }
