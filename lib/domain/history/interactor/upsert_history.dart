import 'package:flutteryomi/domain/history/model/history.dart';
import 'package:flutteryomi/domain/history/repository/history_repository.dart';

class UpsertHistory {
  final HistoryRepository repository;
  UpsertHistory(this.repository);

  Future<void> await_(History historyUpdate) async {
    await repository.upsertHistory(historyUpdate);
  }
}
