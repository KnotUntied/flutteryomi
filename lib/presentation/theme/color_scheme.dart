import 'package:flutter/material.dart';

// ThemeExtension exists but is rather redundant
Color active(BuildContext context) {
  return MediaQuery.of(context).platformBrightness == Brightness.light
      ? const Color(0xFFFFEB3B)
      : const Color(0XFFFFC107);
}
