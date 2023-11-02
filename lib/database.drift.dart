// ignore_for_file: type=lint
import 'package:drift/drift.dart' as i0;
import 'package:flutteryomi/models/tables/mangas.drift.dart' as i1;
import 'package:flutteryomi/models/tables/chapters.drift.dart' as i2;
import 'package:flutteryomi/models/tables/history.drift.dart' as i3;
import 'package:flutteryomi/models/tables/categories.drift.dart' as i4;
import 'package:flutteryomi/models/tables/mangas_categories.drift.dart' as i5;
import 'package:flutteryomi/models/views/updatesView.drift.dart' as i6;
import 'package:flutteryomi/models/views/libraryView.drift.dart' as i7;
import 'package:flutteryomi/models/views/historyView.drift.dart' as i8;
import 'package:flutteryomi/models/tables/sources.drift.dart' as i9;
import 'package:flutteryomi/models/tables/manga_sync.drift.dart' as i10;
import 'package:drift/internal/modular.dart' as i11;

abstract class $AppDatabase extends i0.GeneratedDatabase {
  $AppDatabase(i0.QueryExecutor e) : super(e);
  late final i1.Mangas mangas = i1.Mangas(this);
  late final i2.Chapters chapters = i2.Chapters(this);
  late final i3.History history = i3.History(this);
  late final i4.Categories categories = i4.Categories(this);
  late final i5.MangasCategories mangasCategories = i5.MangasCategories(this);
  late final i6.LibraryView libraryView = i6.LibraryView(this);
  late final i7.LibraryView libraryView = i7.LibraryView(this);
  late final i8.HistoryView historyView = i8.HistoryView(this);
  late final i9.Sources sources = i9.Sources(this);
  late final i10.MangaSync mangaSync = i10.MangaSync(this);
  i4.CategoriesDrift get categoriesDrift => i11.ReadDatabaseContainer(this)
      .accessor<i4.CategoriesDrift>(i4.CategoriesDrift.new);
  i2.ChaptersDrift get chaptersDrift => i11.ReadDatabaseContainer(this)
      .accessor<i2.ChaptersDrift>(i2.ChaptersDrift.new);
  i3.HistoryDrift get historyDrift => i11.ReadDatabaseContainer(this)
      .accessor<i3.HistoryDrift>(i3.HistoryDrift.new);
  i10.MangaSyncDrift get mangaSyncDrift => i11.ReadDatabaseContainer(this)
      .accessor<i10.MangaSyncDrift>(i10.MangaSyncDrift.new);
  i1.MangasDrift get mangasDrift => i11.ReadDatabaseContainer(this)
      .accessor<i1.MangasDrift>(i1.MangasDrift.new);
  i5.MangasCategoriesDrift get mangasCategoriesDrift =>
      i11.ReadDatabaseContainer(this)
          .accessor<i5.MangasCategoriesDrift>(i5.MangasCategoriesDrift.new);
  i9.SourcesDrift get sourcesDrift => i11.ReadDatabaseContainer(this)
      .accessor<i9.SourcesDrift>(i9.SourcesDrift.new);
  i8.HistoryViewDrift get historyViewDrift => i11.ReadDatabaseContainer(this)
      .accessor<i8.HistoryViewDrift>(i8.HistoryViewDrift.new);
  i7.LibraryViewDrift get libraryViewDrift => i11.ReadDatabaseContainer(this)
      .accessor<i7.LibraryViewDrift>(i7.LibraryViewDrift.new);
  i6.UpdatesViewDrift get updatesViewDrift => i11.ReadDatabaseContainer(this)
      .accessor<i6.UpdatesViewDrift>(i6.UpdatesViewDrift.new);
  @override
  Iterable<i0.TableInfo<i0.Table, Object?>> get allTables =>
      allSchemaEntities.whereType<i0.TableInfo<i0.Table, Object?>>();
  @override
  List<i0.DatabaseSchemaEntity> get allSchemaEntities => [
        mangas,
        chapters,
        history,
        categories,
        mangasCategories,
        libraryView,
        libraryView,
        historyView,
        sources,
        i5.updateLastModifiedAtMangasCategories,
        i1.libraryFavoriteIndex,
        i1.mangasUrlIndex,
        i1.updateLastFavoritedAtMangas,
        i1.updateLastModifiedAtMangas,
        mangaSync,
        i3.historyHistoryChapterIdIndex,
        i2.chaptersMangaIdIndex,
        i2.chaptersUnreadByMangaIndex,
        i2.updateLastModifiedAtChapters,
        i4.systemCategoryDeleteTrigger
      ];
  @override
  i0.StreamQueryUpdateRules get streamUpdateRules =>
      const i0.StreamQueryUpdateRules(
        [
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
