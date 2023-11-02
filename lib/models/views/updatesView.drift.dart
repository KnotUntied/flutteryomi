// ignore_for_file: type=lint
import 'package:drift/drift.dart' as i0;
import 'package:flutteryomi/models/views/updatesView.drift.dart' as i1;
import 'package:drift/internal/modular.dart' as i2;
import 'package:flutteryomi/models/tables/mangas.drift.dart' as i3;
import 'package:flutteryomi/models/tables/chapters.drift.dart' as i4;

class UpdatesViewData extends i0.DataClass {
  final int mangaId;
  final String mangaTitle;
  final int chapterId;
  final String chapterName;
  final String? scanlator;
  final bool read;
  final bool bookmark;
  final int lastPageRead;
  final int source;
  final bool favorite;
  final String? thumbnailUrl;
  final DateTime coverLastModified;
  final DateTime dateUpload;
  final DateTime datefetch;
  const UpdatesViewData(
      {required this.mangaId,
      required this.mangaTitle,
      required this.chapterId,
      required this.chapterName,
      this.scanlator,
      required this.read,
      required this.bookmark,
      required this.lastPageRead,
      required this.source,
      required this.favorite,
      this.thumbnailUrl,
      required this.coverLastModified,
      required this.dateUpload,
      required this.datefetch});
  factory UpdatesViewData.fromJson(Map<String, dynamic> json,
      {i0.ValueSerializer? serializer}) {
    serializer ??= i0.driftRuntimeOptions.defaultSerializer;
    return UpdatesViewData(
      mangaId: serializer.fromJson<int>(json['mangaId']),
      mangaTitle: serializer.fromJson<String>(json['mangaTitle']),
      chapterId: serializer.fromJson<int>(json['chapterId']),
      chapterName: serializer.fromJson<String>(json['chapterName']),
      scanlator: serializer.fromJson<String?>(json['scanlator']),
      read: serializer.fromJson<bool>(json['read']),
      bookmark: serializer.fromJson<bool>(json['bookmark']),
      lastPageRead: serializer.fromJson<int>(json['last_page_read']),
      source: serializer.fromJson<int>(json['source']),
      favorite: serializer.fromJson<bool>(json['favorite']),
      thumbnailUrl: serializer.fromJson<String?>(json['thumbnailUrl']),
      coverLastModified:
          serializer.fromJson<DateTime>(json['coverLastModified']),
      dateUpload: serializer.fromJson<DateTime>(json['dateUpload']),
      datefetch: serializer.fromJson<DateTime>(json['datefetch']),
    );
  }
  @override
  Map<String, dynamic> toJson({i0.ValueSerializer? serializer}) {
    serializer ??= i0.driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'mangaId': serializer.toJson<int>(mangaId),
      'mangaTitle': serializer.toJson<String>(mangaTitle),
      'chapterId': serializer.toJson<int>(chapterId),
      'chapterName': serializer.toJson<String>(chapterName),
      'scanlator': serializer.toJson<String?>(scanlator),
      'read': serializer.toJson<bool>(read),
      'bookmark': serializer.toJson<bool>(bookmark),
      'last_page_read': serializer.toJson<int>(lastPageRead),
      'source': serializer.toJson<int>(source),
      'favorite': serializer.toJson<bool>(favorite),
      'thumbnailUrl': serializer.toJson<String?>(thumbnailUrl),
      'coverLastModified': serializer.toJson<DateTime>(coverLastModified),
      'dateUpload': serializer.toJson<DateTime>(dateUpload),
      'datefetch': serializer.toJson<DateTime>(datefetch),
    };
  }

  i1.UpdatesViewData copyWith(
          {int? mangaId,
          String? mangaTitle,
          int? chapterId,
          String? chapterName,
          i0.Value<String?> scanlator = const i0.Value.absent(),
          bool? read,
          bool? bookmark,
          int? lastPageRead,
          int? source,
          bool? favorite,
          i0.Value<String?> thumbnailUrl = const i0.Value.absent(),
          DateTime? coverLastModified,
          DateTime? dateUpload,
          DateTime? datefetch}) =>
      i1.UpdatesViewData(
        mangaId: mangaId ?? this.mangaId,
        mangaTitle: mangaTitle ?? this.mangaTitle,
        chapterId: chapterId ?? this.chapterId,
        chapterName: chapterName ?? this.chapterName,
        scanlator: scanlator.present ? scanlator.value : this.scanlator,
        read: read ?? this.read,
        bookmark: bookmark ?? this.bookmark,
        lastPageRead: lastPageRead ?? this.lastPageRead,
        source: source ?? this.source,
        favorite: favorite ?? this.favorite,
        thumbnailUrl:
            thumbnailUrl.present ? thumbnailUrl.value : this.thumbnailUrl,
        coverLastModified: coverLastModified ?? this.coverLastModified,
        dateUpload: dateUpload ?? this.dateUpload,
        datefetch: datefetch ?? this.datefetch,
      );
  @override
  String toString() {
    return (StringBuffer('UpdatesViewData(')
          ..write('mangaId: $mangaId, ')
          ..write('mangaTitle: $mangaTitle, ')
          ..write('chapterId: $chapterId, ')
          ..write('chapterName: $chapterName, ')
          ..write('scanlator: $scanlator, ')
          ..write('read: $read, ')
          ..write('bookmark: $bookmark, ')
          ..write('lastPageRead: $lastPageRead, ')
          ..write('source: $source, ')
          ..write('favorite: $favorite, ')
          ..write('thumbnailUrl: $thumbnailUrl, ')
          ..write('coverLastModified: $coverLastModified, ')
          ..write('dateUpload: $dateUpload, ')
          ..write('datefetch: $datefetch')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      mangaId,
      mangaTitle,
      chapterId,
      chapterName,
      scanlator,
      read,
      bookmark,
      lastPageRead,
      source,
      favorite,
      thumbnailUrl,
      coverLastModified,
      dateUpload,
      datefetch);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is i1.UpdatesViewData &&
          other.mangaId == this.mangaId &&
          other.mangaTitle == this.mangaTitle &&
          other.chapterId == this.chapterId &&
          other.chapterName == this.chapterName &&
          other.scanlator == this.scanlator &&
          other.read == this.read &&
          other.bookmark == this.bookmark &&
          other.lastPageRead == this.lastPageRead &&
          other.source == this.source &&
          other.favorite == this.favorite &&
          other.thumbnailUrl == this.thumbnailUrl &&
          other.coverLastModified == this.coverLastModified &&
          other.dateUpload == this.dateUpload &&
          other.datefetch == this.datefetch);
}

