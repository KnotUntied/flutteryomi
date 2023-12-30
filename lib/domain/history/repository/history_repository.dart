import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:flutteryomi/domain/history/model/history.dart';
import 'package:flutteryomi/domain/history/model/history_with_relations.dart';

part 'history_repository.g.dart';

abstract interface class HistoryRepository {
  Stream<List<HistoryWithRelations>> getHistory(String query);
  Future<HistoryWithRelations?> getLastHistory();
  Future<int> getTotalReadDuration();
  Future<List<History>> getHistoryByMangaId(int mangaId);
  Future<void> resetHistory(int historyId);
  Future<void> resetHistoryByMangaId(int mangaId);
  Future<bool> deleteAllHistory();
  Future<void> upsertHistory(History history);
}

// Override this in the main method
@riverpod
HistoryRepository historyRepository(HistoryRepositoryRef ref) =>
    throw UnimplementedError();
