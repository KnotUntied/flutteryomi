import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:flutteryomi/domain/updates/model/updates_with_relations.dart';
import 'package:flutteryomi/domain/updates/repository/updates_repository.dart';

part 'get_updates.g.dart';

class GetUpdates {
  final UpdatesRepository repository;
  GetUpdates(this.repository);

  Future<List<UpdatesWithRelations>?> await_(bool read, DateTime after) async =>
      await repository.awaitWithRead(read, after, 500);

  Stream<List<UpdatesWithRelations>> subscribe(DateTime instant) =>
      repository.subscribeAll(instant, 500);

  Stream<List<UpdatesWithRelations>> subscribeWithRead(
    bool read,
    DateTime after,
  ) =>
      repository.subscribeWithRead(read, after, 500);
}

@riverpod
GetUpdates getUpdates(GetUpdatesRef ref) =>
    GetUpdates(ref.watch(updatesRepositoryProvider));
