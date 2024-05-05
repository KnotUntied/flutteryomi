import 'package:dartx/dartx_io.dart' hide IterableWhereNot;
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutteryomi/domain/reader/setting/reader_orientation.dart';
import 'package:flutteryomi/domain/reader/setting/reader_preferences.dart';
import 'package:flutteryomi/domain/reader/setting/reading_mode.dart';
import 'package:flutteryomi/presentation/more/settings/preference.dart';
import 'package:flutteryomi/presentation/more/settings/screen/searchable_settings.dart';

//TODO
class ISettingsReaderScreen extends ISearchableSettings {
  const ISettingsReaderScreen();
  @override
  String getTitle(BuildContext context) =>
      AppLocalizations.of(context).pref_category_reader;

  @override
  Widget getWidget() => const SettingsReaderScreen();

  @override
  List<Preference> getPreferences(BuildContext context, WidgetRef ref) {
    final lang = AppLocalizations.of(context);
    final readerPref = ref.watch(readerPreferencesProvider);
    return [
      ListPreference(
        pref: readerPref.defaultReadingMode(),
        title: lang.pref_viewer_type,
        entries: ReadingMode
            .values
            .drop(1)
            .associate((it) => MapEntry(it.flagValue, it.string(context))),
      ),
      ListPreference(
        pref: readerPref.doubleTapAnimSpeed(),
        title: lang.pref_double_tap_anim_speed,
        entries: {
          1: lang.double_tap_anim_speed_0,
          500: lang.double_tap_anim_speed_normal,
          250: lang.double_tap_anim_speed_fast,
        },
      ),
      SwitchPreference(
        pref: readerPref.showReadingMode(),
        title: lang.pref_show_reading_mode,
        subtitle: lang.pref_show_reading_mode_summary,
      ),
      SwitchPreference(
        pref: readerPref.showNavigationOverlayOnStart(),
        title: lang.pref_show_navigation_mode,
        subtitle: lang.pref_show_navigation_mode_summary,
      ),
      SwitchPreference(
        pref: readerPref.pageTransitions(),
        title: lang.pref_page_transitions,
      ),
      SwitchPreference(
        pref: readerPref.flashOnPageChange(),
        title: lang.pref_flash_page,
        subtitle: lang.pref_flash_page_summ,
      ),
      _getDisplayGroup(context, readerPref),
      _getReadingGroup(context, readerPref),
      _getPagedGroup(context, readerPref),
      _getWebtoonGroup(context, readerPref),
      _getNavigationGroup(context, readerPref),
      _getActionsGroup(context, readerPref),
    ];
  }

  PreferenceGroup _getDisplayGroup(
    BuildContext context,
    ReaderPreferences readerPreferences,
  ) {
    final lang = AppLocalizations.of(context);
    final fullscreenPref = readerPreferences.fullscreen();
    final fullscreen = fullscreenPref.get();

    return PreferenceGroup(
      title: lang.pref_category_display,
      preferenceItems: [
        ListPreference(
          pref: readerPreferences.defaultOrientationType(),
          title: lang.pref_rotation_type,
          entries: ReaderOrientation
              .values
              .drop(1)
              .associate((it) => MapEntry(it.flagValue, it.string(context))),
        ),
        ListPreference(
          pref: readerPreferences.readerTheme(),
          title: lang.pref_reader_theme,
          entries: {
            1: lang.black_background,
            2: lang.gray_background,
            0: lang.white_background,
            3: lang.automatic_background,
          },
        ),
        SwitchPreference(
          pref: fullscreenPref,
          title: lang.pref_fullscreen,
        ),
        //SwitchPreference(
        //  pref: readerPreferences.cutoutShort(),
        //  title: lang.pref_cutout_short,
        //  enabled: fullscreen &&
        //      Build.VERSION.SDK_INT >= Build.VERSION_CODES.P &&
        //      LocalView.current.rootWindowInsets?.displayCutout != null, // has cutout
        //),
        SwitchPreference(
          pref: readerPreferences.keepScreenOn(),
          title: lang.pref_keep_screen_on,
        ),
        SwitchPreference(
          pref: readerPreferences.showPageNumber(),
          title: lang.pref_show_page_number,
        ),
      ],
    );
  }

