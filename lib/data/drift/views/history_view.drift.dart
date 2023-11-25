// ignore_for_file: type=lint
import 'package:drift/drift.dart' as i0;
import 'package:flutteryomi/data/drift/views/history_view.drift.dart' as i1;
import 'package:drift/internal/modular.dart' as i2;

class HistoryViewData extends i0.DataClass {
  final String? id;
  final String? mangaId;
  final String? chapterId;
  final String? title;
  final String? thumbnailUrl;
  final String? source;
  final String? favorite;
  final String? coverLastModified;
  final String? chapterNumber;
  final String? readAt;
  final String? readDuration;
  final String? maxReadAt;
  final String? maxReadAtChapterId;
  const HistoryViewData(
      {this.id,
      this.mangaId,
      this.chapterId,
      this.title,
      this.thumbnailUrl,
      this.source,
      this.favorite,
      this.coverLastModified,
      this.chapterNumber,
      this.readAt,
      this.readDuration,
      this.maxReadAt,
      this.maxReadAtChapterId});
  factory HistoryViewData.fromJson(Map<String, dynamic> json,
      {i0.ValueSerializer? serializer}) {
    serializer ??= i0.driftRuntimeOptions.defaultSerializer;
    return HistoryViewData(
      id: serializer.fromJson<String?>(json['id']),
      mangaId: serializer.fromJson<String?>(json['mangaId']),
      chapterId: serializer.fromJson<String?>(json['chapterId']),
      title: serializer.fromJson<String?>(json['title']),
      thumbnailUrl: serializer.fromJson<String?>(json['thumbnailUrl']),
      source: serializer.fromJson<String?>(json['source']),
      favorite: serializer.fromJson<String?>(json['favorite']),
      coverLastModified:
          serializer.fromJson<String?>(json['cover_last_modified']),
      chapterNumber: serializer.fromJson<String?>(json['chapterNumber']),
      readAt: serializer.fromJson<String?>(json['readAt']),
      readDuration: serializer.fromJson<String?>(json['readDuration']),
      maxReadAt: serializer.fromJson<String?>(json['maxReadAt']),
      maxReadAtChapterId:
          serializer.fromJson<String?>(json['maxReadAtChapterId']),
    );
  }
  @override
  Map<String, dynamic> toJson({i0.ValueSerializer? serializer}) {
    serializer ??= i0.driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String?>(id),
      'mangaId': serializer.toJson<String?>(mangaId),
      'chapterId': serializer.toJson<String?>(chapterId),
      'title': serializer.toJson<String?>(title),
      'thumbnailUrl': serializer.toJson<String?>(thumbnailUrl),
      'source': serializer.toJson<String?>(source),
      'favorite': serializer.toJson<String?>(favorite),
      'cover_last_modified': serializer.toJson<String?>(coverLastModified),
      'chapterNumber': serializer.toJson<String?>(chapterNumber),
      'readAt': serializer.toJson<String?>(readAt),
      'readDuration': serializer.toJson<String?>(readDuration),
      'maxReadAt': serializer.toJson<String?>(maxReadAt),
      'maxReadAtChapterId': serializer.toJson<String?>(maxReadAtChapterId),
    };
  }

  i1.HistoryViewData copyWith(
          {i0.Value<String?> id = const i0.Value.absent(),
          i0.Value<String?> mangaId = const i0.Value.absent(),
          i0.Value<String?> chapterId = const i0.Value.absent(),
          i0.Value<String?> title = const i0.Value.absent(),
          i0.Value<String?> thumbnailUrl = const i0.Value.absent(),
          i0.Value<String?> source = const i0.Value.absent(),
          i0.Value<String?> favorite = const i0.Value.absent(),
          i0.Value<String?> coverLastModified = const i0.Value.absent(),
          i0.Value<String?> chapterNumber = const i0.Value.absent(),
          i0.Value<String?> readAt = const i0.Value.absent(),
          i0.Value<String?> readDuration = const i0.Value.absent(),
          i0.Value<String?> maxReadAt = const i0.Value.absent(),
          i0.Value<String?> maxReadAtChapterId = const i0.Value.absent()}) =>
      i1.HistoryViewData(
        id: id.present ? id.value : this.id,
        mangaId: mangaId.present ? mangaId.value : this.mangaId,
        chapterId: chapterId.present ? chapterId.value : this.chapterId,
        title: title.present ? title.value : this.title,
        thumbnailUrl:
            thumbnailUrl.present ? thumbnailUrl.value : this.thumbnailUrl,
        source: source.present ? source.value : this.source,
        favorite: favorite.present ? favorite.value : this.favorite,
        coverLastModified: coverLastModified.present
            ? coverLastModified.value
            : this.coverLastModified,
        chapterNumber:
            chapterNumber.present ? chapterNumber.value : this.chapterNumber,
        readAt: readAt.present ? readAt.value : this.readAt,
        readDuration:
            readDuration.present ? readDuration.value : this.readDuration,
        maxReadAt: maxReadAt.present ? maxReadAt.value : this.maxReadAt,
        maxReadAtChapterId: maxReadAtChapterId.present
            ? maxReadAtChapterId.value
            : this.maxReadAtChapterId,
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
          .read(i0.DriftSqlType.string, data['${effectivePrefix}id']),
      mangaId: attachedDatabase.typeMapping
          .read(i0.DriftSqlType.string, data['${effectivePrefix}mangaId']),
      chapterId: attachedDatabase.typeMapping
          .read(i0.DriftSqlType.string, data['${effectivePrefix}chapterId']),
      title: attachedDatabase.typeMapping
          .read(i0.DriftSqlType.string, data['${effectivePrefix}title']),
      thumbnailUrl: attachedDatabase.typeMapping
          .read(i0.DriftSqlType.string, data['${effectivePrefix}thumbnailUrl']),
      source: attachedDatabase.typeMapping
          .read(i0.DriftSqlType.string, data['${effectivePrefix}source']),
      favorite: attachedDatabase.typeMapping
          .read(i0.DriftSqlType.string, data['${effectivePrefix}favorite']),
      coverLastModified: attachedDatabase.typeMapping.read(
          i0.DriftSqlType.string,
          data['${effectivePrefix}cover_last_modified']),
      chapterNumber: attachedDatabase.typeMapping.read(
          i0.DriftSqlType.string, data['${effectivePrefix}chapterNumber']),
      readAt: attachedDatabase.typeMapping
          .read(i0.DriftSqlType.string, data['${effectivePrefix}readAt']),
      readDuration: attachedDatabase.typeMapping
          .read(i0.DriftSqlType.string, data['${effectivePrefix}readDuration']),
      maxReadAt: attachedDatabase.typeMapping
          .read(i0.DriftSqlType.string, data['${effectivePrefix}maxReadAt']),
      maxReadAtChapterId: attachedDatabase.typeMapping.read(
          i0.DriftSqlType.string, data['${effectivePrefix}maxReadAtChapterId']),
    );
  }

  late final i0.GeneratedColumn<String> id = i0.GeneratedColumn<String>(
      'id', aliasedName, true,
      type: i0.DriftSqlType.string);
  late final i0.GeneratedColumn<String> mangaId = i0.GeneratedColumn<String>(
      'mangaId', aliasedName, true,
      type: i0.DriftSqlType.string);
  late final i0.GeneratedColumn<String> chapterId = i0.GeneratedColumn<String>(
      'chapterId', aliasedName, true,
      type: i0.DriftSqlType.string);
  late final i0.GeneratedColumn<String> title = i0.GeneratedColumn<String>(
      'title', aliasedName, true,
      type: i0.DriftSqlType.string);
  late final i0.GeneratedColumn<String> thumbnailUrl =
      i0.GeneratedColumn<String>('thumbnailUrl', aliasedName, true,
          type: i0.DriftSqlType.string);
  late final i0.GeneratedColumn<String> source = i0.GeneratedColumn<String>(
      'source', aliasedName, true,
      type: i0.DriftSqlType.string);
  late final i0.GeneratedColumn<String> favorite = i0.GeneratedColumn<String>(
      'favorite', aliasedName, true,
      type: i0.DriftSqlType.string);
  late final i0.GeneratedColumn<String> coverLastModified =
      i0.GeneratedColumn<String>('cover_last_modified', aliasedName, true,
          type: i0.DriftSqlType.string);
  late final i0.GeneratedColumn<String> chapterNumber =
      i0.GeneratedColumn<String>('chapterNumber', aliasedName, true,
          type: i0.DriftSqlType.string);
  late final i0.GeneratedColumn<String> readAt = i0.GeneratedColumn<String>(
      'readAt', aliasedName, true,
      type: i0.DriftSqlType.string);
  late final i0.GeneratedColumn<String> readDuration =
      i0.GeneratedColumn<String>('readDuration', aliasedName, true,
          type: i0.DriftSqlType.string);
  late final i0.GeneratedColumn<String> maxReadAt = i0.GeneratedColumn<String>(
      'maxReadAt', aliasedName, true,
      type: i0.DriftSqlType.string);
  late final i0.GeneratedColumn<String> maxReadAtChapterId =
      i0.GeneratedColumn<String>('maxReadAtChapterId', aliasedName, true,
          type: i0.DriftSqlType.string);
  @override
  HistoryView createAlias(String alias) {
    return HistoryView(attachedDatabase, alias);
  }

  @override
  i0.Query? get query => null;
  @override
  Set<String> get readTables => const {};
}

