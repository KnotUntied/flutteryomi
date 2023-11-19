// ignore_for_file: type=lint
import 'package:drift/drift.dart' as i0;
import 'package:flutteryomi/data/tables/manga_sync.drift.dart' as i1;
import 'package:drift/internal/modular.dart' as i2;

class MangaSync extends i0.Table
    with i0.TableInfo<MangaSync, i1.MangaSyncData> {
  @override
  final i0.GeneratedDatabase attachedDatabase;
  final String? _alias;
  MangaSync(this.attachedDatabase, [this._alias]);
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
  static const i0.VerificationMeta _syncIdMeta =
      const i0.VerificationMeta('syncId');
  late final i0.GeneratedColumn<int> syncId = i0.GeneratedColumn<int>(
      'sync_id', aliasedName, false,
      type: i0.DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const i0.VerificationMeta _remoteIdMeta =
      const i0.VerificationMeta('remoteId');
  late final i0.GeneratedColumn<int> remoteId = i0.GeneratedColumn<int>(
      'remote_id', aliasedName, false,
      type: i0.DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const i0.VerificationMeta _libraryIdMeta =
      const i0.VerificationMeta('libraryId');
  late final i0.GeneratedColumn<int> libraryId = i0.GeneratedColumn<int>(
      'library_id', aliasedName, true,
      type: i0.DriftSqlType.int,
      requiredDuringInsert: false,
      $customConstraints: '');
  static const i0.VerificationMeta _titleMeta =
      const i0.VerificationMeta('title');
  late final i0.GeneratedColumn<String> title = i0.GeneratedColumn<String>(
      'title', aliasedName, false,
      type: i0.DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const i0.VerificationMeta _lastChapterReadMeta =
      const i0.VerificationMeta('lastChapterRead');
  late final i0.GeneratedColumn<double> lastChapterRead =
      i0.GeneratedColumn<double>('last_chapter_read', aliasedName, false,
          type: i0.DriftSqlType.double,
          requiredDuringInsert: true,
          $customConstraints: 'NOT NULL');
  static const i0.VerificationMeta _totalChaptersMeta =
      const i0.VerificationMeta('totalChapters');
  late final i0.GeneratedColumn<int> totalChapters = i0.GeneratedColumn<int>(
      'total_chapters', aliasedName, false,
      type: i0.DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const i0.VerificationMeta _statusMeta =
      const i0.VerificationMeta('status');
  late final i0.GeneratedColumn<int> status = i0.GeneratedColumn<int>(
      'status', aliasedName, false,
      type: i0.DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const i0.VerificationMeta _scoreMeta =
      const i0.VerificationMeta('score');
  late final i0.GeneratedColumn<double> score = i0.GeneratedColumn<double>(
      'score', aliasedName, false,
      type: i0.DriftSqlType.double,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const i0.VerificationMeta _remoteUrlMeta =
      const i0.VerificationMeta('remoteUrl');
  late final i0.GeneratedColumn<String> remoteUrl = i0.GeneratedColumn<String>(
      'remote_url', aliasedName, false,
      type: i0.DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const i0.VerificationMeta _startDateMeta =
      const i0.VerificationMeta('startDate');
  late final i0.GeneratedColumn<int> startDate = i0.GeneratedColumn<int>(
      'start_date', aliasedName, false,
      type: i0.DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const i0.VerificationMeta _finishDateMeta =
      const i0.VerificationMeta('finishDate');
  late final i0.GeneratedColumn<int> finishDate = i0.GeneratedColumn<int>(
      'finish_date', aliasedName, false,
      type: i0.DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  @override
  List<i0.GeneratedColumn> get $columns => [
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
  i0.VerificationContext validateIntegrity(
      i0.Insertable<i1.MangaSyncData> instance,
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
  Set<i0.GeneratedColumn> get $primaryKey => {id};
  @override
  List<Set<i0.GeneratedColumn>> get uniqueKeys => [
        {mangaId, syncId},
      ];
  @override
  i1.MangaSyncData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return i1.MangaSyncData(
      id: attachedDatabase.typeMapping
          .read(i0.DriftSqlType.int, data['${effectivePrefix}_id'])!,
      mangaId: attachedDatabase.typeMapping
          .read(i0.DriftSqlType.int, data['${effectivePrefix}manga_id'])!,
      syncId: attachedDatabase.typeMapping
          .read(i0.DriftSqlType.int, data['${effectivePrefix}sync_id'])!,
      remoteId: attachedDatabase.typeMapping
          .read(i0.DriftSqlType.int, data['${effectivePrefix}remote_id'])!,
      libraryId: attachedDatabase.typeMapping
          .read(i0.DriftSqlType.int, data['${effectivePrefix}library_id']),
      title: attachedDatabase.typeMapping
          .read(i0.DriftSqlType.string, data['${effectivePrefix}title'])!,
      lastChapterRead: attachedDatabase.typeMapping.read(
          i0.DriftSqlType.double, data['${effectivePrefix}last_chapter_read'])!,
      totalChapters: attachedDatabase.typeMapping
          .read(i0.DriftSqlType.int, data['${effectivePrefix}total_chapters'])!,
      status: attachedDatabase.typeMapping
          .read(i0.DriftSqlType.int, data['${effectivePrefix}status'])!,
      score: attachedDatabase.typeMapping
          .read(i0.DriftSqlType.double, data['${effectivePrefix}score'])!,
      remoteUrl: attachedDatabase.typeMapping
          .read(i0.DriftSqlType.string, data['${effectivePrefix}remote_url'])!,
      startDate: attachedDatabase.typeMapping
          .read(i0.DriftSqlType.int, data['${effectivePrefix}start_date'])!,
      finishDate: attachedDatabase.typeMapping
          .read(i0.DriftSqlType.int, data['${effectivePrefix}finish_date'])!,
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

class MangaSyncData extends i0.DataClass
    implements i0.Insertable<i1.MangaSyncData> {
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
  Map<String, i0.Expression> toColumns(bool nullToAbsent) {
    final map = <String, i0.Expression>{};
    map['_id'] = i0.Variable<int>(id);
    map['manga_id'] = i0.Variable<int>(mangaId);
    map['sync_id'] = i0.Variable<int>(syncId);
    map['remote_id'] = i0.Variable<int>(remoteId);
    if (!nullToAbsent || libraryId != null) {
      map['library_id'] = i0.Variable<int>(libraryId);
    }
    map['title'] = i0.Variable<String>(title);
    map['last_chapter_read'] = i0.Variable<double>(lastChapterRead);
    map['total_chapters'] = i0.Variable<int>(totalChapters);
    map['status'] = i0.Variable<int>(status);
    map['score'] = i0.Variable<double>(score);
    map['remote_url'] = i0.Variable<String>(remoteUrl);
    map['start_date'] = i0.Variable<int>(startDate);
    map['finish_date'] = i0.Variable<int>(finishDate);
    return map;
  }

  i1.MangaSyncCompanion toCompanion(bool nullToAbsent) {
    return i1.MangaSyncCompanion(
      id: i0.Value(id),
      mangaId: i0.Value(mangaId),
      syncId: i0.Value(syncId),
      remoteId: i0.Value(remoteId),
      libraryId: libraryId == null && nullToAbsent
          ? const i0.Value.absent()
          : i0.Value(libraryId),
      title: i0.Value(title),
      lastChapterRead: i0.Value(lastChapterRead),
      totalChapters: i0.Value(totalChapters),
      status: i0.Value(status),
      score: i0.Value(score),
      remoteUrl: i0.Value(remoteUrl),
      startDate: i0.Value(startDate),
      finishDate: i0.Value(finishDate),
    );
  }

  factory MangaSyncData.fromJson(Map<String, dynamic> json,
      {i0.ValueSerializer? serializer}) {
    serializer ??= i0.driftRuntimeOptions.defaultSerializer;
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
  Map<String, dynamic> toJson({i0.ValueSerializer? serializer}) {
    serializer ??= i0.driftRuntimeOptions.defaultSerializer;
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

  i1.MangaSyncData copyWith(
          {int? id,
          int? mangaId,
          int? syncId,
          int? remoteId,
          i0.Value<int?> libraryId = const i0.Value.absent(),
          String? title,
          double? lastChapterRead,
          int? totalChapters,
          int? status,
          double? score,
          String? remoteUrl,
          int? startDate,
          int? finishDate}) =>
      i1.MangaSyncData(
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
      (other is i1.MangaSyncData &&
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

class MangaSyncCompanion extends i0.UpdateCompanion<i1.MangaSyncData> {
  final i0.Value<int> id;
  final i0.Value<int> mangaId;
  final i0.Value<int> syncId;
  final i0.Value<int> remoteId;
  final i0.Value<int?> libraryId;
  final i0.Value<String> title;
  final i0.Value<double> lastChapterRead;
  final i0.Value<int> totalChapters;
  final i0.Value<int> status;
  final i0.Value<double> score;
  final i0.Value<String> remoteUrl;
  final i0.Value<int> startDate;
  final i0.Value<int> finishDate;
  const MangaSyncCompanion({
    this.id = const i0.Value.absent(),
    this.mangaId = const i0.Value.absent(),
    this.syncId = const i0.Value.absent(),
    this.remoteId = const i0.Value.absent(),
    this.libraryId = const i0.Value.absent(),
    this.title = const i0.Value.absent(),
    this.lastChapterRead = const i0.Value.absent(),
    this.totalChapters = const i0.Value.absent(),
    this.status = const i0.Value.absent(),
    this.score = const i0.Value.absent(),
    this.remoteUrl = const i0.Value.absent(),
    this.startDate = const i0.Value.absent(),
    this.finishDate = const i0.Value.absent(),
  });
  MangaSyncCompanion.insert({
    this.id = const i0.Value.absent(),
    required int mangaId,
    required int syncId,
    required int remoteId,
    this.libraryId = const i0.Value.absent(),
    required String title,
    required double lastChapterRead,
    required int totalChapters,
    required int status,
    required double score,
    required String remoteUrl,
    required int startDate,
    required int finishDate,
  })  : mangaId = i0.Value(mangaId),
        syncId = i0.Value(syncId),
        remoteId = i0.Value(remoteId),
        title = i0.Value(title),
        lastChapterRead = i0.Value(lastChapterRead),
        totalChapters = i0.Value(totalChapters),
        status = i0.Value(status),
        score = i0.Value(score),
        remoteUrl = i0.Value(remoteUrl),
        startDate = i0.Value(startDate),
        finishDate = i0.Value(finishDate);
  static i0.Insertable<i1.MangaSyncData> custom({
    i0.Expression<int>? id,
    i0.Expression<int>? mangaId,
    i0.Expression<int>? syncId,
    i0.Expression<int>? remoteId,
    i0.Expression<int>? libraryId,
    i0.Expression<String>? title,
    i0.Expression<double>? lastChapterRead,
    i0.Expression<int>? totalChapters,
    i0.Expression<int>? status,
    i0.Expression<double>? score,
    i0.Expression<String>? remoteUrl,
    i0.Expression<int>? startDate,
    i0.Expression<int>? finishDate,
  }) {
    return i0.RawValuesInsertable({
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

  i1.MangaSyncCompanion copyWith(
      {i0.Value<int>? id,
      i0.Value<int>? mangaId,
      i0.Value<int>? syncId,
      i0.Value<int>? remoteId,
      i0.Value<int?>? libraryId,
      i0.Value<String>? title,
      i0.Value<double>? lastChapterRead,
      i0.Value<int>? totalChapters,
      i0.Value<int>? status,
      i0.Value<double>? score,
      i0.Value<String>? remoteUrl,
      i0.Value<int>? startDate,
      i0.Value<int>? finishDate}) {
    return i1.MangaSyncCompanion(
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
  Map<String, i0.Expression> toColumns(bool nullToAbsent) {
    final map = <String, i0.Expression>{};
    if (id.present) {
      map['_id'] = i0.Variable<int>(id.value);
    }
    if (mangaId.present) {
      map['manga_id'] = i0.Variable<int>(mangaId.value);
    }
    if (syncId.present) {
      map['sync_id'] = i0.Variable<int>(syncId.value);
    }
    if (remoteId.present) {
      map['remote_id'] = i0.Variable<int>(remoteId.value);
    }
    if (libraryId.present) {
      map['library_id'] = i0.Variable<int>(libraryId.value);
    }
    if (title.present) {
      map['title'] = i0.Variable<String>(title.value);
    }
    if (lastChapterRead.present) {
      map['last_chapter_read'] = i0.Variable<double>(lastChapterRead.value);
    }
    if (totalChapters.present) {
      map['total_chapters'] = i0.Variable<int>(totalChapters.value);
    }
    if (status.present) {
      map['status'] = i0.Variable<int>(status.value);
    }
    if (score.present) {
      map['score'] = i0.Variable<double>(score.value);
    }
    if (remoteUrl.present) {
      map['remote_url'] = i0.Variable<String>(remoteUrl.value);
    }
    if (startDate.present) {
      map['start_date'] = i0.Variable<int>(startDate.value);
    }
    if (finishDate.present) {
      map['finish_date'] = i0.Variable<int>(finishDate.value);
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

class MangaSyncDrift extends i2.ModularAccessor {
  MangaSyncDrift(i0.GeneratedDatabase db) : super(db);
  i0.Selectable<i1.MangaSyncData> getTracks() {
    return customSelect('SELECT * FROM manga_sync', variables: [], readsFrom: {
      mangaSync,
    }).asyncMap(mangaSync.mapFromRow);
  }

  i0.Selectable<i1.MangaSyncData> getTrackById({required int id}) {
    return customSelect('SELECT * FROM manga_sync WHERE _id = ?1', variables: [
      i0.Variable<int>(id)
    ], readsFrom: {
      mangaSync,
    }).asyncMap(mangaSync.mapFromRow);
  }

  i0.Selectable<i1.MangaSyncData> getTracksByMangaId({required int mangaId}) {
    return customSelect('SELECT * FROM manga_sync WHERE manga_id = ?1',
        variables: [
          i0.Variable<int>(mangaId)
        ],
        readsFrom: {
          mangaSync,
        }).asyncMap(mangaSync.mapFromRow);
  }

  i1.MangaSync get mangaSync => this.resultSet<i1.MangaSync>('manga_sync');
}
