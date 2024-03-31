import 'package:dartx/dartx.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:flutteryomi/domain/chapter/model/chapter.dart';
import 'package:flutteryomi/domain/history/interactor/get_next_chapters.dart';
import 'package:flutteryomi/domain/history/model/history_with_relations.dart';
import 'package:flutteryomi/domain/ui/ui_preferences.dart';
import 'package:flutteryomi/presentation/components/app_bar.dart';
import 'package:flutteryomi/presentation/components/date_text.dart';
import 'package:flutteryomi/presentation/components/list_group_header.dart';
import 'package:flutteryomi/presentation/history/components/history_dialogs.dart';
import 'package:flutteryomi/presentation/history/components/history_item.dart';
import 'package:flutteryomi/presentation/history/history_screen_model.dart';
import 'package:flutteryomi/presentation/manga/manga.dart';
import 'package:flutteryomi/presentation/screens/empty_screen.dart';
import 'package:flutteryomi/presentation/screens/loading_screen.dart';

part 'history.freezed.dart';

class HistoryTab extends ConsumerWidget {
  const HistoryTab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final lang = AppLocalizations.of(context);
    final screenModel = ref.watch(historyScreenModelProvider.notifier);
    final state = ref.watch(historyScreenModelProvider);
    final getNextChapters = ref.watch(getNextChaptersProvider);
    return Scaffold(
      appBar: SearchToolbar(
        titleContent: Text(lang.history),
        searchQuery: state.valueOrNull?.searchQuery,
        onChangeSearchQuery: screenModel.updateSearchQuery,
        onClickCloseSearch: () => screenModel.updateSearchQuery(null),
        actions: [
          AppBarAction(
            title: lang.pref_clear_history,
            iconData: Icons.delete_sweep_outlined,
            onClick: () => showAdaptiveDialog(
              context: context,
              builder: (context) => HistoryDeleteAllDialog(
                onDelete: screenModel.removeAllHistory,
              ),
            ),
          ),
        ],
      ),
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
        data: (data) {
          if (data.list == null) {
            return const LoadingScreen();
          } else if (data.list!.isEmpty) {
            return EmptyScreen(
              message: !data.searchQuery.isNullOrEmpty
                  ? lang.no_results_found
                  : lang.information_no_recent_manga,
            );
          } else {
            return _HistoryScreenContent(
              history: data.list!,
              onClickCover: (history) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MangaScreen(mangaId: history.mangaId),
                  ),
                );
              },
              onClickResume: (history) async {
                final chapters = await getNextChapters.awaitFromChapterId(
                  history.mangaId,
                  history.chapterId,
                  onlyUnread: false,
                );
                if (context.mounted) {
                  _openChapter(context, chapters.firstOrNull);
                }
              },
              onClickDelete: (item) => showAdaptiveDialog(
                context: context,
                builder: (context) => HistoryDeleteDialog(
                  onDelete: (all) => all
                      ? screenModel.removeAllFromHistory(item.mangaId)
                      : screenModel.removeFromHistory(item),
                ),
              ),
            );
          }
        },
      ),
    );
  }

  void _openChapter(BuildContext context, Chapter? chapter) {
    final lang = AppLocalizations.of(context);
    if (chapter != null) {
      //final intent = ReaderActivity.newIntent(context, chapter.mangaId, chapter.id);
      //context.startActivity(intent);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(lang.no_next_chapter),
        ),
      );
    }
  }
}

class _HistoryScreenContent extends ConsumerWidget {
  const _HistoryScreenContent({
    super.key,
    required this.history,
    required this.onClickCover,
    required this.onClickResume,
    required this.onClickDelete,
  });

  final List<HistoryUiModel> history;
  final ValueChanged<HistoryWithRelations> onClickCover;
  final ValueChanged<HistoryWithRelations> onClickResume;
  final ValueChanged<HistoryWithRelations> onClickDelete;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final preferences = ref.watch(uiPreferencesProvider);
    final relativeTime = preferences.relativeTime().get();
    final dateFormat = preferences.dateFormat().get();
    return ListView.builder(
      itemCount: history.length,
      itemBuilder: (context, index) {
        // TODO: Animate on move
        // Unfortunately no straightforward equivalent
        // for Modifier.animateItemPlacement()
        final item = history[index];
        return switch (item) {
          Header() => ListGroupHeader(
              relativeDateText(
                context: context,
                date: item.date,
                relativeTime: relativeTime,
                dateFormat: dateFormat,
              ),
              key: Key('history-${item.hashCode}'),
            ),
          Item() => HistoryItem(
              key: Key('history-${item.hashCode}'),
              history: item.item,
              onClickCover: () => onClickCover(item.item),
              onClickResume: () => onClickResume(item.item),
              onClickDelete: () => onClickDelete(item.item),
            ),
        };
      },
    );
  }
}

@freezed
sealed class HistoryUiModel with _$HistoryUiModel {
  const factory HistoryUiModel.header(DateTime date) = Header;
  const factory HistoryUiModel.item(HistoryWithRelations item) = Item;
}
