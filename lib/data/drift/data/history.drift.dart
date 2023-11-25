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
  static const i0.VerificationMeta _lastReadMeta =
      const i0.VerificationMeta('lastRead');
  late final i0.GeneratedColumn<DateTime> lastRead =
      i0.GeneratedColumn<DateTime>('last_read', aliasedName, true,
          type: i0.DriftSqlType.dateTime,
          requiredDuringInsert: false,
          $customConstraints: '');
  static const i0.VerificationMeta _timeReadMeta =
      const i0.VerificationMeta('timeRead');
  late final i0.GeneratedColumn<int> timeRead = i0.GeneratedColumn<int>(
      'time_read', aliasedName, false,
      type: i0.DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  @override
  List<i0.GeneratedColumn> get $columns => [id, chapterId, lastRead, timeRead];
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
  Set<i0.GeneratedColumn> get $primaryKey => {id};
  @override
  i1.HistoryData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return i1.HistoryData(
      id: attachedDatabase.typeMapping
          .read(i0.DriftSqlType.int, data['${effectivePrefix}_id'])!,
      chapterId: attachedDatabase.typeMapping
          .read(i0.DriftSqlType.int, data['${effectivePrefix}chapter_id'])!,
      lastRead: attachedDatabase.typeMapping
          .read(i0.DriftSqlType.dateTime, data['${effectivePrefix}last_read']),
      timeRead: attachedDatabase.typeMapping
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
  final DateTime? lastRead;
  final int timeRead;
  const HistoryData(
      {required this.id,
      required this.chapterId,
      this.lastRead,
      required this.timeRead});
  @override
  Map<String, i0.Expression> toColumns(bool nullToAbsent) {
    final map = <String, i0.Expression>{};
    map['_id'] = i0.Variable<int>(id);
    map['chapter_id'] = i0.Variable<int>(chapterId);
    if (!nullToAbsent || lastRead != null) {
      map['last_read'] = i0.Variable<DateTime>(lastRead);
    }
    map['time_read'] = i0.Variable<int>(timeRead);
    return map;
  }

  i1.HistoryCompanion toCompanion(bool nullToAbsent) {
    return i1.HistoryCompanion(
      id: i0.Value(id),
      chapterId: i0.Value(chapterId),
      lastRead: lastRead == null && nullToAbsent
          ? const i0.Value.absent()
          : i0.Value(lastRead),
      timeRead: i0.Value(timeRead),
    );
  }

  factory HistoryData.fromJson(Map<String, dynamic> json,
      {i0.ValueSerializer? serializer}) {
    serializer ??= i0.driftRuntimeOptions.defaultSerializer;
    return HistoryData(
      id: serializer.fromJson<int>(json['_id']),
      chapterId: serializer.fromJson<int>(json['chapter_id']),
      lastRead: serializer.fromJson<DateTime?>(json['last_read']),
      timeRead: serializer.fromJson<int>(json['time_read']),
    );
  }
  @override
  Map<String, dynamic> toJson({i0.ValueSerializer? serializer}) {
    serializer ??= i0.driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      '_id': serializer.toJson<int>(id),
      'chapter_id': serializer.toJson<int>(chapterId),
      'last_read': serializer.toJson<DateTime?>(lastRead),
      'time_read': serializer.toJson<int>(timeRead),
    };
  }

  i1.HistoryData copyWith(
          {int? id,
          int? chapterId,
          i0.Value<DateTime?> lastRead = const i0.Value.absent(),
          int? timeRead}) =>
      i1.HistoryData(
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
      (other is i1.HistoryData &&
          other.id == this.id &&
          other.chapterId == this.chapterId &&
          other.lastRead == this.lastRead &&
          other.timeRead == this.timeRead);
}

class HistoryCompanion extends i0.UpdateCompanion<i1.HistoryData> {
  final i0.Value<int> id;
  final i0.Value<int> chapterId;
  final i0.Value<DateTime?> lastRead;
  final i0.Value<int> timeRead;
  const HistoryCompanion({
    this.id = const i0.Value.absent(),
    this.chapterId = const i0.Value.absent(),
    this.lastRead = const i0.Value.absent(),
    this.timeRead = const i0.Value.absent(),
  });
  HistoryCompanion.insert({
    this.id = const i0.Value.absent(),
    required int chapterId,
    this.lastRead = const i0.Value.absent(),
    required int timeRead,
  })  : chapterId = i0.Value(chapterId),
        timeRead = i0.Value(timeRead);
  static i0.Insertable<i1.HistoryData> custom({
    i0.Expression<int>? id,
    i0.Expression<int>? chapterId,
    i0.Expression<DateTime>? lastRead,
    i0.Expression<int>? timeRead,
  }) {
    return i0.RawValuesInsertable({
      if (id != null) '_id': id,
      if (chapterId != null) 'chapter_id': chapterId,
      if (lastRead != null) 'last_read': lastRead,
      if (timeRead != null) 'time_read': timeRead,
    });
  }

  i1.HistoryCompanion copyWith(
      {i0.Value<int>? id,
      i0.Value<int>? chapterId,
      i0.Value<DateTime?>? lastRead,
      i0.Value<int>? timeRead}) {
    return i1.HistoryCompanion(
      id: id ?? this.id,
      chapterId: chapterId ?? this.chapterId,
      lastRead: lastRead ?? this.lastRead,
      timeRead: timeRead ?? this.timeRead,
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
    if (lastRead.present) {
      map['last_read'] = i0.Variable<DateTime>(lastRead.value);
    }
    if (timeRead.present) {
      map['time_read'] = i0.Variable<int>(timeRead.value);
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
