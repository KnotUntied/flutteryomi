// ignore_for_file: type=lint
import 'package:drift/drift.dart' as i0;
import 'package:flutteryomi/models/tables/sources.drift.dart' as i1;
import 'package:flutteryomi/models/tables/categories.drift.dart' as i2;
import 'package:flutteryomi/models/tables/mangas.drift.dart' as i3;
import 'package:flutteryomi/models/tables/mangas_categories.drift.dart' as i4;
import 'package:flutteryomi/models/tables/manga_sync.drift.dart' as i5;
import 'package:flutteryomi/models/tables/chapters.drift.dart' as i6;
import 'package:flutteryomi/models/tables/history.drift.dart' as i7;
import 'package:drift/internal/modular.dart' as i8;

abstract class $AppDatabase extends i0.GeneratedDatabase {
  $AppDatabase(i0.QueryExecutor e) : super(e);
  late final i1.Sources sources = i1.Sources(this);
  late final i2.Categories categories = i2.Categories(this);
  late final i3.Mangas mangas = i3.Mangas(this);
  late final i4.MangasCategories mangasCategories = i4.MangasCategories(this);
  late final i5.MangaSync mangaSync = i5.MangaSync(this);
  late final i6.Chapters chapters = i6.Chapters(this);
  late final i7.History history = i7.History(this);
  i2.CategoriesDrift get categoriesDrift => i8.ReadDatabaseContainer(this)
      .accessor<i2.CategoriesDrift>(i2.CategoriesDrift.new);
  i6.ChaptersDrift get chaptersDrift => i8.ReadDatabaseContainer(this)
      .accessor<i6.ChaptersDrift>(i6.ChaptersDrift.new);
  i7.HistoryDrift get historyDrift => i8.ReadDatabaseContainer(this)
      .accessor<i7.HistoryDrift>(i7.HistoryDrift.new);
  i5.MangaSyncDrift get mangaSyncDrift => i8.ReadDatabaseContainer(this)
      .accessor<i5.MangaSyncDrift>(i5.MangaSyncDrift.new);
  i3.MangasDrift get mangasDrift => i8.ReadDatabaseContainer(this)
      .accessor<i3.MangasDrift>(i3.MangasDrift.new);
  i4.MangasCategoriesDrift get mangasCategoriesDrift =>
      i8.ReadDatabaseContainer(this)
          .accessor<i4.MangasCategoriesDrift>(i4.MangasCategoriesDrift.new);
  i1.SourcesDrift get sourcesDrift => i8.ReadDatabaseContainer(this)
      .accessor<i1.SourcesDrift>(i1.SourcesDrift.new);
  @override
  Iterable<i0.TableInfo<i0.Table, Object?>> get allTables =>
      allSchemaEntities.whereType<i0.TableInfo<i0.Table, Object?>>();
  @override
  List<i0.DatabaseSchemaEntity> get allSchemaEntities => [
        sources,
        categories,
        mangas,
        mangasCategories,
        i4.updateLastModifiedAtMangasCategories,
        i3.libraryFavoriteIndex,
        i3.mangasUrlIndex,
        i3.updateLastFavoritedAtMangas,
        i3.updateLastModifiedAtMangas,
        mangaSync,
        chapters,
        history,
        i7.historyHistoryChapterIdIndex,
        i6.chaptersMangaIdIndex,
        i6.chaptersUnreadByMangaIndex,
        i6.updateLastModifiedAtChapters,
        i2.systemCategoryDeleteTrigger
      ];
  @override
  i0.StreamQueryUpdateRules get streamUpdateRules =>
      const i0.StreamQueryUpdateRules(
        [
          i0.WritePropagation(
            on: i0.TableUpdateQuery.onTableName('categories',
                limitUpdateKind: i0.UpdateKind.delete),
            result: [
              i0.TableUpdate('mangas_categories', kind: i0.UpdateKind.delete),
            ],
          ),
          i0.WritePropagation(
            on: i0.TableUpdateQuery.onTableName('mangas',
                limitUpdateKind: i0.UpdateKind.delete),
            result: [
              i0.TableUpdate('mangas_categories', kind: i0.UpdateKind.delete),
            ],
          ),
          i0.WritePropagation(
            on: i0.TableUpdateQuery.onTableName('mangas_categories',
                limitUpdateKind: i0.UpdateKind.update),
            result: [
              i0.TableUpdate('mangas_categories', kind: i0.UpdateKind.update),
            ],
          ),
          i0.WritePropagation(
            on: i0.TableUpdateQuery.onTableName('mangas',
                limitUpdateKind: i0.UpdateKind.update),
            result: [
              i0.TableUpdate('mangas', kind: i0.UpdateKind.update),
            ],
          ),
          i0.WritePropagation(
            on: i0.TableUpdateQuery.onTableName('mangas',
                limitUpdateKind: i0.UpdateKind.update),
            result: [
              i0.TableUpdate('mangas', kind: i0.UpdateKind.update),
            ],
          ),
          i0.WritePropagation(
            on: i0.TableUpdateQuery.onTableName('mangas',
                limitUpdateKind: i0.UpdateKind.delete),
            result: [
              i0.TableUpdate('manga_sync', kind: i0.UpdateKind.delete),
            ],
          ),
          i0.WritePropagation(
            on: i0.TableUpdateQuery.onTableName('mangas',
                limitUpdateKind: i0.UpdateKind.delete),
            result: [
              i0.TableUpdate('chapters', kind: i0.UpdateKind.delete),
            ],
          ),
          i0.WritePropagation(
            on: i0.TableUpdateQuery.onTableName('chapters',
                limitUpdateKind: i0.UpdateKind.delete),
            result: [
              i0.TableUpdate('history', kind: i0.UpdateKind.delete),
            ],
          ),
          i0.WritePropagation(
            on: i0.TableUpdateQuery.onTableName('chapters',
                limitUpdateKind: i0.UpdateKind.update),
            result: [
              i0.TableUpdate('chapters', kind: i0.UpdateKind.update),
            ],
          ),
          i0.WritePropagation(
            on: i0.TableUpdateQuery.onTableName('categories',
                limitUpdateKind: i0.UpdateKind.delete),
            result: [],
          ),
        ],
      );
}
