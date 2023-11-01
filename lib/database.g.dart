// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $CategoryItemsTable extends CategoryItems
    with TableInfo<$CategoryItemsTable, Category> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CategoryItemsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _orderMeta = const VerificationMeta('order');
  @override
  late final GeneratedColumn<int> order = GeneratedColumn<int>(
      'order', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _flagsMeta = const VerificationMeta('flags');
  @override
  late final GeneratedColumn<int> flags = GeneratedColumn<int>(
      'flags', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, name, order, flags];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'category_items';
  @override
  VerificationContext validateIntegrity(Insertable<Category> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('order')) {
      context.handle(
          _orderMeta, order.isAcceptableOrUnknown(data['order']!, _orderMeta));
    } else if (isInserting) {
      context.missing(_orderMeta);
    }
    if (data.containsKey('flags')) {
      context.handle(
          _flagsMeta, flags.isAcceptableOrUnknown(data['flags']!, _flagsMeta));
    } else if (isInserting) {
      context.missing(_flagsMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Category map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Category(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      order: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}order'])!,
      flags: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}flags'])!,
    );
  }

  @override
  $CategoryItemsTable createAlias(String alias) {
    return $CategoryItemsTable(attachedDatabase, alias);
  }
}

class Category extends DataClass implements Insertable<Category> {
  final int id;
  final String name;
  final int order;
  final int flags;
  const Category(
      {required this.id,
      required this.name,
      required this.order,
      required this.flags});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['order'] = Variable<int>(order);
    map['flags'] = Variable<int>(flags);
    return map;
  }

  CategoryItemsCompanion toCompanion(bool nullToAbsent) {
    return CategoryItemsCompanion(
      id: Value(id),
      name: Value(name),
      order: Value(order),
      flags: Value(flags),
    );
  }

  factory Category.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Category(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      order: serializer.fromJson<int>(json['order']),
      flags: serializer.fromJson<int>(json['flags']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'order': serializer.toJson<int>(order),
      'flags': serializer.toJson<int>(flags),
    };
  }

  Category copyWith({int? id, String? name, int? order, int? flags}) =>
      Category(
        id: id ?? this.id,
        name: name ?? this.name,
        order: order ?? this.order,
        flags: flags ?? this.flags,
      );
  @override
  String toString() {
    return (StringBuffer('Category(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('order: $order, ')
          ..write('flags: $flags')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, order, flags);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Category &&
          other.id == this.id &&
          other.name == this.name &&
          other.order == this.order &&
          other.flags == this.flags);
}

class CategoryItemsCompanion extends UpdateCompanion<Category> {
  final Value<int> id;
  final Value<String> name;
  final Value<int> order;
  final Value<int> flags;
  const CategoryItemsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.order = const Value.absent(),
    this.flags = const Value.absent(),
  });
  CategoryItemsCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required int order,
    required int flags,
  })  : name = Value(name),
        order = Value(order),
        flags = Value(flags);
  static Insertable<Category> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<int>? order,
    Expression<int>? flags,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (order != null) 'order': order,
      if (flags != null) 'flags': flags,
    });
  }

  CategoryItemsCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<int>? order,
      Value<int>? flags}) {
    return CategoryItemsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      order: order ?? this.order,
      flags: flags ?? this.flags,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (order.present) {
      map['order'] = Variable<int>(order.value);
    }
    if (flags.present) {
      map['flags'] = Variable<int>(flags.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CategoryItemsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('order: $order, ')
          ..write('flags: $flags')
          ..write(')'))
        .toString();
  }
}

