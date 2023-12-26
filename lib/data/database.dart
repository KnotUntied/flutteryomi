import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:riverpod/riverpod.dart';

import 'package:flutteryomi/data/database.drift.dart';
import 'package:flutteryomi/data/drift/data/categories.drift.dart';

@DriftDatabase(
  include: {
    'drift/data/categories.drift',
    'drift/data/chapters.drift',
    'drift/data/excluded_scanlators.drift',
    'drift/data/history.drift',
    'drift/data/manga_sync.drift',
    'drift/data/mangas.drift',
    'drift/data/mangas_categories.drift',
    'drift/data/sources.drift',
    'drift/views/history_view.drift',
    'drift/views/library_view.drift',
    'drift/views/updates_view.drift',
  },
)
class Database extends $Database {
  Database() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onCreate: (m) async {
        await m.createAll();

        // Add default category if not already
        await into(categories).insert(
          CategoriesCompanion.insert(
            id: const Value(0),
            name: '',
            sort: -1,
            flags: 0,
          ),
          mode: InsertMode.insertOrIgnore,
        );
      },
    );
  }

  static final StateProvider<Database> provider = StateProvider((ref) {
    final database = Database();
    ref.onDispose(database.close);

    return database;
  });
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return NativeDatabase.createInBackground(file);
  });
}
