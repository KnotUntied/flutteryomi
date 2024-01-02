import 'package:flutter/material.dart';

const double readItemAlpha = 0.38;
const double secondaryItemAlpha = 0.78;

abstract class MaterialPadding {
  static const double extraLarge = 32.0;
  static const double large = 24.0;
  static const double medium = 16.0;
  static const double small = 8.0;
  static const double tiny = 4.0;
}

abstract class MaterialCorner {
  static const double extraLarge = 28.0;
  static const double large = 16.0;
  static const double medium = 12.0;
  static const double small = 8.0;
  static const double tiny = 4.0;
}

const topSmallPaddingValues = EdgeInsets.only(top: MaterialPadding.small);
