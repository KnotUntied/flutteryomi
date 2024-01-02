import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutteryomi/presentation/components/list_heading.dart';
import 'package:flutteryomi/presentation/components/material/constants.dart';
import 'package:flutteryomi/presentation/more/stats/stats_screen_model.dart';
import 'package:flutteryomi/presentation/screens/loading_screen.dart';
import 'package:flutteryomi/presentation/util/time_utils.dart';

class StatsScreen extends ConsumerWidget {
  const StatsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final lang = AppLocalizations.of(context);
    final screenModel = ref.watch(statsScreenModelProvider.notifier);
    final state = ref.watch(statsScreenModelProvider);
    return Scaffold(
      appBar: AppBar(title: Text(lang.label_stats)),
      body: state.when(
        loading: () => const LoadingScreen(),
        // TODO: Error handling
        error: (Object error, StackTrace stackTrace) {
          debugPrintStack(
            label: error.toString(),
            stackTrace: stackTrace,
          );
          return const LoadingScreen();
        },
        data: (data) => StatsScreenContent(data),
      ),
    );
  }
}

class StatsScreenContent extends StatelessWidget {
  const StatsScreenContent(this.state, {super.key});

  final StatsScreenState state;

  @override
  Widget build(BuildContext context) {
    final lang = AppLocalizations.of(context);
    return ListView(
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
              //value: const Duration(days: 1, hours: 1, minutes: 33, microseconds: 500).toString(),
              value: '0 m',
              label: lang.label_read_duration,
              icon: const Icon(Icons.schedule_outlined),
            ),
          ],
        ),
        const SizedBox.square(dimension: MaterialPadding.small),
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
        const SizedBox.square(dimension: MaterialPadding.small),
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
        const SizedBox.square(dimension: MaterialPadding.small),
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
    );
  }
}

class OverviewSection extends StatelessWidget {
  const OverviewSection(this.data, {super.key});

  final Overview data;

  @override
  Widget build(BuildContext context) {
    final lang = AppLocalizations.of(context);
    final none = lang.none;
    final read = Duration(milliseconds: data.totalReadDuration)
        .toDurationString(context: context, fallback: none);
    return const Placeholder();
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
    ));
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
        Text(value, style: Theme.of(context).textTheme.titleMedium),
        Text(label, style: Theme.of(context).textTheme.labelMedium),
      ],
    ));
  }
}
