import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:flutteryomi/core/preference/preference.dart';
import 'package:flutteryomi/core/preference/preference_store.dart';
import 'package:flutteryomi/domain/reader/setting/reader_orientation.dart';
import 'package:flutteryomi/domain/reader/setting/reading_mode.dart';
import 'package:flutteryomi/l10n/l10n.dart';

part 'reader_preferences.g.dart';

class ReaderPreferences {
  ReaderPreferences(this.preferenceStore);
  final PreferenceStore preferenceStore;

  // region General

  Preference<bool> pageTransitions() =>
      preferenceStore.getBool("pref_enable_transitions_key", true);

  Preference<bool> flashOnPageChange() =>
      preferenceStore.getBool("pref_reader_flash", false);

  Preference<int> doubleTapAnimSpeed() =>
      preferenceStore.getInt("pref_double_tap_anim_speed", 500);

  Preference<bool> showPageNumber() =>
      preferenceStore.getBool("pref_show_page_number_key", true);

  Preference<bool> showReadingMode() =>
      preferenceStore.getBool("pref_show_reading_mode", true);

  Preference<bool> fullscreen() => preferenceStore.getBool("fullscreen", true);

  Preference<bool> cutoutShort() =>
      preferenceStore.getBool("cutout_short", true);

  Preference<bool> keepScreenOn() =>
      preferenceStore.getBool("pref_keep_screen_on_key", true);

  Preference<int> defaultReadingMode() => preferenceStore.getInt(
        "pref_default_reading_mode_key",
        ReadingMode.rightToLeft.flagValue,
      );

  Preference<int> defaultOrientationType() => preferenceStore.getInt(
        "pref_default_orientation_type_key",
        ReaderOrientation.free.flagValue,
      );

  Preference<bool> webtoonDoubleTapZoomEnabled() =>
      preferenceStore.getBool("pref_enable_double_tap_zoom_webtoon", true);

  Preference<int> imageScaleType() =>
      preferenceStore.getInt("pref_image_scale_type_key", 1);

  Preference<int> zoomStart() =>
      preferenceStore.getInt("pref_zoom_start_key", 1);

  Preference<int> readerTheme() =>
      preferenceStore.getInt("pref_reader_theme_key", 1);

  Preference<bool> alwaysShowChapterTransition() =>
      preferenceStore.getBool("always_show_chapter_transition", true);

  Preference<bool> cropBorders() =>
      preferenceStore.getBool("crop_borders", false);

  Preference<bool> navigateToPan() =>
      preferenceStore.getBool("navigate_pan", true);

  Preference<bool> landscapeZoom() =>
      preferenceStore.getBool("landscape_zoom", true);

  Preference<bool> cropBordersWebtoon() =>
      preferenceStore.getBool("crop_borders_webtoon", false);

  Preference<int> webtoonSidePadding() =>
      preferenceStore.getInt("webtoon_side_padding", webtoonPaddingMin);

  Preference<ReaderHideThreshold> readerHideThreshold() =>
      preferenceStore.getEnum(
        "reader_hide_threshold",
        ReaderHideThreshold.low,
        ReaderHideThreshold.values,
      );

  Preference<bool> folderPerManga() =>
      preferenceStore.getBool("create_folder_per_manga", false);

  Preference<bool> skipRead() => preferenceStore.getBool("skip_read", false);

  Preference<bool> skipFiltered() =>
      preferenceStore.getBool("skip_filtered", true);

  Preference<bool> skipDupe() => preferenceStore.getBool("skip_dupe", false);

  Preference<bool> webtoonDisableZoomOut() =>
      preferenceStore.getBool("webtoon_disable_zoom_out", false);

  // endregion

  // region Split two page spread

  Preference<bool> dualPageSplitPaged() =>
      preferenceStore.getBool("pref_dual_page_split", false);

  Preference<bool> dualPageInvertPaged() =>
      preferenceStore.getBool("pref_dual_page_invert", false);

  Preference<bool> dualPageSplitWebtoon() =>
      preferenceStore.getBool("pref_dual_page_split_webtoon", false);

