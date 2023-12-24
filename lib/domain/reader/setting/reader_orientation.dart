enum ReaderOrientation {
  // flag needs cross-platform API for screen orientation compatible
  // with android.content.pm.ActivityInfo, otherwise, belong to presentation
  // stringRes and iconRes belong to presentation
  default_(0x00000000),
  free(0x00000008),
  portrait(0x00000010),
  landscape(0x00000018),
  lockedPortrait(0x00000020),
  lockedLandscape(0x00000028),
  reversePortrait(0x00000030);

  const ReaderOrientation(this.flagValue);

  final int flagValue;

  static const mask = 0x00000007;

  static ReaderOrientation fromPreference(int? preference) => values.firstWhere(
        (it) => it.flagValue == preference,
        orElse: () => default_,
      );

}
