import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutteryomi/presentation/components/material/constants.dart';
import 'package:flutteryomi/presentation/components/section_card.dart';
import 'package:flutteryomi/presentation/more/stats/components/stats_item.dart';
import 'package:flutteryomi/presentation/more/stats/data/stats_data.dart';
import 'package:flutteryomi/presentation/more/stats/stats_screen_model.dart';
import 'package:flutteryomi/presentation/screens/loading_screen.dart';
import 'package:flutteryomi/presentation/util/time_utils.dart';

class StatsScreen extends ConsumerWidget {
  const StatsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final lang = AppLocalizations.of(context);
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
    return Column(
      children: [
        OverviewSection(state.overview),
        const SizedBox.square(dimension: MaterialPadding.small),
        TitlesStats(state.titles),
        const SizedBox.square(dimension: MaterialPadding.small),
        ChapterStats(state.chapters),
        const SizedBox.square(dimension: MaterialPadding.small),
        TrackerStats(state.trackers),
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
    final readDurationString = Duration(milliseconds: data.totalReadDuration)
        .toDurationString(context: context, fallback: none);
    return SectionCard(
      title: lang.label_overview_section,
      content: [
        Row(
          children: [
            StatsOverviewItem(
              title: data.libraryMangaCount.toString(),
              subtitle: lang.in_library,
              icon: Icons.collections_bookmark_outlined,
            ),
            StatsOverviewItem(
              title: readDurationString,
              subtitle: lang.label_read_duration,
              icon: Icons.schedule_outlined,
            ),
            StatsOverviewItem(
              title: data.completedMangaCount.toString(),
              subtitle: lang.label_completed_titles,
              icon: Icons.local_library_outlined,
            ),
          ],
        ),
      ],
    );
  }
}

class TitlesStats extends StatelessWidget {
  const TitlesStats(this.data, {super.key});

  final Titles data;

  @override
  Widget build(BuildContext context) {
    final lang = AppLocalizations.of(context);
    return SectionCard(
      title: lang.label_titles_section,
      content: [
        Row(
          children: [
            StatsItem(
              data.globalUpdateItemCount.toString(),
              lang.label_titles_in_global_update,
            ),
            StatsItem(
              data.startedMangaCount.toString(),
              lang.label_started,
            ),
            StatsItem(
              data.localMangaCount.toString(),
              lang.label_local,
            ),
          ],
        ),
      ],
    );
  }
}

class ChapterStats extends StatelessWidget {
  const ChapterStats(this.data, {super.key});

  final Chapters data;

  @override
  Widget build(BuildContext context) {
    final lang = AppLocalizations.of(context);
    return SectionCard(
      title: lang.chapters,
      content: [
        Row(
          children: [
            StatsItem(
              data.totalChapterCount.toString(),
              lang.label_total_chapters,
            ),
            StatsItem(
              data.readChapterCount.toString(),
              lang.label_read_chapters,
            ),
            StatsItem(
              data.downloadCount.toString(),
              lang.label_downloaded,
            ),
          ],
        ),
      ],
    );
  }
}

class TrackerStats extends StatelessWidget {
  const TrackerStats(this.data, {super.key});

  final Trackers data;

  @override
  Widget build(BuildContext context) {
    final lang = AppLocalizations.of(context);
    final notApplicable = lang.not_applicable;
    final meanScoreStr = (data.trackedTitleCount > 0 && !data.meanScore.isNaN)
        // All other numbers are localized in English
        ? "{${data.meanScore.toStringAsFixed(2)}} ★"
        : notApplicable;
    return SectionCard(
      title: lang.label_tracker_section,
      content: [
        Row(
          children: [
            StatsItem(
              data.trackedTitleCount.toString(),
              lang.label_tracked_titles,
            ),
            StatsItem(
              meanScoreStr,
              lang.label_mean_score,
            ),
            StatsItem(
              data.trackerCount.toString(),
              lang.label_used,
            ),
          ],
        ),
      ],
    );
  }
}
