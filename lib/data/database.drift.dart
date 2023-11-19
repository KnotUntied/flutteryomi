// ignore_for_file: type=lint
import 'package:drift/drift.dart' as i0;
import 'package:flutteryomi/data/tables/mangas.drift.dart' as i1;
import 'package:flutteryomi/data/tables/chapters.drift.dart' as i2;
import 'package:flutteryomi/data/views/updatesView.drift.dart' as i3;
import 'package:flutteryomi/data/tables/excluded_scanlators.drift.dart' as i4;
import 'package:flutteryomi/data/tables/history.drift.dart' as i5;
import 'package:flutteryomi/data/tables/categories.drift.dart' as i6;
import 'package:flutteryomi/data/tables/mangas_categories.drift.dart' as i7;
import 'package:flutteryomi/data/views/libraryView.drift.dart' as i8;
import 'package:flutteryomi/data/views/historyView.drift.dart' as i9;
import 'package:flutteryomi/data/tables/sources.drift.dart' as i10;
import 'package:flutteryomi/data/tables/manga_sync.drift.dart' as i11;
import 'package:drift/internal/modular.dart' as i12;

abstract class $AppDatabase extends i0.GeneratedDatabase {
  $AppDatabase(i0.QueryExecutor e) : super(e);
  late final i1.Mangas mangas = i1.Mangas(this);
  late final i2.Chapters chapters = i2.Chapters(this);
  late final i3.UpdatesView updatesView = i3.UpdatesView(this);
  late final i4.ExcludedScanlators excludedScanlators =
      i4.ExcludedScanlators(this);
  late final i5.History history = i5.History(this);
  late final i6.Categories categories = i6.Categories(this);
  late final i7.MangasCategories mangasCategories = i7.MangasCategories(this);
  late final i8.LibraryView libraryView = i8.LibraryView(this);
  late final i9.HistoryView historyView = i9.HistoryView(this);
  late final i10.Sources sources = i10.Sources(this);
  late final i11.MangaSync mangaSync = i11.MangaSync(this);
  i6.CategoriesDrift get categoriesDrift => i12.ReadDatabaseContainer(this)
      .accessor<i6.CategoriesDrift>(i6.CategoriesDrift.new);
  i2.ChaptersDrift get chaptersDrift => i12.ReadDatabaseContainer(this)
      .accessor<i2.ChaptersDrift>(i2.ChaptersDrift.new);
  i4.ExcludedScanlatorsDrift get excludedScanlatorsDrift =>
      i12.ReadDatabaseContainer(this)
          .accessor<i4.ExcludedScanlatorsDrift>(i4.ExcludedScanlatorsDrift.new);
  i5.HistoryDrift get historyDrift => i12.ReadDatabaseContainer(this)
      .accessor<i5.HistoryDrift>(i5.HistoryDrift.new);
  i11.MangaSyncDrift get mangaSyncDrift => i12.ReadDatabaseContainer(this)
      .accessor<i11.MangaSyncDrift>(i11.MangaSyncDrift.new);
  i1.MangasDrift get mangasDrift => i12.ReadDatabaseContainer(this)
      .accessor<i1.MangasDrift>(i1.MangasDrift.new);
  i7.MangasCategoriesDrift get mangasCategoriesDrift =>
      i12.ReadDatabaseContainer(this)
          .accessor<i7.MangasCategoriesDrift>(i7.MangasCategoriesDrift.new);
  i10.SourcesDrift get sourcesDrift => i12.ReadDatabaseContainer(this)
      .accessor<i10.SourcesDrift>(i10.SourcesDrift.new);
  i9.HistoryViewDrift get historyViewDrift => i12.ReadDatabaseContainer(this)
      .accessor<i9.HistoryViewDrift>(i9.HistoryViewDrift.new);
  i8.LibraryViewDrift get libraryViewDrift => i12.ReadDatabaseContainer(this)
      .accessor<i8.LibraryViewDrift>(i8.LibraryViewDrift.new);
  i3.UpdatesViewDrift get updatesViewDrift => i12.ReadDatabaseContainer(this)
      .accessor<i3.UpdatesViewDrift>(i3.UpdatesViewDrift.new);
  @override
  Iterable<i0.TableInfo<i0.Table, Object?>> get allTables =>
      allSchemaEntities.whereType<i0.TableInfo<i0.Table, Object?>>();
  @override
  List<i0.DatabaseSchemaEntity> get allSchemaEntities => [
        mangas,
        chapters,
        updatesView,
        excludedScanlators,
        history,
        categories,
        mangasCategories,
        libraryView,
        historyView,
        sources,
        i7.updateLastModifiedAtMangasCategories,
        i1.libraryFavoriteIndex,
        i1.mangasUrlIndex,
        i1.updateLastFavoritedAtMangas,
        i1.updateLastModifiedAtMangas,
        mangaSync,
        i5.historyHistoryChapterIdIndex,
        i4.excludedScanlatorsMangaIdIndex,
        i2.chaptersMangaIdIndex,
        i2.chaptersUnreadByMangaIndex,
        i2.updateLastModifiedAtChapters,
        i6.systemCategoryDeleteTrigger
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
            on: i0.TableUpdateQuery.onTableName('mangas',
                limitUpdateKind: i0.UpdateKind.delete),
            result: [
              i0.TableUpdate('excluded_scanlators', kind: i0.UpdateKind.delete),
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
