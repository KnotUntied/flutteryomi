import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:flutteryomi/domain/category/model/category.dart';
import 'package:flutteryomi/domain/library/model/library_display_mode.dart';
import 'package:flutteryomi/presentation/components/settings_items.dart';
import 'package:flutteryomi/presentation/components/tabbed_dialog.dart';

//TODO
class LibrarySettingsDialog extends StatelessWidget {
  const LibrarySettingsDialog({
    super.key,
    //required this.screenModel
    this.category,
  });

  final Category? category;

  @override
  Widget build(BuildContext context) {
    final lang = AppLocalizations.of(context);
    return TabbedDialog(
      tabTitles: [
        lang.action_filter,
        lang.action_sort,
        lang.pref_category_display,
      ],
      content: [
        const _FilterPage(
          //screenModel: screenModel,
        ),
        _SortPage(
          category: category,
          //screenModel: screenModel,
        ),
        const _DisplayPage(
          //screenModel: screenModel,
        ),
      ],
    );
  }
}

class _FilterPage extends StatelessWidget {
  const _FilterPage({
    super.key,
    //required this.screenModel
  });

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
  const _SortPage({
    super.key,
    this.category,
    //required this.screenModel
  });

  final Category? category;

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
  const _DisplayPage({
    super.key,
    //required this.screenModel
  });

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
