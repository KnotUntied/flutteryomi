import 'package:drift/drift.dart';

import 'package:flutteryomi/models/category.dart';
import 'package:flutteryomi/models/manga.dart';

@DataClassName('MangaCategory')
class MangaCategoryItems extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get mangaId => integer().references(MangaItems, #id, onDelete: KeyAction.cascade)();
  IntColumn get categoryId => integer().references(CategoryItems, #id, onDelete: KeyAction.cascade)();
  DateTimeColumn get lastModifiedAt => dateTime().withDefault(Constant(DateTime.utc(1970)))();
}
