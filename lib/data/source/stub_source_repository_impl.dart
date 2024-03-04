import 'package:drift/drift.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:flutteryomi/data/drift/data/sources.drift.dart';
import 'package:flutteryomi/data/database.dart';
import 'package:flutteryomi/domain/source/model/stub_source.dart';
import 'package:flutteryomi/domain/source/repository/stub_source_repository.dart';

part 'stub_source_repository_impl.g.dart';

class StubSourceRepositoryImpl implements StubSourceRepository {
  StubSourceRepositoryImpl({required this.db});
  final Database db;

  @override
  Future<StubSource?> getStubSource(int id) async => await db.sourcesDrift
      .findOne(id: id)
      .map((it) => _mapStubSource(it.id, it.lang, it.name))
      .getSingleOrNull();

  @override
  Stream<List<StubSource>> subscribeAll() => db.sourcesDrift
      .findAll()
      .map((it) => _mapStubSource(it.id, it.lang, it.name))
      .watch();

  @override
  Future<void> upsertStubSource(int id, String lang, String name) async =>
      await db //
          .into(db.sources)
          .insert(
            SourcesCompanion.insert(id: Value(id), lang: lang, name: name),
          );

  StubSource _mapStubSource(int id, String lang, String name) =>
      StubSource(id: id, lang: lang, name: name);
}

@riverpod
StubSourceRepository stubSourceRepositoryImpl(
  StubSourceRepositoryImplRef ref,
) =>
    StubSourceRepositoryImpl(db: ref.watch(databaseProvider));
