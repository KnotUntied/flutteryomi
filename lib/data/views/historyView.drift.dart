// ignore_for_file: type=lint
import 'package:drift/drift.dart' as i0;
import 'package:flutteryomi/data/views/historyView.drift.dart' as i1;
import 'package:drift/internal/modular.dart' as i2;
import 'package:flutteryomi/data/tables/mangas.drift.dart' as i3;
import 'package:flutteryomi/data/tables/chapters.drift.dart' as i4;
import 'package:flutteryomi/data/tables/history.drift.dart' as i5;

class HistoryViewData extends i0.DataClass {
  final int id;
  final int mangaId;
  final int chapterId;
  final String title;
  final String? thumbnailUrl;
  final int source;
  final bool favorite;
  final DateTime coverLastModified;
  final double chapterNumber;
  final DateTime? readAt;
  final int readDuration;
  final DateTime? maxReadAt;
  final int maxReadAtChapterId;
  const HistoryViewData(
      {required this.id,
      required this.mangaId,
      required this.chapterId,
      required this.title,
      this.thumbnailUrl,
      required this.source,
      required this.favorite,
      required this.coverLastModified,
      required this.chapterNumber,
      this.readAt,
      required this.readDuration,
      this.maxReadAt,
      required this.maxReadAtChapterId});
  factory HistoryViewData.fromJson(Map<String, dynamic> json,
      {i0.ValueSerializer? serializer}) {
    serializer ??= i0.driftRuntimeOptions.defaultSerializer;
    return HistoryViewData(
      id: serializer.fromJson<int>(json['id']),
      mangaId: serializer.fromJson<int>(json['mangaId']),
      chapterId: serializer.fromJson<int>(json['chapterId']),
      title: serializer.fromJson<String>(json['title']),
      thumbnailUrl: serializer.fromJson<String?>(json['thumbnailUrl']),
      source: serializer.fromJson<int>(json['source']),
      favorite: serializer.fromJson<bool>(json['favorite']),
      coverLastModified:
          serializer.fromJson<DateTime>(json['cover_last_modified']),
      chapterNumber: serializer.fromJson<double>(json['chapterNumber']),
      readAt: serializer.fromJson<DateTime?>(json['readAt']),
      readDuration: serializer.fromJson<int>(json['readDuration']),
      maxReadAt: serializer.fromJson<DateTime?>(json['maxReadAt']),
      maxReadAtChapterId: serializer.fromJson<int>(json['maxReadAtChapterId']),
    );
  }
  @override
  Map<String, dynamic> toJson({i0.ValueSerializer? serializer}) {
    serializer ??= i0.driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'mangaId': serializer.toJson<int>(mangaId),
      'chapterId': serializer.toJson<int>(chapterId),
      'title': serializer.toJson<String>(title),
      'thumbnailUrl': serializer.toJson<String?>(thumbnailUrl),
      'source': serializer.toJson<int>(source),
      'favorite': serializer.toJson<bool>(favorite),
      'cover_last_modified': serializer.toJson<DateTime>(coverLastModified),
      'chapterNumber': serializer.toJson<double>(chapterNumber),
      'readAt': serializer.toJson<DateTime?>(readAt),
      'readDuration': serializer.toJson<int>(readDuration),
      'maxReadAt': serializer.toJson<DateTime?>(maxReadAt),
      'maxReadAtChapterId': serializer.toJson<int>(maxReadAtChapterId),
    };
  }

  i1.HistoryViewData copyWith(
          {int? id,
          int? mangaId,
          int? chapterId,
          String? title,
          i0.Value<String?> thumbnailUrl = const i0.Value.absent(),
          int? source,
          bool? favorite,
          DateTime? coverLastModified,
          double? chapterNumber,
          i0.Value<DateTime?> readAt = const i0.Value.absent(),
          int? readDuration,
          i0.Value<DateTime?> maxReadAt = const i0.Value.absent(),
          int? maxReadAtChapterId}) =>
      i1.HistoryViewData(
        id: id ?? this.id,
        mangaId: mangaId ?? this.mangaId,
        chapterId: chapterId ?? this.chapterId,
        title: title ?? this.title,
        thumbnailUrl:
            thumbnailUrl.present ? thumbnailUrl.value : this.thumbnailUrl,
        source: source ?? this.source,
        favorite: favorite ?? this.favorite,
        coverLastModified: coverLastModified ?? this.coverLastModified,
        chapterNumber: chapterNumber ?? this.chapterNumber,
        readAt: readAt.present ? readAt.value : this.readAt,
        readDuration: readDuration ?? this.readDuration,
        maxReadAt: maxReadAt.present ? maxReadAt.value : this.maxReadAt,
        maxReadAtChapterId: maxReadAtChapterId ?? this.maxReadAtChapterId,
      );
  @override
  String toString() {
    return (StringBuffer('HistoryViewData(')
          ..write('id: $id, ')
          ..write('mangaId: $mangaId, ')
          ..write('chapterId: $chapterId, ')
          ..write('title: $title, ')
          ..write('thumbnailUrl: $thumbnailUrl, ')
          ..write('source: $source, ')
          ..write('favorite: $favorite, ')
          ..write('coverLastModified: $coverLastModified, ')
          ..write('chapterNumber: $chapterNumber, ')
          ..write('readAt: $readAt, ')
          ..write('readDuration: $readDuration, ')
          ..write('maxReadAt: $maxReadAt, ')
          ..write('maxReadAtChapterId: $maxReadAtChapterId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      mangaId,
      chapterId,
      title,
      thumbnailUrl,
      source,
      favorite,
      coverLastModified,
      chapterNumber,
      readAt,
      readDuration,
      maxReadAt,
      maxReadAtChapterId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is i1.HistoryViewData &&
          other.id == this.id &&
          other.mangaId == this.mangaId &&
          other.chapterId == this.chapterId &&
          other.title == this.title &&
          other.thumbnailUrl == this.thumbnailUrl &&
          other.source == this.source &&
          other.favorite == this.favorite &&
          other.coverLastModified == this.coverLastModified &&
          other.chapterNumber == this.chapterNumber &&
          other.readAt == this.readAt &&
          other.readDuration == this.readDuration &&
          other.maxReadAt == this.maxReadAt &&
          other.maxReadAtChapterId == this.maxReadAtChapterId);
}

class HistoryView extends i0.ViewInfo<i1.HistoryView, i1.HistoryViewData>
    implements i0.HasResultSet {
  final String? _alias;
  @override
  final i0.GeneratedDatabase attachedDatabase;
  HistoryView(this.attachedDatabase, [this._alias]);
  @override
  List<i0.GeneratedColumn> get $columns => [
        id,
        mangaId,
        chapterId,
        title,
        thumbnailUrl,
        source,
        favorite,
        coverLastModified,
        chapterNumber,
        readAt,
        readDuration,
        maxReadAt,
        maxReadAtChapterId
      ];
  @override
  String get aliasedName => _alias ?? entityName;
  @override
  String get entityName => 'historyView';
  @override
  Map<i0.SqlDialect, String> get createViewStatements => {
        i0.SqlDialect.sqlite:
            'CREATE VIEW historyView AS SELECT history._id AS id, mangas._id AS mangaId, chapters._id AS chapterId, mangas.title, mangas.thumbnail_url AS thumbnailUrl, mangas.source, mangas.favorite, mangas.cover_last_modified, chapters.chapter_number AS chapterNumber, history.last_read AS readAt, history.time_read AS readDuration, max_last_read.last_read AS maxReadAt, max_last_read.chapter_id AS maxReadAtChapterId FROM mangas JOIN chapters ON mangas._id = chapters.manga_id JOIN history ON chapters._id = history.chapter_id JOIN (SELECT chapters.manga_id, chapters._id AS chapter_id, MAX(history.last_read) AS last_read FROM chapters JOIN history ON chapters._id = history.chapter_id GROUP BY chapters.manga_id) AS max_last_read ON chapters.manga_id = max_last_read.manga_id',
      };
  @override
  HistoryView get asDslTable => this;
  @override
  i1.HistoryViewData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return i1.HistoryViewData(
      id: attachedDatabase.typeMapping
          .read(i0.DriftSqlType.int, data['${effectivePrefix}id'])!,
      mangaId: attachedDatabase.typeMapping
          .read(i0.DriftSqlType.int, data['${effectivePrefix}mangaId'])!,
      chapterId: attachedDatabase.typeMapping
          .read(i0.DriftSqlType.int, data['${effectivePrefix}chapterId'])!,
      title: attachedDatabase.typeMapping
          .read(i0.DriftSqlType.string, data['${effectivePrefix}title'])!,
      thumbnailUrl: attachedDatabase.typeMapping
          .read(i0.DriftSqlType.string, data['${effectivePrefix}thumbnailUrl']),
      source: attachedDatabase.typeMapping
          .read(i0.DriftSqlType.int, data['${effectivePrefix}source'])!,
      favorite: attachedDatabase.typeMapping
          .read(i0.DriftSqlType.bool, data['${effectivePrefix}favorite'])!,
      coverLastModified: attachedDatabase.typeMapping.read(
          i0.DriftSqlType.dateTime,
          data['${effectivePrefix}cover_last_modified'])!,
      chapterNumber: attachedDatabase.typeMapping.read(
          i0.DriftSqlType.double, data['${effectivePrefix}chapterNumber'])!,
      readAt: attachedDatabase.typeMapping
          .read(i0.DriftSqlType.dateTime, data['${effectivePrefix}readAt']),
      readDuration: attachedDatabase.typeMapping
          .read(i0.DriftSqlType.int, data['${effectivePrefix}readDuration'])!,
      maxReadAt: attachedDatabase.typeMapping
          .read(i0.DriftSqlType.dateTime, data['${effectivePrefix}maxReadAt']),
      maxReadAtChapterId: attachedDatabase.typeMapping.read(
          i0.DriftSqlType.int, data['${effectivePrefix}maxReadAtChapterId'])!,
    );
  }

  late final i0.GeneratedColumn<int> id = i0.GeneratedColumn<int>(
      'id', aliasedName, false,
      type: i0.DriftSqlType.int);
  late final i0.GeneratedColumn<int> mangaId = i0.GeneratedColumn<int>(
      'mangaId', aliasedName, false,
      type: i0.DriftSqlType.int);
  late final i0.GeneratedColumn<int> chapterId = i0.GeneratedColumn<int>(
      'chapterId', aliasedName, false,
      type: i0.DriftSqlType.int);
  late final i0.GeneratedColumn<String> title = i0.GeneratedColumn<String>(
      'title', aliasedName, false,
      type: i0.DriftSqlType.string);
  late final i0.GeneratedColumn<String> thumbnailUrl =
      i0.GeneratedColumn<String>('thumbnailUrl', aliasedName, true,
          type: i0.DriftSqlType.string);
  late final i0.GeneratedColumn<int> source = i0.GeneratedColumn<int>(
      'source', aliasedName, false,
      type: i0.DriftSqlType.int);
  late final i0.GeneratedColumn<bool> favorite = i0.GeneratedColumn<bool>(
      'favorite', aliasedName, false,
      type: i0.DriftSqlType.bool,
      defaultConstraints: i0.GeneratedColumn.constraintIsAlways(
          'CHECK ("favorite" IN (0, 1))'));
  late final i0.GeneratedColumn<DateTime> coverLastModified =
      i0.GeneratedColumn<DateTime>('cover_last_modified', aliasedName, false,
          type: i0.DriftSqlType.dateTime);
  late final i0.GeneratedColumn<double> chapterNumber =
      i0.GeneratedColumn<double>('chapterNumber', aliasedName, false,
          type: i0.DriftSqlType.double);
  late final i0.GeneratedColumn<DateTime> readAt = i0.GeneratedColumn<DateTime>(
      'readAt', aliasedName, true,
      type: i0.DriftSqlType.dateTime);
  late final i0.GeneratedColumn<int> readDuration = i0.GeneratedColumn<int>(
      'readDuration', aliasedName, false,
      type: i0.DriftSqlType.int);
  late final i0.GeneratedColumn<DateTime> maxReadAt =
      i0.GeneratedColumn<DateTime>('maxReadAt', aliasedName, true,
          type: i0.DriftSqlType.dateTime);
  late final i0.GeneratedColumn<int> maxReadAtChapterId =
      i0.GeneratedColumn<int>('maxReadAtChapterId', aliasedName, false,
          type: i0.DriftSqlType.int);
  @override
  HistoryView createAlias(String alias) {
    return HistoryView(attachedDatabase, alias);
  }

  @override
  i0.Query? get query => null;
  @override
  Set<String> get readTables => const {'mangas', 'chapters', 'history'};
}

