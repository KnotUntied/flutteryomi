// ignore_for_file: type=lint
import 'package:drift/drift.dart' as i0;
import 'package:flutteryomi/data/tables/excluded_scanlators.drift.dart' as i1;
import 'package:drift/internal/modular.dart' as i2;

class ExcludedScanlators extends i0.Table
    with i0.TableInfo<ExcludedScanlators, i1.ExcludedScanlator> {
  @override
  final i0.GeneratedDatabase attachedDatabase;
  final String? _alias;
  ExcludedScanlators(this.attachedDatabase, [this._alias]);
  static const i0.VerificationMeta _mangaIdMeta =
      const i0.VerificationMeta('mangaId');
  late final i0.GeneratedColumn<int> mangaId = i0.GeneratedColumn<int>(
      'manga_id', aliasedName, false,
      type: i0.DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const i0.VerificationMeta _scanlatorMeta =
      const i0.VerificationMeta('scanlator');
  late final i0.GeneratedColumn<String> scanlator = i0.GeneratedColumn<String>(
      'scanlator', aliasedName, false,
      type: i0.DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  @override
  List<i0.GeneratedColumn> get $columns => [mangaId, scanlator];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'excluded_scanlators';
  @override
  i0.VerificationContext validateIntegrity(
      i0.Insertable<i1.ExcludedScanlator> instance,
      {bool isInserting = false}) {
    final context = i0.VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('manga_id')) {
      context.handle(_mangaIdMeta,
          mangaId.isAcceptableOrUnknown(data['manga_id']!, _mangaIdMeta));
    } else if (isInserting) {
      context.missing(_mangaIdMeta);
    }
    if (data.containsKey('scanlator')) {
      context.handle(_scanlatorMeta,
          scanlator.isAcceptableOrUnknown(data['scanlator']!, _scanlatorMeta));
    } else if (isInserting) {
      context.missing(_scanlatorMeta);
    }
    return context;
  }

  @override
  Set<i0.GeneratedColumn> get $primaryKey => const {};
  @override
  i1.ExcludedScanlator map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return i1.ExcludedScanlator(
      mangaId: attachedDatabase.typeMapping
          .read(i0.DriftSqlType.int, data['${effectivePrefix}manga_id'])!,
      scanlator: attachedDatabase.typeMapping
          .read(i0.DriftSqlType.string, data['${effectivePrefix}scanlator'])!,
    );
  }

  @override
  ExcludedScanlators createAlias(String alias) {
    return ExcludedScanlators(attachedDatabase, alias);
  }

  @override
  List<String> get customConstraints =>
      const ['FOREIGN KEY(manga_id)REFERENCES mangas(_id)ON DELETE CASCADE'];
  @override
  bool get dontWriteConstraints => true;
}

class ExcludedScanlator extends i0.DataClass
    implements i0.Insertable<i1.ExcludedScanlator> {
  final int mangaId;
  final String scanlator;
  const ExcludedScanlator({required this.mangaId, required this.scanlator});
  @override
  Map<String, i0.Expression> toColumns(bool nullToAbsent) {
    final map = <String, i0.Expression>{};
    map['manga_id'] = i0.Variable<int>(mangaId);
    map['scanlator'] = i0.Variable<String>(scanlator);
    return map;
  }

  i1.ExcludedScanlatorsCompanion toCompanion(bool nullToAbsent) {
    return i1.ExcludedScanlatorsCompanion(
      mangaId: i0.Value(mangaId),
      scanlator: i0.Value(scanlator),
    );
  }

  factory ExcludedScanlator.fromJson(Map<String, dynamic> json,
      {i0.ValueSerializer? serializer}) {
    serializer ??= i0.driftRuntimeOptions.defaultSerializer;
    return ExcludedScanlator(
      mangaId: serializer.fromJson<int>(json['manga_id']),
      scanlator: serializer.fromJson<String>(json['scanlator']),
    );
  }
  @override
  Map<String, dynamic> toJson({i0.ValueSerializer? serializer}) {
    serializer ??= i0.driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'manga_id': serializer.toJson<int>(mangaId),
      'scanlator': serializer.toJson<String>(scanlator),
    };
  }

  i1.ExcludedScanlator copyWith({int? mangaId, String? scanlator}) =>
      i1.ExcludedScanlator(
        mangaId: mangaId ?? this.mangaId,
        scanlator: scanlator ?? this.scanlator,
      );
  @override
  String toString() {
    return (StringBuffer('ExcludedScanlator(')
          ..write('mangaId: $mangaId, ')
          ..write('scanlator: $scanlator')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(mangaId, scanlator);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is i1.ExcludedScanlator &&
          other.mangaId == this.mangaId &&
          other.scanlator == this.scanlator);
}

class ExcludedScanlatorsCompanion
    extends i0.UpdateCompanion<i1.ExcludedScanlator> {
  final i0.Value<int> mangaId;
  final i0.Value<String> scanlator;
  final i0.Value<int> rowid;
  const ExcludedScanlatorsCompanion({
    this.mangaId = const i0.Value.absent(),
    this.scanlator = const i0.Value.absent(),
    this.rowid = const i0.Value.absent(),
  });
  ExcludedScanlatorsCompanion.insert({
    required int mangaId,
    required String scanlator,
    this.rowid = const i0.Value.absent(),
  })  : mangaId = i0.Value(mangaId),
        scanlator = i0.Value(scanlator);
  static i0.Insertable<i1.ExcludedScanlator> custom({
    i0.Expression<int>? mangaId,
    i0.Expression<String>? scanlator,
    i0.Expression<int>? rowid,
  }) {
    return i0.RawValuesInsertable({
      if (mangaId != null) 'manga_id': mangaId,
      if (scanlator != null) 'scanlator': scanlator,
      if (rowid != null) 'rowid': rowid,
    });
  }

  i1.ExcludedScanlatorsCompanion copyWith(
      {i0.Value<int>? mangaId,
      i0.Value<String>? scanlator,
      i0.Value<int>? rowid}) {
    return i1.ExcludedScanlatorsCompanion(
      mangaId: mangaId ?? this.mangaId,
      scanlator: scanlator ?? this.scanlator,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, i0.Expression> toColumns(bool nullToAbsent) {
    final map = <String, i0.Expression>{};
    if (mangaId.present) {
      map['manga_id'] = i0.Variable<int>(mangaId.value);
    }
    if (scanlator.present) {
      map['scanlator'] = i0.Variable<String>(scanlator.value);
    }
    if (rowid.present) {
      map['rowid'] = i0.Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ExcludedScanlatorsCompanion(')
          ..write('mangaId: $mangaId, ')
          ..write('scanlator: $scanlator, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

i0.Index get excludedScanlatorsMangaIdIndex => i0.Index(
    'excluded_scanlators_manga_id_index',
    'CREATE INDEX excluded_scanlators_manga_id_index ON excluded_scanlators (manga_id)');

class ExcludedScanlatorsDrift extends i2.ModularAccessor {
  ExcludedScanlatorsDrift(i0.GeneratedDatabase db) : super(db);
  i0.Selectable<String> getExcludedScanlatorsByMangaId({required int mangaId}) {
    return customSelect(
        'SELECT scanlator FROM excluded_scanlators WHERE manga_id = ?1',
        variables: [
          i0.Variable<int>(mangaId)
        ],
        readsFrom: {
          excludedScanlators,
        }).map((i0.QueryRow row) => row.read<String>('scanlator'));
  }

  i1.ExcludedScanlators get excludedScanlators =>
      this.resultSet<i1.ExcludedScanlators>('excluded_scanlators');
}
