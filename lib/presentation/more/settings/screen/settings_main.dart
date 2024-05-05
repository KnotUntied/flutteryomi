import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:flutteryomi/presentation/components/app_bar.dart';
import 'package:flutteryomi/presentation/more/settings/screen/about/about.dart';
import 'package:flutteryomi/presentation/more/settings/screen/settings_advanced.dart';
import 'package:flutteryomi/presentation/more/settings/screen/settings_appearance.dart';
import 'package:flutteryomi/presentation/more/settings/screen/settings_browse.dart';
import 'package:flutteryomi/presentation/more/settings/screen/settings_data.dart';
import 'package:flutteryomi/presentation/more/settings/screen/settings_download.dart';
import 'package:flutteryomi/presentation/more/settings/screen/settings_library.dart';
import 'package:flutteryomi/presentation/more/settings/screen/settings_reader.dart';
import 'package:flutteryomi/presentation/more/settings/screen/settings_search.dart';
import 'package:flutteryomi/presentation/more/settings/screen/settings_security.dart';
import 'package:flutteryomi/presentation/more/settings/screen/settings_tracking.dart';
import 'package:flutteryomi/presentation/more/settings/widget/text_preference_widget.dart';

part 'settings_main.freezed.dart';

//TODO: Support for two-panel layout for larger screens
class SettingsMainScreen extends StatefulWidget {
  const SettingsMainScreen({super.key});

  @override
  State<SettingsMainScreen> createState() => _SettingsMainScreenState();
}

class _SettingsMainScreenState extends State<SettingsMainScreen> {
  //int? indexSelected;
  @override
  Widget build(BuildContext context) {
    final lang = AppLocalizations.of(context);
    //final containerColor = twoPane ? _getPalerSurface(context) : Theme.of(context).colorScheme.surface;
    final items = [
      SettingsMainScreenItem(
        title: lang.pref_category_appearance,
        subtitle: lang.pref_appearance_summary,
        iconData: Icons.palette_outlined,
        screen: const SettingsAppearanceScreen(),
      ),
      SettingsMainScreenItem(
        title: lang.pref_category_library,
        subtitle: lang.pref_library_summary,
        iconData: Icons.collections_bookmark_outlined,
        screen: const SettingsLibraryScreen(),
      ),
      SettingsMainScreenItem(
        title: lang.pref_category_reader,
        subtitle: lang.pref_reader_summary,
        iconData: Icons.chrome_reader_mode_outlined,
        screen: const SettingsReaderScreen(),
      ),
      SettingsMainScreenItem(
        title: lang.pref_category_downloads,
        subtitle: lang.pref_downloads_summary,
        iconData: Icons.get_app_outlined,
        screen: const SettingsDownloadScreen(),
      ),
      SettingsMainScreenItem(
        title: lang.pref_category_tracking,
        subtitle: lang.pref_tracking_summary,
        iconData: Icons.sync_outlined,
        screen: const SettingsTrackingScreen(),
      ),
      SettingsMainScreenItem(
        title: lang.browse,
        subtitle: lang.pref_browse_summary,
        iconData: Icons.explore_outlined,
        screen: const SettingsBrowseScreen(),
      ),
      SettingsMainScreenItem(
        title: lang.label_data_storage,
        subtitle: lang.pref_backup_summary,
        iconData: Icons.storage_outlined,
        screen: const SettingsDataScreen(),
      ),
      SettingsMainScreenItem(
        title: lang.pref_category_security,
        subtitle: lang.pref_security_summary,
        iconData: Icons.security_outlined,
        screen: const SettingsSecurityScreen(),
      ),
      SettingsMainScreenItem(
        title: lang.pref_category_advanced,
        subtitle: lang.pref_advanced_summary,
        iconData: Icons.code_outlined,
        screen: const SettingsAdvancedScreen(),
      ),
      SettingsMainScreenItem(
        title: lang.pref_category_about,
        subtitle:
            "${lang.app_name} ${AboutScreen.getVersionName(withBuildDate: false)}",
        iconData: Icons.info_outlined,
        screen: const AboutScreen(),
      ),
    ];

    final containerColor = Theme.of(context).colorScheme.surface;
    return Scaffold(
      appBar: AppBar(
        title: Text(lang.label_settings),
        actions: [
          AppBarAction(
            title: lang.action_search,
            iconData: Icons.search_outlined,
            onClick: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SettingsSearchScreen(),
                ),
              );
            },
          ),
        ],
      ),
      body: ListView(
        children: items.map((item) {
          return TextPreferenceWidget(
            key: Key('${item.hashCode}'),
            title: item.title,
            subtitle: item.subtitle,
            icon: item.iconData,
            onPreferenceClick: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => item.screen,
                ),
              );
            },
          );
        }).toList(),
      ),
    );
  }
}

@freezed
class SettingsMainScreenItem with _$SettingsMainScreenItem {
  const factory SettingsMainScreenItem({
    required String title,
    String? subtitle,
    required IconData iconData,
    required Widget screen,
  }) = _SettingsMainScreenItem;
}
