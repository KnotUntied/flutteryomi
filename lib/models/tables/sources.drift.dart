// ignore_for_file: type=lint
import 'package:drift/drift.dart' as i0;
import 'package:flutteryomi/models/tables/sources.drift.dart' as i1;
import 'package:drift/internal/modular.dart' as i2;

class Sources extends i0.Table with i0.TableInfo<Sources, i1.Source> {
  @override
  final i0.GeneratedDatabase attachedDatabase;
  final String? _alias;
  Sources(this.attachedDatabase, [this._alias]);
  static const i0.VerificationMeta _idMeta = const i0.VerificationMeta('id');
  late final i0.GeneratedColumn<int> id = i0.GeneratedColumn<int>(
      '_id', aliasedName, false,
      type: i0.DriftSqlType.int,
      requiredDuringInsert: false,
      $customConstraints: 'NOT NULL PRIMARY KEY');
  static const i0.VerificationMeta _langMeta =
      const i0.VerificationMeta('lang');
  late final i0.GeneratedColumn<String> lang = i0.GeneratedColumn<String>(
      'lang', aliasedName, false,
      type: i0.DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const i0.VerificationMeta _nameMeta =
      const i0.VerificationMeta('name');
  late final i0.GeneratedColumn<String> name = i0.GeneratedColumn<String>(
      'name', aliasedName, false,
      type: i0.DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  @override
  List<i0.GeneratedColumn> get $columns => [id, lang, name];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'sources';
  @override
  i0.VerificationContext validateIntegrity(i0.Insertable<i1.Source> instance,
      {bool isInserting = false}) {
    final context = i0.VerificationContext();
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
  Set<i0.GeneratedColumn> get $primaryKey => {id};
  @override
  i1.Source map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return i1.Source(
      id: attachedDatabase.typeMapping
          .read(i0.DriftSqlType.int, data['${effectivePrefix}_id'])!,
      lang: attachedDatabase.typeMapping
          .read(i0.DriftSqlType.string, data['${effectivePrefix}lang'])!,
      name: attachedDatabase.typeMapping
          .read(i0.DriftSqlType.string, data['${effectivePrefix}name'])!,
    );
  }

  @override
  Sources createAlias(String alias) {
    return Sources(attachedDatabase, alias);
  }

  @override
  bool get dontWriteConstraints => true;
}

class Source extends i0.DataClass implements i0.Insertable<i1.Source> {
  final int id;
  final String lang;
  final String name;
  const Source({required this.id, required this.lang, required this.name});
  @override
  Map<String, i0.Expression> toColumns(bool nullToAbsent) {
    final map = <String, i0.Expression>{};
    map['_id'] = i0.Variable<int>(id);
    map['lang'] = i0.Variable<String>(lang);
    map['name'] = i0.Variable<String>(name);
    return map;
  }

  i1.SourcesCompanion toCompanion(bool nullToAbsent) {
    return i1.SourcesCompanion(
      id: i0.Value(id),
      lang: i0.Value(lang),
      name: i0.Value(name),
    );
  }

  factory Source.fromJson(Map<String, dynamic> json,
      {i0.ValueSerializer? serializer}) {
    serializer ??= i0.driftRuntimeOptions.defaultSerializer;
    return Source(
      id: serializer.fromJson<int>(json['_id']),
      lang: serializer.fromJson<String>(json['lang']),
      name: serializer.fromJson<String>(json['name']),
    );
  }
  @override
  Map<String, dynamic> toJson({i0.ValueSerializer? serializer}) {
    serializer ??= i0.driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      '_id': serializer.toJson<int>(id),
      'lang': serializer.toJson<String>(lang),
      'name': serializer.toJson<String>(name),
    };
  }

  i1.Source copyWith({int? id, String? lang, String? name}) => i1.Source(
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
      (other is i1.Source &&
          other.id == this.id &&
          other.lang == this.lang &&
          other.name == this.name);
}

class SourcesCompanion extends i0.UpdateCompanion<i1.Source> {
  final i0.Value<int> id;
  final i0.Value<String> lang;
  final i0.Value<String> name;
  const SourcesCompanion({
    this.id = const i0.Value.absent(),
    this.lang = const i0.Value.absent(),
    this.name = const i0.Value.absent(),
  });
  SourcesCompanion.insert({
    this.id = const i0.Value.absent(),
    required String lang,
    required String name,
  })  : lang = i0.Value(lang),
        name = i0.Value(name);
  static i0.Insertable<i1.Source> custom({
    i0.Expression<int>? id,
    i0.Expression<String>? lang,
    i0.Expression<String>? name,
  }) {
    return i0.RawValuesInsertable({
      if (id != null) '_id': id,
      if (lang != null) 'lang': lang,
      if (name != null) 'name': name,
    });
  }

  i1.SourcesCompanion copyWith(
      {i0.Value<int>? id, i0.Value<String>? lang, i0.Value<String>? name}) {
    return i1.SourcesCompanion(
      id: id ?? this.id,
      lang: lang ?? this.lang,
      name: name ?? this.name,
    );
  }

  @override
  Map<String, i0.Expression> toColumns(bool nullToAbsent) {
    final map = <String, i0.Expression>{};
    if (id.present) {
      map['_id'] = i0.Variable<int>(id.value);
    }
    if (lang.present) {
      map['lang'] = i0.Variable<String>(lang.value);
    }
    if (name.present) {
      map['name'] = i0.Variable<String>(name.value);
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

class SourcesDrift extends i2.ModularAccessor {
  SourcesDrift(i0.GeneratedDatabase db) : super(db);
  i0.Selectable<i1.Source> findAll() {
    return customSelect('SELECT * FROM sources', variables: [], readsFrom: {
      sources,
    }).asyncMap(sources.mapFromRow);
  }

  i0.Selectable<i1.Source> findOne({required int id}) {
    return customSelect('SELECT * FROM sources WHERE _id = ?1', variables: [
      i0.Variable<int>(id)
    ], readsFrom: {
      sources,
    }).asyncMap(sources.mapFromRow);
  }

  i1.Sources get sources => this.resultSet<i1.Sources>('sources');
}
