import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:riverpod/riverpod.dart';

import 'database.drift.dart';
import 'tables/categories.drift.dart';

@DriftDatabase(
  include: {
    'tables/categories.drift',
    'tables/chapters.drift',
    'tables/excluded_scanlators.drift',
    'tables/history.drift',
    'tables/manga_sync.drift',
    'tables/mangas.drift',
    'tables/mangas_categories.drift',
    'tables/sources.drift',
    'views/history_view.drift',
    'views/library_view.drift',
    'views/updates_view.drift',
  },
)
class AppDatabase extends $AppDatabase {
  AppDatabase() : super(_openConnection());

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

  static final StateProvider<AppDatabase> provider = StateProvider((ref) {
    final database = AppDatabase();
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