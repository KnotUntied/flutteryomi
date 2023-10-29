import 'package:drift/drift.dart';

import 'package:flutteryomi/models/converters/list_of_strings_converter.dart';
import 'package:flutteryomi/models/enums/update_strategy.dart';


@DataClassName('Manga')
class MangaItems extends Table {
  Int64Column get id => int64().autoIncrement()();
  Int64Column get source => int64()();
  BoolColumn get favorite => boolean()();
  DateTimeColumn get lastUpdate => dateTime()();
  DateTimeColumn get nextUpdate => dateTime()();
  IntColumn get fetchInterval => integer()();
  DateTimeColumn get dateAdded => dateTime()();
  Int64Column get viewerFlags => int64()();
  Int64Column get chapterFlags => int64()();
  Int64Column get coverLastModified => int64()();
  TextColumn get url => text()();
  TextColumn get title => text()();
  TextColumn get artist => text().nullable()();
  TextColumn get author => text().nullable()();
  TextColumn get description => text().nullable()();
  TextColumn get genre => text().map(const ListOfStringsConverter())();
  Int64Column get status => int64()();
  TextColumn get thumbnailUrl => text().nullable()();
  IntColumn get updateStrategy => intEnum<UpdateStrategy>()();
  BoolColumn get initialized => boolean()();
  DateTimeColumn get lastModifiedAt => dateTime()();
  DateTimeColumn get favoriteModifiedAt => dateTime().nullable()();
}
