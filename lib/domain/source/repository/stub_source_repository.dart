import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:flutteryomi/domain/source/model/stub_source.dart';

part 'stub_source_repository.g.dart';

abstract interface class StubSourceRepository {
  Stream<List<StubSource>> subscribeAll();
  Future<StubSource?> getStubSource(int id);
  Future<void> upsertStubSource(int id, String lang, String name);
}

// Override this in the main method
@riverpod
StubSourceRepository stubSourceRepository(StubSourceRepositoryRef ref) =>
    throw UnimplementedError();
