import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

const searchDebounceMillis = 250;

class ActionAppBarWithCounter extends StatelessWidget
    implements PreferredSizeWidget {
  const ActionAppBarWithCounter({
    super.key,
    this.backgroundColor,
    this.title,
    this.subtitle,
    required this.actions,
    this.actionModeCounter = 0,
    this.onCancelActionMode = _defaultOnCancelActionMode,
    this.actionModeActions,
    this.bottom,
  });

  final Color? backgroundColor;
  final String? title;
  final String? subtitle;
  final List<Widget> actions;
  final int actionModeCounter;
  final VoidCallback onCancelActionMode;
  final List<Widget>? actionModeActions;
  final PreferredSizeWidget? bottom;

  static void _defaultOnCancelActionMode() {}

  @override
  Size get preferredSize => Size.fromHeight(
      bottom != null ? kToolbarHeight + kTextTabBarHeight : kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    final bool isActionMode = actionModeCounter > 0;
    return AppBar(
      actions: actions,
      backgroundColor: backgroundColor,
      bottom: bottom,
      elevation: isActionMode ? 3.0 : 0.0,
      title: isActionMode
          ? Text(actionModeCounter.toString())
          : AppBarTitle(title, subtitle),
      leading: isActionMode ? CloseButton(onPressed: onCancelActionMode) : null,
    );
  }
}

class ActionAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ActionAppBar({
    super.key,
    this.backgroundColor,
    this.titleContent,
    required this.actions,
    this.isActionMode = false,
    this.leading,
    this.onCancelActionMode = _defaultOnCancelActionMode,
    this.actionModeActions,
    this.bottom,
  });

  final Color? backgroundColor;
  final Widget? titleContent;
  final List<Widget> actions;
  final bool isActionMode;
  final Widget? leading;
  final VoidCallback onCancelActionMode;
  final List<Widget>? actionModeActions;
  final PreferredSizeWidget? bottom;

  static void _defaultOnCancelActionMode() {}

  @override
  Size get preferredSize => Size.fromHeight(
      bottom != null ? kToolbarHeight + kTextTabBarHeight : kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: actions,
      automaticallyImplyLeading: true,
      backgroundColor: backgroundColor,
      bottom: bottom,
      elevation: isActionMode ? 3.0 : 0.0,
      title: titleContent,
      leading: leading ??
          (isActionMode ? CloseButton(onPressed: onCancelActionMode) : null),
    );
  }
}

class AppBarTitle extends StatelessWidget {
  const AppBarTitle(this.title, this.subtitle, {super.key});

  final String? title;
  final String? subtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (title != null)
          Text(
            title!,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        // Couldn't see marquee in action in Tachiyomi/Mihon, use Text for now
        if (subtitle != null)
          Text(
            subtitle!,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
      ],
    );
  }
}

class AppBarAction extends StatelessWidget {
  final String title;
  final IconData iconData;
  final Color? iconTint;
  final VoidCallback? onClick;

  const AppBarAction({
    super.key,
    required this.title,
    required this.iconData,
    this.iconTint,
    this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(iconData, semanticLabel: title),
      color: iconTint,
      tooltip: title,
      onPressed: onClick,
    );
  }
}

class AppBarActionData {
  final String title;
  final IconData iconData;
  final Color? iconTint;
  final VoidCallback? onClick;

  const AppBarActionData({
    required this.title,
    required this.iconData,
    this.iconTint,
    this.onClick,
  });
}

class AppBarOverflowAction {
  final String title;
  final VoidCallback onClick;

  AppBarOverflowAction({
    required this.title,
    required this.onClick,
  });
}

class AppBarOverflowActions extends StatelessWidget {
  final List<AppBarOverflowAction> actions;

  const AppBarOverflowActions(this.actions, {super.key});

  @override
  Widget build(BuildContext context) {
    final lang = AppLocalizations.of(context);
    if (actions.isNotEmpty) {
      return MenuAnchor(
        builder: (context, controller, child) => IconButton(
          onPressed: () => controller.isOpen //
              ? controller.close()
              : controller.open(),
          icon: Icon(
            Icons.adaptive.more_outlined,
            semanticLabel: lang.label_more,
          ),
        ),
        menuChildren: actions
            .map((action) => MenuItemButton(
                  onPressed: action.onClick,
                  child: Text(action.title)
                ))
            .toList(),
      );
    }
    return const SizedBox.shrink();
  }
}

/// Set [searchEnabled] to false if you don't want to show search action.
///
/// Uses the normal toolbar if [searchQuery] is null.
///
/// If [placeholderText] is null, action_search_hint is used.
class SearchToolbar extends StatelessWidget implements PreferredSizeWidget {
  const SearchToolbar({
    super.key,
    this.searchQuery,
    required this.onChangeSearchQuery,
    required this.titleContent,
    this.navigateUp,
    this.searchEnabled = true,
    this.placeholderText,
    this.onSearch = _defaultOnSearch,
    //this.onClickCloseSearch = () => onChangeSearchQuery(null);
    required this.onClickCloseSearch,
    required this.actions,
    this.bottom,
  });

  final String? searchQuery;
  final ValueChanged<String?> onChangeSearchQuery;
  final Widget titleContent;
  final VoidCallback? navigateUp;
  final bool searchEnabled;
  final String? placeholderText;
  final ValueChanged<String>? onSearch;
  final VoidCallback? onClickCloseSearch;
  final List<Widget> actions;
  final PreferredSizeWidget? bottom;

  static void _defaultOnSearch(String _) {}

  @override
  Size get preferredSize => Size.fromHeight(
      bottom != null ? kToolbarHeight + kTextTabBarHeight : kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    final lang = AppLocalizations.of(context);
    final Widget titleContentWidget;
    if (searchQuery == null) {
      titleContentWidget = titleContent;
    } else {
      titleContentWidget = TextField(
        decoration: InputDecoration(
          hintStyle: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.normal,
                fontSize: 18.0,
                overflow: TextOverflow.ellipsis,
              ),
          hintText: placeholderText ?? lang.action_search_hint,
        ),
        onChanged: onChangeSearchQuery,
        style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: Theme.of(context).colorScheme.onSurface,
              fontWeight: FontWeight.normal,
              fontSize: 18.0,
            ),
      );
    }
    final Widget searchWidget;
    if (!searchEnabled) {
      searchWidget = const SizedBox.shrink();
    } else if (searchQuery == null) {
      searchWidget = IconButton(
        icon: Icon(
          Icons.search_outlined,
          semanticLabel: lang.action_search,
        ),
        onPressed: () => onChangeSearchQuery(""),
        tooltip: lang.action_search,
      );
    } else if (searchQuery!.isNotEmpty) {
      searchWidget = CloseButton(onPressed: () => onChangeSearchQuery(""));
    } else {
      searchWidget = const SizedBox.shrink();
    }

    return ActionAppBar(
      actions: [searchWidget, ...actions],
      bottom: bottom,
      isActionMode: false,
      leading: searchQuery == null
          ? null
          : BackButton(onPressed: onClickCloseSearch),
      onCancelActionMode: () {},
      titleContent: titleContentWidget,
    );
  }
}
