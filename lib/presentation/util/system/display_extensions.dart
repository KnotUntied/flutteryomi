import 'dart:math';

import 'package:flutter/widgets.dart';

const _tabletUiRequiredScreenWidth = 720;

// some tablets have screen width like 711dp = 1600px / 2.25
const _tabletUiMinScreenWidthPortrait = 700;

// make sure icons on the nav rail fit
const _tabletUiMinScreenWidthLandscape = 600;

bool isTabletUi(BuildContext context) {
  final size = MediaQuery.sizeOf(context);
  return min(size.width, size.height) >= _tabletUiRequiredScreenWidth;
}