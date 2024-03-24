import 'package:flutter/material.dart';
import 'package:riverpod/riverpod.dart';

import 'package:flutteryomi/l10n/l10n.dart';

enum ReaderOrientation {
  // flag needs cross-platform API for screen orientation compatible
  // with android.content.pm.ActivityInfo, otherwise, belong to presentation
  // stringRes and iconRes belong to presentation
  default_(0x00000000, Icons.screen_rotation),
  free(0x00000008, Icons.screen_rotation),
  portrait(0x00000010, Icons.stay_current_portrait),
  landscape(0x00000018, Icons.stay_current_landscape),
  lockedPortrait(0x00000020, Icons.screen_lock_portrait),
  lockedLandscape(0x00000028, Icons.screen_lock_landscape),
  reversePortrait(0x00000030, Icons.stay_current_portrait);

  const ReaderOrientation(this.flagValue, this.icon);

  final int flagValue;
  final IconData icon;

  String string(Ref ref) {
    final lang = ref.read(appLocalizationsProvider);
    return switch (this) {
      ReaderOrientation.default_ => lang.label_default,
      ReaderOrientation.free => lang.rotation_free,
      ReaderOrientation.portrait => lang.rotation_portrait,
      ReaderOrientation.landscape => lang.rotation_landscape,
      ReaderOrientation.lockedPortrait => lang.rotation_force_portrait,
      ReaderOrientation.lockedLandscape => lang.rotation_force_landscape,
      ReaderOrientation.reversePortrait => lang.rotation_reverse_portrait,
    };
  }

  static const mask = 0x00000007;

  static ReaderOrientation fromPreference(int? preference) => values.firstWhere(
        (it) => it.flagValue == preference,
        orElse: () => default_,
      );
}