  PreferenceGroup _getReadingGroup(
    BuildContext context,
    ReaderPreferences readerPreferences,
  ) {
    final lang = AppLocalizations.of(context);
    return PreferenceGroup(
      title: lang.pref_category_reading,
      preferenceItems: [
        SwitchPreference(
          pref: readerPreferences.skipRead(),
          title: lang.pref_skip_read_chapters,
        ),
        SwitchPreference(
          pref: readerPreferences.skipFiltered(),
          title: lang.pref_skip_filtered_chapters,
        ),
        SwitchPreference(
          pref: readerPreferences.skipDupe(),
          title: lang.pref_skip_dupe_chapters,
        ),
        SwitchPreference(
          pref: readerPreferences.alwaysShowChapterTransition(),
          title: lang.pref_always_show_chapter_transition,
        ),
      ],
    );
  }

  PreferenceGroup _getPagedGroup(
    BuildContext context,
    ReaderPreferences readerPreferences,
  ) {
    final lang = AppLocalizations.of(context);
    final navModePref = readerPreferences.navigationModePager();
    final imageScaleTypePref = readerPreferences.imageScaleType();
    final dualPageSplitPref = readerPreferences.dualPageSplitPaged();
    final rotateToFitPref = readerPreferences.dualPageRotateToFit();

    final navMode = navModePref.get();
    final imageScaleType = imageScaleTypePref.get();
    final dualPageSplit = dualPageSplitPref.get();
    final rotateToFit = rotateToFitPref.get();
    return PreferenceGroup(
      title: lang.pager_viewer,
      preferenceItems: [
        //ListPreference(
        //  pref: navModePref,
        //  title: lang.pref_viewer_nav,
        //  entries: ReaderPreferences.tapZones
        //      .mapIndexed((index, it) => MapEntry(index, it))
        //      .toMap(),
        //),
        ListPreference(
          pref: readerPreferences.pagerNavInverted(),
          title: lang.pref_read_with_tapping_inverted,
          entries: TappingInvertMode
              .values
              .associateWith((it) => it.title(context)),
          enabled: navMode != 5,
        ),
        //ListPreference(
        //  pref: imageScaleTypePref,
        //  title: lang.pref_image_scale_type,
        //  entries: ImageScaleType
        //      .mapIndexed((index, it) => MapEntry(index + 1, it))
        //      .toMap(),
        //),
        //ListPreference(
        //  pref: readerPreferences.zoomStart(),
        //  title: lang.pref_zoom_start,
        //  entries: ZoomStart
        //      .mapIndexed((index, it) => MapEntry(index + 1, it))
        //      .toMap(),
        //),
        SwitchPreference(
          pref: readerPreferences.cropBorders(),
          title: lang.pref_crop_borders,
        ),
        SwitchPreference(
          pref: readerPreferences.landscapeZoom(),
          title: lang.pref_landscape_zoom,
          enabled: imageScaleType == 1,
        ),
        SwitchPreference(
          pref: readerPreferences.navigateToPan(),
          title: lang.pref_navigate_pan,
          enabled: navMode != 5,
        ),
        SwitchPreference(
          pref: dualPageSplitPref,
          title: lang.pref_dual_page_split,
          onValueChanged: (_) async {
            rotateToFitPref.set(false);
            return true;
          },
        ),
        SwitchPreference(
          pref: readerPreferences.dualPageInvertPaged(),
          title: lang.pref_dual_page_invert,
          subtitle: lang.pref_dual_page_invert_summary,
          enabled: dualPageSplit,
        ),
        SwitchPreference(
          pref: rotateToFitPref,
          title: lang.pref_page_rotate,
          onValueChanged: (_) async {
            dualPageSplitPref.set(false);
            return true;
          },
        ),
        SwitchPreference(
          pref: readerPreferences.dualPageRotateToFitInvert(),
          title: lang.pref_page_rotate_invert,
          enabled: rotateToFit,
        ),
      ],
    );
  }

