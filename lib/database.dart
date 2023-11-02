import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

import 'database.drift.dart';
import 'models/tables/categories.drift.dart';

@DriftDatabase(
  include: {
    'models/tables/categories.drift',
    'models/tables/chapters.drift',
    'models/tables/history.drift',
    'models/tables/manga_sync.drift',
    'models/tables/mangas.drift',
    'models/tables/mangas_categories.drift',
    'models/tables/sources.drift',
    'models/views/historyView.drift',
    'models/views/libraryView.drift',
    'models/views/updatesView.drift',
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
}

LazyDatabase _openConnection() {
  // the LazyDatabase util lets us find the right location for the file async.
  return LazyDatabase(() async {
    // put the database file, called db.sqlite here, into the documents folder
    // for your app.
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return NativeDatabase.createInBackground(file);
  });
}
