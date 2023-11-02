// ignore_for_file: type=lint
import 'package:drift/drift.dart' as i0;
import 'package:flutteryomi/models/tables/mangas_categories.drift.dart' as i1;
import 'package:drift/internal/modular.dart' as i2;

class MangasCategories extends i0.Table
    with i0.TableInfo<MangasCategories, i1.MangasCategorie> {
  @override
  final i0.GeneratedDatabase attachedDatabase;
  final String? _alias;
  MangasCategories(this.attachedDatabase, [this._alias]);
  static const i0.VerificationMeta _idMeta = const i0.VerificationMeta('id');
  late final i0.GeneratedColumn<int> id = i0.GeneratedColumn<int>(
      '_id', aliasedName, false,
      type: i0.DriftSqlType.int,
      requiredDuringInsert: false,
      $customConstraints: 'NOT NULL PRIMARY KEY');
  static const i0.VerificationMeta _mangaIdMeta =
      const i0.VerificationMeta('mangaId');
  late final i0.GeneratedColumn<int> mangaId = i0.GeneratedColumn<int>(
      'manga_id', aliasedName, false,
      type: i0.DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const i0.VerificationMeta _categoryIdMeta =
      const i0.VerificationMeta('categoryId');
  late final i0.GeneratedColumn<int> categoryId = i0.GeneratedColumn<int>(
      'category_id', aliasedName, false,
      type: i0.DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const i0.VerificationMeta _lastModifiedAtMeta =
      const i0.VerificationMeta('lastModifiedAt');
  late final i0.GeneratedColumn<DateTime> lastModifiedAt =
      i0.GeneratedColumn<DateTime>('last_modified_at', aliasedName, false,
          type: i0.DriftSqlType.dateTime,
          requiredDuringInsert: false,
          $customConstraints: 'NOT NULL DEFAULT 0',
          defaultValue: const i0.CustomExpression('0'));
  @override
  List<i0.GeneratedColumn> get $columns =>
      [id, mangaId, categoryId, lastModifiedAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'mangas_categories';
  @override
  i0.VerificationContext validateIntegrity(
      i0.Insertable<i1.MangasCategorie> instance,
      {bool isInserting = false}) {
    final context = i0.VerificationContext();
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
  Set<i0.GeneratedColumn> get $primaryKey => {id};
  @override
  i1.MangasCategorie map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return i1.MangasCategorie(
      id: attachedDatabase.typeMapping
          .read(i0.DriftSqlType.int, data['${effectivePrefix}_id'])!,
      mangaId: attachedDatabase.typeMapping
          .read(i0.DriftSqlType.int, data['${effectivePrefix}manga_id'])!,
      categoryId: attachedDatabase.typeMapping
          .read(i0.DriftSqlType.int, data['${effectivePrefix}category_id'])!,
      lastModifiedAt: attachedDatabase.typeMapping.read(
          i0.DriftSqlType.dateTime,
          data['${effectivePrefix}last_modified_at'])!,
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

class MangasCategorie extends i0.DataClass
    implements i0.Insertable<i1.MangasCategorie> {
  final int id;
  final int mangaId;
  final int categoryId;
  final DateTime lastModifiedAt;
  const MangasCategorie(
      {required this.id,
      required this.mangaId,
      required this.categoryId,
      required this.lastModifiedAt});
  @override
  Map<String, i0.Expression> toColumns(bool nullToAbsent) {
    final map = <String, i0.Expression>{};
    map['_id'] = i0.Variable<int>(id);
    map['manga_id'] = i0.Variable<int>(mangaId);
    map['category_id'] = i0.Variable<int>(categoryId);
    map['last_modified_at'] = i0.Variable<DateTime>(lastModifiedAt);
    return map;
  }

  i1.MangasCategoriesCompanion toCompanion(bool nullToAbsent) {
    return i1.MangasCategoriesCompanion(
      id: i0.Value(id),
      mangaId: i0.Value(mangaId),
      categoryId: i0.Value(categoryId),
      lastModifiedAt: i0.Value(lastModifiedAt),
    );
  }

  factory MangasCategorie.fromJson(Map<String, dynamic> json,
      {i0.ValueSerializer? serializer}) {
    serializer ??= i0.driftRuntimeOptions.defaultSerializer;
    return MangasCategorie(
      id: serializer.fromJson<int>(json['_id']),
      mangaId: serializer.fromJson<int>(json['manga_id']),
      categoryId: serializer.fromJson<int>(json['category_id']),
      lastModifiedAt: serializer.fromJson<DateTime>(json['last_modified_at']),
    );
  }
  @override
  Map<String, dynamic> toJson({i0.ValueSerializer? serializer}) {
    serializer ??= i0.driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      '_id': serializer.toJson<int>(id),
      'manga_id': serializer.toJson<int>(mangaId),
      'category_id': serializer.toJson<int>(categoryId),
      'last_modified_at': serializer.toJson<DateTime>(lastModifiedAt),
    };
  }

  i1.MangasCategorie copyWith(
          {int? id, int? mangaId, int? categoryId, DateTime? lastModifiedAt}) =>
      i1.MangasCategorie(
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
      (other is i1.MangasCategorie &&
          other.id == this.id &&
          other.mangaId == this.mangaId &&
          other.categoryId == this.categoryId &&
          other.lastModifiedAt == this.lastModifiedAt);
}

class MangasCategoriesCompanion extends i0.UpdateCompanion<i1.MangasCategorie> {
  final i0.Value<int> id;
  final i0.Value<int> mangaId;
  final i0.Value<int> categoryId;
  final i0.Value<DateTime> lastModifiedAt;
  const MangasCategoriesCompanion({
    this.id = const i0.Value.absent(),
    this.mangaId = const i0.Value.absent(),
    this.categoryId = const i0.Value.absent(),
    this.lastModifiedAt = const i0.Value.absent(),
  });
  MangasCategoriesCompanion.insert({
    this.id = const i0.Value.absent(),
    required int mangaId,
    required int categoryId,
    this.lastModifiedAt = const i0.Value.absent(),
  })  : mangaId = i0.Value(mangaId),
        categoryId = i0.Value(categoryId);
  static i0.Insertable<i1.MangasCategorie> custom({
    i0.Expression<int>? id,
    i0.Expression<int>? mangaId,
    i0.Expression<int>? categoryId,
    i0.Expression<DateTime>? lastModifiedAt,
  }) {
    return i0.RawValuesInsertable({
      if (id != null) '_id': id,
      if (mangaId != null) 'manga_id': mangaId,
      if (categoryId != null) 'category_id': categoryId,
      if (lastModifiedAt != null) 'last_modified_at': lastModifiedAt,
    });
  }

  i1.MangasCategoriesCompanion copyWith(
      {i0.Value<int>? id,
      i0.Value<int>? mangaId,
      i0.Value<int>? categoryId,
      i0.Value<DateTime>? lastModifiedAt}) {
    return i1.MangasCategoriesCompanion(
      id: id ?? this.id,
      mangaId: mangaId ?? this.mangaId,
      categoryId: categoryId ?? this.categoryId,
      lastModifiedAt: lastModifiedAt ?? this.lastModifiedAt,
    );
  }

  @override
  Map<String, i0.Expression> toColumns(bool nullToAbsent) {
    final map = <String, i0.Expression>{};
    if (id.present) {
      map['_id'] = i0.Variable<int>(id.value);
    }
    if (mangaId.present) {
      map['manga_id'] = i0.Variable<int>(mangaId.value);
    }
    if (categoryId.present) {
      map['category_id'] = i0.Variable<int>(categoryId.value);
    }
    if (lastModifiedAt.present) {
      map['last_modified_at'] = i0.Variable<DateTime>(lastModifiedAt.value);
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

i0.Trigger get updateLastModifiedAtMangasCategories => i0.Trigger(
    'CREATE TRIGGER update_last_modified_at_mangas_categories AFTER UPDATE ON mangas_categories BEGIN UPDATE mangas_categories SET last_modified_at = unixepoch() WHERE _id = new._id;END',
    'update_last_modified_at_mangas_categories');

class MangasCategoriesDrift extends i2.ModularAccessor {
  MangasCategoriesDrift(i0.GeneratedDatabase db) : super(db);
  Future<int> deleteMangaCategoryByMangaId({required int mangaId}) {
    return customUpdate(
      'DELETE FROM mangas_categories WHERE manga_id = ?1',
      variables: [i0.Variable<int>(mangaId)],
      updates: {mangasCategories},
      updateKind: i0.UpdateKind.delete,
    );
  }

  i1.MangasCategories get mangasCategories =>
      this.resultSet<i1.MangasCategories>('mangas_categories');
}
