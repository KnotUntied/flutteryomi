// ignore_for_file: type=lint
import 'package:drift/drift.dart' as i0;
import 'package:flutteryomi/data/drift/data/chapters.drift.dart' as i1;
import 'package:drift/internal/modular.dart' as i2;
import 'package:flutteryomi/data/drift/data/excluded_scanlators.drift.dart'
    as i3;

class Chapters extends i0.Table with i0.TableInfo<Chapters, i1.Chapter> {
  @override
  final i0.GeneratedDatabase attachedDatabase;
  final String? _alias;
  Chapters(this.attachedDatabase, [this._alias]);
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
  static const i0.VerificationMeta _urlMeta = const i0.VerificationMeta('url');
  late final i0.GeneratedColumn<String> url = i0.GeneratedColumn<String>(
      'url', aliasedName, false,
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
  static const i0.VerificationMeta _scanlatorMeta =
      const i0.VerificationMeta('scanlator');
  late final i0.GeneratedColumn<String> scanlator = i0.GeneratedColumn<String>(
      'scanlator', aliasedName, true,
      type: i0.DriftSqlType.string,
      requiredDuringInsert: false,
      $customConstraints: '');
  static const i0.VerificationMeta _readMeta =
      const i0.VerificationMeta('read');
  late final i0.GeneratedColumn<bool> read = i0.GeneratedColumn<bool>(
      'read', aliasedName, false,
      type: i0.DriftSqlType.bool,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const i0.VerificationMeta _bookmarkMeta =
      const i0.VerificationMeta('bookmark');
  late final i0.GeneratedColumn<bool> bookmark = i0.GeneratedColumn<bool>(
      'bookmark', aliasedName, false,
      type: i0.DriftSqlType.bool,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const i0.VerificationMeta _lastPageReadMeta =
      const i0.VerificationMeta('lastPageRead');
  late final i0.GeneratedColumn<int> lastPageRead = i0.GeneratedColumn<int>(
      'last_page_read', aliasedName, false,
      type: i0.DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const i0.VerificationMeta _chapterNumberMeta =
      const i0.VerificationMeta('chapterNumber');
  late final i0.GeneratedColumn<double> chapterNumber =
      i0.GeneratedColumn<double>('chapter_number', aliasedName, false,
          type: i0.DriftSqlType.double,
          requiredDuringInsert: true,
          $customConstraints: 'NOT NULL');
  static const i0.VerificationMeta _sourceOrderMeta =
      const i0.VerificationMeta('sourceOrder');
  late final i0.GeneratedColumn<int> sourceOrder = i0.GeneratedColumn<int>(
      'source_order', aliasedName, false,
      type: i0.DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const i0.VerificationMeta _dateFetchMeta =
      const i0.VerificationMeta('dateFetch');
  late final i0.GeneratedColumn<DateTime> dateFetch =
      i0.GeneratedColumn<DateTime>('date_fetch', aliasedName, false,
          type: i0.DriftSqlType.dateTime,
          requiredDuringInsert: true,
          $customConstraints: 'NOT NULL');
  static const i0.VerificationMeta _dateUploadMeta =
      const i0.VerificationMeta('dateUpload');
  late final i0.GeneratedColumn<DateTime> dateUpload =
      i0.GeneratedColumn<DateTime>('date_upload', aliasedName, false,
          type: i0.DriftSqlType.dateTime,
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
  List<i0.GeneratedColumn> get $columns => [
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
  i0.VerificationContext validateIntegrity(i0.Insertable<i1.Chapter> instance,
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
  Set<i0.GeneratedColumn> get $primaryKey => {id};
  @override
  i1.Chapter map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return i1.Chapter(
      id: attachedDatabase.typeMapping
          .read(i0.DriftSqlType.int, data['${effectivePrefix}_id'])!,
      mangaId: attachedDatabase.typeMapping
          .read(i0.DriftSqlType.int, data['${effectivePrefix}manga_id'])!,
      url: attachedDatabase.typeMapping
          .read(i0.DriftSqlType.string, data['${effectivePrefix}url'])!,
      name: attachedDatabase.typeMapping
          .read(i0.DriftSqlType.string, data['${effectivePrefix}name'])!,
      scanlator: attachedDatabase.typeMapping
          .read(i0.DriftSqlType.string, data['${effectivePrefix}scanlator']),
      read: attachedDatabase.typeMapping
          .read(i0.DriftSqlType.bool, data['${effectivePrefix}read'])!,
      bookmark: attachedDatabase.typeMapping
          .read(i0.DriftSqlType.bool, data['${effectivePrefix}bookmark'])!,
      lastPageRead: attachedDatabase.typeMapping
          .read(i0.DriftSqlType.int, data['${effectivePrefix}last_page_read'])!,
      chapterNumber: attachedDatabase.typeMapping.read(
          i0.DriftSqlType.double, data['${effectivePrefix}chapter_number'])!,
      sourceOrder: attachedDatabase.typeMapping
          .read(i0.DriftSqlType.int, data['${effectivePrefix}source_order'])!,
      dateFetch: attachedDatabase.typeMapping.read(
          i0.DriftSqlType.dateTime, data['${effectivePrefix}date_fetch'])!,
      dateUpload: attachedDatabase.typeMapping.read(
          i0.DriftSqlType.dateTime, data['${effectivePrefix}date_upload'])!,
      lastModifiedAt: attachedDatabase.typeMapping.read(
          i0.DriftSqlType.dateTime,
          data['${effectivePrefix}last_modified_at'])!,
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

class Chapter extends i0.DataClass implements i0.Insertable<i1.Chapter> {
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
  Map<String, i0.Expression> toColumns(bool nullToAbsent) {
    final map = <String, i0.Expression>{};
    map['_id'] = i0.Variable<int>(id);
    map['manga_id'] = i0.Variable<int>(mangaId);
    map['url'] = i0.Variable<String>(url);
    map['name'] = i0.Variable<String>(name);
    if (!nullToAbsent || scanlator != null) {
      map['scanlator'] = i0.Variable<String>(scanlator);
    }
    map['read'] = i0.Variable<bool>(read);
    map['bookmark'] = i0.Variable<bool>(bookmark);
    map['last_page_read'] = i0.Variable<int>(lastPageRead);
    map['chapter_number'] = i0.Variable<double>(chapterNumber);
    map['source_order'] = i0.Variable<int>(sourceOrder);
    map['date_fetch'] = i0.Variable<DateTime>(dateFetch);
    map['date_upload'] = i0.Variable<DateTime>(dateUpload);
    map['last_modified_at'] = i0.Variable<DateTime>(lastModifiedAt);
    return map;
  }

  i1.ChaptersCompanion toCompanion(bool nullToAbsent) {
    return i1.ChaptersCompanion(
      id: i0.Value(id),
      mangaId: i0.Value(mangaId),
      url: i0.Value(url),
      name: i0.Value(name),
      scanlator: scanlator == null && nullToAbsent
          ? const i0.Value.absent()
          : i0.Value(scanlator),
      read: i0.Value(read),
      bookmark: i0.Value(bookmark),
      lastPageRead: i0.Value(lastPageRead),
      chapterNumber: i0.Value(chapterNumber),
      sourceOrder: i0.Value(sourceOrder),
      dateFetch: i0.Value(dateFetch),
      dateUpload: i0.Value(dateUpload),
      lastModifiedAt: i0.Value(lastModifiedAt),
    );
  }

  factory Chapter.fromJson(Map<String, dynamic> json,
      {i0.ValueSerializer? serializer}) {
    serializer ??= i0.driftRuntimeOptions.defaultSerializer;
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
  Map<String, dynamic> toJson({i0.ValueSerializer? serializer}) {
    serializer ??= i0.driftRuntimeOptions.defaultSerializer;
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

  i1.Chapter copyWith(
          {int? id,
          int? mangaId,
          String? url,
          String? name,
          i0.Value<String?> scanlator = const i0.Value.absent(),
          bool? read,
          bool? bookmark,
          int? lastPageRead,
          double? chapterNumber,
          int? sourceOrder,
          DateTime? dateFetch,
          DateTime? dateUpload,
          DateTime? lastModifiedAt}) =>
      i1.Chapter(
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
      (other is i1.Chapter &&
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

class ChaptersCompanion extends i0.UpdateCompanion<i1.Chapter> {
  final i0.Value<int> id;
  final i0.Value<int> mangaId;
  final i0.Value<String> url;
  final i0.Value<String> name;
  final i0.Value<String?> scanlator;
  final i0.Value<bool> read;
  final i0.Value<bool> bookmark;
  final i0.Value<int> lastPageRead;
  final i0.Value<double> chapterNumber;
  final i0.Value<int> sourceOrder;
  final i0.Value<DateTime> dateFetch;
  final i0.Value<DateTime> dateUpload;
  final i0.Value<DateTime> lastModifiedAt;
  const ChaptersCompanion({
    this.id = const i0.Value.absent(),
    this.mangaId = const i0.Value.absent(),
    this.url = const i0.Value.absent(),
    this.name = const i0.Value.absent(),
    this.scanlator = const i0.Value.absent(),
    this.read = const i0.Value.absent(),
    this.bookmark = const i0.Value.absent(),
    this.lastPageRead = const i0.Value.absent(),
    this.chapterNumber = const i0.Value.absent(),
    this.sourceOrder = const i0.Value.absent(),
    this.dateFetch = const i0.Value.absent(),
    this.dateUpload = const i0.Value.absent(),
    this.lastModifiedAt = const i0.Value.absent(),
  });
  ChaptersCompanion.insert({
    this.id = const i0.Value.absent(),
    required int mangaId,
    required String url,
    required String name,
    this.scanlator = const i0.Value.absent(),
    required bool read,
    required bool bookmark,
    required int lastPageRead,
    required double chapterNumber,
    required int sourceOrder,
    required DateTime dateFetch,
    required DateTime dateUpload,
    this.lastModifiedAt = const i0.Value.absent(),
  })  : mangaId = i0.Value(mangaId),
        url = i0.Value(url),
        name = i0.Value(name),
        read = i0.Value(read),
        bookmark = i0.Value(bookmark),
        lastPageRead = i0.Value(lastPageRead),
        chapterNumber = i0.Value(chapterNumber),
        sourceOrder = i0.Value(sourceOrder),
        dateFetch = i0.Value(dateFetch),
        dateUpload = i0.Value(dateUpload);
  static i0.Insertable<i1.Chapter> custom({
    i0.Expression<int>? id,
    i0.Expression<int>? mangaId,
    i0.Expression<String>? url,
    i0.Expression<String>? name,
    i0.Expression<String>? scanlator,
    i0.Expression<bool>? read,
    i0.Expression<bool>? bookmark,
    i0.Expression<int>? lastPageRead,
    i0.Expression<double>? chapterNumber,
    i0.Expression<int>? sourceOrder,
    i0.Expression<DateTime>? dateFetch,
    i0.Expression<DateTime>? dateUpload,
    i0.Expression<DateTime>? lastModifiedAt,
  }) {
    return i0.RawValuesInsertable({
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

  i1.ChaptersCompanion copyWith(
      {i0.Value<int>? id,
      i0.Value<int>? mangaId,
      i0.Value<String>? url,
      i0.Value<String>? name,
      i0.Value<String?>? scanlator,
      i0.Value<bool>? read,
      i0.Value<bool>? bookmark,
      i0.Value<int>? lastPageRead,
      i0.Value<double>? chapterNumber,
      i0.Value<int>? sourceOrder,
      i0.Value<DateTime>? dateFetch,
      i0.Value<DateTime>? dateUpload,
      i0.Value<DateTime>? lastModifiedAt}) {
    return i1.ChaptersCompanion(
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
  Map<String, i0.Expression> toColumns(bool nullToAbsent) {
    final map = <String, i0.Expression>{};
    if (id.present) {
      map['_id'] = i0.Variable<int>(id.value);
    }
    if (mangaId.present) {
      map['manga_id'] = i0.Variable<int>(mangaId.value);
    }
    if (url.present) {
      map['url'] = i0.Variable<String>(url.value);
    }
    if (name.present) {
      map['name'] = i0.Variable<String>(name.value);
    }
    if (scanlator.present) {
      map['scanlator'] = i0.Variable<String>(scanlator.value);
    }
    if (read.present) {
      map['read'] = i0.Variable<bool>(read.value);
    }
    if (bookmark.present) {
      map['bookmark'] = i0.Variable<bool>(bookmark.value);
    }
    if (lastPageRead.present) {
      map['last_page_read'] = i0.Variable<int>(lastPageRead.value);
    }
    if (chapterNumber.present) {
      map['chapter_number'] = i0.Variable<double>(chapterNumber.value);
    }
    if (sourceOrder.present) {
      map['source_order'] = i0.Variable<int>(sourceOrder.value);
    }
    if (dateFetch.present) {
      map['date_fetch'] = i0.Variable<DateTime>(dateFetch.value);
    }
    if (dateUpload.present) {
      map['date_upload'] = i0.Variable<DateTime>(dateUpload.value);
    }
    if (lastModifiedAt.present) {
      map['last_modified_at'] = i0.Variable<DateTime>(lastModifiedAt.value);
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

i0.Index get chaptersMangaIdIndex => i0.Index('chapters_manga_id_index',
    'CREATE INDEX chapters_manga_id_index ON chapters (manga_id)');
i0.Index get chaptersUnreadByMangaIndex => i0.Index(
    'chapters_unread_by_manga_index',
    'CREATE INDEX chapters_unread_by_manga_index ON chapters (manga_id, read) WHERE read = 0');
i0.Trigger get updateLastModifiedAtChapters => i0.Trigger(
    'CREATE TRIGGER update_last_modified_at_chapters AFTER UPDATE ON chapters BEGIN UPDATE chapters SET last_modified_at = unixepoch() WHERE _id = new._id;END',
    'update_last_modified_at_chapters');

class ChaptersDrift extends i2.ModularAccessor {
  ChaptersDrift(i0.GeneratedDatabase db) : super(db);
  i0.Selectable<i1.Chapter> getChapterById({required int id}) {
    return customSelect('SELECT * FROM chapters WHERE _id = ?1', variables: [
      i0.Variable<int>(id)
    ], readsFrom: {
      chapters,
    }).asyncMap(chapters.mapFromRow);
  }

  i0.Selectable<i1.Chapter> getChaptersByMangaId(
      {required int mangaId, required bool applyScanlatorFilter}) {
    return customSelect(
        'SELECT C.* FROM chapters AS C LEFT JOIN excluded_scanlators AS ES ON C.manga_id = ES.manga_id AND C.scanlator = ES.scanlator WHERE C.manga_id = ?1 AND(?2 = 0 OR ES.scanlator IS NULL)',
        variables: [
          i0.Variable<int>(mangaId),
          i0.Variable<bool>(applyScanlatorFilter)
        ],
        readsFrom: {
          chapters,
          excludedScanlators,
        }).asyncMap(chapters.mapFromRow);
  }

  i0.Selectable<String?> getScanlatorsByMangaId({required int mangaId}) {
    return customSelect('SELECT scanlator FROM chapters WHERE manga_id = ?1',
        variables: [
          i0.Variable<int>(mangaId)
        ],
        readsFrom: {
          chapters,
        }).map((i0.QueryRow row) => row.readNullable<String>('scanlator'));
  }

  i0.Selectable<i1.Chapter> getBookmarkedChaptersByMangaId(
      {required int mangaId}) {
    return customSelect(
        'SELECT * FROM chapters WHERE bookmark AND manga_id = ?1',
        variables: [
          i0.Variable<int>(mangaId)
        ],
        readsFrom: {
          chapters,
        }).asyncMap(chapters.mapFromRow);
  }

  i0.Selectable<i1.Chapter> getChapterByUrl({required String chapterUrl}) {
    return customSelect('SELECT * FROM chapters WHERE url = ?1', variables: [
      i0.Variable<String>(chapterUrl)
    ], readsFrom: {
      chapters,
    }).asyncMap(chapters.mapFromRow);
  }

  i0.Selectable<i1.Chapter> getChapterByUrlAndMangaId(
      {required String chapterUrl, required int mangaId}) {
    return customSelect(
        'SELECT * FROM chapters WHERE url = ?1 AND manga_id = ?2',
        variables: [
          i0.Variable<String>(chapterUrl),
          i0.Variable<int>(mangaId)
        ],
        readsFrom: {
          chapters,
        }).asyncMap(chapters.mapFromRow);
  }

  Future<int> removeChaptersWithIds({required List<int> chapterIds}) {
    var $arrayStartIndex = 1;
    final expandedchapterIds = $expandVar($arrayStartIndex, chapterIds.length);
    $arrayStartIndex += chapterIds.length;
    return customUpdate(
      'DELETE FROM chapters WHERE _id IN ($expandedchapterIds)',
      variables: [for (var $ in chapterIds) i0.Variable<int>($)],
      updates: {chapters},
      updateKind: i0.UpdateKind.delete,
    );
  }

  i1.Chapters get chapters => this.resultSet<i1.Chapters>('chapters');
  i3.ExcludedScanlators get excludedScanlators =>
      this.resultSet<i3.ExcludedScanlators>('excluded_scanlators');
}