  PreferenceGroup _getWebtoonGroup(
    BuildContext context,
    ReaderPreferences readerPreferences,
  ) {
    final lang = AppLocalizations.of(context);

    //final numberFormat = remember { NumberFormat.getPercentInstance() }

    final navModePref = readerPreferences.navigationModeWebtoon();
    final dualPageSplitPref = readerPreferences.dualPageSplitWebtoon();
    final rotateToFitPref = readerPreferences.dualPageRotateToFitWebtoon();
    final webtoonSidePaddingPref = readerPreferences.webtoonSidePadding();

    final navMode = navModePref.get();
    final dualPageSplit = dualPageSplitPref.get();
    final rotateToFit = rotateToFitPref.get();
    final webtoonSidePadding = webtoonSidePaddingPref.get();
    return PreferenceGroup(
      title: lang.webtoon_viewer,
      preferenceItems: [
        //ListPreference(
        //  pref: navModePref,
        //  title: lang.pref_viewer_nav,
        //  entries: TapZones
        //      .mapIndexed((index, it) => MapEntry(index, it))
        //      .toMap(),
        //),
        ListPreference(
          pref: readerPreferences.webtoonNavInverted(),
          title: lang.pref_read_with_tapping_inverted,
          entries: TappingInvertMode
              .values
              .associateWith((it) => it.title(context)),
          enabled: navMode != 5,
        ),
        //SliderPreference(
        //  value: webtoonSidePadding,
        //  title: lang.pref_webtoon_side_padding,
        //  subtitle: numberFormat.format(webtoonSidePadding / 100.0),
        //  min: ReaderPreferences.webtoonPaddingMin,
        //  max: ReaderPreferences.webtoonPaddingMax,
        //  onValueChanged: (it) async {
        //    webtoonSidePaddingPref.set(it);
        //    return true;
        //  },
        //),
        ListPreference(
          pref: readerPreferences.readerHideThreshold(),
          title: lang.pref_hide_threshold,
          entries: {
            ReaderHideThreshold.highest: lang.pref_highest,
            ReaderHideThreshold.high: lang.pref_high,
            ReaderHideThreshold.low: lang.pref_low,
            ReaderHideThreshold.lowest: lang.pref_lowest,
          },
        ),
        SwitchPreference(
          pref: readerPreferences.cropBordersWebtoon(),
          title: lang.pref_crop_borders,
        ),
        SwitchPreference(
          pref: dualPageSplitPref,
          title: lang.pref_dual_page_split,
          onValueChanged: (_) async {
            rotateToFitPref.set(false);
            return true;
          },
        ),
        SwitchPreference(
          pref: readerPreferences.dualPageInvertWebtoon(),
          title: lang.pref_dual_page_invert,
          subtitle: lang.pref_dual_page_invert_summary,
          enabled: dualPageSplit,
        ),
        SwitchPreference(
          pref: rotateToFitPref,
          title: lang.pref_page_rotate,
          onValueChanged: (_) async {
            dualPageSplitPref.set(false);
            return true;
          },
        ),
        SwitchPreference(
          pref: readerPreferences.dualPageRotateToFitInvertWebtoon(),
          title: lang.pref_page_rotate_invert,
          enabled: rotateToFit,
        ),
        SwitchPreference(
          pref: readerPreferences.webtoonDoubleTapZoomEnabled(),
          title: lang.pref_double_tap_zoom,
        ),
        //SwitchPreference(
        //  pref: readerPreferences.webtoonDisableZoomOut(),
        //  title: lang.pref_webtoon_disable_zoom_out,
        //),
      ],
    );
  }

  PreferenceGroup _getNavigationGroup(
    BuildContext context,
    ReaderPreferences readerPreferences,
  ) {
    final lang = AppLocalizations.of(context);

    final readWithVolumeKeysPref = readerPreferences.readWithVolumeKeys();
    final readWithVolumeKeys = readWithVolumeKeysPref.get();
    return PreferenceGroup(
      title: lang.pref_reader_navigation,
      preferenceItems: [
        SwitchPreference(
          pref: readWithVolumeKeysPref,
          title: lang.pref_read_with_volume_keys,
        ),
        SwitchPreference(
          pref: readerPreferences.readWithVolumeKeysInverted(),
          title: lang.pref_read_with_volume_keys_inverted,
          enabled: readWithVolumeKeys,
        ),
      ],
    );
  }

  PreferenceGroup _getActionsGroup(
    BuildContext context,
    ReaderPreferences readerPreferences,
  ) {
    final lang = AppLocalizations.of(context);
    return PreferenceGroup(
      title: lang.pref_reader_navigation,
      preferenceItems: [
        SwitchPreference(
          pref: readerPreferences.readWithLongTap(),
          title: lang.pref_read_with_long_tap,
        ),
        SwitchPreference(
          pref: readerPreferences.folderPerManga(),
          title: lang.pref_create_folder_per_manga,
          subtitle: lang.pref_create_folder_per_manga_summary,
        ),
      ],
    );
  }
}

class SettingsReaderScreen extends ConsumerWidget {
  const SettingsReaderScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const i = ISettingsReaderScreen();
    return SearchableSettings(
      title: i.getTitle(context),
      preferences: () => i.getPreferences(context, ref),
    );
  }
}
