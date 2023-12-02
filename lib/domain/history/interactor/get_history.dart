import 'package:flutteryomi/data/drift/data/history.drift.dart';
import 'package:flutteryomi/domain/history/model/history_with_relations.dart';
import 'package:flutteryomi/domain/history/repository/history_repository.dart';

class GetHistory {
  final HistoryRepository repository;
  GetHistory(this.repository);

  Future<List<HistoryData>> await_(int mangaId) async =>
      await repository.getHistoryByMangaId(mangaId);

  Stream<List<HistoryWithRelations>> subscribe(String query) =>
      repository.getHistory(query);
}
