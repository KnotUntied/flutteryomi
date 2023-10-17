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


//class Manga {
  //int id;
  //int source;
  //bool favorite;
  //int lastUpdate;
  //int nextUpdate;
  //int fetchInterval;
  //int dateAdded;
  //int viewerFlags;
  //int chapterFlags;
  //int coverLastModified;
  //String url;
  //String title;
  //String? artist;
  //String? author;
  //String? description;
  //List<String>? genre;
  //int status;
  //String? thumbnailUrl;
  //UpdateStrategy updateStrategy;
  //bool initialized;
  //int lastModifiedAt;
  //int? favoriteModifiedAt;

  //Map<String, Object?> toMap() {
  //  var map = <String, Object?>{
  //    columnSource: source,
  //    columnFavorite: favorite == true ? 1 : 0,
  //    columnLastUpdate: lastUpdate,
  //    columnNextUpdate: nextUpdate,
  //    columnFetchInterval: fetchInterval,
  //    columnDateAdded: dateAdded,
  //    columnViewerFlags: viewerFlags,
  //    columnChapterFlags: chapterFlags,
  //    columnCoverLastModified: coverLastModified,
  //    columnUrl: url,
  //    columnTitle: title,
  //    columnArtist: artist,
  //    columnAuthor: author,
  //    columnDescription: description,
  //    columnGenre: genre!.join(','),
  //    columnStatus: status,
  //    columnThumbnailUrl: thumbnailUrl,
  //    columnUpdateStrategy: updateStrategy.index,
  //    columnInitialized: initialized == true ? 1 : 0,
  //    columnLastModifiedAt: lastModifiedAt,
  //    columnFavoriteModifiedAt: favoriteModifiedAt,
  //  };
  //  map[columnId] = id;
  //  return map;
  //}

  //Manga({
  //  required this.id,
  //  required this.source,
  //  required this.favorite,
  //  required this.lastUpdate,
  //  required this.nextUpdate,
  //  required this.fetchInterval,
  //  required this.dateAdded,
  //  required this.viewerFlags,
  //  required this.chapterFlags,
  //  required this.coverLastModified,
  //  required this.url,
  //  required this.title,
  //  required this.artist,
  //  required this.author,
  //  required this.description,
  //  required this.genre,
  //  required this.status,
  //  required this.thumbnailUrl,
  //  required this.updateStrategy,
  //  required this.initialized,
  //  required this.lastModifiedAt,
  //  required this.favoriteModifiedAt,
  //});

  //Manga();

  //Manga.fromMap(Map<String, Object?> map) {
  //  id = map[columnId] as int;
  //  source = map[columnSource] as int;
  //  favorite = map[columnFavorite] == 1;
  //  lastUpdate = map[columnLastUpdate] as int;
  //  nextUpdate = map[columnNextUpdate] as int;
  //  fetchInterval = map[columnFetchInterval] as int;
  //  dateAdded = map[columnDateAdded] as int;
  //  viewerFlags = map[columnViewerFlags] as int;
  //  chapterFlags = map[columnChapterFlags] as int;
  //  coverLastModified = map[columnCoverLastModified] as int;
  //  url = map[columnUrl] as String;
  //  title = map[columnTitle] as String;
  //  artist = map[columnArtist] as String?;
  //  author = map[columnAuthor] as String?;
  //  description = map[columnDescription] as String?;
  //  genre = map[columnGenre]!.split(',') as List<String>;
  //  status = map[columnStatus];
  //  thumbnailUrl = map[columnThumbnailUrl] as String?;
  //  updateStrategy = map[columnUpdateStrategy].index;
  //  initialized = map[columnInitialized] == 1;
  //  lastModifiedAt = map[columnLastModifiedAt];
  //  favoriteModifiedAt = map[columnFavoriteModifiedAt] as int?;
  //}
//}
