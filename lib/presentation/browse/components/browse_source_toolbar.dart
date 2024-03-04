import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:flutteryomi/domain/library/model/library_display_mode.dart';
import 'package:flutteryomi/presentation/components/app_bar.dart';
import 'package:flutteryomi/presentation/components/dropdown_menu.dart';
import 'package:flutteryomi/source/api/configurable_source.dart';
import 'package:flutteryomi/source/api/source.dart';
import 'package:flutteryomi/source/local/local_source.dart';

class BrowseSourceToolbar extends StatelessWidget {
  const BrowseSourceToolbar({
    super.key,
    this.searchQuery,
    required this.onSearchQueryChange,
    this.source,
    required this.displayMode,
    required this.onDisplayModeChange,
    required this.navigateUp,
    required this.onWebViewClick,
    required this.onHelpClick,
    required this.onSettingsClick,
    required this.onSearch,
    this.bottom,
  });

  final String? searchQuery;
  final ValueChanged<String?> onSearchQueryChange;
  final Source? source;
  final LibraryDisplayMode displayMode;
  final ValueChanged<LibraryDisplayMode> onDisplayModeChange;
  final VoidCallback navigateUp;
  final VoidCallback onWebViewClick;
  final VoidCallback onHelpClick;
  final VoidCallback onSettingsClick;
  final ValueChanged<String> onSearch;
  final PreferredSizeWidget? bottom;

  @override
  Widget build(BuildContext context) {
    final lang = AppLocalizations.of(context);
    final title = source?.name;
    final isLocalSource = source is LocalSource;
    final isConfigurableSource = source is ConfigurableSource;
    return SearchToolbar(
      navigateUp: navigateUp,
      titleContent: AppBarTitle(title, null),
      searchQuery: searchQuery,
      onChangeSearchQuery: onSearchQueryChange,
      onSearch: onSearch,
      onClickCloseSearch: navigateUp,
      actions: [
        MenuAnchor(
          builder: (context, controller, child) {
            return AppBarAction(
              iconData: displayMode == ListMode()
                  ? Icons.view_list
                  : Icons.view_module,
              onClick: () => controller.isOpen //
                  ? controller.close()
                  : controller.open(),
              title: lang.action_display_mode,
            );
          },
          menuChildren: [
            RadioMenuItem(
              text: Text(lang.action_display_comfortable_grid),
              isChecked: displayMode == ComfortableGrid(),
              onClick: () => onDisplayModeChange(ComfortableGrid()),
            ),
            RadioMenuItem(
              text: Text(lang.action_display_grid),
              isChecked: displayMode == CompactGrid(),
              onClick: () => onDisplayModeChange(CompactGrid()),
            ),
            RadioMenuItem(
              text: Text(lang.action_display_list),
              isChecked: displayMode == ListMode(),
              onClick: () => onDisplayModeChange(ListMode()),
            ),
          ],
        ),
        AppBarOverflowActions([
          if (isLocalSource)
            AppBarOverflowAction(
              title: lang.label_help,
              onClick: onHelpClick,
            )
          else
            AppBarOverflowAction(
              title: lang.action_open_in_web_view,
              onClick: onWebViewClick,
            ),
          if (isConfigurableSource)
            AppBarOverflowAction(
              title: lang.action_settings,
              onClick: onSettingsClick,
            ),
        ]),
      ],
      bottom: bottom,
    );
  }
}
