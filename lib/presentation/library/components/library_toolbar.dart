import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:flutteryomi/presentation/components/app_bar.dart';
import 'package:flutteryomi/presentation/components/pill.dart';

class LibraryToolbar extends StatelessWidget implements PreferredSizeWidget {
  const LibraryToolbar({
    super.key,
    required this.hasActiveFilters,
    required this.selectedCount,
    required this.title,
    required this.onClickUnselectAll,
    required this.onClickSelectAll,
    required this.onClickInvertSelection,
    required this.onClickFilter,
    required this.onClickRefresh,
    required this.onClickGlobalUpdate,
    required this.onClickOpenRandomManga,
    this.searchQuery,
    required this.onSearchQueryChange,
    this.bottom,
  });

  final bool hasActiveFilters;
  final int selectedCount;
  final LibraryToolbarTitle title;
  final VoidCallback onClickUnselectAll;
  final VoidCallback onClickSelectAll;
  final VoidCallback onClickInvertSelection;
  final VoidCallback onClickFilter;
  final VoidCallback onClickRefresh;
  final VoidCallback onClickGlobalUpdate;
  final VoidCallback onClickOpenRandomManga;
  final String? searchQuery;
  final ValueChanged<String?> onSearchQueryChange;
  final PreferredSizeWidget? bottom;

  @override
  Size get preferredSize => Size.fromHeight(
      bottom != null ? kToolbarHeight + kTextTabBarHeight : kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return selectedCount > 0
        ? LibrarySelectionToolbar(
            selectedCount: selectedCount,
            onClickUnselectAll: onClickUnselectAll,
            onClickSelectAll: onClickSelectAll,
            onClickInvertSelection: onClickInvertSelection,
            bottom: bottom,
          )
        : LibraryRegularToolbar(
            title: title,
            hasFilters: hasActiveFilters,
            searchQuery: searchQuery,
            onSearchQueryChange: onSearchQueryChange,
            onClickFilter: onClickFilter,
            onClickRefresh: onClickRefresh,
            onClickGlobalUpdate: onClickGlobalUpdate,
            onClickOpenRandomManga: onClickOpenRandomManga,
            bottom: bottom,
          );
  }
}

class LibraryRegularToolbar extends StatelessWidget {
  const LibraryRegularToolbar({
    super.key,
    required this.title,
    required this.hasFilters,
    this.searchQuery,
    required this.onSearchQueryChange,
    required this.onClickFilter,
    required this.onClickRefresh,
    required this.onClickGlobalUpdate,
    required this.onClickOpenRandomManga,
    this.bottom,
  });

  final LibraryToolbarTitle title;
  final bool hasFilters;
  final String? searchQuery;
  final ValueChanged<String?> onSearchQueryChange;
  final VoidCallback onClickFilter;
  final VoidCallback onClickRefresh;
  final VoidCallback onClickGlobalUpdate;
  final VoidCallback onClickOpenRandomManga;
  final PreferredSizeWidget? bottom;

  @override
  Widget build(BuildContext context) {
    final lang = AppLocalizations.of(context);
    final pillOpacity =
        MediaQuery.platformBrightnessOf(context) == Brightness.dark
            ? 0.12
            : 0.08;
    final filterTint =
        hasFilters ? Theme.of(context).colorScheme.primary : null;
    return SearchToolbar(
      titleContent: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Text(
              title.text,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          if (title.numberOfManga != null)
            Pill(
              color: Theme.of(context)
                  .colorScheme
                  .onSurface
                  .withOpacity(pillOpacity),
              text: title.numberOfManga.toString(),
              fontSize: 14.0,
            ),
        ],
      ),
      searchQuery: searchQuery,
      onChangeSearchQuery: onSearchQueryChange,
      onClickCloseSearch: () => onSearchQueryChange(null),
      actions: [
        AppBarAction(
          iconData: Icons.filter_list,
          iconTint: filterTint,
          onClick: onClickFilter,
          title: lang.action_filter,
        ),
        AppBarOverflowActions([
          AppBarOverflowAction(
            title: lang.action_update_library,
            onClick: onClickGlobalUpdate,
          ),
          AppBarOverflowAction(
            title: lang.action_update_category,
            onClick: onClickRefresh,
          ),
          AppBarOverflowAction(
            title: lang.action_open_random_manga,
            onClick: onClickOpenRandomManga,
          ),
        ]),
      ],
      bottom: bottom,
    );
  }
}

class LibrarySelectionToolbar extends StatelessWidget {
  const LibrarySelectionToolbar({
    super.key,
    required this.selectedCount,
    required this.onClickUnselectAll,
    required this.onClickSelectAll,
    required this.onClickInvertSelection,
    this.bottom,
  });

  final int selectedCount;
  final VoidCallback onClickUnselectAll;
  final VoidCallback onClickSelectAll;
  final VoidCallback onClickInvertSelection;
  final PreferredSizeWidget? bottom;

  @override
  Widget build(BuildContext context) {
    final lang = AppLocalizations.of(context);
    return ActionAppBar(
      titleContent: Text(selectedCount.toString()),
      actions: [
        AppBarAction(
          iconData: Icons.select_all_outlined,
          onClick: onClickSelectAll,
          title: lang.action_select_all,
        ),
        AppBarAction(
          iconData: Icons.flip_to_back_outlined,
          onClick: onClickInvertSelection,
          title: lang.action_select_inverse,
        ),
      ],
      isActionMode: true,
      onCancelActionMode: onClickUnselectAll,
      bottom: bottom,
    );
  }
}

class LibraryToolbarTitle {
  const LibraryToolbarTitle(this.text, [this.numberOfManga]);
  final String text;
  final int? numberOfManga;
}
