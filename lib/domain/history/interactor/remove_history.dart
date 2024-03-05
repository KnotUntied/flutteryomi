import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:flutteryomi/domain/history/model/history_with_relations.dart';
import 'package:flutteryomi/domain/history/repository/history_repository.dart';

part 'remove_history.g.dart';

class RemoveHistory {
  final HistoryRepository repository;
  RemoveHistory(this.repository);

  Future<bool> awaitAll() =>
      repository.deleteAllHistory();

  Future<void> await_(HistoryWithRelations history) =>
      repository.resetHistory(history.id);

  Future<void> awaitById(int mangaId) =>
      repository.resetHistoryByMangaId(mangaId);
}

@riverpod
RemoveHistory removeHistory(RemoveHistoryRef ref) => RemoveHistory(
      ref.watch(historyRepositoryProvider),
    );
