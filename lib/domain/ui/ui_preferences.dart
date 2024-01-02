import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:flutteryomi/core/preference/preference.dart';
import 'package:flutteryomi/core/preference/preference_store.dart';
import 'package:flutteryomi/domain/ui/model/app_theme.dart';
import 'package:flutteryomi/domain/ui/model/tablet_ui_mode.dart';

part 'ui_preferences.g.dart';

class UiPreferences {
  UiPreferences(this.preferenceStore);
  final PreferenceStore preferenceStore;

  Preference<ThemeMode> themeMode() => preferenceStore.getEnum(
      "pref_theme_mode_key", ThemeMode.system, ThemeMode.values);

  Preference<AppTheme> appTheme() => preferenceStore.getEnum(
      "pref_app_theme", AppTheme.default_, AppTheme.values);

  Preference<bool> themeDarkAmoled() =>
      preferenceStore.getBool("pref_theme_dark_amoled_key", false);

  Preference<bool> relativeTime() =>
      preferenceStore.getBool("relative_time", true);

  Preference<String> dateFormat() =>
      preferenceStore.getString("app_date_format", '');

  Preference<TabletUiMode> tabletUiMode() => preferenceStore.getEnum(
        "tablet_ui_mode",
        TabletUiMode.automatic,
        TabletUiMode.values
      );

  static DateFormat dateFormatFromString(String format) => switch (format) {
        '' => DateFormat.yMd(),
        _ => DateFormat(format),
      };
}

@riverpod
UiPreferences uiPreferences(UiPreferencesRef ref) =>
    UiPreferences(ref.watch(preferenceStoreProvider));
