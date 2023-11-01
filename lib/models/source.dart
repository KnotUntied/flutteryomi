import 'package:drift/drift.dart';

@DataClassName('Source')
class SourceItems extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get lang => text()();
  TextColumn get name => text()();
}
