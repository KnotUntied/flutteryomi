import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:flutteryomi/widgets/list_heading.dart';

class StatisticsPage extends StatelessWidget {
  const StatisticsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final lang = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(lang.label_stats),
      ),
      body: ListView(
        children: <Widget>[
          ListHeading(lang.label_overview_section),
          StatisticsCard(
            children: <StatisticsItemLarge>[
              StatisticsItemLarge(
                value: '0',
                label: lang.in_library,
                icon: const Icon(Icons.collections_bookmark_outlined),
              ),
              StatisticsItemLarge(
                value: '0',
                label: lang.label_completed_titles,
                icon: const Icon(Icons.local_library_outlined),
              ),
              StatisticsItemLarge(
                value: const Duration(days: 1, hours: 1, minutes: 33, microseconds: 500).toString(),
                label: lang.label_read_duration,
                icon: const Icon(Icons.schedule_outlined),
              ),
            ],
          ),
          ListHeading(lang.label_titles_section),
          StatisticsCard(
            children: <StatisticsItem>[
              StatisticsItem(
                value: '0',
                label: lang.label_titles_in_global_update,
              ),
              StatisticsItem(
                value: '0',
                label: lang.label_started,
              ),
              StatisticsItem(
                value: '0',
                label: lang.label_local,
              ),
            ],
          ),
          ListHeading(lang.chapters),
          StatisticsCard(
            children: <StatisticsItem>[
              StatisticsItem(
                value: '0',
                label: lang.label_total_chapters,
              ),
              StatisticsItem(
                value: '0',
                label: lang.label_read_chapters,
              ),
              StatisticsItem(
                value: '0',
                label: lang.label_downloaded,
              ),
            ],
          ),
          ListHeading(lang.label_tracker_section),
          StatisticsCard(
            children: <StatisticsItem>[
              StatisticsItem(
                value: '0',
                label: lang.label_tracked_titles,
              ),
              StatisticsItem(
                value: '0 ★',
                label: lang.label_mean_score,
              ),
              StatisticsItem(
                value: '0',
                label: lang.label_used,
              ),
            ],
          ),
        ],
      ),
    );
  }
}


class StatisticsCard extends StatelessWidget {
  const StatisticsCard({
    super.key,
    required this.children,
  });

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Card(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: children,
          ),
        ),
      ),
    );
  }
}


class StatisticsItemLarge extends StatelessWidget {
  const StatisticsItemLarge({
    super.key,
    required this.value,
    required this.label,
    required this.icon,
  });

  final String value;
  final String label;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            value,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          Text(
            label,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.labelLarge,
          ),
          icon,
        ],
      )
    );
  }
}


class StatisticsItem extends StatelessWidget {
  const StatisticsItem({
    super.key,
    required this.value,
    required this.label,
  });

  final String value;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            value,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          Text(
            label,
            style: Theme.of(context).textTheme.labelMedium,
          ),
        ],
      )
    );
  }
}
