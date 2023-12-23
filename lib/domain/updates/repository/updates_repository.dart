import 'package:flutteryomi/domain/updates/model/updates_with_relations.dart';

abstract interface class UpdatesRepository {
  Future<List<UpdatesWithRelations>> awaitWithRead(bool read, DateTime after, int limit);
  Stream<List<UpdatesWithRelations>> subscribeAll(DateTime after, int limit);
  Stream<List<UpdatesWithRelations>> subscribeWithRead(bool read, DateTime after, int limit);
}
