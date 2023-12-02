import 'package:flutteryomi/domain/history/model/history_with_relations.dart';
import 'package:flutteryomi/domain/history/repository/history_repository.dart';

class RemoveHistory {
  final HistoryRepository repository;
  RemoveHistory(this.repository);

  Future<bool> awaitAll(int mangaId) async =>
      await repository.deleteAllHistory();

  Future<void> await_(HistoryWithRelations history) async {
    await repository.resetHistory(history.id);
  }

  Future<void> awaitById(int mangaId) async {
    await repository.resetHistoryByMangaId(mangaId);
  }
}
