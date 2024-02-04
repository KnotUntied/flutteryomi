import 'package:flutter/material.dart';

abstract class BaseColorScheme {
  abstract final ColorScheme darkScheme;
  abstract final ColorScheme lightScheme;

  ColorScheme getColorScheme(bool isDark, bool isAmoled) => //
      isDark
          ? (isAmoled
              ? darkScheme.copyWith(
                  background: Colors.black,
                  onBackground: Colors.white,
                  surface: Colors.black,
                  onSurface: Colors.white,
                )
              : darkScheme)
          : lightScheme;
}