class UpdatesView extends i0.ViewInfo<i1.UpdatesView, i1.UpdatesViewData>
    implements i0.HasResultSet {
  final String? _alias;
  @override
  final i0.GeneratedDatabase attachedDatabase;
  UpdatesView(this.attachedDatabase, [this._alias]);
  @override
  List<i0.GeneratedColumn> get $columns => [
        mangaId,
        mangaTitle,
        chapterId,
        chapterName,
        scanlator,
        read,
        bookmark,
        lastPageRead,
        source,
        favorite,
        thumbnailUrl,
        coverLastModified,
        dateUpload,
        datefetch
      ];
  @override
  String get aliasedName => _alias ?? entityName;
  @override
  String get entityName => 'updatesView';
  @override
  Map<i0.SqlDialect, String> get createViewStatements => {
        i0.SqlDialect.sqlite:
            'CREATE VIEW updatesView AS SELECT mangas._id AS mangaId, mangas.title AS mangaTitle, chapters._id AS chapterId, chapters.name AS chapterName, chapters.scanlator, chapters.read, chapters.bookmark, chapters.last_page_read, mangas.source, mangas.favorite, mangas.thumbnail_url AS thumbnailUrl, mangas.cover_last_modified AS coverLastModified, chapters.date_upload AS dateUpload, chapters.date_fetch AS datefetch FROM mangas JOIN chapters ON mangas._id = chapters.manga_id WHERE favorite = 1 AND date_fetch > date_added ORDER BY date_fetch DESC',
      };
  @override
  UpdatesView get asDslTable => this;
  @override
  i1.UpdatesViewData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return i1.UpdatesViewData(
      mangaId: attachedDatabase.typeMapping
          .read(i0.DriftSqlType.int, data['${effectivePrefix}mangaId'])!,
      mangaTitle: attachedDatabase.typeMapping
          .read(i0.DriftSqlType.string, data['${effectivePrefix}mangaTitle'])!,
      chapterId: attachedDatabase.typeMapping
          .read(i0.DriftSqlType.int, data['${effectivePrefix}chapterId'])!,
      chapterName: attachedDatabase.typeMapping
          .read(i0.DriftSqlType.string, data['${effectivePrefix}chapterName'])!,
      scanlator: attachedDatabase.typeMapping
          .read(i0.DriftSqlType.string, data['${effectivePrefix}scanlator']),
      read: attachedDatabase.typeMapping
          .read(i0.DriftSqlType.bool, data['${effectivePrefix}read'])!,
      bookmark: attachedDatabase.typeMapping
          .read(i0.DriftSqlType.bool, data['${effectivePrefix}bookmark'])!,
      lastPageRead: attachedDatabase.typeMapping
          .read(i0.DriftSqlType.int, data['${effectivePrefix}last_page_read'])!,
      source: attachedDatabase.typeMapping
          .read(i0.DriftSqlType.int, data['${effectivePrefix}source'])!,
      favorite: attachedDatabase.typeMapping
          .read(i0.DriftSqlType.bool, data['${effectivePrefix}favorite'])!,
      thumbnailUrl: attachedDatabase.typeMapping
          .read(i0.DriftSqlType.string, data['${effectivePrefix}thumbnailUrl']),
      coverLastModified: attachedDatabase.typeMapping.read(
          i0.DriftSqlType.dateTime,
          data['${effectivePrefix}coverLastModified'])!,
      dateUpload: attachedDatabase.typeMapping.read(
          i0.DriftSqlType.dateTime, data['${effectivePrefix}dateUpload'])!,
      datefetch: attachedDatabase.typeMapping
          .read(i0.DriftSqlType.dateTime, data['${effectivePrefix}datefetch'])!,
    );
  }

  late final i0.GeneratedColumn<int> mangaId = i0.GeneratedColumn<int>(
      'mangaId', aliasedName, false,
      type: i0.DriftSqlType.int);
  late final i0.GeneratedColumn<String> mangaTitle = i0.GeneratedColumn<String>(
      'mangaTitle', aliasedName, false,
      type: i0.DriftSqlType.string);
  late final i0.GeneratedColumn<int> chapterId = i0.GeneratedColumn<int>(
      'chapterId', aliasedName, false,
      type: i0.DriftSqlType.int);
  late final i0.GeneratedColumn<String> chapterName =
      i0.GeneratedColumn<String>('chapterName', aliasedName, false,
          type: i0.DriftSqlType.string);
  late final i0.GeneratedColumn<String> scanlator = i0.GeneratedColumn<String>(
      'scanlator', aliasedName, true,
      type: i0.DriftSqlType.string);
  late final i0.GeneratedColumn<bool> read = i0.GeneratedColumn<bool>(
      'read', aliasedName, false,
      type: i0.DriftSqlType.bool,
      defaultConstraints:
          i0.GeneratedColumn.constraintIsAlways('CHECK ("read" IN (0, 1))'));
  late final i0.GeneratedColumn<bool> bookmark = i0.GeneratedColumn<bool>(
      'bookmark', aliasedName, false,
      type: i0.DriftSqlType.bool,
      defaultConstraints: i0.GeneratedColumn.constraintIsAlways(
          'CHECK ("bookmark" IN (0, 1))'));
  late final i0.GeneratedColumn<int> lastPageRead = i0.GeneratedColumn<int>(
      'last_page_read', aliasedName, false,
      type: i0.DriftSqlType.int);
  late final i0.GeneratedColumn<int> source = i0.GeneratedColumn<int>(
      'source', aliasedName, false,
      type: i0.DriftSqlType.int);
  late final i0.GeneratedColumn<bool> favorite = i0.GeneratedColumn<bool>(
      'favorite', aliasedName, false,
      type: i0.DriftSqlType.bool,
      defaultConstraints: i0.GeneratedColumn.constraintIsAlways(
          'CHECK ("favorite" IN (0, 1))'));
  late final i0.GeneratedColumn<String> thumbnailUrl =
      i0.GeneratedColumn<String>('thumbnailUrl', aliasedName, true,
          type: i0.DriftSqlType.string);
  late final i0.GeneratedColumn<DateTime> coverLastModified =
      i0.GeneratedColumn<DateTime>('coverLastModified', aliasedName, false,
          type: i0.DriftSqlType.dateTime);
  late final i0.GeneratedColumn<DateTime> dateUpload =
      i0.GeneratedColumn<DateTime>('dateUpload', aliasedName, false,
          type: i0.DriftSqlType.dateTime);
  late final i0.GeneratedColumn<DateTime> datefetch =
      i0.GeneratedColumn<DateTime>('datefetch', aliasedName, false,
          type: i0.DriftSqlType.dateTime);
  @override
  UpdatesView createAlias(String alias) {
    return UpdatesView(attachedDatabase, alias);
  }

  @override
  i0.Query? get query => null;
  @override
  Set<String> get readTables => const {'mangas', 'chapters'};
}

