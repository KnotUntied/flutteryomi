import 'package:drift/drift.dart';

import 'package:flutteryomi/models/converters/list_of_strings.dart';
import 'package:flutteryomi/models/enums/update_strategy.dart';

@DataClassName('Manga')
class MangaItems extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get source => integer()();
  BoolColumn get favorite => boolean()();
  DateTimeColumn get lastUpdate => dateTime()();
  DateTimeColumn get nextUpdate => dateTime()();
  IntColumn get fetchInterval => integer()();
  DateTimeColumn get dateAdded => dateTime()();
  IntColumn get viewerFlags => integer()();
  IntColumn get chapterFlags => integer()();
  IntColumn get coverLastModified => integer()();
  TextColumn get url => text()();
  TextColumn get title => text()();
  TextColumn get artist => text().nullable()();
  TextColumn get author => text().nullable()();
  TextColumn get description => text().nullable()();
  TextColumn get genre => text().map(const ListOfStringsConverter())();
  IntColumn get status => integer()();
  TextColumn get thumbnailUrl => text().nullable()();
  IntColumn get updateStrategy => intEnum<UpdateStrategy>()();
  BoolColumn get initialized => boolean()();
  DateTimeColumn get lastModifiedAt => dateTime()();
  DateTimeColumn get favoriteModifiedAt => dateTime().nullable()();
}