class HistoryViewDrift extends i2.ModularAccessor {
  HistoryViewDrift(i0.GeneratedDatabase db) : super(db);
  i0.Selectable<GetHistoryResult> getHistory({required String query}) {
    return customSelect('SELECT id, mangaId, chapterId, title, thumbnailUrl, source, favorite, cover_last_modified, chapterNumber, readAt, readDuration FROM historyView WHERE historyView.readAt > 0 AND maxReadAtChapterId = historyView.chapterId AND lower(historyView.title) LIKE(\'%\' || ?1 || \'%\')ORDER BY readAt DESC',
            variables: [i0.Variable<String>(query)], readsFrom: {})
        .map((i0.QueryRow row) => GetHistoryResult(
              id: row.readNullable<String>('id'),
              mangaId: row.readNullable<String>('mangaId'),
              chapterId: row.readNullable<String>('chapterId'),
              title: row.readNullable<String>('title'),
              thumbnailUrl: row.readNullable<String>('thumbnailUrl'),
              source: row.readNullable<String>('source'),
              favorite: row.readNullable<String>('favorite'),
              coverLastModified:
                  row.readNullable<String>('cover_last_modified'),
              chapterNumber: row.readNullable<String>('chapterNumber'),
              readAt: row.readNullable<String>('readAt'),
              readDuration: row.readNullable<String>('readDuration'),
            ));
  }

