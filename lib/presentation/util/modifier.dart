// Unlike Compose, Flutter doesn't have modifiers.
// Still, this file is named such for s

import 'package:flutter/material.dart';

Color selectedBackground(BuildContext context) {
  final alpha = Theme.of(context).brightness == Brightness.dark ? 0.16 : 0.22;
  return Theme.of(context).colorScheme.secondary.withOpacity(alpha);
}
