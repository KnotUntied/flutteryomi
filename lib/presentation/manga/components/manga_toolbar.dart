import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:flutteryomi/presentation/components/app_bar.dart';
import 'package:flutteryomi/presentation/components/download_dropdown_menu.dart';
import 'package:flutteryomi/presentation/manga/manga_screen_constants.dart';
import 'package:flutteryomi/presentation/theme/color_scheme.dart';

class MangaToolbar extends StatelessWidget {
  const MangaToolbar({
    super.key,
    required this.title,
    required this.titleAlphaProvider,
    required this.hasFilters,
    required this.onBackClicked,
    required this.onClickFilter,
    this.onClickShare,
    this.onClickDownload,
    this.onClickEditCategory,
    required this.onClickRefresh,
    this.onClickMigrate,

    // For action mode
    required this.actionModeCounter,
    required this.onSelectAll,
    required this.onInvertSelection,
    required this.backgroundAlphaProvider,
  });

  final String title;
  final double Function() titleAlphaProvider;
  final bool hasFilters;
  final VoidCallback onBackClicked;
  final VoidCallback onClickFilter;
  final VoidCallback? onClickShare;
  final ValueChanged<DownloadAction>? onClickDownload;
  final VoidCallback? onClickEditCategory;
  final VoidCallback onClickRefresh;
  final VoidCallback? onClickMigrate;

  final int actionModeCounter;
  final VoidCallback onSelectAll;
  final VoidCallback onInvertSelection;

  final double Function() backgroundAlphaProvider;

  @override
  Widget build(BuildContext context) {
    final lang = AppLocalizations.of(context);
    final isActionMode = actionModeCounter > 0;
    final filterTint = hasFilters ? active(context) : null;
    return AppBar(
      title: Opacity(
        opacity: isActionMode ? 1.0 : titleAlphaProvider(),
        child: Text(
          isActionMode ? actionModeCounter.toString() : title,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ),
      actions: [
        if (isActionMode) ...[
          AppBarAction(
            title: lang.action_select_all,
            iconData: Icons.select_all_outlined,
            onClick: onSelectAll,
          ),
          AppBarAction(
            title: lang.action_select_inverse,
            iconData: Icons.flip_to_back_outlined,
            onClick: onInvertSelection,
          ),
        ] else ...[
          if (onClickDownload != null)
            DownloadDropdownMenu(
              onDownloadClicked: onClickDownload!,
              title: lang.manga_download,
            ),
          AppBarAction(
            title: lang.action_filter,
            iconData: Icons.filter_list_outlined,
            iconTint: filterTint,
            onClick: onClickFilter,
          ),
          AppBarOverflowActions([
            AppBarOverflowAction(
              title: lang.action_webview_refresh,
              onClick: onClickRefresh,
            ),
            if (onClickEditCategory != null)
              AppBarOverflowAction(
                title: lang.action_edit_categories,
                onClick: onClickEditCategory!,
              ),
            if (onClickMigrate != null)
              AppBarOverflowAction(
                title: lang.action_migrate,
                onClick: onClickMigrate!,
              ),
            if (onClickShare != null)
              AppBarOverflowAction(
                title: lang.action_share,
                onClick: onClickShare!,
              ),
          ])
        ],
      ],
      backgroundColor: Theme.of(context).colorScheme.surfaceTint.withOpacity(
            isActionMode ? 1.0 : backgroundAlphaProvider(),
          ),
    );
  }
}
