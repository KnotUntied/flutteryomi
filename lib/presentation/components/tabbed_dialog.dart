import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

abstract class TabbedDialogPaddings {
  static const horizontal = 24.0;
  static const vertical = 8.0;
}

class TabbedDialog extends StatelessWidget {
  const TabbedDialog({
    super.key,
    required this.tabTitles,
    this.tabOverflowMenuContent,
    required this.content,
  });

  final List<String> tabTitles;
  final List<Widget>? tabOverflowMenuContent;
  final List<Widget> content;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabTitles.length,
      child: DraggableScrollableSheet(
        initialChildSize: 0.5,
        maxChildSize: 1,
        minChildSize: 0.5,
        builder: (context, scrollController) {
          return Expanded(
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: TabBar(
                        tabAlignment: TabAlignment.fill,
                        tabs: tabTitles.map((it) => Tab(text: it)).toList(),
                      ),
                    ),
                    if (tabOverflowMenuContent != null)
                      _MoreMenu(tabOverflowMenuContent!),
                  ],
                ),
                TabBarView(children: content),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _MoreMenu extends StatelessWidget {
  const _MoreMenu(this.content, {super.key});

  final List<Widget> content;

  @override
  Widget build(BuildContext context) {
    final lang = AppLocalizations.of(context);
    return MenuAnchor(
      builder: (context, controller, child) {
        return IconButton(
          onPressed: () => controller.isOpen //
              ? controller.close()
              : controller.open(),
          icon: Icon(
            Icons.adaptive.more,
            semanticLabel: lang.label_more,
          ),
          tooltip: lang.label_more,
        );
      },
      menuChildren: content,
    );
  }
}
