import 'package:drift/drift.dart';

import 'package:flutteryomi/database.dart';

@DataClassName('Category')
class CategoryItems extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  IntColumn get order => integer()();
  IntColumn get flags => integer()();
}

extension CategoryUtils on Category {
  bool get isSystemCategory => id == 0;
}
