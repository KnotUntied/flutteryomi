import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:flutteryomi/data/database.dart';
import 'package:flutteryomi/domain/source/interactor/get_sources_with_non_library_manga.dart';
import 'package:flutteryomi/domain/source/model/domain_source.dart';
import 'package:flutteryomi/domain/source/model/source_with_count.dart';
import 'package:flutteryomi/presentation/browse/components/browse_icons.dart';
import 'package:flutteryomi/presentation/components/app_bar.dart';
import 'package:flutteryomi/presentation/components/list_view_with_action.dart';
import 'package:flutteryomi/presentation/screens/empty_screen.dart';
import 'package:flutteryomi/presentation/screens/loading_screen.dart';

part 'clear_database.freezed.dart';
part 'clear_database.g.dart';

class ClearDatabaseScreen extends ConsumerWidget {
  const ClearDatabaseScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final lang = AppLocalizations.of(context);
    final screenModel = ref.watch(clearDatabaseScreenModelProvider.notifier);
    final state = ref.watch(clearDatabaseScreenModelProvider);
    return Scaffold(
      appBar: state.when(
          loading: () => null,
          error: (_, __) => null,
          data: (data) {
            return AppBar(
              title: Text(lang.pref_clear_database),
              actions: [
                AppBarAction(
                  title: lang.action_select_all,
                  iconData: Icons.select_all_outlined,
                  onClick: screenModel.selectAll,
                ),
                AppBarAction(
                  title: lang.action_select_inverse,
                  iconData: Icons.flip_to_back_outlined,
                  onClick: screenModel.invertSelection,
                ),
              ],
            );
          }),
      body: state.when(
        loading: () => const LoadingScreen(),
        // TODO: Error handling
        error: (error, stackTrace) {
          debugPrintStack(
            label: error.toString(),
            stackTrace: stackTrace,
          );
          return const LoadingScreen();
        },
        data: (data) {
          if (data.items.isEmpty) {
            return EmptyScreen(message: lang.database_clean);
          }
          return ListViewBuilderWithAction(
            actionLabel: lang.action_delete,
            actionEnabled: data.selection.isNotEmpty,
            onClickAction: () => showAdaptiveDialog(
              context: context,
              builder: (context) => AlertDialog.adaptive(
                content: Text(lang.clear_database_confirmation),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text(lang.action_cancel),
                  ),
                  TextButton(
                    onPressed: () async {
                      Navigator.pop(context);
                      await screenModel.removeMangaBySourceId();
                      screenModel.clearSelection();
                      if (context.mounted) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(lang.clear_database_completed),
                          ),
                        );
                      }
                    },
                    child: Text(lang.action_ok),
                  ),
                ],
              ),
            ),
            itemCount: data.items.length,
            itemBuilder: (context, index) {
              final sourceWithCount = data.items[index];
              final source = sourceWithCount.source;
              return CheckboxListTile(
                secondary: SourceIcon(source: source),
                title: Text(source.visualName),
                subtitle: Text(
                  lang.clear_database_source_item_count(sourceWithCount.count),
                ),
                value: data.selection.contains(sourceWithCount.id),
                onChanged: (_) =>
                    screenModel.toggleSelection(sourceWithCount.source),
              );
            },
          );
        },
      ),
    );
  }
}

@riverpod
class ClearDatabaseScreenModel extends _$ClearDatabaseScreenModel {
  @override
  Stream<ClearDatabaseScreenState> build() {
    final getSourcesWithNonLibraryManga =
        ref.watch(getSourcesWithNonLibraryMangaProvider);
    return getSourcesWithNonLibraryManga //
        .subscribe()
        .map(
          (list) => ClearDatabaseScreenState(
            items: list.sortedBy((it) => it.name),
          ),
        );
  }

  Future<void> removeMangaBySourceId() async {
    final db = ref.watch(databaseProvider);
    final previousState = state.valueOrNull;
    if (previousState != null) {
      db.mangasDrift.deleteMangasNotInLibraryBySourceIds(
        sourceIds: previousState.selection,
      );
      db.historyDrift.removeResettedHistory();
    }
  }

  void toggleSelection(Source source) async {
    final previousState = state.valueOrNull;
    if (previousState != null) {
      final mutableList = previousState.selection;
      if (mutableList.contains(source.id)) {
        mutableList.remove(source.id);
      } else {
        mutableList.add(source.id);
      }
      final newState = previousState.copyWith(
        selection: mutableList,
      );
      state = await AsyncValue.guard(() async => newState);
    }
  }

  void clearSelection() async {
    final previousState = state.valueOrNull;
    if (previousState != null) {
      final newState = previousState.copyWith(
        selection: [],
      );
      state = await AsyncValue.guard(() async => newState);
    }
  }

  void selectAll() async {
    final previousState = state.valueOrNull;
    if (previousState != null) {
      final newState = previousState.copyWith(
        selection: previousState.items.map((it) => it.id).toList(),
      );
      state = await AsyncValue.guard(() async => newState);
    }
  }

  void invertSelection() async {
    final previousState = state.valueOrNull;
    if (previousState != null) {
      final newState = previousState.copyWith(
        selection: previousState.items
            .map((it) => it.id)
            .whereNot((it) => previousState.selection.contains(it))
            .toList(),
      );
      state = await AsyncValue.guard(() async => newState);
    }
  }
}

@freezed
class ClearDatabaseScreenState with _$ClearDatabaseScreenState {
  const factory ClearDatabaseScreenState({
    required List<SourceWithCount> items,
    @Default([]) List<int> selection,
  }) = _ClearDatabaseScreenState;
}
