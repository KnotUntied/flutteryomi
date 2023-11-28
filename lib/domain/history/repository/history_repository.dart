import 'package:flutteryomi/data/drift/data/history.drift.dart';
import 'package:flutteryomi/domain/history/model/history_with_relations.dart';

abstract interface class HistoryRepository {
  Stream<List<HistoryWithRelations>> getHistory(String query);
  Future<HistoryWithRelations?> getLastHistory();
  Future<int> getTotalReadDuration();
  Future<List<HistoryData>> getHistoryByMangaId(int mangaId);
  Future<void> resetHistory(int historyId);
  Future<void> resetHistoryByMangaId(int mangaId);
  Future<bool> deleteAllHistory();
  Future<void> upsertHistory(HistoryData history);
}