import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:flutteryomi/domain/history/model/history.dart';
import 'package:flutteryomi/domain/history/repository/history_repository.dart';

part 'upsert_history.g.dart';

class UpsertHistory {
  final HistoryRepository repository;
  UpsertHistory(this.repository);

  Future<void> await_(History historyUpdate) async {
    await repository.upsertHistory(historyUpdate);
  }
}

@riverpod
UpsertHistory upsertHistory(UpsertHistoryRef ref) => UpsertHistory(
      ref.watch(historyRepositoryProvider),
    );
