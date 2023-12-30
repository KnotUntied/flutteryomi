import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:flutteryomi/domain/updates/model/updates_with_relations.dart';

part 'updates_repository.g.dart';

abstract interface class UpdatesRepository {
  Future<List<UpdatesWithRelations>> awaitWithRead(bool read, DateTime after, int limit);
  Stream<List<UpdatesWithRelations>> subscribeAll(DateTime after, int limit);
  Stream<List<UpdatesWithRelations>> subscribeWithRead(bool read, DateTime after, int limit);
}

// Override this in the main method
@riverpod
UpdatesRepository updatesRepository(UpdatesRepositoryRef ref) =>
    throw UnimplementedError();
