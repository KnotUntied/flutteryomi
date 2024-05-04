import 'package:dartx/dartx_io.dart' hide IterableWhereNot;
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:flutteryomi/data/track/tracker.dart';
import 'package:flutteryomi/data/track/tracker_manager.dart';
import 'package:flutteryomi/domain/source/service/source_manager.dart';
import 'package:flutteryomi/domain/track/service/track_preferences.dart';
import 'package:flutteryomi/presentation/components/material/constants.dart';
import 'package:flutteryomi/presentation/more/settings/preference.dart';
import 'package:flutteryomi/presentation/more/settings/screen/searchable_settings.dart';
import 'package:flutteryomi/presentation/more/settings/screen/settings_advanced.dart';
import 'package:flutteryomi/presentation/more/settings/screen/settings_appearance.dart';
import 'package:flutteryomi/presentation/more/settings/screen/settings_browse.dart';
import 'package:flutteryomi/presentation/more/settings/screen/settings_data.dart';
import 'package:flutteryomi/presentation/more/settings/screen/settings_download.dart';
import 'package:flutteryomi/presentation/more/settings/screen/settings_library.dart';
import 'package:flutteryomi/presentation/more/settings/screen/settings_reader.dart';
import 'package:flutteryomi/presentation/more/settings/screen/settings_security.dart';
import 'package:flutteryomi/presentation/more/settings/screen/settings_tracking.dart';

part 'settings_search.freezed.dart';

//TODO
class SettingsSearchScreen extends StatefulWidget {
  const SettingsSearchScreen({super.key});

  @override
  State<SettingsSearchScreen> createState() => _SettingsSearchScreenState();
}

class _SettingsSearchScreenState extends State<SettingsSearchScreen> {
  final searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final lang = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          autofocus: true,
          controller: searchController,
          decoration: InputDecoration(
            hintText: lang.action_search_settings,
            hintStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
          ),
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            color: Theme.of(context).colorScheme.onSurface,
          ),
          textInputAction: TextInputAction.search,
        ),
        actions: [
          if (searchController.text.isNotEmpty)
            IconButton(
              icon: Icon(
                Icons.close_outlined,
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
              onPressed: searchController.clear,
            ),
        ],
      ),
      body: _SearchResult(
        searchKey: searchController.text,
        onItemClick: (result) {
          SearchableSettings.highlightKey = result.highlightKey;
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => result.route,
            ),
          );
        },
      ),
    );
  }
}

class _SearchResult extends StatelessWidget {
  const _SearchResult({
    super.key,
    required this.searchKey,
    required this.onItemClick,
  });

  final String searchKey;
  final ValueChanged<SearchResultItem> onItemClick;

  @override
  Widget build(BuildContext context) {
    if (searchKey.isEmpty) return const SizedBox.shrink();

    final isLtr = Directionality.of(context) == TextDirection.ltr;

    //final index = 
    return const Placeholder();
  }
}

//Iterable<SettingsData> _getIndex(BuildContext context, WidgetRef ref) =>
//    _settingScreens.map((screen) => SettingsData(
//          title: screen.getTitle(context),
//          route: screen,
//          contents: screen.getPreferences(context, ref),
//        ));

String _getLocalizedBreadcrumb({
  required String path,
  String? node,
  required bool isLtr,
}) => node == null
    ? path
    : isLtr
        ? "$path > $node" // This locale reads left to right.
        : "$node < $path"; // This locale reads right to left.

const _settingScreens = [
  SettingsAppearanceScreen(),
  //SettingsLibraryScreen(),
  //SettingsReaderScreen(),
  //SettingsDownloadScreen(),
  //SettingsTrackingScreen(),
  //SettingsBrowseScreen(),
  //SettingsDataScreen(),
  //SettingsSecurityScreen(),
  SettingsAdvancedScreen(),
];

@freezed
class SettingsData with _$SettingsData {
  const factory SettingsData({
    required String title,
    required Widget route,
    required List<Preference> contents,
  }) = _SettingsData;
}

@freezed
class SearchResultItem with _$SearchResultItem {
  const factory SearchResultItem({
    required Widget route,
    required String title,
    required String breadcrumbs,
    required String highlightKey,
  }) = _SearchResultItem;
}
