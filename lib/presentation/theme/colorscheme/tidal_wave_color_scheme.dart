import 'package:flutter/material.dart';

import 'package:flutteryomi/presentation/theme/colorscheme/base_color_scheme.dart';

/// Colors for Tidal Wave theme
/// Original color scheme by NahutabDevelop
///
/// Key colors:
/// Primary #004152
/// Secondary #5ed4fc
/// Tertiary #92f7bc
/// Neutral #16151D
class TidalWaveColorScheme extends BaseColorScheme {
  @override
  final ColorScheme darkScheme = const ColorScheme.dark(
    primary: Color(0xFF5ed4fc),
    onPrimary: Color(0xFF003544),
    primaryContainer: Color(0xFF004d61),
    onPrimaryContainer: Color(0xFFb8eaff),
    inversePrimary: Color(0xFFa12b03),
    secondary: Color(0xFF5ed4fc),
    onSecondary: Color(0xFF003544),
    secondaryContainer: Color(0xFF004d61),
    onSecondaryContainer: Color(0xFFb8eaff),
    tertiary: Color(0xFF92f7bc),
    onTertiary: Color(0xFF001c3b),
    tertiaryContainer: Color(0xFFc3fada),
    onTertiaryContainer: Color(0xFF78ffd6),
    surface: Color(0xFF001c3b),
    onSurface: Color(0xFFd5e3ff),
    surfaceContainerHighest: Color(0xFF40484c),
    onSurfaceVariant: Color(0xFFbfc8cc),
    surfaceTint: Color(0xFF5ed4fc),
    inverseSurface: Color(0xFFffe3c4),
    onInverseSurface: Color(0xFF001c3b),
    outline: Color(0xFF8a9296),
  );

  @override
  final ColorScheme lightScheme = const ColorScheme.light(
    primary: Color(0xFF006780),
    onPrimary: Color(0xFFffffff),
    primaryContainer: Color(0xFFB4D4DF),
    onPrimaryContainer: Color(0xFF001f28),
    inversePrimary: Color(0xFFff987f),
    secondary: Color(0xFF006780),
    onSecondary: Color(0xFFffffff),
    secondaryContainer: Color(0xFFb8eaff),
    onSecondaryContainer: Color(0xFF001f28),
    tertiary: Color(0xFF92f7bc),
    onTertiary: Color(0xFF001c3b),
    tertiaryContainer: Color(0xFFc3fada),
    onTertiaryContainer: Color(0xFF78ffd6),
    surface: Color(0xFFfdfbff),
    onSurface: Color(0xFF001c3b),
    surfaceContainerHighest: Color(0xFFdce4e8),
    onSurfaceVariant: Color(0xFF40484c),
    surfaceTint: Color(0xFF006780),
    inverseSurface: Color(0xFF020400),
    onInverseSurface: Color(0xFFffe3c4),
    outline: Color(0xFF70787c),
  );
}
