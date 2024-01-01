import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:flutteryomi/domain/history/model/history.dart';
import 'package:flutteryomi/domain/history/model/history_with_relations.dart';
import 'package:flutteryomi/domain/history/repository/history_repository.dart';

part 'get_history.g.dart';

class GetHistory {
  final HistoryRepository repository;
  GetHistory(this.repository);

  Future<List<History>> await_(int mangaId) async =>
      await repository.getHistoryByMangaId(mangaId);

  Stream<List<HistoryWithRelations>> subscribe(String query) =>
      repository.getHistory(query);
}

@riverpod
GetHistory getHistory(GetHistoryRef ref) => GetHistory(
      ref.watch(historyRepositoryProvider),
    );
