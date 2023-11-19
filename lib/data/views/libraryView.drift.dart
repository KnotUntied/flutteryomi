// ignore_for_file: type=lint
import 'package:drift/drift.dart' as i0;
import 'package:flutteryomi/data/views/libraryView.drift.dart' as i1;
import 'package:flutteryomi/data/tables/mangas.drift.dart' as i2;
import 'package:drift/internal/modular.dart' as i3;
import 'package:flutteryomi/data/tables/chapters.drift.dart' as i4;
import 'package:flutteryomi/data/tables/excluded_scanlators.drift.dart' as i5;
import 'package:flutteryomi/data/tables/history.drift.dart' as i6;
import 'package:flutteryomi/data/tables/mangas_categories.drift.dart' as i7;

class LibraryViewData extends i0.DataClass {
  final int id;
  final int source;
  final String url;
  final String? artist;
  final String? author;
  final String? description;
  final List<String>? genre;
  final String title;
  final int status;
  final String? thumbnailUrl;
  final bool favorite;
  final DateTime? lastUpdate;
  final DateTime? nextUpdate;
  final bool initialized;
  final int viewer;
  final int chapterFlags;
  final DateTime coverLastModified;
  final DateTime dateAdded;
  final int updateStrategy;
  final int calculateInterval;
  final DateTime lastModifiedAt;
  final DateTime? favoriteModifiedAt;
  final int totalCount;
  final int readCount;
  final DateTime latestUpload;
  final DateTime chapterFetchedAt;
  final DateTime lastRead;
  final int bookmarkCount;
  final int category;
  const LibraryViewData(
      {required this.id,
      required this.source,
      required this.url,
      this.artist,
      this.author,
      this.description,
      this.genre,
      required this.title,
      required this.status,
      this.thumbnailUrl,
      required this.favorite,
      this.lastUpdate,
      this.nextUpdate,
      required this.initialized,
      required this.viewer,
      required this.chapterFlags,
      required this.coverLastModified,
      required this.dateAdded,
      required this.updateStrategy,
      required this.calculateInterval,
      required this.lastModifiedAt,
      this.favoriteModifiedAt,
      required this.totalCount,
      required this.readCount,
      required this.latestUpload,
      required this.chapterFetchedAt,
      required this.lastRead,
      required this.bookmarkCount,
      required this.category});
  factory LibraryViewData.fromJson(Map<String, dynamic> json,
      {i0.ValueSerializer? serializer}) {
    serializer ??= i0.driftRuntimeOptions.defaultSerializer;
    return LibraryViewData(
      id: serializer.fromJson<int>(json['_id']),
      source: serializer.fromJson<int>(json['source']),
      url: serializer.fromJson<String>(json['url']),
      artist: serializer.fromJson<String?>(json['artist']),
      author: serializer.fromJson<String?>(json['author']),
      description: serializer.fromJson<String?>(json['description']),
      genre: serializer.fromJson<List<String>?>(json['genre']),
      title: serializer.fromJson<String>(json['title']),
      status: serializer.fromJson<int>(json['status']),
      thumbnailUrl: serializer.fromJson<String?>(json['thumbnail_url']),
      favorite: serializer.fromJson<bool>(json['favorite']),
      lastUpdate: serializer.fromJson<DateTime?>(json['last_update']),
      nextUpdate: serializer.fromJson<DateTime?>(json['next_update']),
      initialized: serializer.fromJson<bool>(json['initialized']),
      viewer: serializer.fromJson<int>(json['viewer']),
      chapterFlags: serializer.fromJson<int>(json['chapter_flags']),
      coverLastModified:
          serializer.fromJson<DateTime>(json['cover_last_modified']),
      dateAdded: serializer.fromJson<DateTime>(json['date_added']),
      updateStrategy: serializer.fromJson<int>(json['update_strategy']),
      calculateInterval: serializer.fromJson<int>(json['calculate_interval']),
      lastModifiedAt: serializer.fromJson<DateTime>(json['last_modified_at']),
      favoriteModifiedAt:
          serializer.fromJson<DateTime?>(json['favorite_modified_at']),
      totalCount: serializer.fromJson<int>(json['totalCount']),
      readCount: serializer.fromJson<int>(json['readCount']),
      latestUpload: serializer.fromJson<DateTime>(json['latestUpload']),
      chapterFetchedAt: serializer.fromJson<DateTime>(json['chapterFetchedAt']),
      lastRead: serializer.fromJson<DateTime>(json['lastRead']),
      bookmarkCount: serializer.fromJson<int>(json['bookmarkCount']),
      category: serializer.fromJson<int>(json['category']),
    );
  }
  @override
  Map<String, dynamic> toJson({i0.ValueSerializer? serializer}) {
    serializer ??= i0.driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      '_id': serializer.toJson<int>(id),
      'source': serializer.toJson<int>(source),
      'url': serializer.toJson<String>(url),
      'artist': serializer.toJson<String?>(artist),
      'author': serializer.toJson<String?>(author),
      'description': serializer.toJson<String?>(description),
      'genre': serializer.toJson<List<String>?>(genre),
      'title': serializer.toJson<String>(title),
      'status': serializer.toJson<int>(status),
      'thumbnail_url': serializer.toJson<String?>(thumbnailUrl),
      'favorite': serializer.toJson<bool>(favorite),
      'last_update': serializer.toJson<DateTime?>(lastUpdate),
      'next_update': serializer.toJson<DateTime?>(nextUpdate),
      'initialized': serializer.toJson<bool>(initialized),
      'viewer': serializer.toJson<int>(viewer),
      'chapter_flags': serializer.toJson<int>(chapterFlags),
      'cover_last_modified': serializer.toJson<DateTime>(coverLastModified),
      'date_added': serializer.toJson<DateTime>(dateAdded),
      'update_strategy': serializer.toJson<int>(updateStrategy),
      'calculate_interval': serializer.toJson<int>(calculateInterval),
      'last_modified_at': serializer.toJson<DateTime>(lastModifiedAt),
      'favorite_modified_at': serializer.toJson<DateTime?>(favoriteModifiedAt),
      'totalCount': serializer.toJson<int>(totalCount),
      'readCount': serializer.toJson<int>(readCount),
      'latestUpload': serializer.toJson<DateTime>(latestUpload),
      'chapterFetchedAt': serializer.toJson<DateTime>(chapterFetchedAt),
      'lastRead': serializer.toJson<DateTime>(lastRead),
      'bookmarkCount': serializer.toJson<int>(bookmarkCount),
      'category': serializer.toJson<int>(category),
    };
  }

  i1.LibraryViewData copyWith(
          {int? id,
          int? source,
          String? url,
          i0.Value<String?> artist = const i0.Value.absent(),
          i0.Value<String?> author = const i0.Value.absent(),
          i0.Value<String?> description = const i0.Value.absent(),
          i0.Value<List<String>?> genre = const i0.Value.absent(),
          String? title,
          int? status,
          i0.Value<String?> thumbnailUrl = const i0.Value.absent(),
          bool? favorite,
          i0.Value<DateTime?> lastUpdate = const i0.Value.absent(),
          i0.Value<DateTime?> nextUpdate = const i0.Value.absent(),
          bool? initialized,
          int? viewer,
          int? chapterFlags,
          DateTime? coverLastModified,
          DateTime? dateAdded,
          int? updateStrategy,
          int? calculateInterval,
          DateTime? lastModifiedAt,
          i0.Value<DateTime?> favoriteModifiedAt = const i0.Value.absent(),
          int? totalCount,
          int? readCount,
          DateTime? latestUpload,
          DateTime? chapterFetchedAt,
          DateTime? lastRead,
          int? bookmarkCount,
          int? category}) =>
      i1.LibraryViewData(
        id: id ?? this.id,
        source: source ?? this.source,
        url: url ?? this.url,
        artist: artist.present ? artist.value : this.artist,
        author: author.present ? author.value : this.author,
        description: description.present ? description.value : this.description,
        genre: genre.present ? genre.value : this.genre,
        title: title ?? this.title,
        status: status ?? this.status,
        thumbnailUrl:
            thumbnailUrl.present ? thumbnailUrl.value : this.thumbnailUrl,
        favorite: favorite ?? this.favorite,
        lastUpdate: lastUpdate.present ? lastUpdate.value : this.lastUpdate,
        nextUpdate: nextUpdate.present ? nextUpdate.value : this.nextUpdate,
        initialized: initialized ?? this.initialized,
        viewer: viewer ?? this.viewer,
        chapterFlags: chapterFlags ?? this.chapterFlags,
        coverLastModified: coverLastModified ?? this.coverLastModified,
        dateAdded: dateAdded ?? this.dateAdded,
        updateStrategy: updateStrategy ?? this.updateStrategy,
        calculateInterval: calculateInterval ?? this.calculateInterval,
        lastModifiedAt: lastModifiedAt ?? this.lastModifiedAt,
        favoriteModifiedAt: favoriteModifiedAt.present
            ? favoriteModifiedAt.value
            : this.favoriteModifiedAt,
        totalCount: totalCount ?? this.totalCount,
        readCount: readCount ?? this.readCount,
        latestUpload: latestUpload ?? this.latestUpload,
        chapterFetchedAt: chapterFetchedAt ?? this.chapterFetchedAt,
        lastRead: lastRead ?? this.lastRead,
        bookmarkCount: bookmarkCount ?? this.bookmarkCount,
        category: category ?? this.category,
      );
  @override
  String toString() {
    return (StringBuffer('LibraryViewData(')
          ..write('id: $id, ')
          ..write('source: $source, ')
          ..write('url: $url, ')
          ..write('artist: $artist, ')
          ..write('author: $author, ')
          ..write('description: $description, ')
          ..write('genre: $genre, ')
          ..write('title: $title, ')
          ..write('status: $status, ')
          ..write('thumbnailUrl: $thumbnailUrl, ')
          ..write('favorite: $favorite, ')
          ..write('lastUpdate: $lastUpdate, ')
          ..write('nextUpdate: $nextUpdate, ')
          ..write('initialized: $initialized, ')
          ..write('viewer: $viewer, ')
          ..write('chapterFlags: $chapterFlags, ')
          ..write('coverLastModified: $coverLastModified, ')
          ..write('dateAdded: $dateAdded, ')
          ..write('updateStrategy: $updateStrategy, ')
          ..write('calculateInterval: $calculateInterval, ')
          ..write('lastModifiedAt: $lastModifiedAt, ')
          ..write('favoriteModifiedAt: $favoriteModifiedAt, ')
          ..write('totalCount: $totalCount, ')
          ..write('readCount: $readCount, ')
          ..write('latestUpload: $latestUpload, ')
          ..write('chapterFetchedAt: $chapterFetchedAt, ')
          ..write('lastRead: $lastRead, ')
          ..write('bookmarkCount: $bookmarkCount, ')
          ..write('category: $category')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hashAll([
        id,
        source,
        url,
        artist,
        author,
        description,
        genre,
        title,
        status,
        thumbnailUrl,
        favorite,
        lastUpdate,
        nextUpdate,
        initialized,
        viewer,
        chapterFlags,
        coverLastModified,
        dateAdded,
        updateStrategy,
        calculateInterval,
        lastModifiedAt,
        favoriteModifiedAt,
        totalCount,
        readCount,
        latestUpload,
        chapterFetchedAt,
        lastRead,
        bookmarkCount,
        category
      ]);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is i1.LibraryViewData &&
          other.id == this.id &&
          other.source == this.source &&
          other.url == this.url &&
          other.artist == this.artist &&
          other.author == this.author &&
          other.description == this.description &&
          other.genre == this.genre &&
          other.title == this.title &&
          other.status == this.status &&
          other.thumbnailUrl == this.thumbnailUrl &&
          other.favorite == this.favorite &&
          other.lastUpdate == this.lastUpdate &&
          other.nextUpdate == this.nextUpdate &&
          other.initialized == this.initialized &&
          other.viewer == this.viewer &&
          other.chapterFlags == this.chapterFlags &&
          other.coverLastModified == this.coverLastModified &&
          other.dateAdded == this.dateAdded &&
          other.updateStrategy == this.updateStrategy &&
          other.calculateInterval == this.calculateInterval &&
          other.lastModifiedAt == this.lastModifiedAt &&
          other.favoriteModifiedAt == this.favoriteModifiedAt &&
          other.totalCount == this.totalCount &&
          other.readCount == this.readCount &&
          other.latestUpload == this.latestUpload &&
          other.chapterFetchedAt == this.chapterFetchedAt &&
          other.lastRead == this.lastRead &&
          other.bookmarkCount == this.bookmarkCount &&
          other.category == this.category);
}