  i0.Selectable<GetLatestHistoryResult> getLatestHistory() {
    return customSelect('SELECT id, mangaId, chapterId, title, thumbnailUrl, source, favorite, cover_last_modified, chapterNumber, readAt, readDuration FROM historyView WHERE historyView.readAt > 0 ORDER BY readAt DESC LIMIT 1',
            variables: [], readsFrom: {})
        .map((i0.QueryRow row) => GetLatestHistoryResult(
              id: row.readNullable<String>('id'),
              mangaId: row.readNullable<String>('mangaId'),
              chapterId: row.readNullable<String>('chapterId'),
              title: row.readNullable<String>('title'),
              thumbnailUrl: row.readNullable<String>('thumbnailUrl'),
              source: row.readNullable<String>('source'),
              favorite: row.readNullable<String>('favorite'),
              coverLastModified:
                  row.readNullable<String>('cover_last_modified'),
              chapterNumber: row.readNullable<String>('chapterNumber'),
              readAt: row.readNullable<String>('readAt'),
              readDuration: row.readNullable<String>('readDuration'),
            ));
  }

  i1.HistoryView get historyView =>
      this.resultSet<i1.HistoryView>('historyView');
}

class GetHistoryResult {
  final String? id;
  final String? mangaId;
  final String? chapterId;
  final String? title;
  final String? thumbnailUrl;
  final String? source;
  final String? favorite;
  final String? coverLastModified;
  final String? chapterNumber;
  final String? readAt;
  final String? readDuration;
  GetHistoryResult({
    this.id,
    this.mangaId,
    this.chapterId,
    this.title,
    this.thumbnailUrl,
    this.source,
    this.favorite,
    this.coverLastModified,
    this.chapterNumber,
    this.readAt,
    this.readDuration,
  });
}

class GetLatestHistoryResult {
  final String? id;
  final String? mangaId;
  final String? chapterId;
  final String? title;
  final String? thumbnailUrl;
  final String? source;
  final String? favorite;
  final String? coverLastModified;
  final String? chapterNumber;
  final String? readAt;
  final String? readDuration;
  GetLatestHistoryResult({
    this.id,
    this.mangaId,
    this.chapterId,
    this.title,
    this.thumbnailUrl,
    this.source,
    this.favorite,
    this.coverLastModified,
    this.chapterNumber,
    this.readAt,
    this.readDuration,
  });
}
