// ignore_for_file: type=lint
import 'package:drift/drift.dart' as i0;
import 'package:flutteryomi/data/drift/data/mangas.drift.dart' as i1;
import 'package:flutteryomi/data/database_adapter.dart' as i2;
import 'package:drift/internal/modular.dart' as i3;

class Mangas extends i0.Table with i0.TableInfo<Mangas, i1.Manga> {
  @override
  final i0.GeneratedDatabase attachedDatabase;
  final String? _alias;
  Mangas(this.attachedDatabase, [this._alias]);
  static const i0.VerificationMeta _idMeta = const i0.VerificationMeta('id');
  late final i0.GeneratedColumn<int> id = i0.GeneratedColumn<int>(
      '_id', aliasedName, false,
      type: i0.DriftSqlType.int,
      requiredDuringInsert: false,
      $customConstraints: 'NOT NULL PRIMARY KEY');
  static const i0.VerificationMeta _sourceMeta =
      const i0.VerificationMeta('source');
  late final i0.GeneratedColumn<int> source = i0.GeneratedColumn<int>(
      'source', aliasedName, false,
      type: i0.DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const i0.VerificationMeta _urlMeta = const i0.VerificationMeta('url');
  late final i0.GeneratedColumn<String> url = i0.GeneratedColumn<String>(
      'url', aliasedName, false,
      type: i0.DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const i0.VerificationMeta _artistMeta =
      const i0.VerificationMeta('artist');
  late final i0.GeneratedColumn<String> artist = i0.GeneratedColumn<String>(
      'artist', aliasedName, true,
      type: i0.DriftSqlType.string,
      requiredDuringInsert: false,
      $customConstraints: '');
  static const i0.VerificationMeta _authorMeta =
      const i0.VerificationMeta('author');
  late final i0.GeneratedColumn<String> author = i0.GeneratedColumn<String>(
      'author', aliasedName, true,
      type: i0.DriftSqlType.string,
      requiredDuringInsert: false,
      $customConstraints: '');
  static const i0.VerificationMeta _descriptionMeta =
      const i0.VerificationMeta('description');
  late final i0.GeneratedColumn<String> description =
      i0.GeneratedColumn<String>('description', aliasedName, true,
          type: i0.DriftSqlType.string,
          requiredDuringInsert: false,
          $customConstraints: '');
  static const i0.VerificationMeta _genreMeta =
      const i0.VerificationMeta('genre');
  late final i0.GeneratedColumnWithTypeConverter<List<String>?, String> genre =
      i0.GeneratedColumn<String>('genre', aliasedName, true,
              type: i0.DriftSqlType.string,
              requiredDuringInsert: false,
              $customConstraints: '')
          .withConverter<List<String>?>(i1.Mangas.$convertergenren);
  static const i0.VerificationMeta _titleMeta =
      const i0.VerificationMeta('title');
  late final i0.GeneratedColumn<String> title = i0.GeneratedColumn<String>(
      'title', aliasedName, false,
      type: i0.DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const i0.VerificationMeta _statusMeta =
      const i0.VerificationMeta('status');
  late final i0.GeneratedColumn<int> status = i0.GeneratedColumn<int>(
      'status', aliasedName, false,
      type: i0.DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const i0.VerificationMeta _thumbnailUrlMeta =
      const i0.VerificationMeta('thumbnailUrl');
  late final i0.GeneratedColumn<String> thumbnailUrl =
      i0.GeneratedColumn<String>('thumbnail_url', aliasedName, true,
          type: i0.DriftSqlType.string,
          requiredDuringInsert: false,
          $customConstraints: '');
  static const i0.VerificationMeta _favoriteMeta =
      const i0.VerificationMeta('favorite');
  late final i0.GeneratedColumn<bool> favorite = i0.GeneratedColumn<bool>(
      'favorite', aliasedName, false,
      type: i0.DriftSqlType.bool,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const i0.VerificationMeta _lastUpdateMeta =
      const i0.VerificationMeta('lastUpdate');
  late final i0.GeneratedColumn<DateTime> lastUpdate =
      i0.GeneratedColumn<DateTime>('last_update', aliasedName, true,
          type: i0.DriftSqlType.dateTime,
          requiredDuringInsert: false,
          $customConstraints: '');
  static const i0.VerificationMeta _nextUpdateMeta =
      const i0.VerificationMeta('nextUpdate');
  late final i0.GeneratedColumn<DateTime> nextUpdate =
      i0.GeneratedColumn<DateTime>('next_update', aliasedName, true,
          type: i0.DriftSqlType.dateTime,
          requiredDuringInsert: false,
          $customConstraints: '');
  static const i0.VerificationMeta _initializedMeta =
      const i0.VerificationMeta('initialized');
  late final i0.GeneratedColumn<bool> initialized = i0.GeneratedColumn<bool>(
      'initialized', aliasedName, false,
      type: i0.DriftSqlType.bool,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const i0.VerificationMeta _viewerMeta =
      const i0.VerificationMeta('viewer');
  late final i0.GeneratedColumn<int> viewer = i0.GeneratedColumn<int>(
      'viewer', aliasedName, false,
      type: i0.DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const i0.VerificationMeta _chapterFlagsMeta =
      const i0.VerificationMeta('chapterFlags');
  late final i0.GeneratedColumn<int> chapterFlags = i0.GeneratedColumn<int>(
      'chapter_flags', aliasedName, false,
      type: i0.DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const i0.VerificationMeta _coverLastModifiedMeta =
      const i0.VerificationMeta('coverLastModified');
  late final i0.GeneratedColumn<DateTime> coverLastModified =
      i0.GeneratedColumn<DateTime>('cover_last_modified', aliasedName, false,
          type: i0.DriftSqlType.dateTime,
          requiredDuringInsert: true,
          $customConstraints: 'NOT NULL');
  static const i0.VerificationMeta _dateAddedMeta =
      const i0.VerificationMeta('dateAdded');
  late final i0.GeneratedColumn<DateTime> dateAdded =
      i0.GeneratedColumn<DateTime>('date_added', aliasedName, false,
          type: i0.DriftSqlType.dateTime,
          requiredDuringInsert: true,
          $customConstraints: 'NOT NULL');
  static const i0.VerificationMeta _updateStrategyMeta =
      const i0.VerificationMeta('updateStrategy');
  late final i0.GeneratedColumn<int> updateStrategy = i0.GeneratedColumn<int>(
      'update_strategy', aliasedName, false,
      type: i0.DriftSqlType.int,
      requiredDuringInsert: false,
      $customConstraints: 'NOT NULL DEFAULT 0',
      defaultValue: const i0.CustomExpression('0'));
  static const i0.VerificationMeta _calculateIntervalMeta =
      const i0.VerificationMeta('calculateInterval');
  late final i0.GeneratedColumn<int> calculateInterval =
      i0.GeneratedColumn<int>('calculate_interval', aliasedName, false,
          type: i0.DriftSqlType.int,
          requiredDuringInsert: false,
          $customConstraints: 'DEFAULT 0 NOT NULL',
          defaultValue: const i0.CustomExpression('0'));
  static const i0.VerificationMeta _lastModifiedAtMeta =
      const i0.VerificationMeta('lastModifiedAt');
  late final i0.GeneratedColumn<DateTime> lastModifiedAt =
      i0.GeneratedColumn<DateTime>('last_modified_at', aliasedName, false,
          type: i0.DriftSqlType.dateTime,
          requiredDuringInsert: false,
          $customConstraints: 'NOT NULL DEFAULT 0',
          defaultValue: const i0.CustomExpression('0'));
  static const i0.VerificationMeta _favoriteModifiedAtMeta =
      const i0.VerificationMeta('favoriteModifiedAt');
  late final i0.GeneratedColumn<DateTime> favoriteModifiedAt =
      i0.GeneratedColumn<DateTime>('favorite_modified_at', aliasedName, true,
          type: i0.DriftSqlType.dateTime,
          requiredDuringInsert: false,
          $customConstraints: '');
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
        favoriteModifiedAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'mangas';
  @override
  i0.VerificationContext validateIntegrity(i0.Insertable<i1.Manga> instance,
      {bool isInserting = false}) {
    final context = i0.VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('_id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['_id']!, _idMeta));
    }
    if (data.containsKey('source')) {
      context.handle(_sourceMeta,
          source.isAcceptableOrUnknown(data['source']!, _sourceMeta));
    } else if (isInserting) {
      context.missing(_sourceMeta);
    }
    if (data.containsKey('url')) {
      context.handle(
          _urlMeta, url.isAcceptableOrUnknown(data['url']!, _urlMeta));
    } else if (isInserting) {
      context.missing(_urlMeta);
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
    context.handle(_genreMeta, const i0.VerificationResult.success());
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
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
    }
    if (data.containsKey('next_update')) {
      context.handle(
          _nextUpdateMeta,
          nextUpdate.isAcceptableOrUnknown(
              data['next_update']!, _nextUpdateMeta));
    }
    if (data.containsKey('initialized')) {
      context.handle(
          _initializedMeta,
          initialized.isAcceptableOrUnknown(
              data['initialized']!, _initializedMeta));
    } else if (isInserting) {
      context.missing(_initializedMeta);
    }
    if (data.containsKey('viewer')) {
      context.handle(_viewerMeta,
          viewer.isAcceptableOrUnknown(data['viewer']!, _viewerMeta));
    } else if (isInserting) {
      context.missing(_viewerMeta);
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
    if (data.containsKey('date_added')) {
      context.handle(_dateAddedMeta,
          dateAdded.isAcceptableOrUnknown(data['date_added']!, _dateAddedMeta));
    } else if (isInserting) {
      context.missing(_dateAddedMeta);
    }
    if (data.containsKey('update_strategy')) {
      context.handle(
          _updateStrategyMeta,
          updateStrategy.isAcceptableOrUnknown(
              data['update_strategy']!, _updateStrategyMeta));
    }
    if (data.containsKey('calculate_interval')) {
      context.handle(
          _calculateIntervalMeta,
          calculateInterval.isAcceptableOrUnknown(
              data['calculate_interval']!, _calculateIntervalMeta));
    }
    if (data.containsKey('last_modified_at')) {
      context.handle(
          _lastModifiedAtMeta,
          lastModifiedAt.isAcceptableOrUnknown(
              data['last_modified_at']!, _lastModifiedAtMeta));
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
  Set<i0.GeneratedColumn> get $primaryKey => {id};
  @override
  i1.Manga map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return i1.Manga(
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
      genre: i1.Mangas.$convertergenren.fromSql(attachedDatabase.typeMapping
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
    );
  }

  @override
  Mangas createAlias(String alias) {
    return Mangas(attachedDatabase, alias);
  }

  static i0.TypeConverter<List<String>, String> $convertergenre =
      const i2.ListOfStringsConverter();
  static i0.TypeConverter<List<String>?, String?> $convertergenren =
      i0.NullAwareTypeConverter.wrap($convertergenre);
  @override
  bool get dontWriteConstraints => true;
}

class Manga extends i0.DataClass implements i0.Insertable<i1.Manga> {
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

  /// update_strategy ENUM(UpdateStrategy) NOT NULL DEFAULT 0,
  /// Built as DateTime for some reason
  final int updateStrategy;
  final int calculateInterval;
  final DateTime lastModifiedAt;
  final DateTime? favoriteModifiedAt;
  const Manga(
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
      this.favoriteModifiedAt});
  @override
  Map<String, i0.Expression> toColumns(bool nullToAbsent) {
    final map = <String, i0.Expression>{};
    map['_id'] = i0.Variable<int>(id);
    map['source'] = i0.Variable<int>(source);
    map['url'] = i0.Variable<String>(url);
    if (!nullToAbsent || artist != null) {
      map['artist'] = i0.Variable<String>(artist);
    }
    if (!nullToAbsent || author != null) {
      map['author'] = i0.Variable<String>(author);
    }
    if (!nullToAbsent || description != null) {
      map['description'] = i0.Variable<String>(description);
    }
    if (!nullToAbsent || genre != null) {
      map['genre'] =
          i0.Variable<String>(i1.Mangas.$convertergenren.toSql(genre));
    }
    map['title'] = i0.Variable<String>(title);
    map['status'] = i0.Variable<int>(status);
    if (!nullToAbsent || thumbnailUrl != null) {
      map['thumbnail_url'] = i0.Variable<String>(thumbnailUrl);
    }
    map['favorite'] = i0.Variable<bool>(favorite);
    if (!nullToAbsent || lastUpdate != null) {
      map['last_update'] = i0.Variable<DateTime>(lastUpdate);
    }
    if (!nullToAbsent || nextUpdate != null) {
      map['next_update'] = i0.Variable<DateTime>(nextUpdate);
    }
    map['initialized'] = i0.Variable<bool>(initialized);
    map['viewer'] = i0.Variable<int>(viewer);
    map['chapter_flags'] = i0.Variable<int>(chapterFlags);
    map['cover_last_modified'] = i0.Variable<DateTime>(coverLastModified);
    map['date_added'] = i0.Variable<DateTime>(dateAdded);
    map['update_strategy'] = i0.Variable<int>(updateStrategy);
    map['calculate_interval'] = i0.Variable<int>(calculateInterval);
    map['last_modified_at'] = i0.Variable<DateTime>(lastModifiedAt);
    if (!nullToAbsent || favoriteModifiedAt != null) {
      map['favorite_modified_at'] = i0.Variable<DateTime>(favoriteModifiedAt);
    }
    return map;
  }

  i1.MangasCompanion toCompanion(bool nullToAbsent) {
    return i1.MangasCompanion(
      id: i0.Value(id),
      source: i0.Value(source),
      url: i0.Value(url),
      artist: artist == null && nullToAbsent
          ? const i0.Value.absent()
          : i0.Value(artist),
      author: author == null && nullToAbsent
          ? const i0.Value.absent()
          : i0.Value(author),
      description: description == null && nullToAbsent
          ? const i0.Value.absent()
          : i0.Value(description),
      genre: genre == null && nullToAbsent
          ? const i0.Value.absent()
          : i0.Value(genre),
      title: i0.Value(title),
      status: i0.Value(status),
      thumbnailUrl: thumbnailUrl == null && nullToAbsent
          ? const i0.Value.absent()
          : i0.Value(thumbnailUrl),
      favorite: i0.Value(favorite),
      lastUpdate: lastUpdate == null && nullToAbsent
          ? const i0.Value.absent()
          : i0.Value(lastUpdate),
      nextUpdate: nextUpdate == null && nullToAbsent
          ? const i0.Value.absent()
          : i0.Value(nextUpdate),
      initialized: i0.Value(initialized),
      viewer: i0.Value(viewer),
      chapterFlags: i0.Value(chapterFlags),
      coverLastModified: i0.Value(coverLastModified),
      dateAdded: i0.Value(dateAdded),
      updateStrategy: i0.Value(updateStrategy),
      calculateInterval: i0.Value(calculateInterval),
      lastModifiedAt: i0.Value(lastModifiedAt),
      favoriteModifiedAt: favoriteModifiedAt == null && nullToAbsent
          ? const i0.Value.absent()
          : i0.Value(favoriteModifiedAt),
    );
  }

  factory Manga.fromJson(Map<String, dynamic> json,
      {i0.ValueSerializer? serializer}) {
    serializer ??= i0.driftRuntimeOptions.defaultSerializer;
    return Manga(
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
    };
  }

  i1.Manga copyWith(
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
          i0.Value<DateTime?> favoriteModifiedAt = const i0.Value.absent()}) =>
      i1.Manga(
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
      );
  @override
  String toString() {
    return (StringBuffer('Manga(')
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
          ..write('favoriteModifiedAt: $favoriteModifiedAt')
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
        favoriteModifiedAt
      ]);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is i1.Manga &&
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
          other.favoriteModifiedAt == this.favoriteModifiedAt);
}

class MangasCompanion extends i0.UpdateCompanion<i1.Manga> {
  final i0.Value<int> id;
  final i0.Value<int> source;
  final i0.Value<String> url;
  final i0.Value<String?> artist;
  final i0.Value<String?> author;
  final i0.Value<String?> description;
  final i0.Value<List<String>?> genre;
  final i0.Value<String> title;
  final i0.Value<int> status;
  final i0.Value<String?> thumbnailUrl;
  final i0.Value<bool> favorite;
  final i0.Value<DateTime?> lastUpdate;
  final i0.Value<DateTime?> nextUpdate;
  final i0.Value<bool> initialized;
  final i0.Value<int> viewer;
  final i0.Value<int> chapterFlags;
  final i0.Value<DateTime> coverLastModified;
  final i0.Value<DateTime> dateAdded;
  final i0.Value<int> updateStrategy;
  final i0.Value<int> calculateInterval;
  final i0.Value<DateTime> lastModifiedAt;
  final i0.Value<DateTime?> favoriteModifiedAt;
  const MangasCompanion({
    this.id = const i0.Value.absent(),
    this.source = const i0.Value.absent(),
    this.url = const i0.Value.absent(),
    this.artist = const i0.Value.absent(),
    this.author = const i0.Value.absent(),
    this.description = const i0.Value.absent(),
    this.genre = const i0.Value.absent(),
    this.title = const i0.Value.absent(),
    this.status = const i0.Value.absent(),
    this.thumbnailUrl = const i0.Value.absent(),
    this.favorite = const i0.Value.absent(),
    this.lastUpdate = const i0.Value.absent(),
    this.nextUpdate = const i0.Value.absent(),
    this.initialized = const i0.Value.absent(),
    this.viewer = const i0.Value.absent(),
    this.chapterFlags = const i0.Value.absent(),
    this.coverLastModified = const i0.Value.absent(),
    this.dateAdded = const i0.Value.absent(),
    this.updateStrategy = const i0.Value.absent(),
    this.calculateInterval = const i0.Value.absent(),
    this.lastModifiedAt = const i0.Value.absent(),
    this.favoriteModifiedAt = const i0.Value.absent(),
  });
  MangasCompanion.insert({
    this.id = const i0.Value.absent(),
    required int source,
    required String url,
    this.artist = const i0.Value.absent(),
    this.author = const i0.Value.absent(),
    this.description = const i0.Value.absent(),
    this.genre = const i0.Value.absent(),
    required String title,
    required int status,
    this.thumbnailUrl = const i0.Value.absent(),
    required bool favorite,
    this.lastUpdate = const i0.Value.absent(),
    this.nextUpdate = const i0.Value.absent(),
    required bool initialized,
    required int viewer,
    required int chapterFlags,
    required DateTime coverLastModified,
    required DateTime dateAdded,
    this.updateStrategy = const i0.Value.absent(),
    this.calculateInterval = const i0.Value.absent(),
    this.lastModifiedAt = const i0.Value.absent(),
    this.favoriteModifiedAt = const i0.Value.absent(),
  })  : source = i0.Value(source),
        url = i0.Value(url),
        title = i0.Value(title),
        status = i0.Value(status),
        favorite = i0.Value(favorite),
        initialized = i0.Value(initialized),
        viewer = i0.Value(viewer),
        chapterFlags = i0.Value(chapterFlags),
        coverLastModified = i0.Value(coverLastModified),
        dateAdded = i0.Value(dateAdded);
  static i0.Insertable<i1.Manga> custom({
    i0.Expression<int>? id,
    i0.Expression<int>? source,
    i0.Expression<String>? url,
    i0.Expression<String>? artist,
    i0.Expression<String>? author,
    i0.Expression<String>? description,
    i0.Expression<String>? genre,
    i0.Expression<String>? title,
    i0.Expression<int>? status,
    i0.Expression<String>? thumbnailUrl,
    i0.Expression<bool>? favorite,
    i0.Expression<DateTime>? lastUpdate,
    i0.Expression<DateTime>? nextUpdate,
    i0.Expression<bool>? initialized,
    i0.Expression<int>? viewer,
    i0.Expression<int>? chapterFlags,
    i0.Expression<DateTime>? coverLastModified,
    i0.Expression<DateTime>? dateAdded,
    i0.Expression<int>? updateStrategy,
    i0.Expression<int>? calculateInterval,
    i0.Expression<DateTime>? lastModifiedAt,
    i0.Expression<DateTime>? favoriteModifiedAt,
  }) {
    return i0.RawValuesInsertable({
      if (id != null) '_id': id,
      if (source != null) 'source': source,
      if (url != null) 'url': url,
      if (artist != null) 'artist': artist,
      if (author != null) 'author': author,
      if (description != null) 'description': description,
      if (genre != null) 'genre': genre,
      if (title != null) 'title': title,
      if (status != null) 'status': status,
      if (thumbnailUrl != null) 'thumbnail_url': thumbnailUrl,
      if (favorite != null) 'favorite': favorite,
      if (lastUpdate != null) 'last_update': lastUpdate,
      if (nextUpdate != null) 'next_update': nextUpdate,
      if (initialized != null) 'initialized': initialized,
      if (viewer != null) 'viewer': viewer,
      if (chapterFlags != null) 'chapter_flags': chapterFlags,
      if (coverLastModified != null) 'cover_last_modified': coverLastModified,
      if (dateAdded != null) 'date_added': dateAdded,
      if (updateStrategy != null) 'update_strategy': updateStrategy,
      if (calculateInterval != null) 'calculate_interval': calculateInterval,
      if (lastModifiedAt != null) 'last_modified_at': lastModifiedAt,
      if (favoriteModifiedAt != null)
        'favorite_modified_at': favoriteModifiedAt,
    });
  }

  i1.MangasCompanion copyWith(
      {i0.Value<int>? id,
      i0.Value<int>? source,
      i0.Value<String>? url,
      i0.Value<String?>? artist,
      i0.Value<String?>? author,
      i0.Value<String?>? description,
      i0.Value<List<String>?>? genre,
      i0.Value<String>? title,
      i0.Value<int>? status,
      i0.Value<String?>? thumbnailUrl,
      i0.Value<bool>? favorite,
      i0.Value<DateTime?>? lastUpdate,
      i0.Value<DateTime?>? nextUpdate,
      i0.Value<bool>? initialized,
      i0.Value<int>? viewer,
      i0.Value<int>? chapterFlags,
      i0.Value<DateTime>? coverLastModified,
      i0.Value<DateTime>? dateAdded,
      i0.Value<int>? updateStrategy,
      i0.Value<int>? calculateInterval,
      i0.Value<DateTime>? lastModifiedAt,
      i0.Value<DateTime?>? favoriteModifiedAt}) {
    return i1.MangasCompanion(
      id: id ?? this.id,
      source: source ?? this.source,
      url: url ?? this.url,
      artist: artist ?? this.artist,
      author: author ?? this.author,
      description: description ?? this.description,
      genre: genre ?? this.genre,
      title: title ?? this.title,
      status: status ?? this.status,
      thumbnailUrl: thumbnailUrl ?? this.thumbnailUrl,
      favorite: favorite ?? this.favorite,
      lastUpdate: lastUpdate ?? this.lastUpdate,
      nextUpdate: nextUpdate ?? this.nextUpdate,
      initialized: initialized ?? this.initialized,
      viewer: viewer ?? this.viewer,
      chapterFlags: chapterFlags ?? this.chapterFlags,
      coverLastModified: coverLastModified ?? this.coverLastModified,
      dateAdded: dateAdded ?? this.dateAdded,
      updateStrategy: updateStrategy ?? this.updateStrategy,
      calculateInterval: calculateInterval ?? this.calculateInterval,
      lastModifiedAt: lastModifiedAt ?? this.lastModifiedAt,
      favoriteModifiedAt: favoriteModifiedAt ?? this.favoriteModifiedAt,
    );
  }

  @override
  Map<String, i0.Expression> toColumns(bool nullToAbsent) {
    final map = <String, i0.Expression>{};
    if (id.present) {
      map['_id'] = i0.Variable<int>(id.value);
    }
    if (source.present) {
      map['source'] = i0.Variable<int>(source.value);
    }
    if (url.present) {
      map['url'] = i0.Variable<String>(url.value);
    }
    if (artist.present) {
      map['artist'] = i0.Variable<String>(artist.value);
    }
    if (author.present) {
      map['author'] = i0.Variable<String>(author.value);
    }
    if (description.present) {
      map['description'] = i0.Variable<String>(description.value);
    }
    if (genre.present) {
      map['genre'] =
          i0.Variable<String>(i1.Mangas.$convertergenren.toSql(genre.value));
    }
    if (title.present) {
      map['title'] = i0.Variable<String>(title.value);
    }
    if (status.present) {
      map['status'] = i0.Variable<int>(status.value);
    }
    if (thumbnailUrl.present) {
      map['thumbnail_url'] = i0.Variable<String>(thumbnailUrl.value);
    }
    if (favorite.present) {
      map['favorite'] = i0.Variable<bool>(favorite.value);
    }
    if (lastUpdate.present) {
      map['last_update'] = i0.Variable<DateTime>(lastUpdate.value);
    }
    if (nextUpdate.present) {
      map['next_update'] = i0.Variable<DateTime>(nextUpdate.value);
    }
    if (initialized.present) {
      map['initialized'] = i0.Variable<bool>(initialized.value);
    }
    if (viewer.present) {
      map['viewer'] = i0.Variable<int>(viewer.value);
    }
    if (chapterFlags.present) {
      map['chapter_flags'] = i0.Variable<int>(chapterFlags.value);
    }
    if (coverLastModified.present) {
      map['cover_last_modified'] =
          i0.Variable<DateTime>(coverLastModified.value);
    }
    if (dateAdded.present) {
      map['date_added'] = i0.Variable<DateTime>(dateAdded.value);
    }
    if (updateStrategy.present) {
      map['update_strategy'] = i0.Variable<int>(updateStrategy.value);
    }
    if (calculateInterval.present) {
      map['calculate_interval'] = i0.Variable<int>(calculateInterval.value);
    }
    if (lastModifiedAt.present) {
      map['last_modified_at'] = i0.Variable<DateTime>(lastModifiedAt.value);
    }
    if (favoriteModifiedAt.present) {
      map['favorite_modified_at'] =
          i0.Variable<DateTime>(favoriteModifiedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MangasCompanion(')
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
          ..write('favoriteModifiedAt: $favoriteModifiedAt')
          ..write(')'))
        .toString();
  }
}

i0.Index get libraryFavoriteIndex => i0.Index('library_favorite_index',
    'CREATE INDEX library_favorite_index ON mangas (favorite) WHERE favorite = 1');
i0.Index get mangasUrlIndex => i0.Index(
    'mangas_url_index', 'CREATE INDEX mangas_url_index ON mangas (url)');
i0.Trigger get updateLastFavoritedAtMangas => i0.Trigger(
    'CREATE TRIGGER update_last_favorited_at_mangas AFTER UPDATE OF favorite ON mangas BEGIN UPDATE mangas SET favorite_modified_at = unixepoch() WHERE _id = new._id;END',
    'update_last_favorited_at_mangas');
i0.Trigger get updateLastModifiedAtMangas => i0.Trigger(
    'CREATE TRIGGER update_last_modified_at_mangas AFTER UPDATE ON mangas BEGIN UPDATE mangas SET last_modified_at = unixepoch() WHERE _id = new._id;END',
    'update_last_modified_at_mangas');

class MangasDrift extends i3.ModularAccessor {
  MangasDrift(i0.GeneratedDatabase db) : super(db);
  i0.Selectable<i1.Manga> getMangaById({required int id}) {
    return customSelect('SELECT * FROM mangas WHERE _id = ?1', variables: [
      i0.Variable<int>(id)
    ], readsFrom: {
      mangas,
    }).asyncMap(mangas.mapFromRow);
  }

  i0.Selectable<i1.Manga> getMangaByUrlAndSource(
      {required String url, required int source}) {
    return customSelect(
        'SELECT * FROM mangas WHERE url = ?1 AND source = ?2 LIMIT 1',
        variables: [
          i0.Variable<String>(url),
          i0.Variable<int>(source)
        ],
        readsFrom: {
          mangas,
        }).asyncMap(mangas.mapFromRow);
  }

  i0.Selectable<i1.Manga> getFavorites() {
    return customSelect('SELECT * FROM mangas WHERE favorite = 1',
        variables: [],
        readsFrom: {
          mangas,
        }).asyncMap(mangas.mapFromRow);
  }

  i0.Selectable<i1.Manga> getAllManga() {
    return customSelect('SELECT * FROM mangas', variables: [], readsFrom: {
      mangas,
    }).asyncMap(mangas.mapFromRow);
  }

  i0.Selectable<i1.Manga> getMangasWithFavoriteTimestamp() {
    return customSelect(
        'SELECT * FROM mangas WHERE favorite_modified_at IS NOT NULL',
        variables: [],
        readsFrom: {
          mangas,
        }).asyncMap(mangas.mapFromRow);
  }

  i0.Selectable<GetSourceIdWithFavoriteCountResult>
      getSourceIdWithFavoriteCount() {
    return customSelect(
        'SELECT source, count(*) AS _c0 FROM mangas WHERE favorite = 1 GROUP BY source',
        variables: [],
        readsFrom: {
          mangas,
        }).map((i0.QueryRow row) => GetSourceIdWithFavoriteCountResult(
          source: row.read<int>('source'),
          count: row.read<int>('_c0'),
        ));
  }

  i0.Selectable<i1.Manga> getFavoriteBySourceId({required int sourceId}) {
    return customSelect(
        'SELECT * FROM mangas WHERE favorite = 1 AND source = ?1',
        variables: [
          i0.Variable<int>(sourceId)
        ],
        readsFrom: {
          mangas,
        }).asyncMap(mangas.mapFromRow);
  }

  i0.Selectable<i1.Manga> getDuplicateLibraryManga(
      {required String title, required int id}) {
    return customSelect(
        'SELECT * FROM mangas WHERE favorite = 1 AND LOWER(title) = ?1 AND _id != ?2',
        variables: [
          i0.Variable<String>(title),
          i0.Variable<int>(id)
        ],
        readsFrom: {
          mangas,
        }).asyncMap(mangas.mapFromRow);
  }

  Future<int> resetViewerFlags() {
    return customUpdate(
      'UPDATE mangas SET viewer = 0',
      variables: [],
      updates: {mangas},
      updateKind: i0.UpdateKind.update,
    );
  }

  i0.Selectable<GetSourceIdsWithNonLibraryMangaResult>
      getSourceIdsWithNonLibraryManga() {
    return customSelect(
        'SELECT source, COUNT(*) AS manga_count FROM mangas WHERE favorite = 0 GROUP BY source',
        variables: [],
        readsFrom: {
          mangas,
        }).map((i0.QueryRow row) => GetSourceIdsWithNonLibraryMangaResult(
          source: row.read<int>('source'),
          mangaCount: row.read<int>('manga_count'),
        ));
  }

  Future<int> deleteMangasNotInLibraryBySourceIds(
      {required List<int> sourceIds}) {
    var $arrayStartIndex = 1;
    final expandedsourceIds = $expandVar($arrayStartIndex, sourceIds.length);
    $arrayStartIndex += sourceIds.length;
    return customUpdate(
      'DELETE FROM mangas WHERE favorite = 0 AND source IN ($expandedsourceIds)',
      variables: [for (var $ in sourceIds) i0.Variable<int>($)],
      updates: {mangas},
      updateKind: i0.UpdateKind.delete,
    );
  }

  i1.Mangas get mangas => this.resultSet<i1.Mangas>('mangas');
}

class GetSourceIdWithFavoriteCountResult {
  final int source;
  final int count;
  GetSourceIdWithFavoriteCountResult({
    required this.source,
    required this.count,
  });
}

class GetSourceIdsWithNonLibraryMangaResult {
  final int source;
  final int mangaCount;
  GetSourceIdsWithNonLibraryMangaResult({
    required this.source,
    required this.mangaCount,
  });
}