class UpdatesViewDrift extends i2.ModularAccessor {
  UpdatesViewDrift(i0.GeneratedDatabase db) : super(db);
  i0.Selectable<i1.UpdatesViewData> getRecentUpdates(
      {required DateTime after, required int rowLimit}) {
    return customSelect(
        'SELECT * FROM updatesView WHERE dateUpload > ?1 LIMIT ?2',
        variables: [
          i0.Variable<DateTime>(after),
          i0.Variable<int>(rowLimit)
        ],
        readsFrom: {
          mangas,
          chapters,
        }).asyncMap(updatesView.mapFromRow);
  }

  i0.Selectable<i1.UpdatesViewData> getUpdatesByReadStatus(
      {required bool read, required DateTime after, required int rowLimit}) {
    return customSelect(
        'SELECT * FROM updatesView WHERE read = ?1 AND dateUpload > ?2 LIMIT ?3',
        variables: [
          i0.Variable<bool>(read),
          i0.Variable<DateTime>(after),
          i0.Variable<int>(rowLimit)
        ],
        readsFrom: {
          mangas,
          chapters,
        }).asyncMap(updatesView.mapFromRow);
  }

  i1.UpdatesView get updatesView =>
      this.resultSet<i1.UpdatesView>('updatesView');
  i3.Mangas get mangas => this.resultSet<i3.Mangas>('mangas');
  i4.Chapters get chapters => this.resultSet<i4.Chapters>('chapters');
}
