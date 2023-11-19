import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
//import 'package:marquee/marquee.dart';

const searchDebounceMillis = 250;

class ActionAppBarWithCounter extends StatelessWidget {
  const ActionAppBarWithCounter({
    super.key,
    this.backgroundColor,
    this.title,
    this.subtitle,
    this.navigateUp,
    this.navigationIcon,
    required this.actions,
    this.actionModeCounter = 0,
    required this.onCancelActionMode,
    this.actionModeActions,
    //this.scrollBehavior,
  });

  final Color? backgroundColor;
  final String? title;
  final String? subtitle;
  final VoidCallback? navigateUp;
  final Icon? navigationIcon;
  final List<Widget> actions;
  final int actionModeCounter;
  final VoidCallback onCancelActionMode;
  final List<Widget>? actionModeActions;
  //final TopAppBarScrollBehavior? scrollBehavior;

  @override
  Widget build(BuildContext context) {
    final lang = AppLocalizations.of(context);
    final bool isActionMode = actionModeCounter > 0;
    return AppBar(
      actions: actions,
      automaticallyImplyLeading: true,
      backgroundColor: backgroundColor,
      elevation: isActionMode ? 3.0 : 0.0,
      title: isActionMode
          ? Text(actionModeCounter.toString())
          : AppBarTitle(title, subtitle),
      leading: isActionMode
          ? IconButton(
              icon: const Icon(Icons.close_outlined),
              tooltip: lang.action_cancel,
              onPressed: onCancelActionMode,
            )
          : null,
    );
  }
}

class ActionAppBar extends StatelessWidget {
  const ActionAppBar({
    super.key,
    this.backgroundColor,
    this.titleContent,
    this.navigateUp,
    this.navigationIcon,
    required this.actions,
    this.isActionMode = false,
    required this.onCancelActionMode,
    this.actionModeActions,
    //this.scrollBehavior,
  });

  final Color? backgroundColor;
  final Widget? titleContent;
  final VoidCallback? navigateUp;
  final Icon? navigationIcon;
  final List<Widget> actions;
  final bool isActionMode;
  final VoidCallback onCancelActionMode;
  final List<Widget>? actionModeActions;
  //final TopAppBarScrollBehavior? scrollBehavior;

  @override
  Widget build(BuildContext context) {
    final lang = AppLocalizations.of(context);
    return AppBar(
      actions: actions,
      automaticallyImplyLeading: true,
      backgroundColor: backgroundColor,
      elevation: isActionMode ? 3.0 : 0.0,
      title: titleContent,
      leading: isActionMode
          ? IconButton(
              icon: const Icon(Icons.close_outlined),
              tooltip: lang.action_cancel,
              onPressed: onCancelActionMode,
            )
          : null,
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
        // Couldn't see marquee in action in Tachiyomi, use Text for now
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
  // enabled/disabled is managed by onPressed being null
  //final bool enabled;

  const AppBarAction({
    super.key,
    required this.title,
    required this.iconData,
    this.iconTint,
    this.onClick,
    //this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        iconData,
        semanticLabel: title,
      ),
      style: IconButton.styleFrom(surfaceTintColor: iconTint),
      tooltip: title,
      onPressed: onClick,
    );
  }
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
    return actions.isNotEmpty
        ? MenuAnchor(
            builder: (BuildContext context, MenuController controller,
                Widget? child) {
              return IconButton(
                onPressed: () {
                  controller.isOpen ? controller.close() : controller.open();
                },
                icon: Icon(
                  Icons.adaptive.more_outlined,
                  semanticLabel: lang.label_more,
                ),
              );
            },
            menuChildren: actions
                .map((action) => MenuItemButton(
                      onPressed: action.onClick,
                      child: Text(action.title),
                    ))
                .toList(),
          )
        : const SizedBox.shrink();
  }
}

class SearchToolbar extends StatelessWidget {
  const SearchToolbar({
    super.key,
    required this.titleContent,
    this.navigateUp,
    this.searchEnabled = true,
    this.searchQuery,
    required this.onChangeSearchQuery,
    this.placeholderText,
    this.onSearch,
    this.onClickCloseSearch,
    required this.actions,
    //this.scrollBehavior,
    //this.visualTransformation: VisualTransformation = VisualTransformation.None,
    //this.interactionSource: MutableInteractionSource = remember { MutableInteractionSource() },
  });

  final Widget titleContent;
  final VoidCallback? navigateUp;
  final bool searchEnabled;
  final String? searchQuery;
  final ValueChanged<String?> onChangeSearchQuery;
  final String? placeholderText;
  final ValueChanged<String>? onSearch;
  final VoidCallback? onClickCloseSearch;
  final List<Widget> actions;
  //final TopAppBarScrollBehavior? scrollBehavior;
  //final VisualTransformation visualTransformation = VisualTransformation.None;
  //final MutableInteractionSource interactionSource = remember { MutableInteractionSource() };

  @override
  Widget build(BuildContext context) {
    final lang = AppLocalizations.of(context);
    Widget titleContentWidget;
    if (searchQuery == null) {
      titleContentWidget = titleContent;
    } else {
      titleContentWidget = TextField(
        decoration: InputDecoration(
          hintStyle: Theme.of(context).textTheme.titleMedium!.copyWith(
                fontWeight: FontWeight.normal,
                fontSize: 18.0,
                overflow: TextOverflow.ellipsis,
              ),
          hintText: placeholderText ?? lang.action_search_hint,
        ),
        onChanged: onChangeSearchQuery,
        style: Theme.of(context).textTheme.titleMedium!.copyWith(
              color: Theme.of(context).colorScheme.onBackground,
              fontWeight: FontWeight.normal,
              fontSize: 18.0,
            ),
      );
    }
    Widget searchWidget;
    if (!searchEnabled) {
      searchWidget = const SizedBox.shrink();
    } else if (searchQuery == null) {
      searchWidget = IconButton(
        icon: Icon(
          Icons.search_outlined,
          semanticLabel: lang.action_search,
        ),
        onPressed: () {
          onChangeSearchQuery("");
        },
        tooltip: lang.action_search,
      );
    } else if (searchQuery!.isNotEmpty) {
      searchWidget = IconButton(
        icon: Icon(
          Icons.close_outlined,
          semanticLabel: lang.action_reset,
        ),
        onPressed: () {
          onChangeSearchQuery("");
        },
        tooltip: lang.action_reset,
      );
    } else {
      searchWidget = const SizedBox.shrink();
    }

    return ActionAppBar(
      actions: [searchWidget, ...actions],
      isActionMode: false,
      navigateUp: searchQuery == null ? navigateUp : onClickCloseSearch,
      navigationIcon: const Icon(Icons.arrow_back_outlined),
      onCancelActionMode: () {},
      titleContent: titleContentWidget,
    );
  }
}