class HistoryViewDrift extends i2.ModularAccessor {
  HistoryViewDrift(i0.GeneratedDatabase db) : super(db);
  i0.Selectable<GetHistoryResult> getHistory({required String query}) {
    return customSelect(
        'SELECT id, mangaId, chapterId, title, thumbnailUrl, source, favorite, cover_last_modified, chapterNumber, readAt, readDuration FROM historyView WHERE historyView.readAt > 0 AND maxReadAtChapterId = historyView.chapterId AND lower(historyView.title) LIKE(\'%\' || ?1 || \'%\')ORDER BY readAt DESC',
        variables: [
          i0.Variable<String>(query)
        ],
        readsFrom: {
          mangas,
          chapters,
          history,
        }).map((i0.QueryRow row) => GetHistoryResult(
          id: row.read<int>('id'),
          mangaId: row.read<int>('mangaId'),
          chapterId: row.read<int>('chapterId'),
          title: row.read<String>('title'),
          thumbnailUrl: row.readNullable<String>('thumbnailUrl'),
          source: row.read<int>('source'),
          favorite: row.read<bool>('favorite'),
          coverLastModified: row.read<DateTime>('cover_last_modified'),
          chapterNumber: row.read<double>('chapterNumber'),
          readAt: row.readNullable<DateTime>('readAt'),
          readDuration: row.read<int>('readDuration'),
        ));
  }

