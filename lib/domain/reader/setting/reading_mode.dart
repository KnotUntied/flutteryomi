import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:flutteryomi/presentation/icons/custom_icons.dart';

enum ReadingMode {
  default_(0x00000000, CustomIcons.readerDefault),
  leftToRight(
    0x00000001,
    CustomIcons.readerLtr,
    Direction.horizontal,
    ViewerType.pager,
  ),
  rightToLeft(
    0x00000002,
    CustomIcons.readerRtl,
    Direction.horizontal,
    ViewerType.pager,
  ),
  vertical(
    0x00000003,
    CustomIcons.readerVertical,
    Direction.vertical,
    ViewerType.pager,
  ),
  webtoon(
    0x00000004,
    CustomIcons.readerWebtoon,
    Direction.vertical,
    ViewerType.webtoon,
  ),
  continuousVertical(
    0x00000005,
    CustomIcons.readerContinuousVertical,
    Direction.vertical,
    ViewerType.webtoon,
  );

  const ReadingMode(this.flagValue, this.icon, [this.direction, this.type]);

  final int flagValue;
  final IconData icon;
  final Direction? direction;
  final ViewerType? type;

  String string(BuildContext context) {
    final lang = AppLocalizations.of(context);
    return switch (this) {
      ReadingMode.default_ => lang.label_default,
      ReadingMode.leftToRight => lang.left_to_right_viewer,
      ReadingMode.rightToLeft => lang.right_to_left_viewer,
      ReadingMode.vertical => lang.vertical_viewer,
      ReadingMode.webtoon => lang.webtoon_viewer,
      ReadingMode.continuousVertical => lang.vertical_plus_viewer,
    };
  }

  static const mask = 0x00000007;

  static ReadingMode fromPreference(int? preference) => values.firstWhere(
        (it) => it.flagValue == preference,
        orElse: () => default_,
      );

  static bool isPagerType(int preference) =>
      fromPreference(preference).type == ViewerType.pager;

  // TODO: toViewer
}

enum Direction { horizontal, vertical }

enum ViewerType { pager, webtoon }
