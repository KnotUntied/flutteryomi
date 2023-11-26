// ignore_for_file: type=lint
import 'package:drift/drift.dart' as i0;
import 'package:flutteryomi/data/drift/data/categories.drift.dart' as i1;
import 'package:drift/internal/modular.dart' as i2;
import 'package:flutteryomi/data/drift/data/mangas_categories.drift.dart' as i3;

class Categories extends i0.Table with i0.TableInfo<Categories, i1.Category> {
  @override
  final i0.GeneratedDatabase attachedDatabase;
  final String? _alias;
  Categories(this.attachedDatabase, [this._alias]);
  static const i0.VerificationMeta _idMeta = const i0.VerificationMeta('id');
  late final i0.GeneratedColumn<int> id = i0.GeneratedColumn<int>(
      '_id', aliasedName, false,
      type: i0.DriftSqlType.int,
      requiredDuringInsert: false,
      $customConstraints: 'NOT NULL PRIMARY KEY');
  static const i0.VerificationMeta _nameMeta =
      const i0.VerificationMeta('name');
  late final i0.GeneratedColumn<String> name = i0.GeneratedColumn<String>(
      'name', aliasedName, false,
      type: i0.DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const i0.VerificationMeta _sortMeta =
      const i0.VerificationMeta('sort');
  late final i0.GeneratedColumn<int> sort = i0.GeneratedColumn<int>(
      'sort', aliasedName, false,
      type: i0.DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const i0.VerificationMeta _flagsMeta =
      const i0.VerificationMeta('flags');
  late final i0.GeneratedColumn<int> flags = i0.GeneratedColumn<int>(
      'flags', aliasedName, false,
      type: i0.DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  @override
  List<i0.GeneratedColumn> get $columns => [id, name, sort, flags];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'categories';
  @override
  i0.VerificationContext validateIntegrity(i0.Insertable<i1.Category> instance,
      {bool isInserting = false}) {
    final context = i0.VerificationContext();
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
  Set<i0.GeneratedColumn> get $primaryKey => {id};
  @override
  i1.Category map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return i1.Category(
      id: attachedDatabase.typeMapping
          .read(i0.DriftSqlType.int, data['${effectivePrefix}_id'])!,
      name: attachedDatabase.typeMapping
          .read(i0.DriftSqlType.string, data['${effectivePrefix}name'])!,
      sort: attachedDatabase.typeMapping
          .read(i0.DriftSqlType.int, data['${effectivePrefix}sort'])!,
      flags: attachedDatabase.typeMapping
          .read(i0.DriftSqlType.int, data['${effectivePrefix}flags'])!,
    );
  }

  @override
  Categories createAlias(String alias) {
    return Categories(attachedDatabase, alias);
  }

  @override
  bool get dontWriteConstraints => true;
}

class Category extends i0.DataClass implements i0.Insertable<i1.Category> {
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
  Map<String, i0.Expression> toColumns(bool nullToAbsent) {
    final map = <String, i0.Expression>{};
    map['_id'] = i0.Variable<int>(id);
    map['name'] = i0.Variable<String>(name);
    map['sort'] = i0.Variable<int>(sort);
    map['flags'] = i0.Variable<int>(flags);
    return map;
  }

  i1.CategoriesCompanion toCompanion(bool nullToAbsent) {
    return i1.CategoriesCompanion(
      id: i0.Value(id),
      name: i0.Value(name),
      sort: i0.Value(sort),
      flags: i0.Value(flags),
    );
  }

  factory Category.fromJson(Map<String, dynamic> json,
      {i0.ValueSerializer? serializer}) {
    serializer ??= i0.driftRuntimeOptions.defaultSerializer;
    return Category(
      id: serializer.fromJson<int>(json['_id']),
      name: serializer.fromJson<String>(json['name']),
      sort: serializer.fromJson<int>(json['sort']),
      flags: serializer.fromJson<int>(json['flags']),
    );
  }
  @override
  Map<String, dynamic> toJson({i0.ValueSerializer? serializer}) {
    serializer ??= i0.driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      '_id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'sort': serializer.toJson<int>(sort),
      'flags': serializer.toJson<int>(flags),
    };
  }

  i1.Category copyWith({int? id, String? name, int? sort, int? flags}) =>
      i1.Category(
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
      (other is i1.Category &&
          other.id == this.id &&
          other.name == this.name &&
          other.sort == this.sort &&
          other.flags == this.flags);
}

class CategoriesCompanion extends i0.UpdateCompanion<i1.Category> {
  final i0.Value<int> id;
  final i0.Value<String> name;
  final i0.Value<int> sort;
  final i0.Value<int> flags;
  const CategoriesCompanion({
    this.id = const i0.Value.absent(),
    this.name = const i0.Value.absent(),
    this.sort = const i0.Value.absent(),
    this.flags = const i0.Value.absent(),
  });
  CategoriesCompanion.insert({
    this.id = const i0.Value.absent(),
    required String name,
    required int sort,
    required int flags,
  })  : name = i0.Value(name),
        sort = i0.Value(sort),
        flags = i0.Value(flags);
  static i0.Insertable<i1.Category> custom({
    i0.Expression<int>? id,
    i0.Expression<String>? name,
    i0.Expression<int>? sort,
    i0.Expression<int>? flags,
  }) {
    return i0.RawValuesInsertable({
      if (id != null) '_id': id,
      if (name != null) 'name': name,
      if (sort != null) 'sort': sort,
      if (flags != null) 'flags': flags,
    });
  }

  i1.CategoriesCompanion copyWith(
      {i0.Value<int>? id,
      i0.Value<String>? name,
      i0.Value<int>? sort,
      i0.Value<int>? flags}) {
    return i1.CategoriesCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      sort: sort ?? this.sort,
      flags: flags ?? this.flags,
    );
  }

  @override
  Map<String, i0.Expression> toColumns(bool nullToAbsent) {
    final map = <String, i0.Expression>{};
    if (id.present) {
      map['_id'] = i0.Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = i0.Variable<String>(name.value);
    }
    if (sort.present) {
      map['sort'] = i0.Variable<int>(sort.value);
    }
    if (flags.present) {
      map['flags'] = i0.Variable<int>(flags.value);
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

i0.Trigger get systemCategoryDeleteTrigger => i0.Trigger(
    'CREATE TRIGGER IF NOT EXISTS system_category_delete_trigger BEFORE DELETE ON categories BEGIN SELECT CASE WHEN old._id <= 0 THEN RAISE (ABORT, \'System category can\'\'t be deleted\') END;END',
    'system_category_delete_trigger');

class CategoriesDrift extends i2.ModularAccessor {
  CategoriesDrift(i0.GeneratedDatabase db) : super(db);
  i0.Selectable<i1.Category> getCategory({required int id}) {
    return customSelect('SELECT * FROM categories WHERE _id = ?1 LIMIT 1',
        variables: [
          i0.Variable<int>(id)
        ],
        readsFrom: {
          categories,
        }).asyncMap(categories.mapFromRow);
  }

  i0.Selectable<i1.Category> getCategories() {
    return customSelect(
        'SELECT _id AS id, name, sort AS "order", flags FROM categories ORDER BY sort',
        variables: [],
        readsFrom: {
          categories,
        }).asyncMap(
        (i0.QueryRow row) async => categories.mapFromRowWithAlias(row, const {
              'id': '_id',
              'name': 'name',
              'order': 'sort',
              'flags': 'flags',
            }));
  }

  i0.Selectable<i1.Category> getCategoriesByMangaId({required int mangaId}) {
    return customSelect(
        'SELECT C._id AS id, C.name, C.sort AS "order", C.flags FROM categories AS C JOIN mangas_categories AS MC ON C._id = MC.category_id WHERE MC.manga_id = ?1',
        variables: [
          i0.Variable<int>(mangaId)
        ],
        readsFrom: {
          categories,
          mangasCategories,
        }).asyncMap(
        (i0.QueryRow row) async => categories.mapFromRowWithAlias(row, const {
              'id': '_id',
              'name': 'name',
              'order': 'sort',
              'flags': 'flags',
            }));
  }

  Future<int> updateAllFlags(int? var1) {
    return customUpdate(
      'UPDATE categories SET flags = coalesce(?1, flags)',
      variables: [i0.Variable<int>(var1)],
      updates: {categories},
      updateKind: i0.UpdateKind.update,
    );
  }

  i1.Categories get categories => this.resultSet<i1.Categories>('categories');
  i3.MangasCategories get mangasCategories =>
      this.resultSet<i3.MangasCategories>('mangas_categories');
}