  Preference<bool> dualPageInvertWebtoon() =>
      preferenceStore.getBool("pref_dual_page_invert_webtoon", false);

  Preference<bool> dualPageRotateToFit() =>
      preferenceStore.getBool("pref_dual_page_rotate", false);

  Preference<bool> dualPageRotateToFitInvert() =>
      preferenceStore.getBool("pref_dual_page_rotate_invert", false);

  Preference<bool> dualPageRotateToFitWebtoon() =>
      preferenceStore.getBool("pref_dual_page_rotate_webtoon", false);

  Preference<bool> dualPageRotateToFitInvertWebtoon() =>
      preferenceStore.getBool("pref_dual_page_rotate_invert_webtoon", false);

  // endregion

  // region Color filter

  Preference<bool> customBrightness() =>
      preferenceStore.getBool("pref_custom_brightness_key", false);

  Preference<int> customBrightnessValue() =>
      preferenceStore.getInt("custom_brightness_value", 0);

  Preference<bool> colorFilter() =>
      preferenceStore.getBool("pref_color_filter_key", false);

  Preference<int> colorFilterValue() =>
      preferenceStore.getInt("color_filter_value", 0);

  Preference<int> colorFilterMode() =>
      preferenceStore.getInt("color_filter_mode", 0);

  Preference<bool> grayscale() =>
      preferenceStore.getBool("pref_grayscale", false);

  Preference<bool> invertedColors() =>
      preferenceStore.getBool("pref_inverted_colors", false);

  // endregion

  // region Controls

  Preference<bool> readWithLongTap() =>
      preferenceStore.getBool("reader_long_tap", true);

  Preference<bool> readWithVolumeKeys() =>
      preferenceStore.getBool("reader_volume_keys", false);

  Preference<bool> readWithVolumeKeysInverted() =>
      preferenceStore.getBool("reader_volume_keys_inverted", false);

  Preference<int> navigationModePager() =>
      preferenceStore.getInt("reader_navigation_mode_pager", 0);

  Preference<int> navigationModeWebtoon() =>
      preferenceStore.getInt("reader_navigation_mode_webtoon", 0);

  Preference<TappingInvertMode> pagerNavInverted() => preferenceStore.getEnum(
        "reader_tapping_inverted",
        TappingInvertMode.none,
        TappingInvertMode.values,
      );

  Preference<TappingInvertMode> webtoonNavInverted() => preferenceStore.getEnum(
        "reader_tapping_inverted_webtoon",
        TappingInvertMode.none,
        TappingInvertMode.values,
      );

  Preference<bool> showNavigationOverlayNewUser() =>
      preferenceStore.getBool("reader_navigation_overlay_new_user", true);

  Preference<bool> showNavigationOverlayOnStart() =>
      preferenceStore.getBool("reader_navigation_overlay_on_start", false);

  // endregion

  static const webtoonPaddingMin = 0;
  static const webtoonPaddingMax = 25;
}

enum TappingInvertMode {
  none(),
  horizontal(shouldInvertHorizontal: true),
  vertical(shouldInvertVertical: true),
  both(shouldInvertHorizontal: true, shouldInvertVertical: true);

  const TappingInvertMode({
    this.shouldInvertHorizontal = false,
    this.shouldInvertVertical = false,
  });
  final bool shouldInvertHorizontal;
  final bool shouldInvertVertical;

  String title(Ref ref) {
    final lang = ref.read(appLocalizationsProvider);
    return switch (this) {
      TappingInvertMode.none => lang.tapping_inverted_none,
      TappingInvertMode.horizontal => lang.tapping_inverted_horizontal,
      TappingInvertMode.vertical => lang.tapping_inverted_vertical,
      TappingInvertMode.both => lang.tapping_inverted_both,
    };
  }
}

enum ReaderHideThreshold {
  highest(5),
  high(13),
  low(31),
  lowest(47);

  const ReaderHideThreshold(this.threshold);
  final int threshold;
}

@riverpod
ReaderPreferences readerPreferences(ReaderPreferencesRef ref) =>
    ReaderPreferences(ref.watch(preferenceStoreProvider));
