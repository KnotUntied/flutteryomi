import 'package:flutteryomi/domain/history/repository/history_repository.dart';

class GetTotalReadDuration {
  final HistoryRepository repository;
  GetTotalReadDuration(this.repository);

  Future<int> await_() async => await repository.getTotalReadDuration();
}
