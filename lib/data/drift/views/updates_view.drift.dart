// ignore_for_file: type=lint
import 'package:drift/drift.dart' as i0;
import 'package:flutteryomi/data/drift/views/updates_view.drift.dart' as i1;
import 'package:drift/internal/modular.dart' as i2;

class UpdatesViewData extends i0.DataClass {
  final String? mangaId;
  final String? mangaTitle;
  final String? chapterId;
  final String? chapterName;
  final String? scanlator;
  final String? read;
  final String? bookmark;
  final String? lastPageRead;
  final String? source;
  final String? favorite;
  final String? thumbnailUrl;
  final String? coverLastModified;
  final String? dateUpload;
  final String? datefetch;
  const UpdatesViewData(
      {this.mangaId,
      this.mangaTitle,
      this.chapterId,
      this.chapterName,
      this.scanlator,
      this.read,
      this.bookmark,
      this.lastPageRead,
      this.source,
      this.favorite,
      this.thumbnailUrl,
      this.coverLastModified,
      this.dateUpload,
      this.datefetch});
  factory UpdatesViewData.fromJson(Map<String, dynamic> json,
      {i0.ValueSerializer? serializer}) {
    serializer ??= i0.driftRuntimeOptions.defaultSerializer;
    return UpdatesViewData(
      mangaId: serializer.fromJson<String?>(json['mangaId']),
      mangaTitle: serializer.fromJson<String?>(json['mangaTitle']),
      chapterId: serializer.fromJson<String?>(json['chapterId']),
      chapterName: serializer.fromJson<String?>(json['chapterName']),
      scanlator: serializer.fromJson<String?>(json['scanlator']),
      read: serializer.fromJson<String?>(json['read']),
      bookmark: serializer.fromJson<String?>(json['bookmark']),
      lastPageRead: serializer.fromJson<String?>(json['last_page_read']),
      source: serializer.fromJson<String?>(json['source']),
      favorite: serializer.fromJson<String?>(json['favorite']),
      thumbnailUrl: serializer.fromJson<String?>(json['thumbnailUrl']),
      coverLastModified:
          serializer.fromJson<String?>(json['coverLastModified']),
      dateUpload: serializer.fromJson<String?>(json['dateUpload']),
      datefetch: serializer.fromJson<String?>(json['datefetch']),
    );
  }
  @override
  Map<String, dynamic> toJson({i0.ValueSerializer? serializer}) {
    serializer ??= i0.driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'mangaId': serializer.toJson<String?>(mangaId),
      'mangaTitle': serializer.toJson<String?>(mangaTitle),
      'chapterId': serializer.toJson<String?>(chapterId),
      'chapterName': serializer.toJson<String?>(chapterName),
      'scanlator': serializer.toJson<String?>(scanlator),
      'read': serializer.toJson<String?>(read),
      'bookmark': serializer.toJson<String?>(bookmark),
      'last_page_read': serializer.toJson<String?>(lastPageRead),
      'source': serializer.toJson<String?>(source),
      'favorite': serializer.toJson<String?>(favorite),
      'thumbnailUrl': serializer.toJson<String?>(thumbnailUrl),
      'coverLastModified': serializer.toJson<String?>(coverLastModified),
      'dateUpload': serializer.toJson<String?>(dateUpload),
      'datefetch': serializer.toJson<String?>(datefetch),
    };
  }

  i1.UpdatesViewData copyWith(
          {i0.Value<String?> mangaId = const i0.Value.absent(),
          i0.Value<String?> mangaTitle = const i0.Value.absent(),
          i0.Value<String?> chapterId = const i0.Value.absent(),
          i0.Value<String?> chapterName = const i0.Value.absent(),
          i0.Value<String?> scanlator = const i0.Value.absent(),
          i0.Value<String?> read = const i0.Value.absent(),
          i0.Value<String?> bookmark = const i0.Value.absent(),
          i0.Value<String?> lastPageRead = const i0.Value.absent(),
          i0.Value<String?> source = const i0.Value.absent(),
          i0.Value<String?> favorite = const i0.Value.absent(),
          i0.Value<String?> thumbnailUrl = const i0.Value.absent(),
          i0.Value<String?> coverLastModified = const i0.Value.absent(),
          i0.Value<String?> dateUpload = const i0.Value.absent(),
          i0.Value<String?> datefetch = const i0.Value.absent()}) =>
      i1.UpdatesViewData(
        mangaId: mangaId.present ? mangaId.value : this.mangaId,
        mangaTitle: mangaTitle.present ? mangaTitle.value : this.mangaTitle,
        chapterId: chapterId.present ? chapterId.value : this.chapterId,
        chapterName: chapterName.present ? chapterName.value : this.chapterName,
        scanlator: scanlator.present ? scanlator.value : this.scanlator,
        read: read.present ? read.value : this.read,
        bookmark: bookmark.present ? bookmark.value : this.bookmark,
        lastPageRead:
            lastPageRead.present ? lastPageRead.value : this.lastPageRead,
        source: source.present ? source.value : this.source,
        favorite: favorite.present ? favorite.value : this.favorite,
        thumbnailUrl:
            thumbnailUrl.present ? thumbnailUrl.value : this.thumbnailUrl,
        coverLastModified: coverLastModified.present
            ? coverLastModified.value
            : this.coverLastModified,
        dateUpload: dateUpload.present ? dateUpload.value : this.dateUpload,
        datefetch: datefetch.present ? datefetch.value : this.datefetch,
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
          .read(i0.DriftSqlType.string, data['${effectivePrefix}mangaId']),
      mangaTitle: attachedDatabase.typeMapping
          .read(i0.DriftSqlType.string, data['${effectivePrefix}mangaTitle']),
      chapterId: attachedDatabase.typeMapping
          .read(i0.DriftSqlType.string, data['${effectivePrefix}chapterId']),
      chapterName: attachedDatabase.typeMapping
          .read(i0.DriftSqlType.string, data['${effectivePrefix}chapterName']),
      scanlator: attachedDatabase.typeMapping
          .read(i0.DriftSqlType.string, data['${effectivePrefix}scanlator']),
      read: attachedDatabase.typeMapping
          .read(i0.DriftSqlType.string, data['${effectivePrefix}read']),
      bookmark: attachedDatabase.typeMapping
          .read(i0.DriftSqlType.string, data['${effectivePrefix}bookmark']),
      lastPageRead: attachedDatabase.typeMapping.read(
          i0.DriftSqlType.string, data['${effectivePrefix}last_page_read']),
      source: attachedDatabase.typeMapping
          .read(i0.DriftSqlType.string, data['${effectivePrefix}source']),
      favorite: attachedDatabase.typeMapping
          .read(i0.DriftSqlType.string, data['${effectivePrefix}favorite']),
      thumbnailUrl: attachedDatabase.typeMapping
          .read(i0.DriftSqlType.string, data['${effectivePrefix}thumbnailUrl']),
      coverLastModified: attachedDatabase.typeMapping.read(
          i0.DriftSqlType.string, data['${effectivePrefix}coverLastModified']),
      dateUpload: attachedDatabase.typeMapping
          .read(i0.DriftSqlType.string, data['${effectivePrefix}dateUpload']),
      datefetch: attachedDatabase.typeMapping
          .read(i0.DriftSqlType.string, data['${effectivePrefix}datefetch']),
    );
  }

  late final i0.GeneratedColumn<String> mangaId = i0.GeneratedColumn<String>(
      'mangaId', aliasedName, true,
      type: i0.DriftSqlType.string);
  late final i0.GeneratedColumn<String> mangaTitle = i0.GeneratedColumn<String>(
      'mangaTitle', aliasedName, true,
      type: i0.DriftSqlType.string);
  late final i0.GeneratedColumn<String> chapterId = i0.GeneratedColumn<String>(
      'chapterId', aliasedName, true,
      type: i0.DriftSqlType.string);
  late final i0.GeneratedColumn<String> chapterName =
      i0.GeneratedColumn<String>('chapterName', aliasedName, true,
          type: i0.DriftSqlType.string);
  late final i0.GeneratedColumn<String> scanlator = i0.GeneratedColumn<String>(
      'scanlator', aliasedName, true,
      type: i0.DriftSqlType.string);
  late final i0.GeneratedColumn<String> read = i0.GeneratedColumn<String>(
      'read', aliasedName, true,
      type: i0.DriftSqlType.string);
  late final i0.GeneratedColumn<String> bookmark = i0.GeneratedColumn<String>(
      'bookmark', aliasedName, true,
      type: i0.DriftSqlType.string);
  late final i0.GeneratedColumn<String> lastPageRead =
      i0.GeneratedColumn<String>('last_page_read', aliasedName, true,
          type: i0.DriftSqlType.string);
  late final i0.GeneratedColumn<String> source = i0.GeneratedColumn<String>(
      'source', aliasedName, true,
      type: i0.DriftSqlType.string);
  late final i0.GeneratedColumn<String> favorite = i0.GeneratedColumn<String>(
      'favorite', aliasedName, true,
      type: i0.DriftSqlType.string);
  late final i0.GeneratedColumn<String> thumbnailUrl =
      i0.GeneratedColumn<String>('thumbnailUrl', aliasedName, true,
          type: i0.DriftSqlType.string);
  late final i0.GeneratedColumn<String> coverLastModified =
      i0.GeneratedColumn<String>('coverLastModified', aliasedName, true,
          type: i0.DriftSqlType.string);
  late final i0.GeneratedColumn<String> dateUpload = i0.GeneratedColumn<String>(
      'dateUpload', aliasedName, true,
      type: i0.DriftSqlType.string);
  late final i0.GeneratedColumn<String> datefetch = i0.GeneratedColumn<String>(
      'datefetch', aliasedName, true,
      type: i0.DriftSqlType.string);
  @override
  UpdatesView createAlias(String alias) {
    return UpdatesView(attachedDatabase, alias);
  }

  @override
  i0.Query? get query => null;
  @override
  Set<String> get readTables => const {};
}

class UpdatesViewDrift extends i2.ModularAccessor {
  UpdatesViewDrift(i0.GeneratedDatabase db) : super(db);
  i0.Selectable<i1.UpdatesViewData> getRecentUpdates(
      {String? after, required int limit}) {
    return customSelect(
        'SELECT * FROM updatesView WHERE dateUpload > ?1 LIMIT ?2',
        variables: [i0.Variable<String>(after), i0.Variable<int>(limit)],
        readsFrom: {}).asyncMap(updatesView.mapFromRow);
  }

  i0.Selectable<i1.UpdatesViewData> getUpdatesByReadStatus(
      {String? read, String? after, required int limit}) {
    return customSelect(
        'SELECT * FROM updatesView WHERE read = ?1 AND dateUpload > ?2 LIMIT ?3',
        variables: [
          i0.Variable<String>(read),
          i0.Variable<String>(after),
          i0.Variable<int>(limit)
        ],
        readsFrom: {}).asyncMap(updatesView.mapFromRow);
  }

  i1.UpdatesView get updatesView =>
      this.resultSet<i1.UpdatesView>('updatesView');
}
