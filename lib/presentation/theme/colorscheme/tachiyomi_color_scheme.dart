import 'package:flutter/material.dart';

import 'package:flutteryomi/presentation/theme/colorscheme/base_color_scheme.dart';

/// Colors for Default theme
/// M3 colors generated by Material Theme Builder (https://goo.gle/material-theme-builder-web)
///
/// Key colors:
/// Primary #2979FF
/// Secondary #2979FF
/// Tertiary #47A84A
/// Neutral #919094
class TachiyomiColorScheme extends BaseColorScheme {
  @override
  final ColorScheme darkScheme = const ColorScheme.dark(
    primary: Color(0xFFB0C6FF),
    onPrimary: Color(0xFF002D6E),
    primaryContainer: Color(0xFF00429B),
    onPrimaryContainer: Color(0xFFD9E2FF),
    inversePrimary: Color(0xFF0058CA),
    secondary: Color(0xFFB0C6FF),
    onSecondary: Color(0xFF002D6E),
    secondaryContainer: Color(0xFF00429B),
    onSecondaryContainer: Color(0xFFD9E2FF),
    tertiary: Color(0xFF7ADC77),
    onTertiary: Color(0xFF003909),
    tertiaryContainer: Color(0xFF005312),
    onTertiaryContainer: Color(0xFF95F990),
    surface: Color(0xFF1B1B1F),
    onSurface: Color(0xFFE3E2E6),
    surfaceContainerHighest: Color(0xFF44464F),
    onSurfaceVariant: Color(0xFFC5C6D0),
    surfaceTint: Color(0xFFB0C6FF),
    inverseSurface: Color(0xFFE3E2E6),
    onInverseSurface: Color(0xFF1B1B1F),
    error: Color(0xFFFFB4AB),
    onError: Color(0xFF690005),
    errorContainer: Color(0xFF93000A),
    onErrorContainer: Color(0xFFFFDAD6),
    outline: Color(0xFF8F9099),
    outlineVariant: Color(0xFF44464F),
  );

  @override
  final ColorScheme lightScheme = const ColorScheme.light(
    primary: Color(0xFF0058CA),
    onPrimary: Color(0xFFFFFFFF),
    primaryContainer: Color(0xFFD9E2FF),
    onPrimaryContainer: Color(0xFF001945),
    inversePrimary: Color(0xFFB0C6FF),
    secondary: Color(0xFF0058CA),
    onSecondary: Color(0xFFFFFFFF),
    secondaryContainer: Color(0xFFD9E2FF),
    onSecondaryContainer: Color(0xFF001945),
    tertiary: Color(0xFF006E1B),
    onTertiary: Color(0xFFFFFFFF),
    tertiaryContainer: Color(0xFF95F990),
    onTertiaryContainer: Color(0xFF002203),
    surface: Color(0xFFFEFBFF),
    onSurface: Color(0xFF1B1B1F),
    surfaceContainerHighest: Color(0xFFE1E2EC),
    onSurfaceVariant: Color(0xFF44464F),
    surfaceTint: Color(0xFF0058CA),
    inverseSurface: Color(0xFF303034),
    onInverseSurface: Color(0xFFF2F0F4),
    error: Color(0xFFBA1A1A),
    onError: Color(0xFFFFFFFF),
    errorContainer: Color(0xFFFFDAD6),
    onErrorContainer: Color(0xFF410002),
    outline: Color(0xFF757780),
    outlineVariant: Color(0xFFC5C6D0),
  );
}
