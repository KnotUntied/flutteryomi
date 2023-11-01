import 'package:drift/drift.dart';

import 'package:flutteryomi/models/chapter.dart';

@DataClassName('History')
class HistoryItems extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get chapterId => integer().references(ChapterItems, #id, onDelete: KeyAction.cascade)();
  DateTimeColumn get readAt => dateTime().nullable()();
  IntColumn get readDuration => integer()();
}
