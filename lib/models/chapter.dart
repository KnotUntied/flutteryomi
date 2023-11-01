import 'package:drift/drift.dart';

import 'package:flutteryomi/models/manga.dart';

@DataClassName('Chapter')
class ChapterItems extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get mangaId => integer().references(MangaItems, #id, onDelete: KeyAction.cascade)();
  IntColumn get lastPageRead => integer()();
  DateTimeColumn get dateFetch => dateTime()();
  IntColumn get sourceOrder => integer()();
  TextColumn get url => text()();
  TextColumn get name => text()();
  DateTimeColumn get dateUpload => dateTime()();
  RealColumn get chapterNumber => real()();
  TextColumn get scanlator => text()();
  DateTimeColumn get lastModifiedAt => dateTime()();
}