  i0.Selectable<GetLatestHistoryResult> getLatestHistory() {
    return customSelect(
        'SELECT id, mangaId, chapterId, title, thumbnailUrl, source, favorite, cover_last_modified, chapterNumber, readAt, readDuration FROM historyView WHERE historyView.readAt > 0 ORDER BY readAt DESC LIMIT 1',
        variables: [],
        readsFrom: {
          mangas,
          chapters,
          history,
        }).map((i0.QueryRow row) => GetLatestHistoryResult(
          id: row.read<int>('id'),
          mangaId: row.read<int>('mangaId'),
          chapterId: row.read<int>('chapterId'),
          title: row.read<String>('title'),
          thumbnailUrl: row.readNullable<String>('thumbnailUrl'),
          source: row.read<int>('source'),
          favorite: row.read<bool>('favorite'),
          coverLastModified: row.read<DateTime>('cover_last_modified'),
          chapterNumber: row.read<double>('chapterNumber'),
          readAt: row.readNullable<DateTime>('readAt'),
          readDuration: row.read<int>('readDuration'),
        ));
  }

  i1.HistoryView get historyView =>
      this.resultSet<i1.HistoryView>('historyView');
  i3.Mangas get mangas => this.resultSet<i3.Mangas>('mangas');
  i4.Chapters get chapters => this.resultSet<i4.Chapters>('chapters');
  i5.History get history => this.resultSet<i5.History>('history');
}

class GetHistoryResult {
  final int id;
  final int mangaId;
  final int chapterId;
  final String title;
  final String? thumbnailUrl;
  final int source;
  final bool favorite;
  final DateTime coverLastModified;
  final double chapterNumber;
  final DateTime? readAt;
  final int readDuration;
  GetHistoryResult({
    required this.id,
    required this.mangaId,
    required this.chapterId,
    required this.title,
    this.thumbnailUrl,
    required this.source,
    required this.favorite,
    required this.coverLastModified,
    required this.chapterNumber,
    this.readAt,
    required this.readDuration,
  });
}

class GetLatestHistoryResult {
  final int id;
  final int mangaId;
  final int chapterId;
  final String title;
  final String? thumbnailUrl;
  final int source;
  final bool favorite;
  final DateTime coverLastModified;
  final double chapterNumber;
  final DateTime? readAt;
  final int readDuration;
  GetLatestHistoryResult({
    required this.id,
    required this.mangaId,
    required this.chapterId,
    required this.title,
    this.thumbnailUrl,
    required this.source,
    required this.favorite,
    required this.coverLastModified,
    required this.chapterNumber,
    this.readAt,
    required this.readDuration,
  });
}
