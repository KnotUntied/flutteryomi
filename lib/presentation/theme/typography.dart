import 'package:flutter/material.dart';

// ThemeExtension exists but is rather redundant
TextStyle? header(BuildContext context) {
  return Theme.of(context).textTheme.bodyMedium?.copyWith(
        color: Theme.of(context).colorScheme.onSurfaceVariant,
        fontWeight: FontWeight.w600,
      );
}
