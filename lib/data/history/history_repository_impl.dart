import 'package:logger/logger.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:flutteryomi/core/util/system/logger.dart';
import 'package:flutteryomi/data/database.dart';
import 'package:flutteryomi/data/history/history_mapper.dart';
import 'package:flutteryomi/domain/history/model/history.dart';
import 'package:flutteryomi/domain/history/model/history_with_relations.dart';
import 'package:flutteryomi/domain/history/repository/history_repository.dart';

part 'history_repository_impl.g.dart';

class HistoryRepositoryImpl implements HistoryRepository {
  HistoryRepositoryImpl({required this.db, required this.logger});
  final Database db;
  final Logger logger;

  @override
  Stream<List<HistoryWithRelations>> getHistory(String query) =>
      db.historyViewDrift
          .getHistory(query: query)
          .map((row) => HistoryMapper.mapHistoryWithRelations(row))
          .watch();

  @override
  Future<HistoryWithRelations?> getLastHistory() async =>
      await db.historyViewDrift
          .getLatestHistory()
          .map((row) => HistoryMapper.mapHistoryWithRelations(row))
          .getSingleOrNull();

  @override
  Future<int> getTotalReadDuration() async =>
      await db.historyDrift.getReadDuration().getSingle();

  @override
  Future<List<History>> getHistoryByMangaId(int mangaId) async =>
      await db.historyDrift.getHistoryByMangaId(mangaId: mangaId).get();

  @override
  Future<void> resetHistory(int historyId) async {
    try {
      await db.historyDrift.resetHistoryById(historyId: historyId);
    } catch (e) {
      logger.e(e);
    }
  }

  @override
  Future<void> resetHistoryByMangaId(int mangaId) async {
    try {
      await db.historyDrift.resetHistoryByMangaId(mangaId: mangaId);
    } catch (e) {
      logger.e(e);
    }
  }

  @override
  Future<bool> deleteAllHistory() async {
    try {
      await db.historyDrift.removeAllHistory();
      return true;
    } catch (e) {
      logger.e(e);
      return false;
    }
  }

  @override
  Future<void> upsertHistory(History history) async {
    try {
      await db.into(db.history).insertOnConflictUpdate(history);
    } catch (e) {
      logger.e(e);
    }
  }
}

@riverpod
HistoryRepository historyRepositoryImpl(HistoryRepositoryImplRef ref) =>
    HistoryRepositoryImpl(
      db: ref.watch(databaseProvider),
      logger: ref.watch(loggerProvider),
    );