class $MangaItemsTable extends MangaItems
    with TableInfo<$MangaItemsTable, Manga> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MangaItemsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _sourceMeta = const VerificationMeta('source');
  @override
  late final GeneratedColumn<int> source = GeneratedColumn<int>(
      'source', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _favoriteMeta =
      const VerificationMeta('favorite');
  @override
  late final GeneratedColumn<bool> favorite = GeneratedColumn<bool>(
      'favorite', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("favorite" IN (0, 1))'));
  static const VerificationMeta _lastUpdateMeta =
      const VerificationMeta('lastUpdate');
  @override
  late final GeneratedColumn<DateTime> lastUpdate = GeneratedColumn<DateTime>(
      'last_update', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _nextUpdateMeta =
      const VerificationMeta('nextUpdate');
  @override
  late final GeneratedColumn<DateTime> nextUpdate = GeneratedColumn<DateTime>(
      'next_update', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _fetchIntervalMeta =
      const VerificationMeta('fetchInterval');
  @override
  late final GeneratedColumn<int> fetchInterval = GeneratedColumn<int>(
      'fetch_interval', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _dateAddedMeta =
      const VerificationMeta('dateAdded');
  @override
  late final GeneratedColumn<DateTime> dateAdded = GeneratedColumn<DateTime>(
      'date_added', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _viewerFlagsMeta =
      const VerificationMeta('viewerFlags');
  @override
  late final GeneratedColumn<int> viewerFlags = GeneratedColumn<int>(
      'viewer_flags', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _chapterFlagsMeta =
      const VerificationMeta('chapterFlags');
  @override
  late final GeneratedColumn<int> chapterFlags = GeneratedColumn<int>(
      'chapter_flags', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _coverLastModifiedMeta =
      const VerificationMeta('coverLastModified');
  @override
  late final GeneratedColumn<int> coverLastModified = GeneratedColumn<int>(
      'cover_last_modified', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _urlMeta = const VerificationMeta('url');
  @override
  late final GeneratedColumn<String> url = GeneratedColumn<String>(
      'url', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _artistMeta = const VerificationMeta('artist');
  @override
  late final GeneratedColumn<String> artist = GeneratedColumn<String>(
      'artist', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _authorMeta = const VerificationMeta('author');
  @override
  late final GeneratedColumn<String> author = GeneratedColumn<String>(
      'author', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _genreMeta = const VerificationMeta('genre');
  @override
  late final GeneratedColumnWithTypeConverter<List<String>, String> genre =
      GeneratedColumn<String>('genre', aliasedName, false,
              type: DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<List<String>>($MangaItemsTable.$convertergenre);
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<int> status = GeneratedColumn<int>(
      'status', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _thumbnailUrlMeta =
      const VerificationMeta('thumbnailUrl');
  @override
  late final GeneratedColumn<String> thumbnailUrl = GeneratedColumn<String>(
      'thumbnail_url', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _updateStrategyMeta =
      const VerificationMeta('updateStrategy');
  @override
  late final GeneratedColumnWithTypeConverter<UpdateStrategy, int>
      updateStrategy = GeneratedColumn<int>(
              'update_strategy', aliasedName, false,
              type: DriftSqlType.int, requiredDuringInsert: true)
          .withConverter<UpdateStrategy>(
              $MangaItemsTable.$converterupdateStrategy);
  static const VerificationMeta _initializedMeta =
      const VerificationMeta('initialized');
  @override
  late final GeneratedColumn<bool> initialized = GeneratedColumn<bool>(
      'initialized', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("initialized" IN (0, 1))'));
  static const VerificationMeta _lastModifiedAtMeta =
      const VerificationMeta('lastModifiedAt');
  @override
  late final GeneratedColumn<DateTime> lastModifiedAt =
      GeneratedColumn<DateTime>('last_modified_at', aliasedName, false,
          type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _favoriteModifiedAtMeta =
      const VerificationMeta('favoriteModifiedAt');
  @override
  late final GeneratedColumn<DateTime> favoriteModifiedAt =
      GeneratedColumn<DateTime>('favorite_modified_at', aliasedName, true,
          type: DriftSqlType.dateTime, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        source,
        favorite,
        lastUpdate,
        nextUpdate,
        fetchInterval,
        dateAdded,
        viewerFlags,
        chapterFlags,
        coverLastModified,
        url,
        title,
        artist,
        author,
        description,
        genre,
        status,
        thumbnailUrl,
        updateStrategy,
        initialized,
        lastModifiedAt,
        favoriteModifiedAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'manga_items';
  @override
  VerificationContext validateIntegrity(Insertable<Manga> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('source')) {
      context.handle(_sourceMeta,
          source.isAcceptableOrUnknown(data['source']!, _sourceMeta));
    } else if (isInserting) {
      context.missing(_sourceMeta);
    }
    if (data.containsKey('favorite')) {
      context.handle(_favoriteMeta,
          favorite.isAcceptableOrUnknown(data['favorite']!, _favoriteMeta));
    } else if (isInserting) {
      context.missing(_favoriteMeta);
    }
    if (data.containsKey('last_update')) {
      context.handle(
          _lastUpdateMeta,
          lastUpdate.isAcceptableOrUnknown(
              data['last_update']!, _lastUpdateMeta));
    } else if (isInserting) {
      context.missing(_lastUpdateMeta);
    }
    if (data.containsKey('next_update')) {
      context.handle(
          _nextUpdateMeta,
          nextUpdate.isAcceptableOrUnknown(
              data['next_update']!, _nextUpdateMeta));
    } else if (isInserting) {
      context.missing(_nextUpdateMeta);
    }
    if (data.containsKey('fetch_interval')) {
      context.handle(
          _fetchIntervalMeta,
          fetchInterval.isAcceptableOrUnknown(
              data['fetch_interval']!, _fetchIntervalMeta));
    } else if (isInserting) {
      context.missing(_fetchIntervalMeta);
    }
    if (data.containsKey('date_added')) {
      context.handle(_dateAddedMeta,
          dateAdded.isAcceptableOrUnknown(data['date_added']!, _dateAddedMeta));
    } else if (isInserting) {
      context.missing(_dateAddedMeta);
    }
    if (data.containsKey('viewer_flags')) {
      context.handle(
          _viewerFlagsMeta,
          viewerFlags.isAcceptableOrUnknown(
              data['viewer_flags']!, _viewerFlagsMeta));
    } else if (isInserting) {
      context.missing(_viewerFlagsMeta);
    }
    if (data.containsKey('chapter_flags')) {
      context.handle(
          _chapterFlagsMeta,
          chapterFlags.isAcceptableOrUnknown(
              data['chapter_flags']!, _chapterFlagsMeta));
    } else if (isInserting) {
      context.missing(_chapterFlagsMeta);
    }
    if (data.containsKey('cover_last_modified')) {
      context.handle(
          _coverLastModifiedMeta,
          coverLastModified.isAcceptableOrUnknown(
              data['cover_last_modified']!, _coverLastModifiedMeta));
    } else if (isInserting) {
      context.missing(_coverLastModifiedMeta);
    }
    if (data.containsKey('url')) {
      context.handle(
          _urlMeta, url.isAcceptableOrUnknown(data['url']!, _urlMeta));
    } else if (isInserting) {
      context.missing(_urlMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('artist')) {
      context.handle(_artistMeta,
          artist.isAcceptableOrUnknown(data['artist']!, _artistMeta));
    }
    if (data.containsKey('author')) {
      context.handle(_authorMeta,
          author.isAcceptableOrUnknown(data['author']!, _authorMeta));
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    }
    context.handle(_genreMeta, const VerificationResult.success());
    if (data.containsKey('status')) {
      context.handle(_statusMeta,
          status.isAcceptableOrUnknown(data['status']!, _statusMeta));
    } else if (isInserting) {
      context.missing(_statusMeta);
    }
    if (data.containsKey('thumbnail_url')) {
      context.handle(
          _thumbnailUrlMeta,
          thumbnailUrl.isAcceptableOrUnknown(
              data['thumbnail_url']!, _thumbnailUrlMeta));
    }
    context.handle(_updateStrategyMeta, const VerificationResult.success());
    if (data.containsKey('initialized')) {
      context.handle(
          _initializedMeta,
          initialized.isAcceptableOrUnknown(
              data['initialized']!, _initializedMeta));
    } else if (isInserting) {
      context.missing(_initializedMeta);
    }
    if (data.containsKey('last_modified_at')) {
      context.handle(
          _lastModifiedAtMeta,
          lastModifiedAt.isAcceptableOrUnknown(
              data['last_modified_at']!, _lastModifiedAtMeta));
    } else if (isInserting) {
      context.missing(_lastModifiedAtMeta);
    }
    if (data.containsKey('favorite_modified_at')) {
      context.handle(
          _favoriteModifiedAtMeta,
          favoriteModifiedAt.isAcceptableOrUnknown(
              data['favorite_modified_at']!, _favoriteModifiedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Manga map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Manga(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      source: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}source'])!,
      favorite: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}favorite'])!,
      lastUpdate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}last_update'])!,
      nextUpdate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}next_update'])!,
      fetchInterval: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}fetch_interval'])!,
      dateAdded: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}date_added'])!,
      viewerFlags: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}viewer_flags'])!,
      chapterFlags: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}chapter_flags'])!,
      coverLastModified: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}cover_last_modified'])!,
      url: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}url'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      artist: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}artist']),
      author: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}author']),
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description']),
      genre: $MangaItemsTable.$convertergenre.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}genre'])!),
      status: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}status'])!,
      thumbnailUrl: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}thumbnail_url']),
      updateStrategy: $MangaItemsTable.$converterupdateStrategy.fromSql(
          attachedDatabase.typeMapping.read(
              DriftSqlType.int, data['${effectivePrefix}update_strategy'])!),
      initialized: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}initialized'])!,
      lastModifiedAt: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}last_modified_at'])!,
      favoriteModifiedAt: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime,
          data['${effectivePrefix}favorite_modified_at']),
    );
  }

  @override
  $MangaItemsTable createAlias(String alias) {
    return $MangaItemsTable(attachedDatabase, alias);
  }

  static TypeConverter<List<String>, String> $convertergenre =
      const ListOfStringsConverter();
  static JsonTypeConverter2<UpdateStrategy, int, int> $converterupdateStrategy =
      const EnumIndexConverter<UpdateStrategy>(UpdateStrategy.values);
}

class Manga extends DataClass implements Insertable<Manga> {
  final int id;
  final int source;
  final bool favorite;
  final DateTime lastUpdate;
  final DateTime nextUpdate;
  final int fetchInterval;
  final DateTime dateAdded;
  final int viewerFlags;
  final int chapterFlags;
  final int coverLastModified;
  final String url;
  final String title;
  final String? artist;
  final String? author;
  final String? description;
  final List<String> genre;
  final int status;
  final String? thumbnailUrl;
  final UpdateStrategy updateStrategy;
  final bool initialized;
  final DateTime lastModifiedAt;
  final DateTime? favoriteModifiedAt;
  const Manga(
      {required this.id,
      required this.source,
      required this.favorite,
      required this.lastUpdate,
      required this.nextUpdate,
      required this.fetchInterval,
      required this.dateAdded,
      required this.viewerFlags,
      required this.chapterFlags,
      required this.coverLastModified,
      required this.url,
      required this.title,
      this.artist,
      this.author,
      this.description,
      required this.genre,
      required this.status,
      this.thumbnailUrl,
      required this.updateStrategy,
      required this.initialized,
      required this.lastModifiedAt,
      this.favoriteModifiedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['source'] = Variable<int>(source);
    map['favorite'] = Variable<bool>(favorite);
    map['last_update'] = Variable<DateTime>(lastUpdate);
    map['next_update'] = Variable<DateTime>(nextUpdate);
    map['fetch_interval'] = Variable<int>(fetchInterval);
    map['date_added'] = Variable<DateTime>(dateAdded);
    map['viewer_flags'] = Variable<int>(viewerFlags);
    map['chapter_flags'] = Variable<int>(chapterFlags);
    map['cover_last_modified'] = Variable<int>(coverLastModified);
    map['url'] = Variable<String>(url);
    map['title'] = Variable<String>(title);
    if (!nullToAbsent || artist != null) {
      map['artist'] = Variable<String>(artist);
    }
    if (!nullToAbsent || author != null) {
      map['author'] = Variable<String>(author);
    }
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    {
      final converter = $MangaItemsTable.$convertergenre;
      map['genre'] = Variable<String>(converter.toSql(genre));
    }
    map['status'] = Variable<int>(status);
    if (!nullToAbsent || thumbnailUrl != null) {
      map['thumbnail_url'] = Variable<String>(thumbnailUrl);
    }
    {
      final converter = $MangaItemsTable.$converterupdateStrategy;
      map['update_strategy'] = Variable<int>(converter.toSql(updateStrategy));
    }
    map['initialized'] = Variable<bool>(initialized);
    map['last_modified_at'] = Variable<DateTime>(lastModifiedAt);
    if (!nullToAbsent || favoriteModifiedAt != null) {
      map['favorite_modified_at'] = Variable<DateTime>(favoriteModifiedAt);
    }
    return map;
  }

  MangaItemsCompanion toCompanion(bool nullToAbsent) {
    return MangaItemsCompanion(
      id: Value(id),
      source: Value(source),
      favorite: Value(favorite),
      lastUpdate: Value(lastUpdate),
      nextUpdate: Value(nextUpdate),
      fetchInterval: Value(fetchInterval),
      dateAdded: Value(dateAdded),
      viewerFlags: Value(viewerFlags),
      chapterFlags: Value(chapterFlags),
      coverLastModified: Value(coverLastModified),
      url: Value(url),
      title: Value(title),
      artist:
          artist == null && nullToAbsent ? const Value.absent() : Value(artist),
      author:
          author == null && nullToAbsent ? const Value.absent() : Value(author),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      genre: Value(genre),
      status: Value(status),
      thumbnailUrl: thumbnailUrl == null && nullToAbsent
          ? const Value.absent()
          : Value(thumbnailUrl),
      updateStrategy: Value(updateStrategy),
      initialized: Value(initialized),
      lastModifiedAt: Value(lastModifiedAt),
      favoriteModifiedAt: favoriteModifiedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(favoriteModifiedAt),
    );
  }

  factory Manga.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Manga(
      id: serializer.fromJson<int>(json['id']),
      source: serializer.fromJson<int>(json['source']),
      favorite: serializer.fromJson<bool>(json['favorite']),
      lastUpdate: serializer.fromJson<DateTime>(json['lastUpdate']),
      nextUpdate: serializer.fromJson<DateTime>(json['nextUpdate']),
      fetchInterval: serializer.fromJson<int>(json['fetchInterval']),
      dateAdded: serializer.fromJson<DateTime>(json['dateAdded']),
      viewerFlags: serializer.fromJson<int>(json['viewerFlags']),
      chapterFlags: serializer.fromJson<int>(json['chapterFlags']),
      coverLastModified: serializer.fromJson<int>(json['coverLastModified']),
      url: serializer.fromJson<String>(json['url']),
      title: serializer.fromJson<String>(json['title']),
      artist: serializer.fromJson<String?>(json['artist']),
      author: serializer.fromJson<String?>(json['author']),
      description: serializer.fromJson<String?>(json['description']),
      genre: serializer.fromJson<List<String>>(json['genre']),
      status: serializer.fromJson<int>(json['status']),
      thumbnailUrl: serializer.fromJson<String?>(json['thumbnailUrl']),
      updateStrategy: $MangaItemsTable.$converterupdateStrategy
          .fromJson(serializer.fromJson<int>(json['updateStrategy'])),
      initialized: serializer.fromJson<bool>(json['initialized']),
      lastModifiedAt: serializer.fromJson<DateTime>(json['lastModifiedAt']),
      favoriteModifiedAt:
          serializer.fromJson<DateTime?>(json['favoriteModifiedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'source': serializer.toJson<int>(source),
      'favorite': serializer.toJson<bool>(favorite),
      'lastUpdate': serializer.toJson<DateTime>(lastUpdate),
      'nextUpdate': serializer.toJson<DateTime>(nextUpdate),
      'fetchInterval': serializer.toJson<int>(fetchInterval),
      'dateAdded': serializer.toJson<DateTime>(dateAdded),
      'viewerFlags': serializer.toJson<int>(viewerFlags),
      'chapterFlags': serializer.toJson<int>(chapterFlags),
      'coverLastModified': serializer.toJson<int>(coverLastModified),
      'url': serializer.toJson<String>(url),
      'title': serializer.toJson<String>(title),
      'artist': serializer.toJson<String?>(artist),
      'author': serializer.toJson<String?>(author),
      'description': serializer.toJson<String?>(description),
      'genre': serializer.toJson<List<String>>(genre),
      'status': serializer.toJson<int>(status),
      'thumbnailUrl': serializer.toJson<String?>(thumbnailUrl),
      'updateStrategy': serializer.toJson<int>(
          $MangaItemsTable.$converterupdateStrategy.toJson(updateStrategy)),
      'initialized': serializer.toJson<bool>(initialized),
      'lastModifiedAt': serializer.toJson<DateTime>(lastModifiedAt),
      'favoriteModifiedAt': serializer.toJson<DateTime?>(favoriteModifiedAt),
    };
  }

  Manga copyWith(
          {int? id,
          int? source,
          bool? favorite,
          DateTime? lastUpdate,
          DateTime? nextUpdate,
          int? fetchInterval,
          DateTime? dateAdded,
          int? viewerFlags,
          int? chapterFlags,
          int? coverLastModified,
          String? url,
          String? title,
          Value<String?> artist = const Value.absent(),
          Value<String?> author = const Value.absent(),
          Value<String?> description = const Value.absent(),
          List<String>? genre,
          int? status,
          Value<String?> thumbnailUrl = const Value.absent(),
          UpdateStrategy? updateStrategy,
          bool? initialized,
          DateTime? lastModifiedAt,
          Value<DateTime?> favoriteModifiedAt = const Value.absent()}) =>
      Manga(
        id: id ?? this.id,
        source: source ?? this.source,
        favorite: favorite ?? this.favorite,
        lastUpdate: lastUpdate ?? this.lastUpdate,
        nextUpdate: nextUpdate ?? this.nextUpdate,
        fetchInterval: fetchInterval ?? this.fetchInterval,
        dateAdded: dateAdded ?? this.dateAdded,
        viewerFlags: viewerFlags ?? this.viewerFlags,
        chapterFlags: chapterFlags ?? this.chapterFlags,
        coverLastModified: coverLastModified ?? this.coverLastModified,
        url: url ?? this.url,
        title: title ?? this.title,
        artist: artist.present ? artist.value : this.artist,
        author: author.present ? author.value : this.author,
        description: description.present ? description.value : this.description,
        genre: genre ?? this.genre,
        status: status ?? this.status,
        thumbnailUrl:
            thumbnailUrl.present ? thumbnailUrl.value : this.thumbnailUrl,
        updateStrategy: updateStrategy ?? this.updateStrategy,
        initialized: initialized ?? this.initialized,
        lastModifiedAt: lastModifiedAt ?? this.lastModifiedAt,
        favoriteModifiedAt: favoriteModifiedAt.present
            ? favoriteModifiedAt.value
            : this.favoriteModifiedAt,
      );
  @override
  String toString() {
    return (StringBuffer('Manga(')
          ..write('id: $id, ')
          ..write('source: $source, ')
          ..write('favorite: $favorite, ')
          ..write('lastUpdate: $lastUpdate, ')
          ..write('nextUpdate: $nextUpdate, ')
          ..write('fetchInterval: $fetchInterval, ')
          ..write('dateAdded: $dateAdded, ')
          ..write('viewerFlags: $viewerFlags, ')
          ..write('chapterFlags: $chapterFlags, ')
          ..write('coverLastModified: $coverLastModified, ')
          ..write('url: $url, ')
          ..write('title: $title, ')
          ..write('artist: $artist, ')
          ..write('author: $author, ')
          ..write('description: $description, ')
          ..write('genre: $genre, ')
          ..write('status: $status, ')
          ..write('thumbnailUrl: $thumbnailUrl, ')
          ..write('updateStrategy: $updateStrategy, ')
          ..write('initialized: $initialized, ')
          ..write('lastModifiedAt: $lastModifiedAt, ')
          ..write('favoriteModifiedAt: $favoriteModifiedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hashAll([
        id,
        source,
        favorite,
        lastUpdate,
        nextUpdate,
        fetchInterval,
        dateAdded,
        viewerFlags,
        chapterFlags,
        coverLastModified,
        url,
        title,
        artist,
        author,
        description,
        genre,
        status,
        thumbnailUrl,
        updateStrategy,
        initialized,
        lastModifiedAt,
        favoriteModifiedAt
      ]);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Manga &&
          other.id == this.id &&
          other.source == this.source &&
          other.favorite == this.favorite &&
          other.lastUpdate == this.lastUpdate &&
          other.nextUpdate == this.nextUpdate &&
          other.fetchInterval == this.fetchInterval &&
          other.dateAdded == this.dateAdded &&
          other.viewerFlags == this.viewerFlags &&
          other.chapterFlags == this.chapterFlags &&
          other.coverLastModified == this.coverLastModified &&
          other.url == this.url &&
          other.title == this.title &&
          other.artist == this.artist &&
          other.author == this.author &&
          other.description == this.description &&
          other.genre == this.genre &&
          other.status == this.status &&
          other.thumbnailUrl == this.thumbnailUrl &&
          other.updateStrategy == this.updateStrategy &&
          other.initialized == this.initialized &&
          other.lastModifiedAt == this.lastModifiedAt &&
          other.favoriteModifiedAt == this.favoriteModifiedAt);
}

class MangaItemsCompanion extends UpdateCompanion<Manga> {
  final Value<int> id;
  final Value<int> source;
  final Value<bool> favorite;
  final Value<DateTime> lastUpdate;
  final Value<DateTime> nextUpdate;
  final Value<int> fetchInterval;
  final Value<DateTime> dateAdded;
  final Value<int> viewerFlags;
  final Value<int> chapterFlags;
  final Value<int> coverLastModified;
  final Value<String> url;
  final Value<String> title;
  final Value<String?> artist;
  final Value<String?> author;
  final Value<String?> description;
  final Value<List<String>> genre;
  final Value<int> status;
  final Value<String?> thumbnailUrl;
  final Value<UpdateStrategy> updateStrategy;
  final Value<bool> initialized;
  final Value<DateTime> lastModifiedAt;
  final Value<DateTime?> favoriteModifiedAt;
  const MangaItemsCompanion({
    this.id = const Value.absent(),
    this.source = const Value.absent(),
    this.favorite = const Value.absent(),
    this.lastUpdate = const Value.absent(),
    this.nextUpdate = const Value.absent(),
    this.fetchInterval = const Value.absent(),
    this.dateAdded = const Value.absent(),
    this.viewerFlags = const Value.absent(),
    this.chapterFlags = const Value.absent(),
    this.coverLastModified = const Value.absent(),
    this.url = const Value.absent(),
    this.title = const Value.absent(),
    this.artist = const Value.absent(),
    this.author = const Value.absent(),
    this.description = const Value.absent(),
    this.genre = const Value.absent(),
    this.status = const Value.absent(),
    this.thumbnailUrl = const Value.absent(),
    this.updateStrategy = const Value.absent(),
    this.initialized = const Value.absent(),
    this.lastModifiedAt = const Value.absent(),
    this.favoriteModifiedAt = const Value.absent(),
  });
  MangaItemsCompanion.insert({
    this.id = const Value.absent(),
    required int source,
    required bool favorite,
    required DateTime lastUpdate,
    required DateTime nextUpdate,
    required int fetchInterval,
    required DateTime dateAdded,
    required int viewerFlags,
    required int chapterFlags,
    required int coverLastModified,
    required String url,
    required String title,
    this.artist = const Value.absent(),
    this.author = const Value.absent(),
    this.description = const Value.absent(),
    required List<String> genre,
    required int status,
    this.thumbnailUrl = const Value.absent(),
    required UpdateStrategy updateStrategy,
    required bool initialized,
    required DateTime lastModifiedAt,
    this.favoriteModifiedAt = const Value.absent(),
  })  : source = Value(source),
        favorite = Value(favorite),
        lastUpdate = Value(lastUpdate),
        nextUpdate = Value(nextUpdate),
        fetchInterval = Value(fetchInterval),
        dateAdded = Value(dateAdded),
        viewerFlags = Value(viewerFlags),
        chapterFlags = Value(chapterFlags),
        coverLastModified = Value(coverLastModified),
        url = Value(url),
        title = Value(title),
        genre = Value(genre),
        status = Value(status),
        updateStrategy = Value(updateStrategy),
        initialized = Value(initialized),
        lastModifiedAt = Value(lastModifiedAt);
  static Insertable<Manga> custom({
    Expression<int>? id,
    Expression<int>? source,
    Expression<bool>? favorite,
    Expression<DateTime>? lastUpdate,
    Expression<DateTime>? nextUpdate,
    Expression<int>? fetchInterval,
    Expression<DateTime>? dateAdded,
    Expression<int>? viewerFlags,
    Expression<int>? chapterFlags,
    Expression<int>? coverLastModified,
    Expression<String>? url,
    Expression<String>? title,
    Expression<String>? artist,
    Expression<String>? author,
    Expression<String>? description,
    Expression<String>? genre,
    Expression<int>? status,
    Expression<String>? thumbnailUrl,
    Expression<int>? updateStrategy,
    Expression<bool>? initialized,
    Expression<DateTime>? lastModifiedAt,
    Expression<DateTime>? favoriteModifiedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (source != null) 'source': source,
      if (favorite != null) 'favorite': favorite,
      if (lastUpdate != null) 'last_update': lastUpdate,
      if (nextUpdate != null) 'next_update': nextUpdate,
      if (fetchInterval != null) 'fetch_interval': fetchInterval,
      if (dateAdded != null) 'date_added': dateAdded,
      if (viewerFlags != null) 'viewer_flags': viewerFlags,
      if (chapterFlags != null) 'chapter_flags': chapterFlags,
      if (coverLastModified != null) 'cover_last_modified': coverLastModified,
      if (url != null) 'url': url,
      if (title != null) 'title': title,
      if (artist != null) 'artist': artist,
      if (author != null) 'author': author,
      if (description != null) 'description': description,
      if (genre != null) 'genre': genre,
      if (status != null) 'status': status,
      if (thumbnailUrl != null) 'thumbnail_url': thumbnailUrl,
      if (updateStrategy != null) 'update_strategy': updateStrategy,
      if (initialized != null) 'initialized': initialized,
      if (lastModifiedAt != null) 'last_modified_at': lastModifiedAt,
      if (favoriteModifiedAt != null)
        'favorite_modified_at': favoriteModifiedAt,
    });
  }

  MangaItemsCompanion copyWith(
      {Value<int>? id,
      Value<int>? source,
      Value<bool>? favorite,
      Value<DateTime>? lastUpdate,
      Value<DateTime>? nextUpdate,
      Value<int>? fetchInterval,
      Value<DateTime>? dateAdded,
      Value<int>? viewerFlags,
      Value<int>? chapterFlags,
      Value<int>? coverLastModified,
      Value<String>? url,
      Value<String>? title,
      Value<String?>? artist,
      Value<String?>? author,
      Value<String?>? description,
      Value<List<String>>? genre,
      Value<int>? status,
      Value<String?>? thumbnailUrl,
      Value<UpdateStrategy>? updateStrategy,
      Value<bool>? initialized,
      Value<DateTime>? lastModifiedAt,
      Value<DateTime?>? favoriteModifiedAt}) {
    return MangaItemsCompanion(
      id: id ?? this.id,
      source: source ?? this.source,
      favorite: favorite ?? this.favorite,
      lastUpdate: lastUpdate ?? this.lastUpdate,
      nextUpdate: nextUpdate ?? this.nextUpdate,
      fetchInterval: fetchInterval ?? this.fetchInterval,
      dateAdded: dateAdded ?? this.dateAdded,
      viewerFlags: viewerFlags ?? this.viewerFlags,
      chapterFlags: chapterFlags ?? this.chapterFlags,
      coverLastModified: coverLastModified ?? this.coverLastModified,
      url: url ?? this.url,
      title: title ?? this.title,
      artist: artist ?? this.artist,
      author: author ?? this.author,
      description: description ?? this.description,
      genre: genre ?? this.genre,
      status: status ?? this.status,
      thumbnailUrl: thumbnailUrl ?? this.thumbnailUrl,
      updateStrategy: updateStrategy ?? this.updateStrategy,
      initialized: initialized ?? this.initialized,
      lastModifiedAt: lastModifiedAt ?? this.lastModifiedAt,
      favoriteModifiedAt: favoriteModifiedAt ?? this.favoriteModifiedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (source.present) {
      map['source'] = Variable<int>(source.value);
    }
    if (favorite.present) {
      map['favorite'] = Variable<bool>(favorite.value);
    }
    if (lastUpdate.present) {
      map['last_update'] = Variable<DateTime>(lastUpdate.value);
    }
    if (nextUpdate.present) {
      map['next_update'] = Variable<DateTime>(nextUpdate.value);
    }
    if (fetchInterval.present) {
      map['fetch_interval'] = Variable<int>(fetchInterval.value);
    }
    if (dateAdded.present) {
      map['date_added'] = Variable<DateTime>(dateAdded.value);
    }
    if (viewerFlags.present) {
      map['viewer_flags'] = Variable<int>(viewerFlags.value);
    }
    if (chapterFlags.present) {
      map['chapter_flags'] = Variable<int>(chapterFlags.value);
    }
    if (coverLastModified.present) {
      map['cover_last_modified'] = Variable<int>(coverLastModified.value);
    }
    if (url.present) {
      map['url'] = Variable<String>(url.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (artist.present) {
      map['artist'] = Variable<String>(artist.value);
    }
    if (author.present) {
      map['author'] = Variable<String>(author.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (genre.present) {
      final converter = $MangaItemsTable.$convertergenre;

      map['genre'] = Variable<String>(converter.toSql(genre.value));
    }
    if (status.present) {
      map['status'] = Variable<int>(status.value);
    }
    if (thumbnailUrl.present) {
      map['thumbnail_url'] = Variable<String>(thumbnailUrl.value);
    }
    if (updateStrategy.present) {
      final converter = $MangaItemsTable.$converterupdateStrategy;

      map['update_strategy'] =
          Variable<int>(converter.toSql(updateStrategy.value));
    }
    if (initialized.present) {
      map['initialized'] = Variable<bool>(initialized.value);
    }
    if (lastModifiedAt.present) {
      map['last_modified_at'] = Variable<DateTime>(lastModifiedAt.value);
    }
    if (favoriteModifiedAt.present) {
      map['favorite_modified_at'] =
          Variable<DateTime>(favoriteModifiedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MangaItemsCompanion(')
          ..write('id: $id, ')
          ..write('source: $source, ')
          ..write('favorite: $favorite, ')
          ..write('lastUpdate: $lastUpdate, ')
          ..write('nextUpdate: $nextUpdate, ')
          ..write('fetchInterval: $fetchInterval, ')
          ..write('dateAdded: $dateAdded, ')
          ..write('viewerFlags: $viewerFlags, ')
          ..write('chapterFlags: $chapterFlags, ')
          ..write('coverLastModified: $coverLastModified, ')
          ..write('url: $url, ')
          ..write('title: $title, ')
          ..write('artist: $artist, ')
          ..write('author: $author, ')
          ..write('description: $description, ')
          ..write('genre: $genre, ')
          ..write('status: $status, ')
          ..write('thumbnailUrl: $thumbnailUrl, ')
          ..write('updateStrategy: $updateStrategy, ')
          ..write('initialized: $initialized, ')
          ..write('lastModifiedAt: $lastModifiedAt, ')
          ..write('favoriteModifiedAt: $favoriteModifiedAt')
          ..write(')'))
        .toString();
  }
}

class $ChapterItemsTable extends ChapterItems
    with TableInfo<$ChapterItemsTable, Chapter> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ChapterItemsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _mangaIdMeta =
      const VerificationMeta('mangaId');
  @override
  late final GeneratedColumn<int> mangaId = GeneratedColumn<int>(
      'manga_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES manga_items (id) ON DELETE CASCADE'));
  static const VerificationMeta _lastPageReadMeta =
      const VerificationMeta('lastPageRead');
  @override
  late final GeneratedColumn<int> lastPageRead = GeneratedColumn<int>(
      'last_page_read', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _dateFetchMeta =
      const VerificationMeta('dateFetch');
  @override
  late final GeneratedColumn<DateTime> dateFetch = GeneratedColumn<DateTime>(
      'date_fetch', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _sourceOrderMeta =
      const VerificationMeta('sourceOrder');
  @override
  late final GeneratedColumn<int> sourceOrder = GeneratedColumn<int>(
      'source_order', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _urlMeta = const VerificationMeta('url');
  @override
  late final GeneratedColumn<String> url = GeneratedColumn<String>(
      'url', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _dateUploadMeta =
      const VerificationMeta('dateUpload');
  @override
  late final GeneratedColumn<DateTime> dateUpload = GeneratedColumn<DateTime>(
      'date_upload', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _chapterNumberMeta =
      const VerificationMeta('chapterNumber');
  @override
  late final GeneratedColumn<double> chapterNumber = GeneratedColumn<double>(
      'chapter_number', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _scanlatorMeta =
      const VerificationMeta('scanlator');
  @override
  late final GeneratedColumn<String> scanlator = GeneratedColumn<String>(
      'scanlator', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _lastModifiedAtMeta =
      const VerificationMeta('lastModifiedAt');
  @override
  late final GeneratedColumn<DateTime> lastModifiedAt =
      GeneratedColumn<DateTime>('last_modified_at', aliasedName, false,
          type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        mangaId,
        lastPageRead,
        dateFetch,
        sourceOrder,
        url,
        name,
        dateUpload,
        chapterNumber,
        scanlator,
        lastModifiedAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'chapter_items';
  @override
  VerificationContext validateIntegrity(Insertable<Chapter> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('manga_id')) {
      context.handle(_mangaIdMeta,
          mangaId.isAcceptableOrUnknown(data['manga_id']!, _mangaIdMeta));
    } else if (isInserting) {
      context.missing(_mangaIdMeta);
    }
    if (data.containsKey('last_page_read')) {
      context.handle(
          _lastPageReadMeta,
          lastPageRead.isAcceptableOrUnknown(
              data['last_page_read']!, _lastPageReadMeta));
    } else if (isInserting) {
      context.missing(_lastPageReadMeta);
    }
    if (data.containsKey('date_fetch')) {
      context.handle(_dateFetchMeta,
          dateFetch.isAcceptableOrUnknown(data['date_fetch']!, _dateFetchMeta));
    } else if (isInserting) {
      context.missing(_dateFetchMeta);
    }
    if (data.containsKey('source_order')) {
      context.handle(
          _sourceOrderMeta,
          sourceOrder.isAcceptableOrUnknown(
              data['source_order']!, _sourceOrderMeta));
    } else if (isInserting) {
      context.missing(_sourceOrderMeta);
    }
    if (data.containsKey('url')) {
      context.handle(
          _urlMeta, url.isAcceptableOrUnknown(data['url']!, _urlMeta));
    } else if (isInserting) {
      context.missing(_urlMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('date_upload')) {
      context.handle(
          _dateUploadMeta,
          dateUpload.isAcceptableOrUnknown(
              data['date_upload']!, _dateUploadMeta));
    } else if (isInserting) {
      context.missing(_dateUploadMeta);
    }
    if (data.containsKey('chapter_number')) {
      context.handle(
          _chapterNumberMeta,
          chapterNumber.isAcceptableOrUnknown(
              data['chapter_number']!, _chapterNumberMeta));
    } else if (isInserting) {
      context.missing(_chapterNumberMeta);
    }
    if (data.containsKey('scanlator')) {
      context.handle(_scanlatorMeta,
          scanlator.isAcceptableOrUnknown(data['scanlator']!, _scanlatorMeta));
    } else if (isInserting) {
      context.missing(_scanlatorMeta);
    }
    if (data.containsKey('last_modified_at')) {
      context.handle(
          _lastModifiedAtMeta,
          lastModifiedAt.isAcceptableOrUnknown(
              data['last_modified_at']!, _lastModifiedAtMeta));
    } else if (isInserting) {
      context.missing(_lastModifiedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Chapter map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Chapter(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      mangaId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}manga_id'])!,
      lastPageRead: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}last_page_read'])!,
      dateFetch: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}date_fetch'])!,
      sourceOrder: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}source_order'])!,
      url: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}url'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      dateUpload: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}date_upload'])!,
      chapterNumber: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}chapter_number'])!,
      scanlator: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}scanlator'])!,
      lastModifiedAt: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}last_modified_at'])!,
    );
  }

  @override
  $ChapterItemsTable createAlias(String alias) {
    return $ChapterItemsTable(attachedDatabase, alias);
  }
}

class Chapter extends DataClass implements Insertable<Chapter> {
  final int id;
  final int mangaId;
  final int lastPageRead;
  final DateTime dateFetch;
  final int sourceOrder;
  final String url;
  final String name;
  final DateTime dateUpload;
  final double chapterNumber;
  final String scanlator;
  final DateTime lastModifiedAt;
  const Chapter(
      {required this.id,
      required this.mangaId,
      required this.lastPageRead,
      required this.dateFetch,
      required this.sourceOrder,
      required this.url,
      required this.name,
      required this.dateUpload,
      required this.chapterNumber,
      required this.scanlator,
      required this.lastModifiedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['manga_id'] = Variable<int>(mangaId);
    map['last_page_read'] = Variable<int>(lastPageRead);
    map['date_fetch'] = Variable<DateTime>(dateFetch);
    map['source_order'] = Variable<int>(sourceOrder);
    map['url'] = Variable<String>(url);
    map['name'] = Variable<String>(name);
    map['date_upload'] = Variable<DateTime>(dateUpload);
    map['chapter_number'] = Variable<double>(chapterNumber);
    map['scanlator'] = Variable<String>(scanlator);
    map['last_modified_at'] = Variable<DateTime>(lastModifiedAt);
    return map;
  }

  ChapterItemsCompanion toCompanion(bool nullToAbsent) {
    return ChapterItemsCompanion(
      id: Value(id),
      mangaId: Value(mangaId),
      lastPageRead: Value(lastPageRead),
      dateFetch: Value(dateFetch),
      sourceOrder: Value(sourceOrder),
      url: Value(url),
      name: Value(name),
      dateUpload: Value(dateUpload),
      chapterNumber: Value(chapterNumber),
      scanlator: Value(scanlator),
      lastModifiedAt: Value(lastModifiedAt),
    );
  }

  factory Chapter.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Chapter(
      id: serializer.fromJson<int>(json['id']),
      mangaId: serializer.fromJson<int>(json['mangaId']),
      lastPageRead: serializer.fromJson<int>(json['lastPageRead']),
      dateFetch: serializer.fromJson<DateTime>(json['dateFetch']),
      sourceOrder: serializer.fromJson<int>(json['sourceOrder']),
      url: serializer.fromJson<String>(json['url']),
      name: serializer.fromJson<String>(json['name']),
      dateUpload: serializer.fromJson<DateTime>(json['dateUpload']),
      chapterNumber: serializer.fromJson<double>(json['chapterNumber']),
      scanlator: serializer.fromJson<String>(json['scanlator']),
      lastModifiedAt: serializer.fromJson<DateTime>(json['lastModifiedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'mangaId': serializer.toJson<int>(mangaId),
      'lastPageRead': serializer.toJson<int>(lastPageRead),
      'dateFetch': serializer.toJson<DateTime>(dateFetch),
      'sourceOrder': serializer.toJson<int>(sourceOrder),
      'url': serializer.toJson<String>(url),
      'name': serializer.toJson<String>(name),
      'dateUpload': serializer.toJson<DateTime>(dateUpload),
      'chapterNumber': serializer.toJson<double>(chapterNumber),
      'scanlator': serializer.toJson<String>(scanlator),
      'lastModifiedAt': serializer.toJson<DateTime>(lastModifiedAt),
    };
  }

  Chapter copyWith(
          {int? id,
          int? mangaId,
          int? lastPageRead,
          DateTime? dateFetch,
          int? sourceOrder,
          String? url,
          String? name,
          DateTime? dateUpload,
          double? chapterNumber,
          String? scanlator,
          DateTime? lastModifiedAt}) =>
      Chapter(
        id: id ?? this.id,
        mangaId: mangaId ?? this.mangaId,
        lastPageRead: lastPageRead ?? this.lastPageRead,
        dateFetch: dateFetch ?? this.dateFetch,
        sourceOrder: sourceOrder ?? this.sourceOrder,
        url: url ?? this.url,
        name: name ?? this.name,
        dateUpload: dateUpload ?? this.dateUpload,
        chapterNumber: chapterNumber ?? this.chapterNumber,
        scanlator: scanlator ?? this.scanlator,
        lastModifiedAt: lastModifiedAt ?? this.lastModifiedAt,
      );
  @override
  String toString() {
    return (StringBuffer('Chapter(')
          ..write('id: $id, ')
          ..write('mangaId: $mangaId, ')
          ..write('lastPageRead: $lastPageRead, ')
          ..write('dateFetch: $dateFetch, ')
          ..write('sourceOrder: $sourceOrder, ')
          ..write('url: $url, ')
          ..write('name: $name, ')
          ..write('dateUpload: $dateUpload, ')
          ..write('chapterNumber: $chapterNumber, ')
          ..write('scanlator: $scanlator, ')
          ..write('lastModifiedAt: $lastModifiedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      mangaId,
      lastPageRead,
      dateFetch,
      sourceOrder,
      url,
      name,
      dateUpload,
      chapterNumber,
      scanlator,
      lastModifiedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Chapter &&
          other.id == this.id &&
          other.mangaId == this.mangaId &&
          other.lastPageRead == this.lastPageRead &&
          other.dateFetch == this.dateFetch &&
          other.sourceOrder == this.sourceOrder &&
          other.url == this.url &&
          other.name == this.name &&
          other.dateUpload == this.dateUpload &&
          other.chapterNumber == this.chapterNumber &&
          other.scanlator == this.scanlator &&
          other.lastModifiedAt == this.lastModifiedAt);
}

class ChapterItemsCompanion extends UpdateCompanion<Chapter> {
  final Value<int> id;
  final Value<int> mangaId;
  final Value<int> lastPageRead;
  final Value<DateTime> dateFetch;
  final Value<int> sourceOrder;
  final Value<String> url;
  final Value<String> name;
  final Value<DateTime> dateUpload;
  final Value<double> chapterNumber;
  final Value<String> scanlator;
  final Value<DateTime> lastModifiedAt;
  const ChapterItemsCompanion({
    this.id = const Value.absent(),
    this.mangaId = const Value.absent(),
    this.lastPageRead = const Value.absent(),
    this.dateFetch = const Value.absent(),
    this.sourceOrder = const Value.absent(),
    this.url = const Value.absent(),
    this.name = const Value.absent(),
    this.dateUpload = const Value.absent(),
    this.chapterNumber = const Value.absent(),
    this.scanlator = const Value.absent(),
    this.lastModifiedAt = const Value.absent(),
  });
  ChapterItemsCompanion.insert({
    this.id = const Value.absent(),
    required int mangaId,
    required int lastPageRead,
    required DateTime dateFetch,
    required int sourceOrder,
    required String url,
    required String name,
    required DateTime dateUpload,
    required double chapterNumber,
    required String scanlator,
    required DateTime lastModifiedAt,
  })  : mangaId = Value(mangaId),
        lastPageRead = Value(lastPageRead),
        dateFetch = Value(dateFetch),
        sourceOrder = Value(sourceOrder),
        url = Value(url),
        name = Value(name),
        dateUpload = Value(dateUpload),
        chapterNumber = Value(chapterNumber),
        scanlator = Value(scanlator),
        lastModifiedAt = Value(lastModifiedAt);
  static Insertable<Chapter> custom({
    Expression<int>? id,
    Expression<int>? mangaId,
    Expression<int>? lastPageRead,
    Expression<DateTime>? dateFetch,
    Expression<int>? sourceOrder,
    Expression<String>? url,
    Expression<String>? name,
    Expression<DateTime>? dateUpload,
    Expression<double>? chapterNumber,
    Expression<String>? scanlator,
    Expression<DateTime>? lastModifiedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (mangaId != null) 'manga_id': mangaId,
      if (lastPageRead != null) 'last_page_read': lastPageRead,
      if (dateFetch != null) 'date_fetch': dateFetch,
      if (sourceOrder != null) 'source_order': sourceOrder,
      if (url != null) 'url': url,
      if (name != null) 'name': name,
      if (dateUpload != null) 'date_upload': dateUpload,
      if (chapterNumber != null) 'chapter_number': chapterNumber,
      if (scanlator != null) 'scanlator': scanlator,
      if (lastModifiedAt != null) 'last_modified_at': lastModifiedAt,
    });
  }

  ChapterItemsCompanion copyWith(
      {Value<int>? id,
      Value<int>? mangaId,
      Value<int>? lastPageRead,
      Value<DateTime>? dateFetch,
      Value<int>? sourceOrder,
      Value<String>? url,
      Value<String>? name,
      Value<DateTime>? dateUpload,
      Value<double>? chapterNumber,
      Value<String>? scanlator,
      Value<DateTime>? lastModifiedAt}) {
    return ChapterItemsCompanion(
      id: id ?? this.id,
      mangaId: mangaId ?? this.mangaId,
      lastPageRead: lastPageRead ?? this.lastPageRead,
      dateFetch: dateFetch ?? this.dateFetch,
      sourceOrder: sourceOrder ?? this.sourceOrder,
      url: url ?? this.url,
      name: name ?? this.name,
      dateUpload: dateUpload ?? this.dateUpload,
      chapterNumber: chapterNumber ?? this.chapterNumber,
      scanlator: scanlator ?? this.scanlator,
      lastModifiedAt: lastModifiedAt ?? this.lastModifiedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (mangaId.present) {
      map['manga_id'] = Variable<int>(mangaId.value);
    }
    if (lastPageRead.present) {
      map['last_page_read'] = Variable<int>(lastPageRead.value);
    }
    if (dateFetch.present) {
      map['date_fetch'] = Variable<DateTime>(dateFetch.value);
    }
    if (sourceOrder.present) {
      map['source_order'] = Variable<int>(sourceOrder.value);
    }
    if (url.present) {
      map['url'] = Variable<String>(url.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (dateUpload.present) {
      map['date_upload'] = Variable<DateTime>(dateUpload.value);
    }
    if (chapterNumber.present) {
      map['chapter_number'] = Variable<double>(chapterNumber.value);
    }
    if (scanlator.present) {
      map['scanlator'] = Variable<String>(scanlator.value);
    }
    if (lastModifiedAt.present) {
      map['last_modified_at'] = Variable<DateTime>(lastModifiedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ChapterItemsCompanion(')
          ..write('id: $id, ')
          ..write('mangaId: $mangaId, ')
          ..write('lastPageRead: $lastPageRead, ')
          ..write('dateFetch: $dateFetch, ')
          ..write('sourceOrder: $sourceOrder, ')
          ..write('url: $url, ')
          ..write('name: $name, ')
          ..write('dateUpload: $dateUpload, ')
          ..write('chapterNumber: $chapterNumber, ')
          ..write('scanlator: $scanlator, ')
          ..write('lastModifiedAt: $lastModifiedAt')
          ..write(')'))
        .toString();
  }
}

class $HistoryItemsTable extends HistoryItems
    with TableInfo<$HistoryItemsTable, History> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $HistoryItemsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _chapterIdMeta =
      const VerificationMeta('chapterId');
  @override
  late final GeneratedColumn<int> chapterId = GeneratedColumn<int>(
      'chapter_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES chapter_items (id) ON DELETE CASCADE'));
  static const VerificationMeta _readAtMeta = const VerificationMeta('readAt');
  @override
  late final GeneratedColumn<DateTime> readAt = GeneratedColumn<DateTime>(
      'read_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _readDurationMeta =
      const VerificationMeta('readDuration');
  @override
  late final GeneratedColumn<int> readDuration = GeneratedColumn<int>(
      'read_duration', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, chapterId, readAt, readDuration];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'history_items';
  @override
  VerificationContext validateIntegrity(Insertable<History> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('chapter_id')) {
      context.handle(_chapterIdMeta,
          chapterId.isAcceptableOrUnknown(data['chapter_id']!, _chapterIdMeta));
    } else if (isInserting) {
      context.missing(_chapterIdMeta);
    }
    if (data.containsKey('read_at')) {
      context.handle(_readAtMeta,
          readAt.isAcceptableOrUnknown(data['read_at']!, _readAtMeta));
    }
    if (data.containsKey('read_duration')) {
      context.handle(
          _readDurationMeta,
          readDuration.isAcceptableOrUnknown(
              data['read_duration']!, _readDurationMeta));
    } else if (isInserting) {
      context.missing(_readDurationMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  History map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return History(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      chapterId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}chapter_id'])!,
      readAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}read_at']),
      readDuration: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}read_duration'])!,
    );
  }

  @override
  $HistoryItemsTable createAlias(String alias) {
    return $HistoryItemsTable(attachedDatabase, alias);
  }
}

class History extends DataClass implements Insertable<History> {
  final int id;
  final int chapterId;
  final DateTime? readAt;
  final int readDuration;
  const History(
      {required this.id,
      required this.chapterId,
      this.readAt,
      required this.readDuration});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['chapter_id'] = Variable<int>(chapterId);
    if (!nullToAbsent || readAt != null) {
      map['read_at'] = Variable<DateTime>(readAt);
    }
    map['read_duration'] = Variable<int>(readDuration);
    return map;
  }

  HistoryItemsCompanion toCompanion(bool nullToAbsent) {
    return HistoryItemsCompanion(
      id: Value(id),
      chapterId: Value(chapterId),
      readAt:
          readAt == null && nullToAbsent ? const Value.absent() : Value(readAt),
      readDuration: Value(readDuration),
    );
  }

  factory History.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return History(
      id: serializer.fromJson<int>(json['id']),
      chapterId: serializer.fromJson<int>(json['chapterId']),
      readAt: serializer.fromJson<DateTime?>(json['readAt']),
      readDuration: serializer.fromJson<int>(json['readDuration']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'chapterId': serializer.toJson<int>(chapterId),
      'readAt': serializer.toJson<DateTime?>(readAt),
      'readDuration': serializer.toJson<int>(readDuration),
    };
  }

  History copyWith(
          {int? id,
          int? chapterId,
          Value<DateTime?> readAt = const Value.absent(),
          int? readDuration}) =>
      History(
        id: id ?? this.id,
        chapterId: chapterId ?? this.chapterId,
        readAt: readAt.present ? readAt.value : this.readAt,
        readDuration: readDuration ?? this.readDuration,
      );
  @override
  String toString() {
    return (StringBuffer('History(')
          ..write('id: $id, ')
          ..write('chapterId: $chapterId, ')
          ..write('readAt: $readAt, ')
          ..write('readDuration: $readDuration')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, chapterId, readAt, readDuration);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is History &&
          other.id == this.id &&
          other.chapterId == this.chapterId &&
          other.readAt == this.readAt &&
          other.readDuration == this.readDuration);
}

class HistoryItemsCompanion extends UpdateCompanion<History> {
  final Value<int> id;
  final Value<int> chapterId;
  final Value<DateTime?> readAt;
  final Value<int> readDuration;
  const HistoryItemsCompanion({
    this.id = const Value.absent(),
    this.chapterId = const Value.absent(),
    this.readAt = const Value.absent(),
    this.readDuration = const Value.absent(),
  });
  HistoryItemsCompanion.insert({
    this.id = const Value.absent(),
    required int chapterId,
    this.readAt = const Value.absent(),
    required int readDuration,
  })  : chapterId = Value(chapterId),
        readDuration = Value(readDuration);
  static Insertable<History> custom({
    Expression<int>? id,
    Expression<int>? chapterId,
    Expression<DateTime>? readAt,
    Expression<int>? readDuration,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (chapterId != null) 'chapter_id': chapterId,
      if (readAt != null) 'read_at': readAt,
      if (readDuration != null) 'read_duration': readDuration,
    });
  }

  HistoryItemsCompanion copyWith(
      {Value<int>? id,
      Value<int>? chapterId,
      Value<DateTime?>? readAt,
      Value<int>? readDuration}) {
    return HistoryItemsCompanion(
      id: id ?? this.id,
      chapterId: chapterId ?? this.chapterId,
      readAt: readAt ?? this.readAt,
      readDuration: readDuration ?? this.readDuration,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (chapterId.present) {
      map['chapter_id'] = Variable<int>(chapterId.value);
    }
    if (readAt.present) {
      map['read_at'] = Variable<DateTime>(readAt.value);
    }
    if (readDuration.present) {
      map['read_duration'] = Variable<int>(readDuration.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('HistoryItemsCompanion(')
          ..write('id: $id, ')
          ..write('chapterId: $chapterId, ')
          ..write('readAt: $readAt, ')
          ..write('readDuration: $readDuration')
          ..write(')'))
        .toString();
  }
}

class $SourceItemsTable extends SourceItems
    with TableInfo<$SourceItemsTable, Source> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SourceItemsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _langMeta = const VerificationMeta('lang');
  @override
  late final GeneratedColumn<String> lang = GeneratedColumn<String>(
      'lang', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, lang, name];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'source_items';
  @override
  VerificationContext validateIntegrity(Insertable<Source> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('lang')) {
      context.handle(
          _langMeta, lang.isAcceptableOrUnknown(data['lang']!, _langMeta));
    } else if (isInserting) {
      context.missing(_langMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Source map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Source(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      lang: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}lang'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
    );
  }

  @override
  $SourceItemsTable createAlias(String alias) {
    return $SourceItemsTable(attachedDatabase, alias);
  }
}

class Source extends DataClass implements Insertable<Source> {
  final int id;
  final String lang;
  final String name;
  const Source({required this.id, required this.lang, required this.name});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['lang'] = Variable<String>(lang);
    map['name'] = Variable<String>(name);
    return map;
  }

  SourceItemsCompanion toCompanion(bool nullToAbsent) {
    return SourceItemsCompanion(
      id: Value(id),
      lang: Value(lang),
      name: Value(name),
    );
  }

  factory Source.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Source(
      id: serializer.fromJson<int>(json['id']),
      lang: serializer.fromJson<String>(json['lang']),
      name: serializer.fromJson<String>(json['name']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'lang': serializer.toJson<String>(lang),
      'name': serializer.toJson<String>(name),
    };
  }

  Source copyWith({int? id, String? lang, String? name}) => Source(
        id: id ?? this.id,
        lang: lang ?? this.lang,
        name: name ?? this.name,
      );
  @override
  String toString() {
    return (StringBuffer('Source(')
          ..write('id: $id, ')
          ..write('lang: $lang, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, lang, name);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Source &&
          other.id == this.id &&
          other.lang == this.lang &&
          other.name == this.name);
}

class SourceItemsCompanion extends UpdateCompanion<Source> {
  final Value<int> id;
  final Value<String> lang;
  final Value<String> name;
  const SourceItemsCompanion({
    this.id = const Value.absent(),
    this.lang = const Value.absent(),
    this.name = const Value.absent(),
  });
  SourceItemsCompanion.insert({
    this.id = const Value.absent(),
    required String lang,
    required String name,
  })  : lang = Value(lang),
        name = Value(name);
  static Insertable<Source> custom({
    Expression<int>? id,
    Expression<String>? lang,
    Expression<String>? name,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (lang != null) 'lang': lang,
      if (name != null) 'name': name,
    });
  }

  SourceItemsCompanion copyWith(
      {Value<int>? id, Value<String>? lang, Value<String>? name}) {
    return SourceItemsCompanion(
      id: id ?? this.id,
      lang: lang ?? this.lang,
      name: name ?? this.name,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (lang.present) {
      map['lang'] = Variable<String>(lang.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SourceItemsCompanion(')
          ..write('id: $id, ')
          ..write('lang: $lang, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  late final $CategoryItemsTable categoryItems = $CategoryItemsTable(this);
  late final $MangaItemsTable mangaItems = $MangaItemsTable(this);
  late final $ChapterItemsTable chapterItems = $ChapterItemsTable(this);
  late final $HistoryItemsTable historyItems = $HistoryItemsTable(this);
  late final $SourceItemsTable sourceItems = $SourceItemsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [categoryItems, mangaItems, chapterItems, historyItems, sourceItems];
  @override
  StreamQueryUpdateRules get streamUpdateRules => const StreamQueryUpdateRules(
        [
          WritePropagation(
            on: TableUpdateQuery.onTableName('manga_items',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('chapter_items', kind: UpdateKind.delete),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('chapter_items',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('history_items', kind: UpdateKind.delete),
            ],
          ),
        ],
      );
}
