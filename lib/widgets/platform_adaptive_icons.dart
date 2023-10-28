// ignore_for_file: non_constant_identifier_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart' show defaultTargetPlatform;
import 'package:flutter/material.dart';

// Not sure if this works design-wise
abstract final class PlatformAdaptiveIcons {
  const PlatformAdaptiveIcons._();

  static bool _isCupertino() {
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
      case TargetPlatform.fuchsia:
      case TargetPlatform.linux:
      case TargetPlatform.windows:
        return false;
      case TargetPlatform.iOS:
      case TargetPlatform.macOS:
        return true;
    }
  }

  IconData get info_outlined => !_isCupertino() ? Icons.info_outlined : CupertinoIcons.info;
}