class LibraryView extends i0.ViewInfo<i1.LibraryView, i1.LibraryViewData>
    implements i0.HasResultSet {
  final String? _alias;
  @override
  final i0.GeneratedDatabase attachedDatabase;
  LibraryView(this.attachedDatabase, [this._alias]);
  @override
  List<i0.GeneratedColumn> get $columns => [
        id,
        source,
        url,
        artist,
        author,
        description,
        genre,
        title,
        status,
        thumbnailUrl,
        favorite,
        lastUpdate,
        nextUpdate,
        initialized,
        viewer,
        chapterFlags,
        coverLastModified,
        dateAdded,
        updateStrategy,
        calculateInterval,
        lastModifiedAt,
        favoriteModifiedAt,
        totalCount,
        readCount,
        latestUpload,
        chapterFetchedAt,
        lastRead,
        bookmarkCount,
        category
      ];
  @override
  String get aliasedName => _alias ?? entityName;
  @override
  String get entityName => 'libraryView';
  @override
  Map<i0.SqlDialect, String> get createViewStatements => {
        i0.SqlDialect.sqlite:
            'CREATE VIEW libraryView AS SELECT M.*, coalesce(C.total, 0) AS totalCount, coalesce(C.readCount, 0) AS readCount, coalesce(C.latestUpload, 0) AS latestUpload, coalesce(C.fetchedAt, 0) AS chapterFetchedAt, coalesce(C.lastRead, 0) AS lastRead, coalesce(C.bookmarkCount, 0) AS bookmarkCount, coalesce(MC.category_id, 0) AS category FROM mangas AS M LEFT JOIN (SELECT chapters.manga_id, count(*) AS total, sum(read) AS readCount, coalesce(max(chapters.date_upload), 0) AS latestUpload, coalesce(max(history.last_read), 0) AS lastRead, coalesce(max(chapters.date_fetch), 0) AS fetchedAt, sum(chapters.bookmark) AS bookmarkCount FROM chapters LEFT JOIN excluded_scanlators ON chapters.manga_id = excluded_scanlators.manga_id AND chapters.scanlator = excluded_scanlators.scanlator LEFT JOIN history ON chapters._id = history.chapter_id WHERE excluded_scanlators.scanlator IS NULL GROUP BY chapters.manga_id) AS C ON M._id = C.manga_id LEFT JOIN mangas_categories AS MC ON MC.manga_id = M._id WHERE M.favorite = 1',
      };
  @override
  LibraryView get asDslTable => this;
  @override
  i1.LibraryViewData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return i1.LibraryViewData(
      id: attachedDatabase.typeMapping
          .read(i0.DriftSqlType.int, data['${effectivePrefix}_id'])!,
      source: attachedDatabase.typeMapping
          .read(i0.DriftSqlType.int, data['${effectivePrefix}source'])!,
      url: attachedDatabase.typeMapping
          .read(i0.DriftSqlType.string, data['${effectivePrefix}url'])!,
      artist: attachedDatabase.typeMapping
          .read(i0.DriftSqlType.string, data['${effectivePrefix}artist']),
      author: attachedDatabase.typeMapping
          .read(i0.DriftSqlType.string, data['${effectivePrefix}author']),
      description: attachedDatabase.typeMapping
          .read(i0.DriftSqlType.string, data['${effectivePrefix}description']),
      genre: i2.Mangas.$convertergenren.fromSql(attachedDatabase.typeMapping
          .read(i0.DriftSqlType.string, data['${effectivePrefix}genre'])),
      title: attachedDatabase.typeMapping
          .read(i0.DriftSqlType.string, data['${effectivePrefix}title'])!,
      status: attachedDatabase.typeMapping
          .read(i0.DriftSqlType.int, data['${effectivePrefix}status'])!,
      thumbnailUrl: attachedDatabase.typeMapping.read(
          i0.DriftSqlType.string, data['${effectivePrefix}thumbnail_url']),
      favorite: attachedDatabase.typeMapping
          .read(i0.DriftSqlType.bool, data['${effectivePrefix}favorite'])!,
      lastUpdate: attachedDatabase.typeMapping.read(
          i0.DriftSqlType.dateTime, data['${effectivePrefix}last_update']),
      nextUpdate: attachedDatabase.typeMapping.read(
          i0.DriftSqlType.dateTime, data['${effectivePrefix}next_update']),
      initialized: attachedDatabase.typeMapping
          .read(i0.DriftSqlType.bool, data['${effectivePrefix}initialized'])!,
      viewer: attachedDatabase.typeMapping
          .read(i0.DriftSqlType.int, data['${effectivePrefix}viewer'])!,
      chapterFlags: attachedDatabase.typeMapping
          .read(i0.DriftSqlType.int, data['${effectivePrefix}chapter_flags'])!,
      coverLastModified: attachedDatabase.typeMapping.read(
          i0.DriftSqlType.dateTime,
          data['${effectivePrefix}cover_last_modified'])!,
      dateAdded: attachedDatabase.typeMapping.read(
          i0.DriftSqlType.dateTime, data['${effectivePrefix}date_added'])!,
      updateStrategy: attachedDatabase.typeMapping.read(
          i0.DriftSqlType.int, data['${effectivePrefix}update_strategy'])!,
      calculateInterval: attachedDatabase.typeMapping.read(
          i0.DriftSqlType.int, data['${effectivePrefix}calculate_interval'])!,
      lastModifiedAt: attachedDatabase.typeMapping.read(
          i0.DriftSqlType.dateTime,
          data['${effectivePrefix}last_modified_at'])!,
      favoriteModifiedAt: attachedDatabase.typeMapping.read(
          i0.DriftSqlType.dateTime,
          data['${effectivePrefix}favorite_modified_at']),
      totalCount: attachedDatabase.typeMapping
          .read(i0.DriftSqlType.int, data['${effectivePrefix}totalCount'])!,
      readCount: attachedDatabase.typeMapping
          .read(i0.DriftSqlType.int, data['${effectivePrefix}readCount'])!,
      latestUpload: attachedDatabase.typeMapping.read(
          i0.DriftSqlType.dateTime, data['${effectivePrefix}latestUpload'])!,
      chapterFetchedAt: attachedDatabase.typeMapping.read(
          i0.DriftSqlType.dateTime,
          data['${effectivePrefix}chapterFetchedAt'])!,
      lastRead: attachedDatabase.typeMapping
          .read(i0.DriftSqlType.dateTime, data['${effectivePrefix}lastRead'])!,
      bookmarkCount: attachedDatabase.typeMapping
          .read(i0.DriftSqlType.int, data['${effectivePrefix}bookmarkCount'])!,
      category: attachedDatabase.typeMapping
          .read(i0.DriftSqlType.int, data['${effectivePrefix}category'])!,
    );
  }

  late final i0.GeneratedColumn<int> id = i0.GeneratedColumn<int>(
      '_id', aliasedName, false,
      type: i0.DriftSqlType.int);
  late final i0.GeneratedColumn<int> source = i0.GeneratedColumn<int>(
      'source', aliasedName, false,
      type: i0.DriftSqlType.int);
  late final i0.GeneratedColumn<String> url = i0.GeneratedColumn<String>(
      'url', aliasedName, false,
      type: i0.DriftSqlType.string);
  late final i0.GeneratedColumn<String> artist = i0.GeneratedColumn<String>(
      'artist', aliasedName, true,
      type: i0.DriftSqlType.string);
  late final i0.GeneratedColumn<String> author = i0.GeneratedColumn<String>(
      'author', aliasedName, true,
      type: i0.DriftSqlType.string);
  late final i0.GeneratedColumn<String> description =
      i0.GeneratedColumn<String>('description', aliasedName, true,
          type: i0.DriftSqlType.string);
  late final i0.GeneratedColumnWithTypeConverter<List<String>?, String> genre =
      i0.GeneratedColumn<String>('genre', aliasedName, true,
              type: i0.DriftSqlType.string)
          .withConverter<List<String>?>(i2.Mangas.$convertergenren);
  late final i0.GeneratedColumn<String> title = i0.GeneratedColumn<String>(
      'title', aliasedName, false,
      type: i0.DriftSqlType.string);
  late final i0.GeneratedColumn<int> status = i0.GeneratedColumn<int>(
      'status', aliasedName, false,
      type: i0.DriftSqlType.int);
  late final i0.GeneratedColumn<String> thumbnailUrl =
      i0.GeneratedColumn<String>('thumbnail_url', aliasedName, true,
          type: i0.DriftSqlType.string);
  late final i0.GeneratedColumn<bool> favorite = i0.GeneratedColumn<bool>(
      'favorite', aliasedName, false,
      type: i0.DriftSqlType.bool,
      defaultConstraints: i0.GeneratedColumn.constraintIsAlways(
          'CHECK ("favorite" IN (0, 1))'));
  late final i0.GeneratedColumn<DateTime> lastUpdate =
      i0.GeneratedColumn<DateTime>('last_update', aliasedName, true,
          type: i0.DriftSqlType.dateTime);
  late final i0.GeneratedColumn<DateTime> nextUpdate =
      i0.GeneratedColumn<DateTime>('next_update', aliasedName, true,
          type: i0.DriftSqlType.dateTime);
  late final i0.GeneratedColumn<bool> initialized = i0.GeneratedColumn<bool>(
      'initialized', aliasedName, false,
      type: i0.DriftSqlType.bool,
      defaultConstraints: i0.GeneratedColumn.constraintIsAlways(
          'CHECK ("initialized" IN (0, 1))'));
  late final i0.GeneratedColumn<int> viewer = i0.GeneratedColumn<int>(
      'viewer', aliasedName, false,
      type: i0.DriftSqlType.int);
  late final i0.GeneratedColumn<int> chapterFlags = i0.GeneratedColumn<int>(
      'chapter_flags', aliasedName, false,
      type: i0.DriftSqlType.int);
  late final i0.GeneratedColumn<DateTime> coverLastModified =
      i0.GeneratedColumn<DateTime>('cover_last_modified', aliasedName, false,
          type: i0.DriftSqlType.dateTime);
  late final i0.GeneratedColumn<DateTime> dateAdded =
      i0.GeneratedColumn<DateTime>('date_added', aliasedName, false,
          type: i0.DriftSqlType.dateTime);
  late final i0.GeneratedColumn<int> updateStrategy = i0.GeneratedColumn<int>(
      'update_strategy', aliasedName, false,
      type: i0.DriftSqlType.int);
  late final i0.GeneratedColumn<int> calculateInterval =
      i0.GeneratedColumn<int>('calculate_interval', aliasedName, false,
          type: i0.DriftSqlType.int);
  late final i0.GeneratedColumn<DateTime> lastModifiedAt =
      i0.GeneratedColumn<DateTime>('last_modified_at', aliasedName, false,
          type: i0.DriftSqlType.dateTime);
  late final i0.GeneratedColumn<DateTime> favoriteModifiedAt =
      i0.GeneratedColumn<DateTime>('favorite_modified_at', aliasedName, true,
          type: i0.DriftSqlType.dateTime);
  late final i0.GeneratedColumn<int> totalCount = i0.GeneratedColumn<int>(
      'totalCount', aliasedName, false,
      type: i0.DriftSqlType.int);
  late final i0.GeneratedColumn<int> readCount = i0.GeneratedColumn<int>(
      'readCount', aliasedName, false,
      type: i0.DriftSqlType.int);
  late final i0.GeneratedColumn<DateTime> latestUpload =
      i0.GeneratedColumn<DateTime>('latestUpload', aliasedName, false,
          type: i0.DriftSqlType.dateTime);
  late final i0.GeneratedColumn<DateTime> chapterFetchedAt =
      i0.GeneratedColumn<DateTime>('chapterFetchedAt', aliasedName, false,
          type: i0.DriftSqlType.dateTime);
  late final i0.GeneratedColumn<DateTime> lastRead =
      i0.GeneratedColumn<DateTime>('lastRead', aliasedName, false,
          type: i0.DriftSqlType.dateTime);
  late final i0.GeneratedColumn<int> bookmarkCount = i0.GeneratedColumn<int>(
      'bookmarkCount', aliasedName, false,
      type: i0.DriftSqlType.int);
  late final i0.GeneratedColumn<int> category = i0.GeneratedColumn<int>(
      'category', aliasedName, false,
      type: i0.DriftSqlType.int);
  @override
  LibraryView createAlias(String alias) {
    return LibraryView(attachedDatabase, alias);
  }

  @override
  i0.Query? get query => null;
  @override
  Set<String> get readTables => const {
        'mangas',
        'chapters',
        'excluded_scanlators',
        'history',
        'mangas_categories'
      };
}

class LibraryViewDrift extends i3.ModularAccessor {
  LibraryViewDrift(i0.GeneratedDatabase db) : super(db);
  i0.Selectable<i1.LibraryViewData> library() {
    return customSelect('SELECT * FROM libraryView', variables: [], readsFrom: {
      mangas,
      chapters,
      excludedScanlators,
      history,
      mangasCategories,
    }).asyncMap(libraryView.mapFromRow);
  }

  i1.LibraryView get libraryView =>
      this.resultSet<i1.LibraryView>('libraryView');
  i2.Mangas get mangas => this.resultSet<i2.Mangas>('mangas');
  i4.Chapters get chapters => this.resultSet<i4.Chapters>('chapters');
  i5.ExcludedScanlators get excludedScanlators =>
      this.resultSet<i5.ExcludedScanlators>('excluded_scanlators');
  i6.History get history => this.resultSet<i6.History>('history');
  i7.MangasCategories get mangasCategories =>
      this.resultSet<i7.MangasCategories>('mangas_categories');
}
