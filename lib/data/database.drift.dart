// ignore_for_file: type=lint
import 'package:drift/drift.dart' as i0;
import 'package:flutteryomi/data/drift/views/updates_view.drift.dart' as i1;
import 'package:flutteryomi/data/drift/views/history_view.drift.dart' as i2;
import 'package:flutteryomi/data/drift/data/sources.drift.dart' as i3;
import 'package:flutteryomi/data/drift/data/categories.drift.dart' as i4;
import 'package:flutteryomi/data/drift/data/mangas.drift.dart' as i5;
import 'package:flutteryomi/data/drift/data/mangas_categories.drift.dart' as i6;
import 'package:flutteryomi/data/drift/data/manga_sync.drift.dart' as i7;
import 'package:flutteryomi/data/drift/data/chapters.drift.dart' as i8;
import 'package:flutteryomi/data/drift/data/history.drift.dart' as i9;
import 'package:flutteryomi/data/drift/data/excluded_scanlators.drift.dart'
    as i10;
import 'package:drift/internal/modular.dart' as i11;
import 'package:flutteryomi/data/drift/views/library_view.drift.dart' as i12;

abstract class $AppDatabase extends i0.GeneratedDatabase {
  $AppDatabase(i0.QueryExecutor e) : super(e);
  late final i1.UpdatesView updatesView = i1.UpdatesView(this);
  late final i2.HistoryView historyView = i2.HistoryView(this);
  late final i3.Sources sources = i3.Sources(this);
  late final i4.Categories categories = i4.Categories(this);
  late final i5.Mangas mangas = i5.Mangas(this);
  late final i6.MangasCategories mangasCategories = i6.MangasCategories(this);
  late final i7.MangaSync mangaSync = i7.MangaSync(this);
  late final i8.Chapters chapters = i8.Chapters(this);
  late final i9.History history = i9.History(this);
  late final i10.ExcludedScanlators excludedScanlators =
      i10.ExcludedScanlators(this);
  i4.CategoriesDrift get categoriesDrift => i11.ReadDatabaseContainer(this)
      .accessor<i4.CategoriesDrift>(i4.CategoriesDrift.new);
  i8.ChaptersDrift get chaptersDrift => i11.ReadDatabaseContainer(this)
      .accessor<i8.ChaptersDrift>(i8.ChaptersDrift.new);
  i10.ExcludedScanlatorsDrift get excludedScanlatorsDrift =>
      i11.ReadDatabaseContainer(this).accessor<i10.ExcludedScanlatorsDrift>(
          i10.ExcludedScanlatorsDrift.new);
  i9.HistoryDrift get historyDrift => i11.ReadDatabaseContainer(this)
      .accessor<i9.HistoryDrift>(i9.HistoryDrift.new);
  i7.MangaSyncDrift get mangaSyncDrift => i11.ReadDatabaseContainer(this)
      .accessor<i7.MangaSyncDrift>(i7.MangaSyncDrift.new);
  i5.MangasDrift get mangasDrift => i11.ReadDatabaseContainer(this)
      .accessor<i5.MangasDrift>(i5.MangasDrift.new);
  i6.MangasCategoriesDrift get mangasCategoriesDrift =>
      i11.ReadDatabaseContainer(this)
          .accessor<i6.MangasCategoriesDrift>(i6.MangasCategoriesDrift.new);
  i3.SourcesDrift get sourcesDrift => i11.ReadDatabaseContainer(this)
      .accessor<i3.SourcesDrift>(i3.SourcesDrift.new);
  i2.HistoryViewDrift get historyViewDrift => i11.ReadDatabaseContainer(this)
      .accessor<i2.HistoryViewDrift>(i2.HistoryViewDrift.new);
  i12.LibraryViewDrift get libraryViewDrift => i11.ReadDatabaseContainer(this)
      .accessor<i12.LibraryViewDrift>(i12.LibraryViewDrift.new);
  i1.UpdatesViewDrift get updatesViewDrift => i11.ReadDatabaseContainer(this)
      .accessor<i1.UpdatesViewDrift>(i1.UpdatesViewDrift.new);
  @override
  Iterable<i0.TableInfo<i0.Table, Object?>> get allTables =>
      allSchemaEntities.whereType<i0.TableInfo<i0.Table, Object?>>();
  @override
  List<i0.DatabaseSchemaEntity> get allSchemaEntities => [
        updatesView,
        historyView,
        sources,
        categories,
        mangas,
        mangasCategories,
        i6.updateLastModifiedAtMangasCategories,
        i5.libraryFavoriteIndex,
        i5.mangasUrlIndex,
        i5.updateLastFavoritedAtMangas,
        i5.updateLastModifiedAtMangas,
        mangaSync,
        chapters,
        history,
        i9.historyHistoryChapterIdIndex,
        excludedScanlators,
        i10.excludedScanlatorsMangaIdIndex,
        i8.chaptersMangaIdIndex,
        i8.chaptersUnreadByMangaIndex,
        i8.updateLastModifiedAtChapters,
        i4.systemCategoryDeleteTrigger
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
            on: i0.TableUpdateQuery.onTableName('mangas',
                limitUpdateKind: i0.UpdateKind.delete),
            result: [
              i0.TableUpdate('excluded_scanlators', kind: i0.UpdateKind.delete),
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
