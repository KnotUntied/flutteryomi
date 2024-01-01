import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:flutteryomi/domain/history/repository/history_repository.dart';

part 'get_total_read_duration.g.dart';

class GetTotalReadDuration {
  final HistoryRepository repository;
  GetTotalReadDuration(this.repository);

  Future<int> await_() async => await repository.getTotalReadDuration();
}

@riverpod
GetTotalReadDuration getTotalReadDuration(GetTotalReadDurationRef ref) =>
    GetTotalReadDuration(
      ref.watch(historyRepositoryProvider),
    );
