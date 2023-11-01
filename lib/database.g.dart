// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class Sources extends Table with TableInfo<Sources, Source> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  Sources(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      '_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      $customConstraints: 'NOT NULL PRIMARY KEY');
  static const VerificationMeta _langMeta = const VerificationMeta('lang');
  late final GeneratedColumn<String> lang = GeneratedColumn<String>(
      'lang', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  @override
  List<GeneratedColumn> get $columns => [id, lang, name];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'sources';
  @override
  VerificationContext validateIntegrity(Insertable<Source> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('_id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['_id']!, _idMeta));
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
          .read(DriftSqlType.int, data['${effectivePrefix}_id'])!,
      lang: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}lang'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
    );
  }

  @override
  Sources createAlias(String alias) {
    return Sources(attachedDatabase, alias);
  }

  @override
  bool get dontWriteConstraints => true;
}

class Source extends DataClass implements Insertable<Source> {
  final int id;
  final String lang;
  final String name;
  const Source({required this.id, required this.lang, required this.name});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['_id'] = Variable<int>(id);
    map['lang'] = Variable<String>(lang);
    map['name'] = Variable<String>(name);
    return map;
  }

  SourcesCompanion toCompanion(bool nullToAbsent) {
    return SourcesCompanion(
      id: Value(id),
      lang: Value(lang),
      name: Value(name),
    );
  }

  factory Source.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Source(
      id: serializer.fromJson<int>(json['_id']),
      lang: serializer.fromJson<String>(json['lang']),
      name: serializer.fromJson<String>(json['name']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      '_id': serializer.toJson<int>(id),
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

class SourcesCompanion extends UpdateCompanion<Source> {
  final Value<int> id;
  final Value<String> lang;
  final Value<String> name;
  const SourcesCompanion({
    this.id = const Value.absent(),
    this.lang = const Value.absent(),
    this.name = const Value.absent(),
  });
  SourcesCompanion.insert({
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
      if (id != null) '_id': id,
      if (lang != null) 'lang': lang,
      if (name != null) 'name': name,
    });
  }

  SourcesCompanion copyWith(
      {Value<int>? id, Value<String>? lang, Value<String>? name}) {
    return SourcesCompanion(
      id: id ?? this.id,
      lang: lang ?? this.lang,
      name: name ?? this.name,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['_id'] = Variable<int>(id.value);
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
    return (StringBuffer('SourcesCompanion(')
          ..write('id: $id, ')
          ..write('lang: $lang, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }
}

class MangasCategories extends Table
    with TableInfo<MangasCategories, MangasCategorie> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  MangasCategories(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      '_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      $customConstraints: 'NOT NULL PRIMARY KEY');
  static const VerificationMeta _mangaIdMeta =
      const VerificationMeta('mangaId');
  late final GeneratedColumn<int> mangaId = GeneratedColumn<int>(
      'manga_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _categoryIdMeta =
      const VerificationMeta('categoryId');
  late final GeneratedColumn<int> categoryId = GeneratedColumn<int>(
      'category_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _lastModifiedAtMeta =
      const VerificationMeta('lastModifiedAt');
  late final GeneratedColumn<int> lastModifiedAt = GeneratedColumn<int>(
      'last_modified_at', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      $customConstraints: 'NOT NULL DEFAULT 0',
      defaultValue: const CustomExpression('0'));
  @override
  List<GeneratedColumn> get $columns =>
      [id, mangaId, categoryId, lastModifiedAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'mangas_categories';
  @override
  VerificationContext validateIntegrity(Insertable<MangasCategorie> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('_id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['_id']!, _idMeta));
    }
    if (data.containsKey('manga_id')) {
      context.handle(_mangaIdMeta,
          mangaId.isAcceptableOrUnknown(data['manga_id']!, _mangaIdMeta));
    } else if (isInserting) {
      context.missing(_mangaIdMeta);
    }
    if (data.containsKey('category_id')) {
      context.handle(
          _categoryIdMeta,
          categoryId.isAcceptableOrUnknown(
              data['category_id']!, _categoryIdMeta));
    } else if (isInserting) {
      context.missing(_categoryIdMeta);
    }
    if (data.containsKey('last_modified_at')) {
      context.handle(
          _lastModifiedAtMeta,
          lastModifiedAt.isAcceptableOrUnknown(
              data['last_modified_at']!, _lastModifiedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  MangasCategorie map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MangasCategorie(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}_id'])!,
      mangaId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}manga_id'])!,
      categoryId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}category_id'])!,
      lastModifiedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}last_modified_at'])!,
    );
  }

  @override
  MangasCategories createAlias(String alias) {
    return MangasCategories(attachedDatabase, alias);
  }

  @override
  List<String> get customConstraints => const [
        'FOREIGN KEY(category_id)REFERENCES categories(_id)ON DELETE CASCADE',
        'FOREIGN KEY(manga_id)REFERENCES mangas(_id)ON DELETE CASCADE'
      ];
  @override
  bool get dontWriteConstraints => true;
}

class MangasCategorie extends DataClass implements Insertable<MangasCategorie> {
  final int id;
  final int mangaId;
  final int categoryId;
  final int lastModifiedAt;
  const MangasCategorie(
      {required this.id,
      required this.mangaId,
      required this.categoryId,
      required this.lastModifiedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['_id'] = Variable<int>(id);
    map['manga_id'] = Variable<int>(mangaId);
    map['category_id'] = Variable<int>(categoryId);
    map['last_modified_at'] = Variable<int>(lastModifiedAt);
    return map;
  }

  MangasCategoriesCompanion toCompanion(bool nullToAbsent) {
    return MangasCategoriesCompanion(
      id: Value(id),
      mangaId: Value(mangaId),
      categoryId: Value(categoryId),
      lastModifiedAt: Value(lastModifiedAt),
    );
  }

  factory MangasCategorie.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MangasCategorie(
      id: serializer.fromJson<int>(json['_id']),
      mangaId: serializer.fromJson<int>(json['manga_id']),
      categoryId: serializer.fromJson<int>(json['category_id']),
      lastModifiedAt: serializer.fromJson<int>(json['last_modified_at']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      '_id': serializer.toJson<int>(id),
      'manga_id': serializer.toJson<int>(mangaId),
      'category_id': serializer.toJson<int>(categoryId),
      'last_modified_at': serializer.toJson<int>(lastModifiedAt),
    };
  }

  MangasCategorie copyWith(
          {int? id, int? mangaId, int? categoryId, int? lastModifiedAt}) =>
      MangasCategorie(
        id: id ?? this.id,
        mangaId: mangaId ?? this.mangaId,
        categoryId: categoryId ?? this.categoryId,
        lastModifiedAt: lastModifiedAt ?? this.lastModifiedAt,
      );
  @override
  String toString() {
    return (StringBuffer('MangasCategorie(')
          ..write('id: $id, ')
          ..write('mangaId: $mangaId, ')
          ..write('categoryId: $categoryId, ')
          ..write('lastModifiedAt: $lastModifiedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, mangaId, categoryId, lastModifiedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MangasCategorie &&
          other.id == this.id &&
          other.mangaId == this.mangaId &&
          other.categoryId == this.categoryId &&
          other.lastModifiedAt == this.lastModifiedAt);
}

class MangasCategoriesCompanion extends UpdateCompanion<MangasCategorie> {
  final Value<int> id;
  final Value<int> mangaId;
  final Value<int> categoryId;
  final Value<int> lastModifiedAt;
  const MangasCategoriesCompanion({
    this.id = const Value.absent(),
    this.mangaId = const Value.absent(),
    this.categoryId = const Value.absent(),
    this.lastModifiedAt = const Value.absent(),
  });
  MangasCategoriesCompanion.insert({
    this.id = const Value.absent(),
    required int mangaId,
    required int categoryId,
    this.lastModifiedAt = const Value.absent(),
  })  : mangaId = Value(mangaId),
        categoryId = Value(categoryId);
  static Insertable<MangasCategorie> custom({
    Expression<int>? id,
    Expression<int>? mangaId,
    Expression<int>? categoryId,
    Expression<int>? lastModifiedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) '_id': id,
      if (mangaId != null) 'manga_id': mangaId,
      if (categoryId != null) 'category_id': categoryId,
      if (lastModifiedAt != null) 'last_modified_at': lastModifiedAt,
    });
  }

  MangasCategoriesCompanion copyWith(
      {Value<int>? id,
      Value<int>? mangaId,
      Value<int>? categoryId,
      Value<int>? lastModifiedAt}) {
    return MangasCategoriesCompanion(
      id: id ?? this.id,
      mangaId: mangaId ?? this.mangaId,
      categoryId: categoryId ?? this.categoryId,
      lastModifiedAt: lastModifiedAt ?? this.lastModifiedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['_id'] = Variable<int>(id.value);
    }
    if (mangaId.present) {
      map['manga_id'] = Variable<int>(mangaId.value);
    }
    if (categoryId.present) {
      map['category_id'] = Variable<int>(categoryId.value);
    }
    if (lastModifiedAt.present) {
      map['last_modified_at'] = Variable<int>(lastModifiedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MangasCategoriesCompanion(')
          ..write('id: $id, ')
          ..write('mangaId: $mangaId, ')
          ..write('categoryId: $categoryId, ')
          ..write('lastModifiedAt: $lastModifiedAt')
          ..write(')'))
        .toString();
  }
}

class Mangas extends Table with TableInfo<Mangas, Manga> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  Mangas(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      '_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      $customConstraints: 'NOT NULL PRIMARY KEY');
  static const VerificationMeta _sourceMeta = const VerificationMeta('source');
  late final GeneratedColumn<int> source = GeneratedColumn<int>(
      'source', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _urlMeta = const VerificationMeta('url');
  late final GeneratedColumn<String> url = GeneratedColumn<String>(
      'url', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _artistMeta = const VerificationMeta('artist');
  late final GeneratedColumn<String> artist = GeneratedColumn<String>(
      'artist', aliasedName, true,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      $customConstraints: '');
  static const VerificationMeta _authorMeta = const VerificationMeta('author');
  late final GeneratedColumn<String> author = GeneratedColumn<String>(
      'author', aliasedName, true,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      $customConstraints: '');
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, true,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      $customConstraints: '');
  static const VerificationMeta _genreMeta = const VerificationMeta('genre');
  late final GeneratedColumnWithTypeConverter<List<String>?, String> genre =
      GeneratedColumn<String>('genre', aliasedName, true,
              type: DriftSqlType.string,
              requiredDuringInsert: false,
              $customConstraints: '')
          .withConverter<List<String>?>(Mangas.$convertergenren);
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  late final GeneratedColumn<int> status = GeneratedColumn<int>(
      'status', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _thumbnailUrlMeta =
      const VerificationMeta('thumbnailUrl');
  late final GeneratedColumn<String> thumbnailUrl = GeneratedColumn<String>(
      'thumbnail_url', aliasedName, true,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      $customConstraints: '');
  static const VerificationMeta _favoriteMeta =
      const VerificationMeta('favorite');
  late final GeneratedColumn<bool> favorite = GeneratedColumn<bool>(
      'favorite', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _lastUpdateMeta =
      const VerificationMeta('lastUpdate');
  late final GeneratedColumn<DateTime> lastUpdate = GeneratedColumn<DateTime>(
      'last_update', aliasedName, true,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      $customConstraints: '');
  static const VerificationMeta _nextUpdateMeta =
      const VerificationMeta('nextUpdate');
  late final GeneratedColumn<DateTime> nextUpdate = GeneratedColumn<DateTime>(
      'next_update', aliasedName, true,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      $customConstraints: '');
  static const VerificationMeta _initializedMeta =
      const VerificationMeta('initialized');
  late final GeneratedColumn<bool> initialized = GeneratedColumn<bool>(
      'initialized', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _viewerMeta = const VerificationMeta('viewer');
  late final GeneratedColumn<int> viewer = GeneratedColumn<int>(
      'viewer', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _chapterFlagsMeta =
      const VerificationMeta('chapterFlags');
  late final GeneratedColumn<int> chapterFlags = GeneratedColumn<int>(
      'chapter_flags', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _coverLastModifiedMeta =
      const VerificationMeta('coverLastModified');
  late final GeneratedColumn<int> coverLastModified = GeneratedColumn<int>(
      'cover_last_modified', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _dateAddedMeta =
      const VerificationMeta('dateAdded');
  late final GeneratedColumn<DateTime> dateAdded = GeneratedColumn<DateTime>(
      'date_added', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _updateStrategyMeta =
      const VerificationMeta('updateStrategy');
  late final GeneratedColumnWithTypeConverter<UpdateStrategy, DateTime>
      updateStrategy = GeneratedColumn<DateTime>(
              'update_strategy', aliasedName, false,
              type: DriftSqlType.dateTime,
              requiredDuringInsert: true,
              $customConstraints: 'NOT NULL')
          .withConverter<UpdateStrategy>(Mangas.$converterupdateStrategy);
  static const VerificationMeta _calculateIntervalMeta =
      const VerificationMeta('calculateInterval');
  late final GeneratedColumn<int> calculateInterval = GeneratedColumn<int>(
      'calculate_interval', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      $customConstraints: 'DEFAULT 0 NOT NULL',
      defaultValue: const CustomExpression('0'));
  static const VerificationMeta _lastModifiedAtMeta =
      const VerificationMeta('lastModifiedAt');
  late final GeneratedColumn<DateTime> lastModifiedAt =
      GeneratedColumn<DateTime>('last_modified_at', aliasedName, false,
          type: DriftSqlType.dateTime,
          requiredDuringInsert: false,
          $customConstraints: 'NOT NULL DEFAULT 0',
          defaultValue: const CustomExpression('0'));
  static const VerificationMeta _favoriteModifiedAtMeta =
      const VerificationMeta('favoriteModifiedAt');
  late final GeneratedColumn<DateTime> favoriteModifiedAt =
      GeneratedColumn<DateTime>('favorite_modified_at', aliasedName, true,
          type: DriftSqlType.dateTime,
          requiredDuringInsert: false,
          $customConstraints: '');
  @override
  List<GeneratedColumn> get $columns => [
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
  VerificationContext validateIntegrity(Insertable<Manga> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
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
    context.handle(_genreMeta, const VerificationResult.success());
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
    context.handle(_updateStrategyMeta, const VerificationResult.success());
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
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Manga map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Manga(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}_id'])!,
      source: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}source'])!,
      url: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}url'])!,
      artist: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}artist']),
      author: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}author']),
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description']),
      genre: Mangas.$convertergenren.fromSql(attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}genre'])),
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      status: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}status'])!,
      thumbnailUrl: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}thumbnail_url']),
      favorite: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}favorite'])!,
      lastUpdate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}last_update']),
      nextUpdate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}next_update']),
      initialized: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}initialized'])!,
      viewer: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}viewer'])!,
      chapterFlags: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}chapter_flags'])!,
      coverLastModified: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}cover_last_modified'])!,
      dateAdded: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}date_added'])!,
      updateStrategy: Mangas.$converterupdateStrategy.fromSql(
          attachedDatabase.typeMapping.read(DriftSqlType.dateTime,
              data['${effectivePrefix}update_strategy'])!),
      calculateInterval: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}calculate_interval'])!,
      lastModifiedAt: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}last_modified_at'])!,
      favoriteModifiedAt: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime,
          data['${effectivePrefix}favorite_modified_at']),
    );
  }

  @override
  Mangas createAlias(String alias) {
    return Mangas(attachedDatabase, alias);
  }

  static TypeConverter<List<String>, String> $convertergenre =
      const ListOfStringsConverter();
  static TypeConverter<List<String>?, String?> $convertergenren =
      NullAwareTypeConverter.wrap($convertergenre);
  static JsonTypeConverter2<UpdateStrategy, String, String>
      $converterupdateStrategy =
      const EnumNameConverter<UpdateStrategy>(UpdateStrategy.values);
  @override
  bool get dontWriteConstraints => true;
}

class Manga extends DataClass implements Insertable<Manga> {
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
  final int coverLastModified;
  final DateTime dateAdded;
  final UpdateStrategy updateStrategy;
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
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['_id'] = Variable<int>(id);
    map['source'] = Variable<int>(source);
    map['url'] = Variable<String>(url);
    if (!nullToAbsent || artist != null) {
      map['artist'] = Variable<String>(artist);
    }
    if (!nullToAbsent || author != null) {
      map['author'] = Variable<String>(author);
    }
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    if (!nullToAbsent || genre != null) {
      final converter = Mangas.$convertergenren;
      map['genre'] = Variable<String>(converter.toSql(genre));
    }
    map['title'] = Variable<String>(title);
    map['status'] = Variable<int>(status);
    if (!nullToAbsent || thumbnailUrl != null) {
      map['thumbnail_url'] = Variable<String>(thumbnailUrl);
    }
    map['favorite'] = Variable<bool>(favorite);
    if (!nullToAbsent || lastUpdate != null) {
      map['last_update'] = Variable<DateTime>(lastUpdate);
    }
    if (!nullToAbsent || nextUpdate != null) {
      map['next_update'] = Variable<DateTime>(nextUpdate);
    }
    map['initialized'] = Variable<bool>(initialized);
    map['viewer'] = Variable<int>(viewer);
    map['chapter_flags'] = Variable<int>(chapterFlags);
    map['cover_last_modified'] = Variable<int>(coverLastModified);
    map['date_added'] = Variable<DateTime>(dateAdded);
    {
      final converter = Mangas.$converterupdateStrategy;
      map['update_strategy'] =
          Variable<DateTime>(converter.toSql(updateStrategy));
    }
    map['calculate_interval'] = Variable<int>(calculateInterval);
    map['last_modified_at'] = Variable<DateTime>(lastModifiedAt);
    if (!nullToAbsent || favoriteModifiedAt != null) {
      map['favorite_modified_at'] = Variable<DateTime>(favoriteModifiedAt);
    }
    return map;
  }

  MangasCompanion toCompanion(bool nullToAbsent) {
    return MangasCompanion(
      id: Value(id),
      source: Value(source),
      url: Value(url),
      artist:
          artist == null && nullToAbsent ? const Value.absent() : Value(artist),
      author:
          author == null && nullToAbsent ? const Value.absent() : Value(author),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      genre:
          genre == null && nullToAbsent ? const Value.absent() : Value(genre),
      title: Value(title),
      status: Value(status),
      thumbnailUrl: thumbnailUrl == null && nullToAbsent
          ? const Value.absent()
          : Value(thumbnailUrl),
      favorite: Value(favorite),
      lastUpdate: lastUpdate == null && nullToAbsent
          ? const Value.absent()
          : Value(lastUpdate),
      nextUpdate: nextUpdate == null && nullToAbsent
          ? const Value.absent()
          : Value(nextUpdate),
      initialized: Value(initialized),
      viewer: Value(viewer),
      chapterFlags: Value(chapterFlags),
      coverLastModified: Value(coverLastModified),
      dateAdded: Value(dateAdded),
      updateStrategy: Value(updateStrategy),
      calculateInterval: Value(calculateInterval),
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
      coverLastModified: serializer.fromJson<int>(json['cover_last_modified']),
      dateAdded: serializer.fromJson<DateTime>(json['date_added']),
      updateStrategy: Mangas.$converterupdateStrategy
          .fromJson(serializer.fromJson<String>(json['update_strategy'])),
      calculateInterval: serializer.fromJson<int>(json['calculate_interval']),
      lastModifiedAt: serializer.fromJson<DateTime>(json['last_modified_at']),
      favoriteModifiedAt:
          serializer.fromJson<DateTime?>(json['favorite_modified_at']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
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
      'cover_last_modified': serializer.toJson<int>(coverLastModified),
      'date_added': serializer.toJson<DateTime>(dateAdded),
      'update_strategy': serializer.toJson<String>(
          Mangas.$converterupdateStrategy.toJson(updateStrategy)),
      'calculate_interval': serializer.toJson<int>(calculateInterval),
      'last_modified_at': serializer.toJson<DateTime>(lastModifiedAt),
      'favorite_modified_at': serializer.toJson<DateTime?>(favoriteModifiedAt),
    };
  }

  Manga copyWith(
          {int? id,
          int? source,
          String? url,
          Value<String?> artist = const Value.absent(),
          Value<String?> author = const Value.absent(),
          Value<String?> description = const Value.absent(),
          Value<List<String>?> genre = const Value.absent(),
          String? title,
          int? status,
          Value<String?> thumbnailUrl = const Value.absent(),
          bool? favorite,
          Value<DateTime?> lastUpdate = const Value.absent(),
          Value<DateTime?> nextUpdate = const Value.absent(),
          bool? initialized,
          int? viewer,
          int? chapterFlags,
          int? coverLastModified,
          DateTime? dateAdded,
          UpdateStrategy? updateStrategy,
          int? calculateInterval,
          DateTime? lastModifiedAt,
          Value<DateTime?> favoriteModifiedAt = const Value.absent()}) =>
      Manga(
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
      (other is Manga &&
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

class MangasCompanion extends UpdateCompanion<Manga> {
  final Value<int> id;
  final Value<int> source;
  final Value<String> url;
  final Value<String?> artist;
  final Value<String?> author;
  final Value<String?> description;
  final Value<List<String>?> genre;
  final Value<String> title;
  final Value<int> status;
  final Value<String?> thumbnailUrl;
  final Value<bool> favorite;
  final Value<DateTime?> lastUpdate;
  final Value<DateTime?> nextUpdate;
  final Value<bool> initialized;
  final Value<int> viewer;
  final Value<int> chapterFlags;
  final Value<int> coverLastModified;
  final Value<DateTime> dateAdded;
  final Value<UpdateStrategy> updateStrategy;
  final Value<int> calculateInterval;
  final Value<DateTime> lastModifiedAt;
  final Value<DateTime?> favoriteModifiedAt;
  const MangasCompanion({
    this.id = const Value.absent(),
    this.source = const Value.absent(),
    this.url = const Value.absent(),
    this.artist = const Value.absent(),
    this.author = const Value.absent(),
    this.description = const Value.absent(),
    this.genre = const Value.absent(),
    this.title = const Value.absent(),
    this.status = const Value.absent(),
    this.thumbnailUrl = const Value.absent(),
    this.favorite = const Value.absent(),
    this.lastUpdate = const Value.absent(),
    this.nextUpdate = const Value.absent(),
    this.initialized = const Value.absent(),
    this.viewer = const Value.absent(),
    this.chapterFlags = const Value.absent(),
    this.coverLastModified = const Value.absent(),
    this.dateAdded = const Value.absent(),
    this.updateStrategy = const Value.absent(),
    this.calculateInterval = const Value.absent(),
    this.lastModifiedAt = const Value.absent(),
    this.favoriteModifiedAt = const Value.absent(),
  });
  MangasCompanion.insert({
    this.id = const Value.absent(),
    required int source,
    required String url,
    this.artist = const Value.absent(),
    this.author = const Value.absent(),
    this.description = const Value.absent(),
    this.genre = const Value.absent(),
    required String title,
    required int status,
    this.thumbnailUrl = const Value.absent(),
    required bool favorite,
    this.lastUpdate = const Value.absent(),
    this.nextUpdate = const Value.absent(),
    required bool initialized,
    required int viewer,
    required int chapterFlags,
    required int coverLastModified,
    required DateTime dateAdded,
    required UpdateStrategy updateStrategy,
    this.calculateInterval = const Value.absent(),
    this.lastModifiedAt = const Value.absent(),
    this.favoriteModifiedAt = const Value.absent(),
  })  : source = Value(source),
        url = Value(url),
        title = Value(title),
        status = Value(status),
        favorite = Value(favorite),
        initialized = Value(initialized),
        viewer = Value(viewer),
        chapterFlags = Value(chapterFlags),
        coverLastModified = Value(coverLastModified),
        dateAdded = Value(dateAdded),
        updateStrategy = Value(updateStrategy);
  static Insertable<Manga> custom({
    Expression<int>? id,
    Expression<int>? source,
    Expression<String>? url,
    Expression<String>? artist,
    Expression<String>? author,
    Expression<String>? description,
    Expression<String>? genre,
    Expression<String>? title,
    Expression<int>? status,
    Expression<String>? thumbnailUrl,
    Expression<bool>? favorite,
    Expression<DateTime>? lastUpdate,
    Expression<DateTime>? nextUpdate,
    Expression<bool>? initialized,
    Expression<int>? viewer,
    Expression<int>? chapterFlags,
    Expression<int>? coverLastModified,
    Expression<DateTime>? dateAdded,
    Expression<DateTime>? updateStrategy,
    Expression<int>? calculateInterval,
    Expression<DateTime>? lastModifiedAt,
    Expression<DateTime>? favoriteModifiedAt,
  }) {
    return RawValuesInsertable({
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

  MangasCompanion copyWith(
      {Value<int>? id,
      Value<int>? source,
      Value<String>? url,
      Value<String?>? artist,
      Value<String?>? author,
      Value<String?>? description,
      Value<List<String>?>? genre,
      Value<String>? title,
      Value<int>? status,
      Value<String?>? thumbnailUrl,
      Value<bool>? favorite,
      Value<DateTime?>? lastUpdate,
      Value<DateTime?>? nextUpdate,
      Value<bool>? initialized,
      Value<int>? viewer,
      Value<int>? chapterFlags,
      Value<int>? coverLastModified,
      Value<DateTime>? dateAdded,
      Value<UpdateStrategy>? updateStrategy,
      Value<int>? calculateInterval,
      Value<DateTime>? lastModifiedAt,
      Value<DateTime?>? favoriteModifiedAt}) {
    return MangasCompanion(
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
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['_id'] = Variable<int>(id.value);
    }
    if (source.present) {
      map['source'] = Variable<int>(source.value);
    }
    if (url.present) {
      map['url'] = Variable<String>(url.value);
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
      final converter = Mangas.$convertergenren;

      map['genre'] = Variable<String>(converter.toSql(genre.value));
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (status.present) {
      map['status'] = Variable<int>(status.value);
    }
    if (thumbnailUrl.present) {
      map['thumbnail_url'] = Variable<String>(thumbnailUrl.value);
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
    if (initialized.present) {
      map['initialized'] = Variable<bool>(initialized.value);
    }
    if (viewer.present) {
      map['viewer'] = Variable<int>(viewer.value);
    }
    if (chapterFlags.present) {
      map['chapter_flags'] = Variable<int>(chapterFlags.value);
    }
    if (coverLastModified.present) {
      map['cover_last_modified'] = Variable<int>(coverLastModified.value);
    }
    if (dateAdded.present) {
      map['date_added'] = Variable<DateTime>(dateAdded.value);
    }
    if (updateStrategy.present) {
      final converter = Mangas.$converterupdateStrategy;

      map['update_strategy'] =
          Variable<DateTime>(converter.toSql(updateStrategy.value));
    }
    if (calculateInterval.present) {
      map['calculate_interval'] = Variable<int>(calculateInterval.value);
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

class MangaSync extends Table with TableInfo<MangaSync, MangaSyncData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  MangaSync(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      '_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      $customConstraints: 'NOT NULL PRIMARY KEY');
  static const VerificationMeta _mangaIdMeta =
      const VerificationMeta('mangaId');
  late final GeneratedColumn<int> mangaId = GeneratedColumn<int>(
      'manga_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _syncIdMeta = const VerificationMeta('syncId');
  late final GeneratedColumn<int> syncId = GeneratedColumn<int>(
      'sync_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _remoteIdMeta =
      const VerificationMeta('remoteId');
  late final GeneratedColumn<int> remoteId = GeneratedColumn<int>(
      'remote_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _libraryIdMeta =
      const VerificationMeta('libraryId');
  late final GeneratedColumn<int> libraryId = GeneratedColumn<int>(
      'library_id', aliasedName, true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      $customConstraints: '');
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _lastChapterReadMeta =
      const VerificationMeta('lastChapterRead');
  late final GeneratedColumn<double> lastChapterRead = GeneratedColumn<double>(
      'last_chapter_read', aliasedName, false,
      type: DriftSqlType.double,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _totalChaptersMeta =
      const VerificationMeta('totalChapters');
  late final GeneratedColumn<int> totalChapters = GeneratedColumn<int>(
      'total_chapters', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  late final GeneratedColumn<int> status = GeneratedColumn<int>(
      'status', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _scoreMeta = const VerificationMeta('score');
  late final GeneratedColumn<double> score = GeneratedColumn<double>(
      'score', aliasedName, false,
      type: DriftSqlType.double,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _remoteUrlMeta =
      const VerificationMeta('remoteUrl');
  late final GeneratedColumn<String> remoteUrl = GeneratedColumn<String>(
      'remote_url', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _startDateMeta =
      const VerificationMeta('startDate');
  late final GeneratedColumn<int> startDate = GeneratedColumn<int>(
      'start_date', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _finishDateMeta =
      const VerificationMeta('finishDate');
  late final GeneratedColumn<int> finishDate = GeneratedColumn<int>(
      'finish_date', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  @override
  List<GeneratedColumn> get $columns => [
        id,
        mangaId,
        syncId,
        remoteId,
        libraryId,
        title,
        lastChapterRead,
        totalChapters,
        status,
        score,
        remoteUrl,
        startDate,
        finishDate
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'manga_sync';
  @override
  VerificationContext validateIntegrity(Insertable<MangaSyncData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('_id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['_id']!, _idMeta));
    }
    if (data.containsKey('manga_id')) {
      context.handle(_mangaIdMeta,
          mangaId.isAcceptableOrUnknown(data['manga_id']!, _mangaIdMeta));
    } else if (isInserting) {
      context.missing(_mangaIdMeta);
    }
    if (data.containsKey('sync_id')) {
      context.handle(_syncIdMeta,
          syncId.isAcceptableOrUnknown(data['sync_id']!, _syncIdMeta));
    } else if (isInserting) {
      context.missing(_syncIdMeta);
    }
    if (data.containsKey('remote_id')) {
      context.handle(_remoteIdMeta,
          remoteId.isAcceptableOrUnknown(data['remote_id']!, _remoteIdMeta));
    } else if (isInserting) {
      context.missing(_remoteIdMeta);
    }
    if (data.containsKey('library_id')) {
      context.handle(_libraryIdMeta,
          libraryId.isAcceptableOrUnknown(data['library_id']!, _libraryIdMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('last_chapter_read')) {
      context.handle(
          _lastChapterReadMeta,
          lastChapterRead.isAcceptableOrUnknown(
              data['last_chapter_read']!, _lastChapterReadMeta));
    } else if (isInserting) {
      context.missing(_lastChapterReadMeta);
    }
    if (data.containsKey('total_chapters')) {
      context.handle(
          _totalChaptersMeta,
          totalChapters.isAcceptableOrUnknown(
              data['total_chapters']!, _totalChaptersMeta));
    } else if (isInserting) {
      context.missing(_totalChaptersMeta);
    }
    if (data.containsKey('status')) {
      context.handle(_statusMeta,
          status.isAcceptableOrUnknown(data['status']!, _statusMeta));
    } else if (isInserting) {
      context.missing(_statusMeta);
    }
    if (data.containsKey('score')) {
      context.handle(
          _scoreMeta, score.isAcceptableOrUnknown(data['score']!, _scoreMeta));
    } else if (isInserting) {
      context.missing(_scoreMeta);
    }
    if (data.containsKey('remote_url')) {
      context.handle(_remoteUrlMeta,
          remoteUrl.isAcceptableOrUnknown(data['remote_url']!, _remoteUrlMeta));
    } else if (isInserting) {
      context.missing(_remoteUrlMeta);
    }
    if (data.containsKey('start_date')) {
      context.handle(_startDateMeta,
          startDate.isAcceptableOrUnknown(data['start_date']!, _startDateMeta));
    } else if (isInserting) {
      context.missing(_startDateMeta);
    }
    if (data.containsKey('finish_date')) {
      context.handle(
          _finishDateMeta,
          finishDate.isAcceptableOrUnknown(
              data['finish_date']!, _finishDateMeta));
    } else if (isInserting) {
      context.missing(_finishDateMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  List<Set<GeneratedColumn>> get uniqueKeys => [
        {mangaId, syncId},
      ];
  @override
  MangaSyncData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MangaSyncData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}_id'])!,
      mangaId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}manga_id'])!,
      syncId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}sync_id'])!,
      remoteId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}remote_id'])!,
      libraryId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}library_id']),
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      lastChapterRead: attachedDatabase.typeMapping.read(
          DriftSqlType.double, data['${effectivePrefix}last_chapter_read'])!,
      totalChapters: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}total_chapters'])!,
      status: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}status'])!,
      score: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}score'])!,
      remoteUrl: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}remote_url'])!,
      startDate: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}start_date'])!,
      finishDate: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}finish_date'])!,
    );
  }

  @override
  MangaSync createAlias(String alias) {
    return MangaSync(attachedDatabase, alias);
  }

  @override
  List<String> get customConstraints => const [
        'UNIQUE(manga_id, sync_id)ON CONFLICT REPLACE',
        'FOREIGN KEY(manga_id)REFERENCES mangas(_id)ON DELETE CASCADE'
      ];
  @override
  bool get dontWriteConstraints => true;
}

class MangaSyncData extends DataClass implements Insertable<MangaSyncData> {
  final int id;
  final int mangaId;
  final int syncId;
  final int remoteId;
  final int? libraryId;
  final String title;
  final double lastChapterRead;
  final int totalChapters;
  final int status;
  final double score;
  final String remoteUrl;
  final int startDate;
  final int finishDate;
  const MangaSyncData(
      {required this.id,
      required this.mangaId,
      required this.syncId,
      required this.remoteId,
      this.libraryId,
      required this.title,
      required this.lastChapterRead,
      required this.totalChapters,
      required this.status,
      required this.score,
      required this.remoteUrl,
      required this.startDate,
      required this.finishDate});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['_id'] = Variable<int>(id);
    map['manga_id'] = Variable<int>(mangaId);
    map['sync_id'] = Variable<int>(syncId);
    map['remote_id'] = Variable<int>(remoteId);
    if (!nullToAbsent || libraryId != null) {
      map['library_id'] = Variable<int>(libraryId);
    }
    map['title'] = Variable<String>(title);
    map['last_chapter_read'] = Variable<double>(lastChapterRead);
    map['total_chapters'] = Variable<int>(totalChapters);
    map['status'] = Variable<int>(status);
    map['score'] = Variable<double>(score);
    map['remote_url'] = Variable<String>(remoteUrl);
    map['start_date'] = Variable<int>(startDate);
    map['finish_date'] = Variable<int>(finishDate);
    return map;
  }

  MangaSyncCompanion toCompanion(bool nullToAbsent) {
    return MangaSyncCompanion(
      id: Value(id),
      mangaId: Value(mangaId),
      syncId: Value(syncId),
      remoteId: Value(remoteId),
      libraryId: libraryId == null && nullToAbsent
          ? const Value.absent()
          : Value(libraryId),
      title: Value(title),
      lastChapterRead: Value(lastChapterRead),
      totalChapters: Value(totalChapters),
      status: Value(status),
      score: Value(score),
      remoteUrl: Value(remoteUrl),
      startDate: Value(startDate),
      finishDate: Value(finishDate),
    );
  }

  factory MangaSyncData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MangaSyncData(
      id: serializer.fromJson<int>(json['_id']),
      mangaId: serializer.fromJson<int>(json['manga_id']),
      syncId: serializer.fromJson<int>(json['sync_id']),
      remoteId: serializer.fromJson<int>(json['remote_id']),
      libraryId: serializer.fromJson<int?>(json['library_id']),
      title: serializer.fromJson<String>(json['title']),
      lastChapterRead: serializer.fromJson<double>(json['last_chapter_read']),
      totalChapters: serializer.fromJson<int>(json['total_chapters']),
      status: serializer.fromJson<int>(json['status']),
      score: serializer.fromJson<double>(json['score']),
      remoteUrl: serializer.fromJson<String>(json['remote_url']),
      startDate: serializer.fromJson<int>(json['start_date']),
      finishDate: serializer.fromJson<int>(json['finish_date']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      '_id': serializer.toJson<int>(id),
      'manga_id': serializer.toJson<int>(mangaId),
      'sync_id': serializer.toJson<int>(syncId),
      'remote_id': serializer.toJson<int>(remoteId),
      'library_id': serializer.toJson<int?>(libraryId),
      'title': serializer.toJson<String>(title),
      'last_chapter_read': serializer.toJson<double>(lastChapterRead),
      'total_chapters': serializer.toJson<int>(totalChapters),
      'status': serializer.toJson<int>(status),
      'score': serializer.toJson<double>(score),
      'remote_url': serializer.toJson<String>(remoteUrl),
      'start_date': serializer.toJson<int>(startDate),
      'finish_date': serializer.toJson<int>(finishDate),
    };
  }

  MangaSyncData copyWith(
          {int? id,
          int? mangaId,
          int? syncId,
          int? remoteId,
          Value<int?> libraryId = const Value.absent(),
          String? title,
          double? lastChapterRead,
          int? totalChapters,
          int? status,
          double? score,
          String? remoteUrl,
          int? startDate,
          int? finishDate}) =>
      MangaSyncData(
        id: id ?? this.id,
        mangaId: mangaId ?? this.mangaId,
        syncId: syncId ?? this.syncId,
        remoteId: remoteId ?? this.remoteId,
        libraryId: libraryId.present ? libraryId.value : this.libraryId,
        title: title ?? this.title,
        lastChapterRead: lastChapterRead ?? this.lastChapterRead,
        totalChapters: totalChapters ?? this.totalChapters,
        status: status ?? this.status,
        score: score ?? this.score,
        remoteUrl: remoteUrl ?? this.remoteUrl,
        startDate: startDate ?? this.startDate,
        finishDate: finishDate ?? this.finishDate,
      );
  @override
  String toString() {
    return (StringBuffer('MangaSyncData(')
          ..write('id: $id, ')
          ..write('mangaId: $mangaId, ')
          ..write('syncId: $syncId, ')
          ..write('remoteId: $remoteId, ')
          ..write('libraryId: $libraryId, ')
          ..write('title: $title, ')
          ..write('lastChapterRead: $lastChapterRead, ')
          ..write('totalChapters: $totalChapters, ')
          ..write('status: $status, ')
          ..write('score: $score, ')
          ..write('remoteUrl: $remoteUrl, ')
          ..write('startDate: $startDate, ')
          ..write('finishDate: $finishDate')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      mangaId,
      syncId,
      remoteId,
      libraryId,
      title,
      lastChapterRead,
      totalChapters,
      status,
      score,
      remoteUrl,
      startDate,
      finishDate);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MangaSyncData &&
          other.id == this.id &&
          other.mangaId == this.mangaId &&
          other.syncId == this.syncId &&
          other.remoteId == this.remoteId &&
          other.libraryId == this.libraryId &&
          other.title == this.title &&
          other.lastChapterRead == this.lastChapterRead &&
          other.totalChapters == this.totalChapters &&
          other.status == this.status &&
          other.score == this.score &&
          other.remoteUrl == this.remoteUrl &&
          other.startDate == this.startDate &&
          other.finishDate == this.finishDate);
}

class MangaSyncCompanion extends UpdateCompanion<MangaSyncData> {
  final Value<int> id;
  final Value<int> mangaId;
  final Value<int> syncId;
  final Value<int> remoteId;
  final Value<int?> libraryId;
  final Value<String> title;
  final Value<double> lastChapterRead;
  final Value<int> totalChapters;
  final Value<int> status;
  final Value<double> score;
  final Value<String> remoteUrl;
  final Value<int> startDate;
  final Value<int> finishDate;
  const MangaSyncCompanion({
    this.id = const Value.absent(),
    this.mangaId = const Value.absent(),
    this.syncId = const Value.absent(),
    this.remoteId = const Value.absent(),
    this.libraryId = const Value.absent(),
    this.title = const Value.absent(),
    this.lastChapterRead = const Value.absent(),
    this.totalChapters = const Value.absent(),
    this.status = const Value.absent(),
    this.score = const Value.absent(),
    this.remoteUrl = const Value.absent(),
    this.startDate = const Value.absent(),
    this.finishDate = const Value.absent(),
  });
  MangaSyncCompanion.insert({
    this.id = const Value.absent(),
    required int mangaId,
    required int syncId,
    required int remoteId,
    this.libraryId = const Value.absent(),
    required String title,
    required double lastChapterRead,
    required int totalChapters,
    required int status,
    required double score,
    required String remoteUrl,
    required int startDate,
    required int finishDate,
  })  : mangaId = Value(mangaId),
        syncId = Value(syncId),
        remoteId = Value(remoteId),
        title = Value(title),
        lastChapterRead = Value(lastChapterRead),
        totalChapters = Value(totalChapters),
        status = Value(status),
        score = Value(score),
        remoteUrl = Value(remoteUrl),
        startDate = Value(startDate),
        finishDate = Value(finishDate);
  static Insertable<MangaSyncData> custom({
    Expression<int>? id,
    Expression<int>? mangaId,
    Expression<int>? syncId,
    Expression<int>? remoteId,
    Expression<int>? libraryId,
    Expression<String>? title,
    Expression<double>? lastChapterRead,
    Expression<int>? totalChapters,
    Expression<int>? status,
    Expression<double>? score,
    Expression<String>? remoteUrl,
    Expression<int>? startDate,
    Expression<int>? finishDate,
  }) {
    return RawValuesInsertable({
      if (id != null) '_id': id,
      if (mangaId != null) 'manga_id': mangaId,
      if (syncId != null) 'sync_id': syncId,
      if (remoteId != null) 'remote_id': remoteId,
      if (libraryId != null) 'library_id': libraryId,
      if (title != null) 'title': title,
      if (lastChapterRead != null) 'last_chapter_read': lastChapterRead,
      if (totalChapters != null) 'total_chapters': totalChapters,
      if (status != null) 'status': status,
      if (score != null) 'score': score,
      if (remoteUrl != null) 'remote_url': remoteUrl,
      if (startDate != null) 'start_date': startDate,
      if (finishDate != null) 'finish_date': finishDate,
    });
  }

  MangaSyncCompanion copyWith(
      {Value<int>? id,
      Value<int>? mangaId,
      Value<int>? syncId,
      Value<int>? remoteId,
      Value<int?>? libraryId,
      Value<String>? title,
      Value<double>? lastChapterRead,
      Value<int>? totalChapters,
      Value<int>? status,
      Value<double>? score,
      Value<String>? remoteUrl,
      Value<int>? startDate,
      Value<int>? finishDate}) {
    return MangaSyncCompanion(
      id: id ?? this.id,
      mangaId: mangaId ?? this.mangaId,
      syncId: syncId ?? this.syncId,
      remoteId: remoteId ?? this.remoteId,
      libraryId: libraryId ?? this.libraryId,
      title: title ?? this.title,
      lastChapterRead: lastChapterRead ?? this.lastChapterRead,
      totalChapters: totalChapters ?? this.totalChapters,
      status: status ?? this.status,
      score: score ?? this.score,
      remoteUrl: remoteUrl ?? this.remoteUrl,
      startDate: startDate ?? this.startDate,
      finishDate: finishDate ?? this.finishDate,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['_id'] = Variable<int>(id.value);
    }
    if (mangaId.present) {
      map['manga_id'] = Variable<int>(mangaId.value);
    }
    if (syncId.present) {
      map['sync_id'] = Variable<int>(syncId.value);
    }
    if (remoteId.present) {
      map['remote_id'] = Variable<int>(remoteId.value);
    }
    if (libraryId.present) {
      map['library_id'] = Variable<int>(libraryId.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (lastChapterRead.present) {
      map['last_chapter_read'] = Variable<double>(lastChapterRead.value);
    }
    if (totalChapters.present) {
      map['total_chapters'] = Variable<int>(totalChapters.value);
    }
    if (status.present) {
      map['status'] = Variable<int>(status.value);
    }
    if (score.present) {
      map['score'] = Variable<double>(score.value);
    }
    if (remoteUrl.present) {
      map['remote_url'] = Variable<String>(remoteUrl.value);
    }
    if (startDate.present) {
      map['start_date'] = Variable<int>(startDate.value);
    }
    if (finishDate.present) {
      map['finish_date'] = Variable<int>(finishDate.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MangaSyncCompanion(')
          ..write('id: $id, ')
          ..write('mangaId: $mangaId, ')
          ..write('syncId: $syncId, ')
          ..write('remoteId: $remoteId, ')
          ..write('libraryId: $libraryId, ')
          ..write('title: $title, ')
          ..write('lastChapterRead: $lastChapterRead, ')
          ..write('totalChapters: $totalChapters, ')
          ..write('status: $status, ')
          ..write('score: $score, ')
          ..write('remoteUrl: $remoteUrl, ')
          ..write('startDate: $startDate, ')
          ..write('finishDate: $finishDate')
          ..write(')'))
        .toString();
  }
}

class History extends Table with TableInfo<History, HistoryData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  History(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      '_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      $customConstraints: 'NOT NULL PRIMARY KEY');
  static const VerificationMeta _chapterIdMeta =
      const VerificationMeta('chapterId');
  late final GeneratedColumn<int> chapterId = GeneratedColumn<int>(
      'chapter_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL UNIQUE');
  static const VerificationMeta _lastReadMeta =
      const VerificationMeta('lastRead');
  late final GeneratedColumn<DateTime> lastRead = GeneratedColumn<DateTime>(
      'last_read', aliasedName, true,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      $customConstraints: '');
  static const VerificationMeta _timeReadMeta =
      const VerificationMeta('timeRead');
  late final GeneratedColumn<int> timeRead = GeneratedColumn<int>(
      'time_read', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  @override
  List<GeneratedColumn> get $columns => [id, chapterId, lastRead, timeRead];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'history';
  @override
  VerificationContext validateIntegrity(Insertable<HistoryData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('_id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['_id']!, _idMeta));
    }
    if (data.containsKey('chapter_id')) {
      context.handle(_chapterIdMeta,
          chapterId.isAcceptableOrUnknown(data['chapter_id']!, _chapterIdMeta));
    } else if (isInserting) {
      context.missing(_chapterIdMeta);
    }
    if (data.containsKey('last_read')) {
      context.handle(_lastReadMeta,
          lastRead.isAcceptableOrUnknown(data['last_read']!, _lastReadMeta));
    }
    if (data.containsKey('time_read')) {
      context.handle(_timeReadMeta,
          timeRead.isAcceptableOrUnknown(data['time_read']!, _timeReadMeta));
    } else if (isInserting) {
      context.missing(_timeReadMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  HistoryData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return HistoryData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}_id'])!,
      chapterId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}chapter_id'])!,
      lastRead: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}last_read']),
      timeRead: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}time_read'])!,
    );
  }

  @override
  History createAlias(String alias) {
    return History(attachedDatabase, alias);
  }

  @override
  List<String> get customConstraints => const [
        'FOREIGN KEY(chapter_id)REFERENCES chapters(_id)ON DELETE CASCADE'
      ];
  @override
  bool get dontWriteConstraints => true;
}

class HistoryData extends DataClass implements Insertable<HistoryData> {
  final int id;
  final int chapterId;
  final DateTime? lastRead;
  final int timeRead;
  const HistoryData(
      {required this.id,
      required this.chapterId,
      this.lastRead,
      required this.timeRead});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['_id'] = Variable<int>(id);
    map['chapter_id'] = Variable<int>(chapterId);
    if (!nullToAbsent || lastRead != null) {
      map['last_read'] = Variable<DateTime>(lastRead);
    }
    map['time_read'] = Variable<int>(timeRead);
    return map;
  }

  HistoryCompanion toCompanion(bool nullToAbsent) {
    return HistoryCompanion(
      id: Value(id),
      chapterId: Value(chapterId),
      lastRead: lastRead == null && nullToAbsent
          ? const Value.absent()
          : Value(lastRead),
      timeRead: Value(timeRead),
    );
  }

  factory HistoryData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return HistoryData(
      id: serializer.fromJson<int>(json['_id']),
      chapterId: serializer.fromJson<int>(json['chapter_id']),
      lastRead: serializer.fromJson<DateTime?>(json['last_read']),
      timeRead: serializer.fromJson<int>(json['time_read']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      '_id': serializer.toJson<int>(id),
      'chapter_id': serializer.toJson<int>(chapterId),
      'last_read': serializer.toJson<DateTime?>(lastRead),
      'time_read': serializer.toJson<int>(timeRead),
    };
  }

  HistoryData copyWith(
          {int? id,
          int? chapterId,
          Value<DateTime?> lastRead = const Value.absent(),
          int? timeRead}) =>
      HistoryData(
        id: id ?? this.id,
        chapterId: chapterId ?? this.chapterId,
        lastRead: lastRead.present ? lastRead.value : this.lastRead,
        timeRead: timeRead ?? this.timeRead,
      );
  @override
  String toString() {
    return (StringBuffer('HistoryData(')
          ..write('id: $id, ')
          ..write('chapterId: $chapterId, ')
          ..write('lastRead: $lastRead, ')
          ..write('timeRead: $timeRead')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, chapterId, lastRead, timeRead);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is HistoryData &&
          other.id == this.id &&
          other.chapterId == this.chapterId &&
          other.lastRead == this.lastRead &&
          other.timeRead == this.timeRead);
}

class HistoryCompanion extends UpdateCompanion<HistoryData> {
  final Value<int> id;
  final Value<int> chapterId;
  final Value<DateTime?> lastRead;
  final Value<int> timeRead;
  const HistoryCompanion({
    this.id = const Value.absent(),
    this.chapterId = const Value.absent(),
    this.lastRead = const Value.absent(),
    this.timeRead = const Value.absent(),
  });
  HistoryCompanion.insert({
    this.id = const Value.absent(),
    required int chapterId,
    this.lastRead = const Value.absent(),
    required int timeRead,
  })  : chapterId = Value(chapterId),
        timeRead = Value(timeRead);
  static Insertable<HistoryData> custom({
    Expression<int>? id,
    Expression<int>? chapterId,
    Expression<DateTime>? lastRead,
    Expression<int>? timeRead,
  }) {
    return RawValuesInsertable({
      if (id != null) '_id': id,
      if (chapterId != null) 'chapter_id': chapterId,
      if (lastRead != null) 'last_read': lastRead,
      if (timeRead != null) 'time_read': timeRead,
    });
  }

  HistoryCompanion copyWith(
      {Value<int>? id,
      Value<int>? chapterId,
      Value<DateTime?>? lastRead,
      Value<int>? timeRead}) {
    return HistoryCompanion(
      id: id ?? this.id,
      chapterId: chapterId ?? this.chapterId,
      lastRead: lastRead ?? this.lastRead,
      timeRead: timeRead ?? this.timeRead,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['_id'] = Variable<int>(id.value);
    }
    if (chapterId.present) {
      map['chapter_id'] = Variable<int>(chapterId.value);
    }
    if (lastRead.present) {
      map['last_read'] = Variable<DateTime>(lastRead.value);
    }
    if (timeRead.present) {
      map['time_read'] = Variable<int>(timeRead.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('HistoryCompanion(')
          ..write('id: $id, ')
          ..write('chapterId: $chapterId, ')
          ..write('lastRead: $lastRead, ')
          ..write('timeRead: $timeRead')
          ..write(')'))
        .toString();
  }
}

class Chapters extends Table with TableInfo<Chapters, Chapter> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  Chapters(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      '_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      $customConstraints: 'NOT NULL PRIMARY KEY');
  static const VerificationMeta _mangaIdMeta =
      const VerificationMeta('mangaId');
  late final GeneratedColumn<int> mangaId = GeneratedColumn<int>(
      'manga_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _urlMeta = const VerificationMeta('url');
  late final GeneratedColumn<String> url = GeneratedColumn<String>(
      'url', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _scanlatorMeta =
      const VerificationMeta('scanlator');
  late final GeneratedColumn<String> scanlator = GeneratedColumn<String>(
      'scanlator', aliasedName, true,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      $customConstraints: '');
  static const VerificationMeta _readMeta = const VerificationMeta('read');
  late final GeneratedColumn<bool> read = GeneratedColumn<bool>(
      'read', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _bookmarkMeta =
      const VerificationMeta('bookmark');
  late final GeneratedColumn<bool> bookmark = GeneratedColumn<bool>(
      'bookmark', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _lastPageReadMeta =
      const VerificationMeta('lastPageRead');
  late final GeneratedColumn<int> lastPageRead = GeneratedColumn<int>(
      'last_page_read', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _chapterNumberMeta =
      const VerificationMeta('chapterNumber');
  late final GeneratedColumn<double> chapterNumber = GeneratedColumn<double>(
      'chapter_number', aliasedName, false,
      type: DriftSqlType.double,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _sourceOrderMeta =
      const VerificationMeta('sourceOrder');
  late final GeneratedColumn<int> sourceOrder = GeneratedColumn<int>(
      'source_order', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _dateFetchMeta =
      const VerificationMeta('dateFetch');
  late final GeneratedColumn<DateTime> dateFetch = GeneratedColumn<DateTime>(
      'date_fetch', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _dateUploadMeta =
      const VerificationMeta('dateUpload');
  late final GeneratedColumn<DateTime> dateUpload = GeneratedColumn<DateTime>(
      'date_upload', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _lastModifiedAtMeta =
      const VerificationMeta('lastModifiedAt');
  late final GeneratedColumn<DateTime> lastModifiedAt =
      GeneratedColumn<DateTime>('last_modified_at', aliasedName, false,
          type: DriftSqlType.dateTime,
          requiredDuringInsert: false,
          $customConstraints: 'NOT NULL DEFAULT 0',
          defaultValue: const CustomExpression('0'));
  @override
  List<GeneratedColumn> get $columns => [
        id,
        mangaId,
        url,
        name,
        scanlator,
        read,
        bookmark,
        lastPageRead,
        chapterNumber,
        sourceOrder,
        dateFetch,
        dateUpload,
        lastModifiedAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'chapters';
  @override
  VerificationContext validateIntegrity(Insertable<Chapter> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('_id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['_id']!, _idMeta));
    }
    if (data.containsKey('manga_id')) {
      context.handle(_mangaIdMeta,
          mangaId.isAcceptableOrUnknown(data['manga_id']!, _mangaIdMeta));
    } else if (isInserting) {
      context.missing(_mangaIdMeta);
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
    if (data.containsKey('scanlator')) {
      context.handle(_scanlatorMeta,
          scanlator.isAcceptableOrUnknown(data['scanlator']!, _scanlatorMeta));
    }
    if (data.containsKey('read')) {
      context.handle(
          _readMeta, read.isAcceptableOrUnknown(data['read']!, _readMeta));
    } else if (isInserting) {
      context.missing(_readMeta);
    }
    if (data.containsKey('bookmark')) {
      context.handle(_bookmarkMeta,
          bookmark.isAcceptableOrUnknown(data['bookmark']!, _bookmarkMeta));
    } else if (isInserting) {
      context.missing(_bookmarkMeta);
    }
    if (data.containsKey('last_page_read')) {
      context.handle(
          _lastPageReadMeta,
          lastPageRead.isAcceptableOrUnknown(
              data['last_page_read']!, _lastPageReadMeta));
    } else if (isInserting) {
      context.missing(_lastPageReadMeta);
    }
    if (data.containsKey('chapter_number')) {
      context.handle(
          _chapterNumberMeta,
          chapterNumber.isAcceptableOrUnknown(
              data['chapter_number']!, _chapterNumberMeta));
    } else if (isInserting) {
      context.missing(_chapterNumberMeta);
    }
    if (data.containsKey('source_order')) {
      context.handle(
          _sourceOrderMeta,
          sourceOrder.isAcceptableOrUnknown(
              data['source_order']!, _sourceOrderMeta));
    } else if (isInserting) {
      context.missing(_sourceOrderMeta);
    }
    if (data.containsKey('date_fetch')) {
      context.handle(_dateFetchMeta,
          dateFetch.isAcceptableOrUnknown(data['date_fetch']!, _dateFetchMeta));
    } else if (isInserting) {
      context.missing(_dateFetchMeta);
    }
    if (data.containsKey('date_upload')) {
      context.handle(
          _dateUploadMeta,
          dateUpload.isAcceptableOrUnknown(
              data['date_upload']!, _dateUploadMeta));
    } else if (isInserting) {
      context.missing(_dateUploadMeta);
    }
    if (data.containsKey('last_modified_at')) {
      context.handle(
          _lastModifiedAtMeta,
          lastModifiedAt.isAcceptableOrUnknown(
              data['last_modified_at']!, _lastModifiedAtMeta));
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
          .read(DriftSqlType.int, data['${effectivePrefix}_id'])!,
      mangaId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}manga_id'])!,
      url: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}url'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      scanlator: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}scanlator']),
      read: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}read'])!,
      bookmark: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}bookmark'])!,
      lastPageRead: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}last_page_read'])!,
      chapterNumber: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}chapter_number'])!,
      sourceOrder: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}source_order'])!,
      dateFetch: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}date_fetch'])!,
      dateUpload: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}date_upload'])!,
      lastModifiedAt: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}last_modified_at'])!,
    );
  }

  @override
  Chapters createAlias(String alias) {
    return Chapters(attachedDatabase, alias);
  }

  @override
  List<String> get customConstraints =>
      const ['FOREIGN KEY(manga_id)REFERENCES mangas(_id)ON DELETE CASCADE'];
  @override
  bool get dontWriteConstraints => true;
}

class Chapter extends DataClass implements Insertable<Chapter> {
  final int id;
  final int mangaId;
  final String url;
  final String name;
  final String? scanlator;
  final bool read;
  final bool bookmark;
  final int lastPageRead;
  final double chapterNumber;
  final int sourceOrder;
  final DateTime dateFetch;
  final DateTime dateUpload;
  final DateTime lastModifiedAt;
  const Chapter(
      {required this.id,
      required this.mangaId,
      required this.url,
      required this.name,
      this.scanlator,
      required this.read,
      required this.bookmark,
      required this.lastPageRead,
      required this.chapterNumber,
      required this.sourceOrder,
      required this.dateFetch,
      required this.dateUpload,
      required this.lastModifiedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['_id'] = Variable<int>(id);
    map['manga_id'] = Variable<int>(mangaId);
    map['url'] = Variable<String>(url);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || scanlator != null) {
      map['scanlator'] = Variable<String>(scanlator);
    }
    map['read'] = Variable<bool>(read);
    map['bookmark'] = Variable<bool>(bookmark);
    map['last_page_read'] = Variable<int>(lastPageRead);
    map['chapter_number'] = Variable<double>(chapterNumber);
    map['source_order'] = Variable<int>(sourceOrder);
    map['date_fetch'] = Variable<DateTime>(dateFetch);
    map['date_upload'] = Variable<DateTime>(dateUpload);
    map['last_modified_at'] = Variable<DateTime>(lastModifiedAt);
    return map;
  }

  ChaptersCompanion toCompanion(bool nullToAbsent) {
    return ChaptersCompanion(
      id: Value(id),
      mangaId: Value(mangaId),
      url: Value(url),
      name: Value(name),
      scanlator: scanlator == null && nullToAbsent
          ? const Value.absent()
          : Value(scanlator),
      read: Value(read),
      bookmark: Value(bookmark),
      lastPageRead: Value(lastPageRead),
      chapterNumber: Value(chapterNumber),
      sourceOrder: Value(sourceOrder),
      dateFetch: Value(dateFetch),
      dateUpload: Value(dateUpload),
      lastModifiedAt: Value(lastModifiedAt),
    );
  }

  factory Chapter.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Chapter(
      id: serializer.fromJson<int>(json['_id']),
      mangaId: serializer.fromJson<int>(json['manga_id']),
      url: serializer.fromJson<String>(json['url']),
      name: serializer.fromJson<String>(json['name']),
      scanlator: serializer.fromJson<String?>(json['scanlator']),
      read: serializer.fromJson<bool>(json['read']),
      bookmark: serializer.fromJson<bool>(json['bookmark']),
      lastPageRead: serializer.fromJson<int>(json['last_page_read']),
      chapterNumber: serializer.fromJson<double>(json['chapter_number']),
      sourceOrder: serializer.fromJson<int>(json['source_order']),
      dateFetch: serializer.fromJson<DateTime>(json['date_fetch']),
      dateUpload: serializer.fromJson<DateTime>(json['date_upload']),
      lastModifiedAt: serializer.fromJson<DateTime>(json['last_modified_at']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      '_id': serializer.toJson<int>(id),
      'manga_id': serializer.toJson<int>(mangaId),
      'url': serializer.toJson<String>(url),
      'name': serializer.toJson<String>(name),
      'scanlator': serializer.toJson<String?>(scanlator),
      'read': serializer.toJson<bool>(read),
      'bookmark': serializer.toJson<bool>(bookmark),
      'last_page_read': serializer.toJson<int>(lastPageRead),
      'chapter_number': serializer.toJson<double>(chapterNumber),
      'source_order': serializer.toJson<int>(sourceOrder),
      'date_fetch': serializer.toJson<DateTime>(dateFetch),
      'date_upload': serializer.toJson<DateTime>(dateUpload),
      'last_modified_at': serializer.toJson<DateTime>(lastModifiedAt),
    };
  }

  Chapter copyWith(
          {int? id,
          int? mangaId,
          String? url,
          String? name,
          Value<String?> scanlator = const Value.absent(),
          bool? read,
          bool? bookmark,
          int? lastPageRead,
          double? chapterNumber,
          int? sourceOrder,
          DateTime? dateFetch,
          DateTime? dateUpload,
          DateTime? lastModifiedAt}) =>
      Chapter(
        id: id ?? this.id,
        mangaId: mangaId ?? this.mangaId,
        url: url ?? this.url,
        name: name ?? this.name,
        scanlator: scanlator.present ? scanlator.value : this.scanlator,
        read: read ?? this.read,
        bookmark: bookmark ?? this.bookmark,
        lastPageRead: lastPageRead ?? this.lastPageRead,
        chapterNumber: chapterNumber ?? this.chapterNumber,
        sourceOrder: sourceOrder ?? this.sourceOrder,
        dateFetch: dateFetch ?? this.dateFetch,
        dateUpload: dateUpload ?? this.dateUpload,
        lastModifiedAt: lastModifiedAt ?? this.lastModifiedAt,
      );
  @override
  String toString() {
    return (StringBuffer('Chapter(')
          ..write('id: $id, ')
          ..write('mangaId: $mangaId, ')
          ..write('url: $url, ')
          ..write('name: $name, ')
          ..write('scanlator: $scanlator, ')
          ..write('read: $read, ')
          ..write('bookmark: $bookmark, ')
          ..write('lastPageRead: $lastPageRead, ')
          ..write('chapterNumber: $chapterNumber, ')
          ..write('sourceOrder: $sourceOrder, ')
          ..write('dateFetch: $dateFetch, ')
          ..write('dateUpload: $dateUpload, ')
          ..write('lastModifiedAt: $lastModifiedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      mangaId,
      url,
      name,
      scanlator,
      read,
      bookmark,
      lastPageRead,
      chapterNumber,
      sourceOrder,
      dateFetch,
      dateUpload,
      lastModifiedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Chapter &&
          other.id == this.id &&
          other.mangaId == this.mangaId &&
          other.url == this.url &&
          other.name == this.name &&
          other.scanlator == this.scanlator &&
          other.read == this.read &&
          other.bookmark == this.bookmark &&
          other.lastPageRead == this.lastPageRead &&
          other.chapterNumber == this.chapterNumber &&
          other.sourceOrder == this.sourceOrder &&
          other.dateFetch == this.dateFetch &&
          other.dateUpload == this.dateUpload &&
          other.lastModifiedAt == this.lastModifiedAt);
}

class ChaptersCompanion extends UpdateCompanion<Chapter> {
  final Value<int> id;
  final Value<int> mangaId;
  final Value<String> url;
  final Value<String> name;
  final Value<String?> scanlator;
  final Value<bool> read;
  final Value<bool> bookmark;
  final Value<int> lastPageRead;
  final Value<double> chapterNumber;
  final Value<int> sourceOrder;
  final Value<DateTime> dateFetch;
  final Value<DateTime> dateUpload;
  final Value<DateTime> lastModifiedAt;
  const ChaptersCompanion({
    this.id = const Value.absent(),
    this.mangaId = const Value.absent(),
    this.url = const Value.absent(),
    this.name = const Value.absent(),
    this.scanlator = const Value.absent(),
    this.read = const Value.absent(),
    this.bookmark = const Value.absent(),
    this.lastPageRead = const Value.absent(),
    this.chapterNumber = const Value.absent(),
    this.sourceOrder = const Value.absent(),
    this.dateFetch = const Value.absent(),
    this.dateUpload = const Value.absent(),
    this.lastModifiedAt = const Value.absent(),
  });
  ChaptersCompanion.insert({
    this.id = const Value.absent(),
    required int mangaId,
    required String url,
    required String name,
    this.scanlator = const Value.absent(),
    required bool read,
    required bool bookmark,
    required int lastPageRead,
    required double chapterNumber,
    required int sourceOrder,
    required DateTime dateFetch,
    required DateTime dateUpload,
    this.lastModifiedAt = const Value.absent(),
  })  : mangaId = Value(mangaId),
        url = Value(url),
        name = Value(name),
        read = Value(read),
        bookmark = Value(bookmark),
        lastPageRead = Value(lastPageRead),
        chapterNumber = Value(chapterNumber),
        sourceOrder = Value(sourceOrder),
        dateFetch = Value(dateFetch),
        dateUpload = Value(dateUpload);
  static Insertable<Chapter> custom({
    Expression<int>? id,
    Expression<int>? mangaId,
    Expression<String>? url,
    Expression<String>? name,
    Expression<String>? scanlator,
    Expression<bool>? read,
    Expression<bool>? bookmark,
    Expression<int>? lastPageRead,
    Expression<double>? chapterNumber,
    Expression<int>? sourceOrder,
    Expression<DateTime>? dateFetch,
    Expression<DateTime>? dateUpload,
    Expression<DateTime>? lastModifiedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) '_id': id,
      if (mangaId != null) 'manga_id': mangaId,
      if (url != null) 'url': url,
      if (name != null) 'name': name,
      if (scanlator != null) 'scanlator': scanlator,
      if (read != null) 'read': read,
      if (bookmark != null) 'bookmark': bookmark,
      if (lastPageRead != null) 'last_page_read': lastPageRead,
      if (chapterNumber != null) 'chapter_number': chapterNumber,
      if (sourceOrder != null) 'source_order': sourceOrder,
      if (dateFetch != null) 'date_fetch': dateFetch,
      if (dateUpload != null) 'date_upload': dateUpload,
      if (lastModifiedAt != null) 'last_modified_at': lastModifiedAt,
    });
  }

  ChaptersCompanion copyWith(
      {Value<int>? id,
      Value<int>? mangaId,
      Value<String>? url,
      Value<String>? name,
      Value<String?>? scanlator,
      Value<bool>? read,
      Value<bool>? bookmark,
      Value<int>? lastPageRead,
      Value<double>? chapterNumber,
      Value<int>? sourceOrder,
      Value<DateTime>? dateFetch,
      Value<DateTime>? dateUpload,
      Value<DateTime>? lastModifiedAt}) {
    return ChaptersCompanion(
      id: id ?? this.id,
      mangaId: mangaId ?? this.mangaId,
      url: url ?? this.url,
      name: name ?? this.name,
      scanlator: scanlator ?? this.scanlator,
      read: read ?? this.read,
      bookmark: bookmark ?? this.bookmark,
      lastPageRead: lastPageRead ?? this.lastPageRead,
      chapterNumber: chapterNumber ?? this.chapterNumber,
      sourceOrder: sourceOrder ?? this.sourceOrder,
      dateFetch: dateFetch ?? this.dateFetch,
      dateUpload: dateUpload ?? this.dateUpload,
      lastModifiedAt: lastModifiedAt ?? this.lastModifiedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['_id'] = Variable<int>(id.value);
    }
    if (mangaId.present) {
      map['manga_id'] = Variable<int>(mangaId.value);
    }
    if (url.present) {
      map['url'] = Variable<String>(url.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (scanlator.present) {
      map['scanlator'] = Variable<String>(scanlator.value);
    }
    if (read.present) {
      map['read'] = Variable<bool>(read.value);
    }
    if (bookmark.present) {
      map['bookmark'] = Variable<bool>(bookmark.value);
    }
    if (lastPageRead.present) {
      map['last_page_read'] = Variable<int>(lastPageRead.value);
    }
    if (chapterNumber.present) {
      map['chapter_number'] = Variable<double>(chapterNumber.value);
    }
    if (sourceOrder.present) {
      map['source_order'] = Variable<int>(sourceOrder.value);
    }
    if (dateFetch.present) {
      map['date_fetch'] = Variable<DateTime>(dateFetch.value);
    }
    if (dateUpload.present) {
      map['date_upload'] = Variable<DateTime>(dateUpload.value);
    }
    if (lastModifiedAt.present) {
      map['last_modified_at'] = Variable<DateTime>(lastModifiedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ChaptersCompanion(')
          ..write('id: $id, ')
          ..write('mangaId: $mangaId, ')
          ..write('url: $url, ')
          ..write('name: $name, ')
          ..write('scanlator: $scanlator, ')
          ..write('read: $read, ')
          ..write('bookmark: $bookmark, ')
          ..write('lastPageRead: $lastPageRead, ')
          ..write('chapterNumber: $chapterNumber, ')
          ..write('sourceOrder: $sourceOrder, ')
          ..write('dateFetch: $dateFetch, ')
          ..write('dateUpload: $dateUpload, ')
          ..write('lastModifiedAt: $lastModifiedAt')
          ..write(')'))
        .toString();
  }
}

class Categories extends Table with TableInfo<Categories, Category> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  Categories(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      '_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      $customConstraints: 'NOT NULL PRIMARY KEY');
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _sortMeta = const VerificationMeta('sort');
  late final GeneratedColumn<int> sort = GeneratedColumn<int>(
      'sort', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _flagsMeta = const VerificationMeta('flags');
  late final GeneratedColumn<int> flags = GeneratedColumn<int>(
      'flags', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  @override
  List<GeneratedColumn> get $columns => [id, name, sort, flags];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'categories';
  @override
  VerificationContext validateIntegrity(Insertable<Category> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('_id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['_id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('sort')) {
      context.handle(
          _sortMeta, sort.isAcceptableOrUnknown(data['sort']!, _sortMeta));
    } else if (isInserting) {
      context.missing(_sortMeta);
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
          .read(DriftSqlType.int, data['${effectivePrefix}_id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      sort: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}sort'])!,
      flags: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}flags'])!,
    );
  }

  @override
  Categories createAlias(String alias) {
    return Categories(attachedDatabase, alias);
  }

  @override
  bool get dontWriteConstraints => true;
}

class Category extends DataClass implements Insertable<Category> {
  final int id;
  final String name;
  final int sort;
  final int flags;
  const Category(
      {required this.id,
      required this.name,
      required this.sort,
      required this.flags});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['_id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['sort'] = Variable<int>(sort);
    map['flags'] = Variable<int>(flags);
    return map;
  }

  CategoriesCompanion toCompanion(bool nullToAbsent) {
    return CategoriesCompanion(
      id: Value(id),
      name: Value(name),
      sort: Value(sort),
      flags: Value(flags),
    );
  }

  factory Category.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Category(
      id: serializer.fromJson<int>(json['_id']),
      name: serializer.fromJson<String>(json['name']),
      sort: serializer.fromJson<int>(json['sort']),
      flags: serializer.fromJson<int>(json['flags']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      '_id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'sort': serializer.toJson<int>(sort),
      'flags': serializer.toJson<int>(flags),
    };
  }

  Category copyWith({int? id, String? name, int? sort, int? flags}) => Category(
        id: id ?? this.id,
        name: name ?? this.name,
        sort: sort ?? this.sort,
        flags: flags ?? this.flags,
      );
  @override
  String toString() {
    return (StringBuffer('Category(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('sort: $sort, ')
          ..write('flags: $flags')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, sort, flags);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Category &&
          other.id == this.id &&
          other.name == this.name &&
          other.sort == this.sort &&
          other.flags == this.flags);
}

class CategoriesCompanion extends UpdateCompanion<Category> {
  final Value<int> id;
  final Value<String> name;
  final Value<int> sort;
  final Value<int> flags;
  const CategoriesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.sort = const Value.absent(),
    this.flags = const Value.absent(),
  });
  CategoriesCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required int sort,
    required int flags,
  })  : name = Value(name),
        sort = Value(sort),
        flags = Value(flags);
  static Insertable<Category> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<int>? sort,
    Expression<int>? flags,
  }) {
    return RawValuesInsertable({
      if (id != null) '_id': id,
      if (name != null) 'name': name,
      if (sort != null) 'sort': sort,
      if (flags != null) 'flags': flags,
    });
  }

  CategoriesCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<int>? sort,
      Value<int>? flags}) {
    return CategoriesCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      sort: sort ?? this.sort,
      flags: flags ?? this.flags,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['_id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (sort.present) {
      map['sort'] = Variable<int>(sort.value);
    }
    if (flags.present) {
      map['flags'] = Variable<int>(flags.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CategoriesCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('sort: $sort, ')
          ..write('flags: $flags')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  late final Sources sources = Sources(this);
  late final MangasCategories mangasCategories = MangasCategories(this);
  late final Trigger updateLastModifiedAtMangasCategories = Trigger(
      'CREATE TRIGGER update_last_modified_at_mangas_categories AFTER UPDATE ON mangas_categories BEGIN UPDATE mangas_categories SET last_modified_at = strftime(\'%s\', \'now\') WHERE _id = new._id;END',
      'update_last_modified_at_mangas_categories');
  late final Mangas mangas = Mangas(this);
  late final Index libraryFavoriteIndex = Index('library_favorite_index',
      'CREATE INDEX library_favorite_index ON mangas (favorite) WHERE favorite = 1');
  late final Index mangasUrlIndex = Index(
      'mangas_url_index', 'CREATE INDEX mangas_url_index ON mangas (url)');
  late final Trigger updateLastFavoritedAtMangas = Trigger(
      'CREATE TRIGGER update_last_favorited_at_mangas AFTER UPDATE OF favorite ON mangas BEGIN UPDATE mangas SET favorite_modified_at = strftime(\'%s\', \'now\') WHERE _id = new._id;END',
      'update_last_favorited_at_mangas');
  late final Trigger updateLastModifiedAtMangas = Trigger(
      'CREATE TRIGGER update_last_modified_at_mangas AFTER UPDATE ON mangas BEGIN UPDATE mangas SET last_modified_at = strftime(\'%s\', \'now\') WHERE _id = new._id;END',
      'update_last_modified_at_mangas');
  late final MangaSync mangaSync = MangaSync(this);
  late final History history = History(this);
  late final Index historyHistoryChapterIdIndex = Index(
      'history_history_chapter_id_index',
      'CREATE INDEX history_history_chapter_id_index ON history (chapter_id)');
  late final Chapters chapters = Chapters(this);
  late final Index chaptersMangaIdIndex = Index('chapters_manga_id_index',
      'CREATE INDEX chapters_manga_id_index ON chapters (manga_id)');
  late final Index chaptersUnreadByMangaIndex = Index(
      'chapters_unread_by_manga_index',
      'CREATE INDEX chapters_unread_by_manga_index ON chapters (manga_id, read) WHERE read = 0');
  late final Trigger updateLastModifiedAtChapters = Trigger(
      'CREATE TRIGGER update_last_modified_at_chapters AFTER UPDATE ON chapters BEGIN UPDATE chapters SET last_modified_at = strftime(\'%s\', \'now\') WHERE _id = new._id;END',
      'update_last_modified_at_chapters');
  late final Categories categories = Categories(this);
  Selectable<Source> findAll() {
    return customSelect('SELECT * FROM sources', variables: [], readsFrom: {
      sources,
    }).asyncMap(sources.mapFromRow);
  }

  Selectable<Source> findOne(int id) {
    return customSelect('SELECT * FROM sources WHERE _id = ?1', variables: [
      Variable<int>(id)
    ], readsFrom: {
      sources,
    }).asyncMap(sources.mapFromRow);
  }

  Future<int> upsert(int id, String lang, String name) {
    return customInsert(
      'INSERT INTO sources (_id, lang, name) VALUES (?1, ?2, ?3) ON CONFLICT (_id) DO UPDATE SET lang = ?2, name = ?3 WHERE _id = ?1',
      variables: [
        Variable<int>(id),
        Variable<String>(lang),
        Variable<String>(name)
      ],
      updates: {sources},
    );
  }

  Future<int> insert(int mangaId, int categoryId) {
    return customInsert(
      'INSERT INTO mangas_categories (manga_id, category_id, last_modified_at) VALUES (?1, ?2, strftime(\'%s\', \'now\'))',
      variables: [Variable<int>(mangaId), Variable<int>(categoryId)],
      updates: {mangasCategories},
    );
  }

  Future<int> deleteMangaCategoryByMangaId(int mangaId) {
    return customUpdate(
      'DELETE FROM mangas_categories WHERE manga_id = ?1',
      variables: [Variable<int>(mangaId)],
      updates: {mangasCategories},
      updateKind: UpdateKind.delete,
    );
  }

  Selectable<Manga> getMangaById(int id) {
    return customSelect('SELECT * FROM mangas WHERE _id = ?1', variables: [
      Variable<int>(id)
    ], readsFrom: {
      mangas,
    }).asyncMap(mangas.mapFromRow);
  }

  Selectable<Manga> getMangaByUrlAndSource(String url, int source) {
    return customSelect(
        'SELECT * FROM mangas WHERE url = ?1 AND source = ?2 LIMIT 1',
        variables: [
          Variable<String>(url),
          Variable<int>(source)
        ],
        readsFrom: {
          mangas,
        }).asyncMap(mangas.mapFromRow);
  }

  Selectable<Manga> getFavorites() {
    return customSelect('SELECT * FROM mangas WHERE favorite = 1',
        variables: [],
        readsFrom: {
          mangas,
        }).asyncMap(mangas.mapFromRow);
  }

  Selectable<Manga> getAllManga() {
    return customSelect('SELECT * FROM mangas', variables: [], readsFrom: {
      mangas,
    }).asyncMap(mangas.mapFromRow);
  }

  Selectable<Manga> getMangasWithFavoriteTimestamp() {
    return customSelect(
        'SELECT * FROM mangas WHERE favorite_modified_at IS NOT NULL',
        variables: [],
        readsFrom: {
          mangas,
        }).asyncMap(mangas.mapFromRow);
  }

  Selectable<GetSourceIdWithFavoriteCountResult>
      getSourceIdWithFavoriteCount() {
    return customSelect(
        'SELECT source, count(*) AS _c0 FROM mangas WHERE favorite = 1 GROUP BY source',
        variables: [],
        readsFrom: {
          mangas,
        }).map((QueryRow row) => GetSourceIdWithFavoriteCountResult(
          source: row.read<int>('source'),
          count: row.read<int>('_c0'),
        ));
  }

  Selectable<Manga> getFavoriteBySourceId(int sourceId) {
    return customSelect(
        'SELECT * FROM mangas WHERE favorite = 1 AND source = ?1',
        variables: [
          Variable<int>(sourceId)
        ],
        readsFrom: {
          mangas,
        }).asyncMap(mangas.mapFromRow);
  }

  Selectable<Manga> getDuplicateLibraryManga(String title, int id) {
    return customSelect(
        'SELECT * FROM mangas WHERE favorite = 1 AND LOWER(title) = ?1 AND _id != ?2',
        variables: [
          Variable<String>(title),
          Variable<int>(id)
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
      updateKind: UpdateKind.update,
    );
  }

  Selectable<GetSourceIdsWithNonLibraryMangaResult>
      getSourceIdsWithNonLibraryManga() {
    return customSelect(
        'SELECT source, COUNT(*) AS manga_count FROM mangas WHERE favorite = 0 GROUP BY source',
        variables: [],
        readsFrom: {
          mangas,
        }).map((QueryRow row) => GetSourceIdsWithNonLibraryMangaResult(
          source: row.read<int>('source'),
          mangaCount: row.read<int>('manga_count'),
        ));
  }

  Future<int> deleteMangasNotInLibraryBySourceIds(List<int> sourceIds) {
    var $arrayStartIndex = 1;
    final expandedsourceIds = $expandVar($arrayStartIndex, sourceIds.length);
    $arrayStartIndex += sourceIds.length;
    return customUpdate(
      'DELETE FROM mangas WHERE favorite = 0 AND source IN ($expandedsourceIds)',
      variables: [for (var $ in sourceIds) Variable<int>($)],
      updates: {mangas},
      updateKind: UpdateKind.delete,
    );
  }

  Future<int> insert(
      int source,
      String url,
      String? artist,
      String? author,
      String? description,
      List<String>? genre,
      String title,
      int status,
      String? thumbnailUrl,
      bool favorite,
      DateTime? lastUpdate,
      DateTime? nextUpdate,
      bool initialized,
      int viewerFlags,
      int chapterFlags,
      int coverLastModified,
      DateTime dateAdded,
      UpdateStrategy updateStrategy,
      int calculateInterval) {
    return customInsert(
      'INSERT INTO mangas (source, url, artist, author, description, genre, title, status, thumbnail_url, favorite, last_update, next_update, initialized, viewer, chapter_flags, cover_last_modified, date_added, update_strategy, calculate_interval, last_modified_at) VALUES (?1, ?2, ?3, ?4, ?5, ?6, ?7, ?8, ?9, ?10, ?11, ?12, ?13, ?14, ?15, ?16, ?17, ?18, ?19, strftime(\'%s\', \'now\'))',
      variables: [
        Variable<int>(source),
        Variable<String>(url),
        Variable<String>(artist),
        Variable<String>(author),
        Variable<String>(description),
        Variable<String>(
            NullAwareTypeConverter.wrapToSql(Mangas.$convertergenre, genre)),
        Variable<String>(title),
        Variable<int>(status),
        Variable<String>(thumbnailUrl),
        Variable<bool>(favorite),
        Variable<DateTime>(lastUpdate),
        Variable<DateTime>(nextUpdate),
        Variable<bool>(initialized),
        Variable<int>(viewerFlags),
        Variable<int>(chapterFlags),
        Variable<int>(coverLastModified),
        Variable<DateTime>(dateAdded),
        Variable<DateTime>(
            Mangas.$converterupdateStrategy.toSql(updateStrategy)),
        Variable<int>(calculateInterval)
      ],
      updates: {mangas},
    );
  }

  Future<int> update(
      String source,
      String url,
      String artist,
      String author,
      String description,
      String genre,
      String title,
      String status,
      String thumbnailUrl,
      String favorite,
      String lastUpdate,
      String nextUpdate,
      String initialized,
      String viewer,
      String chapterFlags,
      String coverLastModified,
      String dateAdded,
      String updateStrategy,
      String calculateInterval,
      int mangaId) {
    return customUpdate(
      'UPDATE mangas SET source = coalesce(?1, source), url = coalesce(?2, url), artist = coalesce(?3, artist), author = coalesce(?4, author), description = coalesce(?5, description), genre = coalesce(?6, genre), title = coalesce(?7, title), status = coalesce(?8, status), thumbnail_url = coalesce(?9, thumbnail_url), favorite = coalesce(?10, favorite), last_update = coalesce(?11, last_update), next_update = coalesce(?12, next_update), initialized = coalesce(?13, initialized), viewer = coalesce(?14, viewer), chapter_flags = coalesce(?15, chapter_flags), cover_last_modified = coalesce(?16, cover_last_modified), date_added = coalesce(?17, date_added), update_strategy = coalesce(?18, update_strategy), calculate_interval = coalesce(?19, calculate_interval) WHERE _id = ?20',
      variables: [
        Variable<String>(source),
        Variable<String>(url),
        Variable<String>(artist),
        Variable<String>(author),
        Variable<String>(description),
        Variable<String>(genre),
        Variable<String>(title),
        Variable<String>(status),
        Variable<String>(thumbnailUrl),
        Variable<String>(favorite),
        Variable<String>(lastUpdate),
        Variable<String>(nextUpdate),
        Variable<String>(initialized),
        Variable<String>(viewer),
        Variable<String>(chapterFlags),
        Variable<String>(coverLastModified),
        Variable<String>(dateAdded),
        Variable<String>(updateStrategy),
        Variable<String>(calculateInterval),
        Variable<int>(mangaId)
      ],
      updates: {mangas},
      updateKind: UpdateKind.update,
    );
  }

  Selectable<int> selectLastInsertedRowId() {
    return customSelect('SELECT last_insert_rowid() AS _c0',
        variables: [],
        readsFrom: {}).map((QueryRow row) => row.read<int>('_c0'));
  }

  Future<int> delete(int mangaId, int syncId) {
    return customUpdate(
      'DELETE FROM manga_sync WHERE manga_id = ?1 AND sync_id = ?2',
      variables: [Variable<int>(mangaId), Variable<int>(syncId)],
      updates: {mangaSync},
      updateKind: UpdateKind.delete,
    );
  }

  Selectable<MangaSyncData> getTracks() {
    return customSelect('SELECT * FROM manga_sync', variables: [], readsFrom: {
      mangaSync,
    }).asyncMap(mangaSync.mapFromRow);
  }

  Selectable<MangaSyncData> getTrackById(int id) {
    return customSelect('SELECT * FROM manga_sync WHERE _id = ?1', variables: [
      Variable<int>(id)
    ], readsFrom: {
      mangaSync,
    }).asyncMap(mangaSync.mapFromRow);
  }

  Selectable<MangaSyncData> getTracksByMangaId(int mangaId) {
    return customSelect('SELECT * FROM manga_sync WHERE manga_id = ?1',
        variables: [
          Variable<int>(mangaId)
        ],
        readsFrom: {
          mangaSync,
        }).asyncMap(mangaSync.mapFromRow);
  }

  Future<int> insert(
      int mangaId,
      int syncId,
      int remoteId,
      int? libraryId,
      String title,
      double lastChapterRead,
      int totalChapters,
      int status,
      double score,
      String remoteUrl,
      int startDate,
      int finishDate) {
    return customInsert(
      'INSERT INTO manga_sync (manga_id, sync_id, remote_id, library_id, title, last_chapter_read, total_chapters, status, score, remote_url, start_date, finish_date) VALUES (?1, ?2, ?3, ?4, ?5, ?6, ?7, ?8, ?9, ?10, ?11, ?12)',
      variables: [
        Variable<int>(mangaId),
        Variable<int>(syncId),
        Variable<int>(remoteId),
        Variable<int>(libraryId),
        Variable<String>(title),
        Variable<double>(lastChapterRead),
        Variable<int>(totalChapters),
        Variable<int>(status),
        Variable<double>(score),
        Variable<String>(remoteUrl),
        Variable<int>(startDate),
        Variable<int>(finishDate)
      ],
      updates: {mangaSync},
    );
  }

  Future<int> update(
      String mangaId,
      String syncId,
      String mediaId,
      String libraryId,
      String title,
      String lastChapterRead,
      String totalChapter,
      String status,
      String score,
      String trackingUrl,
      String startDate,
      String finishDate,
      int id) {
    return customUpdate(
      'UPDATE manga_sync SET manga_id = coalesce(?1, manga_id), sync_id = coalesce(?2, sync_id), remote_id = coalesce(?3, remote_id), library_id = coalesce(?4, library_id), title = coalesce(?5, title), last_chapter_read = coalesce(?6, last_chapter_read), total_chapters = coalesce(?7, total_chapters), status = coalesce(?8, status), score = coalesce(?9, score), remote_url = coalesce(?10, remote_url), start_date = coalesce(?11, start_date), finish_date = coalesce(?12, finish_date) WHERE _id = ?13',
      variables: [
        Variable<String>(mangaId),
        Variable<String>(syncId),
        Variable<String>(mediaId),
        Variable<String>(libraryId),
        Variable<String>(title),
        Variable<String>(lastChapterRead),
        Variable<String>(totalChapter),
        Variable<String>(status),
        Variable<String>(score),
        Variable<String>(trackingUrl),
        Variable<String>(startDate),
        Variable<String>(finishDate),
        Variable<int>(id)
      ],
      updates: {mangaSync},
      updateKind: UpdateKind.update,
    );
  }

  Selectable<HistoryData> getHistoryByMangaId(String mangaId) {
    return customSelect(
        'SELECT H._id, H.chapter_id, H.last_read, H.time_read FROM history AS H JOIN chapters AS C ON H.chapter_id = C._id WHERE C.manga_id = ?1 AND C._id = H.chapter_id',
        variables: [
          Variable<String>(mangaId)
        ],
        readsFrom: {
          history,
        }).asyncMap(history.mapFromRow);
  }

  Selectable<HistoryData> getHistoryByChapterUrl(String chapterUrl) {
    return customSelect(
        'SELECT H._id, H.chapter_id, H.last_read, H.time_read FROM history AS H JOIN chapters AS C ON H.chapter_id = C._id WHERE C.url = ?1 AND C._id = H.chapter_id',
        variables: [
          Variable<String>(chapterUrl)
        ],
        readsFrom: {
          history,
        }).asyncMap(history.mapFromRow);
  }

  Future<int> resetHistoryById(int historyId) {
    return customUpdate(
      'UPDATE history SET last_read = 0 WHERE _id = ?1',
      variables: [Variable<int>(historyId)],
      updates: {history},
      updateKind: UpdateKind.update,
    );
  }

  Future<int> resetHistoryByMangaId(String mangaId) {
    return customUpdate(
      'UPDATE history SET last_read = 0 WHERE _id IN (SELECT H._id FROM mangas AS M INNER JOIN chapters AS C ON M._id = C.manga_id INNER JOIN history AS H ON C._id = H.chapter_id WHERE M._id = ?1)',
      variables: [Variable<String>(mangaId)],
      updates: {history},
      updateKind: UpdateKind.update,
    );
  }

  Future<int> removeAllHistory() {
    return customUpdate(
      'DELETE FROM history',
      variables: [],
      updates: {history},
      updateKind: UpdateKind.delete,
    );
  }

  Future<int> removeResettedHistory() {
    return customUpdate(
      'DELETE FROM history WHERE last_read = 0',
      variables: [],
      updates: {history},
      updateKind: UpdateKind.delete,
    );
  }

  Future<int> upsert(int chapterId, DateTime? readAt, int timeRead) {
    return customInsert(
      'INSERT INTO history (chapter_id, last_read, time_read) VALUES (?1, ?2, ?3) ON CONFLICT (chapter_id) DO UPDATE SET last_read = ?2, time_read = time_read + ?3 WHERE chapter_id = ?1',
      variables: [
        Variable<int>(chapterId),
        Variable<DateTime>(readAt),
        Variable<int>(timeRead)
      ],
      updates: {history},
    );
  }

  Selectable<int> getReadDuration() {
    return customSelect(
        'SELECT coalesce(sum(time_read), 0) AS _c0 FROM history',
        variables: [],
        readsFrom: {
          history,
        }).map((QueryRow row) => row.read<int>('_c0'));
  }

  Selectable<Chapter> getChapterById(int id) {
    return customSelect('SELECT * FROM chapters WHERE _id = ?1', variables: [
      Variable<int>(id)
    ], readsFrom: {
      chapters,
    }).asyncMap(chapters.mapFromRow);
  }

  Selectable<Chapter> getChaptersByMangaId(int mangaId) {
    return customSelect('SELECT * FROM chapters WHERE manga_id = ?1',
        variables: [
          Variable<int>(mangaId)
        ],
        readsFrom: {
          chapters,
        }).asyncMap(chapters.mapFromRow);
  }

  Selectable<Chapter> getBookmarkedChaptersByMangaId(int mangaId) {
    return customSelect(
        'SELECT * FROM chapters WHERE bookmark AND manga_id = ?1',
        variables: [
          Variable<int>(mangaId)
        ],
        readsFrom: {
          chapters,
        }).asyncMap(chapters.mapFromRow);
  }

  Selectable<Chapter> getChapterByUrl(String chapterUrl) {
    return customSelect('SELECT * FROM chapters WHERE url = ?1', variables: [
      Variable<String>(chapterUrl)
    ], readsFrom: {
      chapters,
    }).asyncMap(chapters.mapFromRow);
  }

  Selectable<Chapter> getChapterByUrlAndMangaId(
      String chapterUrl, int mangaId) {
    return customSelect(
        'SELECT * FROM chapters WHERE url = ?1 AND manga_id = ?2',
        variables: [
          Variable<String>(chapterUrl),
          Variable<int>(mangaId)
        ],
        readsFrom: {
          chapters,
        }).asyncMap(chapters.mapFromRow);
  }

  Future<int> removeChaptersWithIds(List<int> chapterIds) {
    var $arrayStartIndex = 1;
    final expandedchapterIds = $expandVar($arrayStartIndex, chapterIds.length);
    $arrayStartIndex += chapterIds.length;
    return customUpdate(
      'DELETE FROM chapters WHERE _id IN ($expandedchapterIds)',
      variables: [for (var $ in chapterIds) Variable<int>($)],
      updates: {chapters},
      updateKind: UpdateKind.delete,
    );
  }

  Future<int> insert(
      int mangaId,
      String url,
      String name,
      String? scanlator,
      bool read,
      bool bookmark,
      int lastPageRead,
      double chapterNumber,
      int sourceOrder,
      DateTime dateFetch,
      DateTime dateUpload) {
    return customInsert(
      'INSERT INTO chapters (manga_id, url, name, scanlator, read, bookmark, last_page_read, chapter_number, source_order, date_fetch, date_upload, last_modified_at) VALUES (?1, ?2, ?3, ?4, ?5, ?6, ?7, ?8, ?9, ?10, ?11, strftime(\'%s\', \'now\'))',
      variables: [
        Variable<int>(mangaId),
        Variable<String>(url),
        Variable<String>(name),
        Variable<String>(scanlator),
        Variable<bool>(read),
        Variable<bool>(bookmark),
        Variable<int>(lastPageRead),
        Variable<double>(chapterNumber),
        Variable<int>(sourceOrder),
        Variable<DateTime>(dateFetch),
        Variable<DateTime>(dateUpload)
      ],
      updates: {chapters},
    );
  }

  Future<int> update(
      String mangaId,
      String url,
      String name,
      String scanlator,
      String read,
      String bookmark,
      String lastPageRead,
      String chapterNumber,
      String sourceOrder,
      String dateFetch,
      String dateUpload,
      int chapterId) {
    return customUpdate(
      'UPDATE chapters SET manga_id = coalesce(?1, manga_id), url = coalesce(?2, url), name = coalesce(?3, name), scanlator = coalesce(?4, scanlator), read = coalesce(?5, read), bookmark = coalesce(?6, bookmark), last_page_read = coalesce(?7, last_page_read), chapter_number = coalesce(?8, chapter_number), source_order = coalesce(?9, source_order), date_fetch = coalesce(?10, date_fetch), date_upload = coalesce(?11, date_upload) WHERE _id = ?12',
      variables: [
        Variable<String>(mangaId),
        Variable<String>(url),
        Variable<String>(name),
        Variable<String>(scanlator),
        Variable<String>(read),
        Variable<String>(bookmark),
        Variable<String>(lastPageRead),
        Variable<String>(chapterNumber),
        Variable<String>(sourceOrder),
        Variable<String>(dateFetch),
        Variable<String>(dateUpload),
        Variable<int>(chapterId)
      ],
      updates: {chapters},
      updateKind: UpdateKind.update,
    );
  }

  Selectable<int> selectLastInsertedRowId() {
    return customSelect('SELECT last_insert_rowid() AS _c0',
        variables: [],
        readsFrom: {}).map((QueryRow row) => row.read<int>('_c0'));
  }

  Selectable<Category> getCategory(int id) {
    return customSelect('SELECT * FROM categories WHERE _id = ?1 LIMIT 1',
        variables: [
          Variable<int>(id)
        ],
        readsFrom: {
          categories,
        }).asyncMap(categories.mapFromRow);
  }

  Future<int> insert(String name, int order, int flags) {
    return customInsert(
      'INSERT INTO categories (name, sort, flags) VALUES (?1, ?2, ?3)',
      variables: [
        Variable<String>(name),
        Variable<int>(order),
        Variable<int>(flags)
      ],
      updates: {categories},
    );
  }

  Future<int> delete(int categoryId) {
    return customUpdate(
      'DELETE FROM categories WHERE _id = ?1',
      variables: [Variable<int>(categoryId)],
      updates: {categories},
      updateKind: UpdateKind.delete,
    );
  }

  Future<int> update(String name, String order, String flags, int categoryId) {
    return customUpdate(
      'UPDATE categories SET name = coalesce(?1, name), sort = coalesce(?2, sort), flags = coalesce(?3, flags) WHERE _id = ?4',
      variables: [
        Variable<String>(name),
        Variable<String>(order),
        Variable<String>(flags),
        Variable<int>(categoryId)
      ],
      updates: {categories},
      updateKind: UpdateKind.update,
    );
  }

  Future<int> updateAllFlags(String var1) {
    return customUpdate(
      'UPDATE categories SET flags = coalesce(?1, flags)',
      variables: [Variable<String>(var1)],
      updates: {categories},
      updateKind: UpdateKind.update,
    );
  }

  Selectable<int> selectLastInsertedRowId() {
    return customSelect('SELECT last_insert_rowid() AS _c0',
        variables: [],
        readsFrom: {}).map((QueryRow row) => row.read<int>('_c0'));
  }

  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
        sources,
        mangasCategories,
        updateLastModifiedAtMangasCategories,
        mangas,
        libraryFavoriteIndex,
        mangasUrlIndex,
        updateLastFavoritedAtMangas,
        updateLastModifiedAtMangas,
        mangaSync,
        history,
        historyHistoryChapterIdIndex,
        chapters,
        chaptersMangaIdIndex,
        chaptersUnreadByMangaIndex,
        updateLastModifiedAtChapters,
        categories
      ];
  @override
  StreamQueryUpdateRules get streamUpdateRules => const StreamQueryUpdateRules(
        [
          WritePropagation(
            on: TableUpdateQuery.onTableName('mangas_categories',
                limitUpdateKind: UpdateKind.update),
            result: [
              TableUpdate('mangas_categories', kind: UpdateKind.update),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('mangas',
                limitUpdateKind: UpdateKind.update),
            result: [
              TableUpdate('mangas', kind: UpdateKind.update),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('mangas',
                limitUpdateKind: UpdateKind.update),
            result: [
              TableUpdate('mangas', kind: UpdateKind.update),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('chapters',
                limitUpdateKind: UpdateKind.update),
            result: [
              TableUpdate('chapters', kind: UpdateKind.update),
            ],
          ),
        ],
      );
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
