// ignore_for_file: type=lint
import 'package:drift/drift.dart' as i0;
import 'package:flutteryomi/data/drift/data/history.drift.dart' as i1;
import 'package:drift/internal/modular.dart' as i2;
import 'package:flutteryomi/data/drift/data/chapters.drift.dart' as i3;
import 'package:flutteryomi/data/drift/data/mangas.drift.dart' as i4;

class History extends i0.Table with i0.TableInfo<History, i1.HistoryData> {
  @override
  final i0.GeneratedDatabase attachedDatabase;
  final String? _alias;
  History(this.attachedDatabase, [this._alias]);
  static const i0.VerificationMeta _idMeta = const i0.VerificationMeta('id');
  late final i0.GeneratedColumn<int> id = i0.GeneratedColumn<int>(
      '_id', aliasedName, false,
      type: i0.DriftSqlType.int,
      requiredDuringInsert: false,
      $customConstraints: 'NOT NULL PRIMARY KEY');
  static const i0.VerificationMeta _chapterIdMeta =
      const i0.VerificationMeta('chapterId');
  late final i0.GeneratedColumn<int> chapterId = i0.GeneratedColumn<int>(
      'chapter_id', aliasedName, false,
      type: i0.DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL UNIQUE');
  static const i0.VerificationMeta _readAtMeta =
      const i0.VerificationMeta('readAt');
  late final i0.GeneratedColumn<DateTime> readAt = i0.GeneratedColumn<DateTime>(
      'last_read', aliasedName, true,
      type: i0.DriftSqlType.dateTime,
      requiredDuringInsert: false,
      $customConstraints: '');
  static const i0.VerificationMeta _readDurationMeta =
      const i0.VerificationMeta('readDuration');
  late final i0.GeneratedColumn<int> readDuration = i0.GeneratedColumn<int>(
      'time_read', aliasedName, false,
      type: i0.DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  @override
  List<i0.GeneratedColumn> get $columns =>
      [id, chapterId, readAt, readDuration];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'history';
  @override
  i0.VerificationContext validateIntegrity(
      i0.Insertable<i1.HistoryData> instance,
      {bool isInserting = false}) {
    final context = i0.VerificationContext();
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
      context.handle(_readAtMeta,
          readAt.isAcceptableOrUnknown(data['last_read']!, _readAtMeta));
    }
    if (data.containsKey('time_read')) {
      context.handle(
          _readDurationMeta,
          readDuration.isAcceptableOrUnknown(
              data['time_read']!, _readDurationMeta));
    } else if (isInserting) {
      context.missing(_readDurationMeta);
    }
    return context;
  }

  @override
  Set<i0.GeneratedColumn> get $primaryKey => {id};
  @override
  i1.HistoryData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return i1.HistoryData(
      id: attachedDatabase.typeMapping
          .read(i0.DriftSqlType.int, data['${effectivePrefix}_id'])!,
      chapterId: attachedDatabase.typeMapping
          .read(i0.DriftSqlType.int, data['${effectivePrefix}chapter_id'])!,
      readAt: attachedDatabase.typeMapping
          .read(i0.DriftSqlType.dateTime, data['${effectivePrefix}last_read']),
      readDuration: attachedDatabase.typeMapping
          .read(i0.DriftSqlType.int, data['${effectivePrefix}time_read'])!,
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

class HistoryData extends i0.DataClass
    implements i0.Insertable<i1.HistoryData> {
  final int id;
  final int chapterId;
  final DateTime? readAt;
  final int readDuration;
  const HistoryData(
      {required this.id,
      required this.chapterId,
      this.readAt,
      required this.readDuration});
  @override
  Map<String, i0.Expression> toColumns(bool nullToAbsent) {
    final map = <String, i0.Expression>{};
    map['_id'] = i0.Variable<int>(id);
    map['chapter_id'] = i0.Variable<int>(chapterId);
    if (!nullToAbsent || readAt != null) {
      map['last_read'] = i0.Variable<DateTime>(readAt);
    }
    map['time_read'] = i0.Variable<int>(readDuration);
    return map;
  }

  i1.HistoryCompanion toCompanion(bool nullToAbsent) {
    return i1.HistoryCompanion(
      id: i0.Value(id),
      chapterId: i0.Value(chapterId),
      readAt: readAt == null && nullToAbsent
          ? const i0.Value.absent()
          : i0.Value(readAt),
      readDuration: i0.Value(readDuration),
    );
  }

  factory HistoryData.fromJson(Map<String, dynamic> json,
      {i0.ValueSerializer? serializer}) {
    serializer ??= i0.driftRuntimeOptions.defaultSerializer;
    return HistoryData(
      id: serializer.fromJson<int>(json['_id']),
      chapterId: serializer.fromJson<int>(json['chapter_id']),
      readAt: serializer.fromJson<DateTime?>(json['last_read']),
      readDuration: serializer.fromJson<int>(json['time_read']),
    );
  }
  @override
  Map<String, dynamic> toJson({i0.ValueSerializer? serializer}) {
    serializer ??= i0.driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      '_id': serializer.toJson<int>(id),
      'chapter_id': serializer.toJson<int>(chapterId),
      'last_read': serializer.toJson<DateTime?>(readAt),
      'time_read': serializer.toJson<int>(readDuration),
    };
  }

  i1.HistoryData copyWith(
          {int? id,
          int? chapterId,
          i0.Value<DateTime?> readAt = const i0.Value.absent(),
          int? readDuration}) =>
      i1.HistoryData(
        id: id ?? this.id,
        chapterId: chapterId ?? this.chapterId,
        readAt: readAt.present ? readAt.value : this.readAt,
        readDuration: readDuration ?? this.readDuration,
      );
  @override
  String toString() {
    return (StringBuffer('HistoryData(')
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
      (other is i1.HistoryData &&
          other.id == this.id &&
          other.chapterId == this.chapterId &&
          other.readAt == this.readAt &&
          other.readDuration == this.readDuration);
}

class HistoryCompanion extends i0.UpdateCompanion<i1.HistoryData> {
  final i0.Value<int> id;
  final i0.Value<int> chapterId;
  final i0.Value<DateTime?> readAt;
  final i0.Value<int> readDuration;
  const HistoryCompanion({
    this.id = const i0.Value.absent(),
    this.chapterId = const i0.Value.absent(),
    this.readAt = const i0.Value.absent(),
    this.readDuration = const i0.Value.absent(),
  });
  HistoryCompanion.insert({
    this.id = const i0.Value.absent(),
    required int chapterId,
    this.readAt = const i0.Value.absent(),
    required int readDuration,
  })  : chapterId = i0.Value(chapterId),
        readDuration = i0.Value(readDuration);
  static i0.Insertable<i1.HistoryData> custom({
    i0.Expression<int>? id,
    i0.Expression<int>? chapterId,
    i0.Expression<DateTime>? readAt,
    i0.Expression<int>? readDuration,
  }) {
    return i0.RawValuesInsertable({
      if (id != null) '_id': id,
      if (chapterId != null) 'chapter_id': chapterId,
      if (readAt != null) 'last_read': readAt,
      if (readDuration != null) 'time_read': readDuration,
    });
  }

  i1.HistoryCompanion copyWith(
      {i0.Value<int>? id,
      i0.Value<int>? chapterId,
      i0.Value<DateTime?>? readAt,
      i0.Value<int>? readDuration}) {
    return i1.HistoryCompanion(
      id: id ?? this.id,
      chapterId: chapterId ?? this.chapterId,
      readAt: readAt ?? this.readAt,
      readDuration: readDuration ?? this.readDuration,
    );
  }

  @override
  Map<String, i0.Expression> toColumns(bool nullToAbsent) {
    final map = <String, i0.Expression>{};
    if (id.present) {
      map['_id'] = i0.Variable<int>(id.value);
    }
    if (chapterId.present) {
      map['chapter_id'] = i0.Variable<int>(chapterId.value);
    }
    if (readAt.present) {
      map['last_read'] = i0.Variable<DateTime>(readAt.value);
    }
    if (readDuration.present) {
      map['time_read'] = i0.Variable<int>(readDuration.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('HistoryCompanion(')
          ..write('id: $id, ')
          ..write('chapterId: $chapterId, ')
          ..write('readAt: $readAt, ')
          ..write('readDuration: $readDuration')
          ..write(')'))
        .toString();
  }
}

i0.Index get historyHistoryChapterIdIndex => i0.Index(
    'history_history_chapter_id_index',
    'CREATE INDEX history_history_chapter_id_index ON history (chapter_id)');

class HistoryDrift extends i2.ModularAccessor {
  HistoryDrift(i0.GeneratedDatabase db) : super(db);
  i0.Selectable<i1.HistoryData> getHistoryByMangaId({required int mangaId}) {
    return customSelect(
        'SELECT H._id, H.chapter_id, H.last_read, H.time_read FROM history AS H JOIN chapters AS C ON H.chapter_id = C._id WHERE C.manga_id = ?1 AND C._id = H.chapter_id',
        variables: [
          i0.Variable<int>(mangaId)
        ],
        readsFrom: {
          history,
          chapters,
        }).asyncMap(history.mapFromRow);
  }

  i0.Selectable<i1.HistoryData> getHistoryByChapterUrl(
      {required String chapterUrl}) {
    return customSelect(
        'SELECT H._id, H.chapter_id, H.last_read, H.time_read FROM history AS H JOIN chapters AS C ON H.chapter_id = C._id WHERE C.url = ?1 AND C._id = H.chapter_id',
        variables: [
          i0.Variable<String>(chapterUrl)
        ],
        readsFrom: {
          history,
          chapters,
        }).asyncMap(history.mapFromRow);
  }

  Future<int> resetHistoryById({required int historyId}) {
    return customUpdate(
      'UPDATE history SET last_read = 0 WHERE _id = ?1',
      variables: [i0.Variable<int>(historyId)],
      updates: {history},
      updateKind: i0.UpdateKind.update,
    );
  }

  Future<int> resetHistoryByMangaId({required int mangaId}) {
    return customUpdate(
      'UPDATE history SET last_read = 0 WHERE _id IN (SELECT H._id FROM mangas AS M INNER JOIN chapters AS C ON M._id = C.manga_id INNER JOIN history AS H ON C._id = H.chapter_id WHERE M._id = ?1)',
      variables: [i0.Variable<int>(mangaId)],
      updates: {history},
      updateKind: i0.UpdateKind.update,
    );
  }

  Future<int> removeAllHistory() {
    return customUpdate(
      'DELETE FROM history',
      variables: [],
      updates: {history},
      updateKind: i0.UpdateKind.delete,
    );
  }

  Future<int> removeResettedHistory() {
    return customUpdate(
      'DELETE FROM history WHERE last_read = 0',
      variables: [],
      updates: {history},
      updateKind: i0.UpdateKind.delete,
    );
  }

  i0.Selectable<int> getReadDuration() {
    return customSelect(
        'SELECT coalesce(sum(time_read), 0) AS _c0 FROM history',
        variables: [],
        readsFrom: {
          history,
        }).map((i0.QueryRow row) => row.read<int>('_c0'));
  }

  i1.History get history => this.resultSet<i1.History>('history');
  i3.Chapters get chapters => this.resultSet<i3.Chapters>('chapters');
  i4.Mangas get mangas => this.resultSet<i4.Mangas>('mangas');
}
