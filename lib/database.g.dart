// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $MangaItemsTable extends MangaItems
    with TableInfo<$MangaItemsTable, Manga> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MangaItemsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<BigInt> id = GeneratedColumn<BigInt>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.bigInt,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _sourceMeta = const VerificationMeta('source');
  @override
  late final GeneratedColumn<BigInt> source = GeneratedColumn<BigInt>(
      'source', aliasedName, false,
      type: DriftSqlType.bigInt, requiredDuringInsert: true);
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
  late final GeneratedColumn<BigInt> viewerFlags = GeneratedColumn<BigInt>(
      'viewer_flags', aliasedName, false,
      type: DriftSqlType.bigInt, requiredDuringInsert: true);
  static const VerificationMeta _chapterFlagsMeta =
      const VerificationMeta('chapterFlags');
  @override
  late final GeneratedColumn<BigInt> chapterFlags = GeneratedColumn<BigInt>(
      'chapter_flags', aliasedName, false,
      type: DriftSqlType.bigInt, requiredDuringInsert: true);
  static const VerificationMeta _coverLastModifiedMeta =
      const VerificationMeta('coverLastModified');
  @override
  late final GeneratedColumn<BigInt> coverLastModified =
      GeneratedColumn<BigInt>('cover_last_modified', aliasedName, false,
          type: DriftSqlType.bigInt, requiredDuringInsert: true);
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
  late final GeneratedColumn<BigInt> status = GeneratedColumn<BigInt>(
      'status', aliasedName, false,
      type: DriftSqlType.bigInt, requiredDuringInsert: true);
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
          .read(DriftSqlType.bigInt, data['${effectivePrefix}id'])!,
      source: attachedDatabase.typeMapping
          .read(DriftSqlType.bigInt, data['${effectivePrefix}source'])!,
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
          .read(DriftSqlType.bigInt, data['${effectivePrefix}viewer_flags'])!,
      chapterFlags: attachedDatabase.typeMapping
          .read(DriftSqlType.bigInt, data['${effectivePrefix}chapter_flags'])!,
      coverLastModified: attachedDatabase.typeMapping.read(
          DriftSqlType.bigInt, data['${effectivePrefix}cover_last_modified'])!,
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
          .read(DriftSqlType.bigInt, data['${effectivePrefix}status'])!,
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
  final BigInt id;
  final BigInt source;
  final bool favorite;
  final DateTime lastUpdate;
  final DateTime nextUpdate;
  final int fetchInterval;
  final DateTime dateAdded;
  final BigInt viewerFlags;
  final BigInt chapterFlags;
  final BigInt coverLastModified;
  final String url;
  final String title;
  final String? artist;
  final String? author;
  final String? description;
  final List<String> genre;
  final BigInt status;
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
    map['id'] = Variable<BigInt>(id);
    map['source'] = Variable<BigInt>(source);
    map['favorite'] = Variable<bool>(favorite);
    map['last_update'] = Variable<DateTime>(lastUpdate);
    map['next_update'] = Variable<DateTime>(nextUpdate);
    map['fetch_interval'] = Variable<int>(fetchInterval);
    map['date_added'] = Variable<DateTime>(dateAdded);
    map['viewer_flags'] = Variable<BigInt>(viewerFlags);
    map['chapter_flags'] = Variable<BigInt>(chapterFlags);
    map['cover_last_modified'] = Variable<BigInt>(coverLastModified);
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
    map['status'] = Variable<BigInt>(status);
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
      id: serializer.fromJson<BigInt>(json['id']),
      source: serializer.fromJson<BigInt>(json['source']),
      favorite: serializer.fromJson<bool>(json['favorite']),
      lastUpdate: serializer.fromJson<DateTime>(json['lastUpdate']),
      nextUpdate: serializer.fromJson<DateTime>(json['nextUpdate']),
      fetchInterval: serializer.fromJson<int>(json['fetchInterval']),
      dateAdded: serializer.fromJson<DateTime>(json['dateAdded']),
      viewerFlags: serializer.fromJson<BigInt>(json['viewerFlags']),
      chapterFlags: serializer.fromJson<BigInt>(json['chapterFlags']),
      coverLastModified: serializer.fromJson<BigInt>(json['coverLastModified']),
      url: serializer.fromJson<String>(json['url']),
      title: serializer.fromJson<String>(json['title']),
      artist: serializer.fromJson<String?>(json['artist']),
      author: serializer.fromJson<String?>(json['author']),
      description: serializer.fromJson<String?>(json['description']),
      genre: serializer.fromJson<List<String>>(json['genre']),
      status: serializer.fromJson<BigInt>(json['status']),
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
      'id': serializer.toJson<BigInt>(id),
      'source': serializer.toJson<BigInt>(source),
      'favorite': serializer.toJson<bool>(favorite),
      'lastUpdate': serializer.toJson<DateTime>(lastUpdate),
      'nextUpdate': serializer.toJson<DateTime>(nextUpdate),
      'fetchInterval': serializer.toJson<int>(fetchInterval),
      'dateAdded': serializer.toJson<DateTime>(dateAdded),
      'viewerFlags': serializer.toJson<BigInt>(viewerFlags),
      'chapterFlags': serializer.toJson<BigInt>(chapterFlags),
      'coverLastModified': serializer.toJson<BigInt>(coverLastModified),
      'url': serializer.toJson<String>(url),
      'title': serializer.toJson<String>(title),
      'artist': serializer.toJson<String?>(artist),
      'author': serializer.toJson<String?>(author),
      'description': serializer.toJson<String?>(description),
      'genre': serializer.toJson<List<String>>(genre),
      'status': serializer.toJson<BigInt>(status),
      'thumbnailUrl': serializer.toJson<String?>(thumbnailUrl),
      'updateStrategy': serializer.toJson<int>(
          $MangaItemsTable.$converterupdateStrategy.toJson(updateStrategy)),
      'initialized': serializer.toJson<bool>(initialized),
      'lastModifiedAt': serializer.toJson<DateTime>(lastModifiedAt),
      'favoriteModifiedAt': serializer.toJson<DateTime?>(favoriteModifiedAt),
    };
  }

  Manga copyWith(
          {BigInt? id,
          BigInt? source,
          bool? favorite,
          DateTime? lastUpdate,
          DateTime? nextUpdate,
          int? fetchInterval,
          DateTime? dateAdded,
          BigInt? viewerFlags,
          BigInt? chapterFlags,
          BigInt? coverLastModified,
          String? url,
          String? title,
          Value<String?> artist = const Value.absent(),
          Value<String?> author = const Value.absent(),
          Value<String?> description = const Value.absent(),
          List<String>? genre,
          BigInt? status,
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
  final Value<BigInt> id;
  final Value<BigInt> source;
  final Value<bool> favorite;
  final Value<DateTime> lastUpdate;
  final Value<DateTime> nextUpdate;
  final Value<int> fetchInterval;
  final Value<DateTime> dateAdded;
  final Value<BigInt> viewerFlags;
  final Value<BigInt> chapterFlags;
  final Value<BigInt> coverLastModified;
  final Value<String> url;
  final Value<String> title;
  final Value<String?> artist;
  final Value<String?> author;
  final Value<String?> description;
  final Value<List<String>> genre;
  final Value<BigInt> status;
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
    required BigInt source,
    required bool favorite,
    required DateTime lastUpdate,
    required DateTime nextUpdate,
    required int fetchInterval,
    required DateTime dateAdded,
    required BigInt viewerFlags,
    required BigInt chapterFlags,
    required BigInt coverLastModified,
    required String url,
    required String title,
    this.artist = const Value.absent(),
    this.author = const Value.absent(),
    this.description = const Value.absent(),
    required List<String> genre,
    required BigInt status,
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
    Expression<BigInt>? id,
    Expression<BigInt>? source,
    Expression<bool>? favorite,
    Expression<DateTime>? lastUpdate,
    Expression<DateTime>? nextUpdate,
    Expression<int>? fetchInterval,
    Expression<DateTime>? dateAdded,
    Expression<BigInt>? viewerFlags,
    Expression<BigInt>? chapterFlags,
    Expression<BigInt>? coverLastModified,
    Expression<String>? url,
    Expression<String>? title,
    Expression<String>? artist,
    Expression<String>? author,
    Expression<String>? description,
    Expression<String>? genre,
    Expression<BigInt>? status,
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
      {Value<BigInt>? id,
      Value<BigInt>? source,
      Value<bool>? favorite,
      Value<DateTime>? lastUpdate,
      Value<DateTime>? nextUpdate,
      Value<int>? fetchInterval,
      Value<DateTime>? dateAdded,
      Value<BigInt>? viewerFlags,
      Value<BigInt>? chapterFlags,
      Value<BigInt>? coverLastModified,
      Value<String>? url,
      Value<String>? title,
      Value<String?>? artist,
      Value<String?>? author,
      Value<String?>? description,
      Value<List<String>>? genre,
      Value<BigInt>? status,
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
      map['id'] = Variable<BigInt>(id.value);
    }
    if (source.present) {
      map['source'] = Variable<BigInt>(source.value);
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
      map['viewer_flags'] = Variable<BigInt>(viewerFlags.value);
    }
    if (chapterFlags.present) {
      map['chapter_flags'] = Variable<BigInt>(chapterFlags.value);
    }
    if (coverLastModified.present) {
      map['cover_last_modified'] = Variable<BigInt>(coverLastModified.value);
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
      map['status'] = Variable<BigInt>(status.value);
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

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  late final $MangaItemsTable mangaItems = $MangaItemsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [mangaItems];
}
