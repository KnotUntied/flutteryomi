import 'package:dartx/dartx_io.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

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
import 'package:flutteryomi/presentation/screens/empty_screen.dart';

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

class _SearchResult extends ConsumerWidget {
  const _SearchResult({
    super.key,
    required this.searchKey,
    required this.onItemClick,
  });

  final String searchKey;
  final ValueChanged<SearchResultItem> onItemClick;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final lang = AppLocalizations.of(context);
    if (searchKey.isEmpty) return const SizedBox.shrink();

    final isLtr = Directionality.of(context) == TextDirection.ltr;

    final index = _getIndex(context, ref);
    final result = index
        .flatMap(
          (settingsData) => settingsData.contents
              // Only search from enabled prefs and one with valid title
              .where((it) => it.enabled && it.title.isNotBlank)
              // Flatten items contained inside *enabled* PreferenceGroup
              .flatMap<(String?, PreferenceItem)>((p) => switch (p) {
                    PreferenceGroup() => p.enabled
                        ? p.preferenceItems
                            .where((it) => it.enabled && it.title.isNotBlank)
                            .map((it) => (p.title, it))
                        : const [],
                    PreferenceItem() => [(null, p)],
                  })
              // Don't show info preference
              .whereNot((it) => it.$2 is InfoPreference)
              // Filter by search query
              .where((it) {
            final (_, p) = it;
            final inTitle =
                p.title.toLowerCase().contains(searchKey.toLowerCase());
            final inSummary =
                p.subtitle?.toLowerCase().contains(searchKey.toLowerCase()) ??
                    false;
            return inTitle || inSummary;
          }).map((it) {
            final (categoryTitle, p) = it;
            return SearchResultItem(
              route: settingsData.route,
              title: p.title,
              breadcrumbs: _getLocalizedBreadcrumb(
                path: settingsData.title,
                node: categoryTitle,
                isLtr: isLtr,
              ),
              highlightKey: p.title,
            );
          }),
        )
        .take(10) // Just take top 10 result for quicker result
        .toList();

    //TODO: Crossfade
    if (result.isEmpty) {
      return EmptyScreen(message: lang.no_results_found);
    }
    return ListView.builder(
      itemCount: result.length,
      itemBuilder: (context, index) {
        final item = result[index];
        return InkWell(
          onTap: () => onItemClick(item),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 24.0,
              vertical: 14.0,
            ),
            child: Column(
              key: Key('${item.hashCode}'),
              children: [
                Text(
                  item.title,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.normal,
                      ),
                ),
                const SizedBox(
                  height: 16.0,
                ),
                Text(
                  item.breadcrumbs,
                  maxLines: 1,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                      ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}

Iterable<SettingsData> _getIndex(BuildContext context, WidgetRef ref) =>
    _settingScreens.map((screen) => SettingsData(
          title: screen.getTitle(context),
          route: screen.getWidget(),
          contents: screen.getPreferences(context, ref),
        ));

String _getLocalizedBreadcrumb({
  required String path,
  String? node,
  required bool isLtr,
}) =>
    node == null
        ? path
        : isLtr
            ? "$path > $node" // This locale reads left to right.
            : "$node < $path"; // This locale reads right to left.

const _settingScreens = [
  ISettingsAppearanceScreen(),
  ISettingsLibraryScreen(),
  ISettingsReaderScreen(),
  ISettingsDownloadScreen(),
  ISettingsTrackingScreen(),
  ISettingsBrowseScreen(),
  ISettingsDataScreen(),
  ISettingsSecurityScreen(),
  ISettingsAdvancedScreen(),
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
