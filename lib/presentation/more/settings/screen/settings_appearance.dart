import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutteryomi/domain/ui/model/tablet_ui_mode.dart';
import 'package:flutteryomi/domain/ui/ui_preferences.dart';
import 'package:flutteryomi/presentation/more/settings/preference.dart';
import 'package:flutteryomi/presentation/more/settings/screen/appearance/app_language.dart';
import 'package:flutteryomi/presentation/more/settings/screen/searchable_settings.dart';
import 'package:flutteryomi/presentation/more/settings/widget/app_theme_mode_preference_widget.dart';
import 'package:flutteryomi/presentation/more/settings/widget/app_theme_preference_widget.dart';
import 'package:flutteryomi/presentation/util/time_utils.dart';

//TODO
class ISettingsAppearanceScreen extends ISearchableSettings {
  @override
  String getTitle(BuildContext context) =>
      AppLocalizations.of(context).pref_category_appearance;

  @override
  Widget getWidget() => const SettingsAppearanceScreen();

  @override
  List<Preference> getPreferences(BuildContext context, WidgetRef ref) {
    final uiPreferences = ref.watch(uiPreferencesProvider);
    return [
      _getThemeGroup(context, uiPreferences),
      _getDisplayGroup(context, uiPreferences),
    ];
  }

  PreferenceGroup _getThemeGroup(
    BuildContext context,
    UiPreferences uiPreferences,
  ) {
    final lang = AppLocalizations.of(context);

    final themeModePref = uiPreferences.themeMode();
    final themeMode = themeModePref.get();

    final appThemePref = uiPreferences.appTheme();
    final appTheme = appThemePref.get();

    final amoledPref = uiPreferences.themeDarkAmoled();
    final amoled = amoledPref.get();

    return PreferenceGroup(
      title: lang.pref_category_theme,
      preferenceItems: [
        // Manual actions
        CustomPreference(
          title: lang.pref_app_theme,
          content: Column(
            children: [
              AppThemeModePreferenceWidget(
                value: themeMode,
                onItemClick: (it) {
                  themeModePref.set(it);
                  //setAppCompatDelegateThemeMode(it);
                },
              ),
              AppThemePreferenceWidget(
                value: appTheme,
                amoled: amoled,
                onItemClick: (it) => appThemePref.set(it),
              )
            ],
          ),
        ),
        SwitchPreference(
          pref: amoledPref,
          title: lang.pref_dark_theme_pure_black,
          enabled: themeMode != ThemeMode.light,
          onValueChanged: (it) async {
            //switch between light/dark/system theme
            //(context as? Activity)?.let { ActivityCompat.recreate(it) };
            return true;
          },
        ),
      ],
    );
  }

  PreferenceGroup _getDisplayGroup(
    BuildContext context,
    UiPreferences uiPreferences,
  ) {
    final lang = AppLocalizations.of(context);

    //final dateFormat = uiPreferences.dateFormat().get();
    //final formattedNow = UiPreferences.dateFormat(dateFormat).format(now);

    return PreferenceGroup(
      title: lang.pref_category_display,
      preferenceItems: [
        TextPreference(
          title: lang.pref_app_language,
          onClick: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AppLanguageScreen()),
          ),
        ),
        //ListPreference(
        //  pref: uiPreferences.tabletUiMode(),
        //  title: lang.pref_tablet_ui_mode,
        //  entries: TabletUiMode
        //      .values
        //      .associateWith((it) => it.title)
        //      .toMap(),
        //  onValueChanged: (_) async {
        //    //context.toast(lang.requires_app_restart);
        //    return true;
        //  },
        //),
        //ListPreference(
        //  pref: uiPreferences.dateFormat(),
        //  title: lang.pref_date_format,
        //  entries: DateFormats
        //      .associateWith((it ) {
        //        final formattedDate = UiPreferences.dateFormat(it).format(now);
        //        return "${it.ifEmpty { lang.label_default }} ($formattedDate)";
        //      })
        //      .toMap(),
        //),
        //SwitchPreference(
        //  pref: uiPreferences.relativeTime(),
        //  title: lang.pref_relative_format,
        //  subtitle: lang.pref_relative_format_summary(
        //    lang.relative_time_today,
        //    formattedNow,
        //  ),
        //),
      ],
    );
  }
}

class SettingsAppearanceScreen extends ConsumerStatefulWidget {
  const SettingsAppearanceScreen({super.key});

  @override
  ConsumerState<SettingsAppearanceScreen> createState() =>
      _SettingsAppearanceScreenState();
}

class _SettingsAppearanceScreenState
    extends ConsumerState<SettingsAppearanceScreen> {
  final now = DateTime.now();

  @override
  Widget build(BuildContext context) {
    final i = ISettingsAppearanceScreen();
    return SearchableSettings(
      title: i.getTitle(context),
      preferences: () => i.getPreferences(context, ref),
    );
  }
}

const _dateFormats = [
  "", // Default
  "MM/dd/yy",
  "dd/MM/yy",
  "yyyy-MM-dd",
  "dd MMM yyyy",
  "MMM dd, yyyy",
];
