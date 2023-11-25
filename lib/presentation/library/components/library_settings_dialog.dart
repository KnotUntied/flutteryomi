import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:flutteryomi/domain/library/model/library_display_mode.dart';
import 'package:flutteryomi/presentation/components/settings_items.dart';

class LibrarySettingsDialog extends StatelessWidget {
  const LibrarySettingsDialog({
    super.key,
    //required this.category,
  });

  //final Category? category;

  @override
  Widget build(BuildContext context) {
    final lang = AppLocalizations.of(context);
    return DefaultTabController(
      length: 3,
      child: DraggableScrollableSheet(
        initialChildSize: 0.5,
        maxChildSize: 1,
        minChildSize: 0.5,
        builder: (BuildContext context, ScrollController scrollController) =>
            Expanded(
          child: Column(
            children: [
              TabBar(
                tabAlignment: TabAlignment.fill,
                tabs: <Tab>[
                  Tab(text: lang.action_filter),
                  Tab(text: lang.action_sort),
                  Tab(text: lang.pref_category_display),
                ],
              ),
              const TabBarView(
                children: [
                  _FilterPage(),
                  //_SortPage(category),
                  _SortPage(),
                  _DisplayPage(),
                ],
              ),
            ],
          ),
        ),
      ),
      //child: Column(
      //  children: [
      //    TabBar(
      //      tabAlignment: TabAlignment.fill,
      //      tabs: <Tab>[
      //        Tab(text: lang.action_filter),
      //        Tab(text: lang.action_sort),
      //        Tab(text: lang.pref_category_display),
      //      ],
      //    ),
      //    const Expanded(
      //      child: TabBarView(
      //        children: [
      //          _FilterPage(),
      //          //_SortPage(category),
      //          _SortPage(),
      //          _DisplayPage(),
      //        ],
      //      ),
      //    ),
      //  ],
      //),
    );
  }
}

class _FilterPage extends StatelessWidget {
  const _FilterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final lang = AppLocalizations.of(context);
    return ListView(
      children: [
        TriStateItem(
          label: lang.label_downloaded,
          state: true,
          enabled: true,
          onClick: (bool? x) {},
        ),
        TriStateItem(
          label: lang.action_filter_unread,
          state: true,
          onClick: (bool? x) {},
        ),
        TriStateItem(
          label: lang.label_started,
          state: true,
          onClick: (bool? x) {},
        ),
        TriStateItem(
          label: lang.action_filter_bookmarked,
          state: true,
          onClick: (bool? x) {},
        ),
        TriStateItem(
          label: lang.completed,
          state: true,
          onClick: (bool? x) {},
        ),
        TriStateItem(
          label: lang.action_filter_tracked,
          state: true,
          onClick: (bool? x) {},
        ),
      ],
    );
  }
}

class _SortPage extends StatelessWidget {
  const _SortPage({super.key});

  @override
  Widget build(BuildContext context) {
    final lang = AppLocalizations.of(context);
    return ListView(
      children: [
        SortItem(
          label: lang.action_filter_tracked,
          sortDescending: false,
          onClick: () {},
        ),
      ],
    );
  }
}

class _DisplayPage extends StatelessWidget {
  const _DisplayPage({super.key});

  @override
  Widget build(BuildContext context) {
    final lang = AppLocalizations.of(context);
    return ListView(
      children: [
        HeadingItem(lang.overlay_header),
        HeadingItem(lang.tabs_header),
      ],
    );
  }
}
