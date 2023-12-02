import 'package:flutteryomi/data/drift/data/history.drift.dart';
import 'package:flutteryomi/domain/history/repository/history_repository.dart';

class UpsertHistory {
  final HistoryRepository repository;
  UpsertHistory(this.repository);

  Future<void> await_(HistoryData historyUpdate) async {
    await repository.upsertHistory(historyUpdate);
  }
}
