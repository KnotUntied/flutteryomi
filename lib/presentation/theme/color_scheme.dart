import 'package:flutter/material.dart';

// ThemeExtension exists but is overkill
Color active(BuildContext context) {
  return MediaQuery.platformBrightnessOf(context) == Brightness.light
      ? const Color(0xFFFFEB3B)
      : const Color(0XFFFFC107);
}
