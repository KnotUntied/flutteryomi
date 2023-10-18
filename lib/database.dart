import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

// Tedious but necessary
// See https://github.com/simolus3/drift/issues/2474#issuecomment-1591582644
import 'package:flutteryomi/models/converters/list_of_strings_converter.dart';
import 'package:flutteryomi/models/enums/update_strategy.dart';
import 'package:flutteryomi/models/manga.dart';

part 'database.g.dart';


@DriftDatabase(tables: [MangaItems])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;
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