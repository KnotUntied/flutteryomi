import 'package:dartx/dartx.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutteryomi/core/preference/checkbox_state.dart';
import 'package:flutteryomi/data/track/tracker_manager.dart';
import 'package:flutteryomi/domain/chapter/model/chapter.dart';
import 'package:flutteryomi/domain/chapter/service/missing_chapters.dart';
import 'package:flutteryomi/domain/download/model/download.dart';
import 'package:flutteryomi/domain/library/service/library_preferences.dart';
import 'package:flutteryomi/domain/manga/model/manga.dart';
import 'package:flutteryomi/domain/source/model/domain_source.dart';
import 'package:flutteryomi/domain/source/model/stub_source.dart';
import 'package:flutteryomi/presentation/category/category.dart';
import 'package:flutteryomi/presentation/category/components/category_dialogs.dart';
import 'package:flutteryomi/presentation/components/date_text.dart';
import 'package:flutteryomi/presentation/components/two_panel_box.dart';
import 'package:flutteryomi/presentation/manga/chapter_settings_dialog.dart';
import 'package:flutteryomi/presentation/manga/components/chapter_download_indicator.dart';
import 'package:flutteryomi/presentation/manga/components/chapter_header.dart';
import 'package:flutteryomi/presentation/manga/components/manga_bottom_action_menu.dart';
import 'package:flutteryomi/presentation/manga/components/manga_chapter_list_item.dart';
import 'package:flutteryomi/presentation/manga/components/manga_dialogs.dart';
import 'package:flutteryomi/presentation/manga/components/manga_info_header.dart';
import 'package:flutteryomi/presentation/manga/components/manga_toolbar.dart';
import 'package:flutteryomi/presentation/manga/components/missing_chapter_count_list_item.dart';
import 'package:flutteryomi/presentation/manga/components/scanlator_filter_dialog.dart';
import 'package:flutteryomi/presentation/manga/manga_screen_constants.dart';
import 'package:flutteryomi/presentation/manga/manga_screen_model.dart';
import 'package:flutteryomi/presentation/screens/loading_screen.dart';
import 'package:flutteryomi/presentation/util/chapter_number_formatter.dart';
import 'package:flutteryomi/source/api/source_extensions.dart';

class MangaScreen extends ConsumerWidget {
  const MangaScreen({
    super.key,
    required this.mangaId,
    this.fromSource = false,
  });

  final int mangaId;
  final bool fromSource;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = mangaScreenModelProvider(mangaId: mangaId, isFromSource: fromSource);
    final screenModel = ref.watch(provider.notifier);
    final state = ref.watch(provider);
    final trackerManager = ref.watch(trackerManagerProvider);
    final libraryPreferences = ref.watch(libraryPreferencesProvider);
    final loggedInTrackers = trackerManager.trackers.where((it) => it.isLoggedIn);
    final isUpdateIntervalEnabled = libraryPreferences
        .autoUpdateMangaRestrictions()
        .get()
        .contains(LibraryPreferences.mangaOutsideReleasePeriod);
    return state.when(
      loading: () => const LoadingScreen(),
      // TODO: Error handling
      error: (error, stackTrace) {
        debugPrintStack(
          label: error.toString(),
          stackTrace: stackTrace,
        );
        return const LoadingScreen();
      },
      data: (data) {
        //final isHttpSource = data.source is HttpSource;
        const isHttpSource = false;
        return MangaScreenContent(
          mangaId: mangaId,
          fromSource: fromSource,
          nextUpdate: data.manga.expectedNextUpdate,
          isTabletUi: isTabletUi(),
          chapterSwipeStartAction: screenModel.chapterSwipeStartAction,
          chapterSwipeEndAction: screenModel.chapterSwipeEndAction,
          onBackClicked: Navigator.of(context).pop,
          onChapterClicked: (it) => _openChapter(context, it),
          onDownloadChapter: !data.source.isLocalOrStub()
              ? screenModel.runChapterDownloadActions
              : null,
          onAddToLibraryClicked: () {
            screenModel.toggleFavorite();
            Feedback.forLongPress(context);
          },
          onWebViewClicked: isHttpSource
              ? () {
                  _openMangaInWebView(
                    data.manga,
                    data.source,
                  );
                }
              : null,
          onWebViewLongClicked: isHttpSource
              ? () {
                  _copyMangaUrl(
                    data.manga,
                    data.source,
                  );
                }
              : null,
          onTrackingClicked: () {
            if (loggedInTrackers.isEmpty) {
              //Navigator.push(
              //  context,
              //  MaterialPageRoute(
              //    builder: (context) => SettingsScreen(
              //        SettingsScreen.Destination.Tracking,
              //      ),
              //  ),
              //);
            } else {
              //screenModel.showTrackDialog();
            }
          },
          onTagSearch: (it) => _performGenreSearch(context, it, data.source),
          onFilterButtonClicked: () => showAdaptiveDialog(
            context: context,
            builder: (context) => ChapterSettingsDialog(
              manga: data.manga,
              onDownloadFilterChanged: screenModel.setDownloadedFilter,
              onUnreadFilterChanged: screenModel.setUnreadFilter,
              onBookmarkedFilterChanged: screenModel.setBookmarkedFilter,
              onSortModeChanged: screenModel.setSorting,
              onDisplayModeChanged: screenModel.setDisplayMode,
              onSetAsDefault: screenModel.setCurrentSettingsAsDefault,
              onResetToDefault: screenModel.resetToDefaultSettings,
              scanlatorFilterActive: data.scanlatorFilterActive,
              onScanlatorFilterClicked: () => showAdaptiveDialog(
                context: context,
                builder: (context) => ScanlatorFilterDialog(
                  availableScanlators: data.availableScanlators,
                  excludedScanlators: data.excludedScanlators,
                  onConfirm: screenModel.setExcludedScanlators,
                ),
              ),
            ),
          ),
          onRefresh: screenModel.fetchAllFromSource,
          onContinueReading: () => continueReading(context, screenModel.getNextUnreadChapter()),
          onSearch: (query, global) => _performSearch(context, query, global),
          onCoverClicked: () {
            //final sm = rememberScreenModel { MangaCoverScreenModel(data.manga.id) }
            //final manga = sm.state.collectAsState();
            //if (manga != null) {
              //final getContent = rememberLauncherForActivityResult(ActivityResultContracts.GetContent()) {
              //  if (it == null) return@rememberLauncherForActivityResult
              //  sm.editCover(context, it);
              //}
              //showAdaptiveDialog(
              //  context: context,
              //  builder: (context) => MangaCoverDialog(
              //    coverDataProvider: () => manga!,
              //    snackbarHostState: sm.snackbarHostState,
              //    isCustomCover: manga!.hasCustomCover,
              //    onShareClick: () => sm.shareCover(context),
              //    onSaveClick: () => sm.saveCover(context),
              //    onEditClick: (it) {
              //      switch (it) {
              //        EditCoverAction.EDIT -> getContent.launch("image/*"),
              //        EditCoverAction.DELETE -> sm.deleteCustomCover(context),
              //      }
              //    },
              //  ),
              //);
            //} else {
              //return const LoadingScreen();
            //}
          },
          onShareClicked: isHttpSource
              ? () => _shareManga(context, data.manga, data.source)
              : null,
          onDownloadActionClicked: !data.source.isLocalOrStub()
              ? screenModel.runDownloadAction
              : null,
          onEditCategoryClicked: data.manga.favorite
              ? () async {
                  final manga = data.manga;
                  final categories = await screenModel.getCategories();
                  final selection = await screenModel.getMangaCategoryIds(manga);
                  final initialSelection = categories
                      .mapAsCheckboxState((it) => selection.contains(it.id))
                      .toList();
                  if (context.mounted) {
                    showAdaptiveDialog(
                      context: context,
                      builder: (context) => ChangeCategoryDialog(
                        initialSelection: initialSelection,
                        onEditCategories: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const CategoryScreen(),
                            ),
                          );
                        },
                        onConfirm: (include, _) =>
                          screenModel.moveMangaToCategoriesAndAddToLibrary(manga, include),
                      ),
                    );
                  }
                }
              : null,
          onEditFetchIntervalClicked: data.manga.favorite
              ? () {
                  final manga = data.manga;
                  showAdaptiveDialog(
                    context: context,
                    builder: (context) => SetIntervalDialog(
                      interval: manga.fetchInterval,
                      nextUpdate: manga.expectedNextUpdate,
                      onValueChanged: isUpdateIntervalEnabled
                          ? (interval) => screenModel.setFetchInterval(manga, interval)
                          : null,
                    ),
                  );
                }
              : null,
          onMigrateClicked: data.manga.favorite
              ? () {
                  //Navigator.push(
                  //  context,
                  //  MaterialPageRoute(
                  //    builder: (context) => MigrateSearchScreen(data.manga.id),
                  //  ),
                  //);
                }
              : null,
          onMultiBookmarkClicked: screenModel.bookmarkChapters,
          onMultiMarkAsReadClicked: screenModel.markChaptersRead,
          onMarkPreviousAsReadClicked: screenModel.markPreviousChapterRead,
          onMultiDeleteClicked: (chapters) => showAdaptiveDialog(
            context: context,
            builder: (context) => DeleteChaptersDialog(
              onConfirm: () {
                screenModel.toggleAllSelection(false);
                screenModel.deleteChapters(chapters);
              },
            ),
          ),
          onChapterSwipe: screenModel.chapterSwipe,
          onChapterSelected: screenModel.toggleSelection,
          onAllChapterSelected: screenModel.toggleAllSelection,
          onInvertSelection: screenModel.invertSelection,
        );
      }
    );
  }

  void continueReading(BuildContext context, Chapter? unreadChapter) {
    if (unreadChapter != null) _openChapter(context, unreadChapter);
  }

  void _openChapter(BuildContext context, Chapter chapter) {
    //context.startActivity(ReaderActivity.newIntent(context, chapter.mangaId, chapter.id))
  }

  String? _getMangaUrl(Manga? manga, Source? source) {
    if (manga == null || source == null) return null;

    //try {
    //  return source.getMangaUrl(manga.toSManga());
    //} catch (e) {
    //  return null;
    //}
  }

  void _openMangaInWebView(Manga? manga, Source? source) {
    //_getMangaUrl(manga_, source_)?.let { url ->
    //Navigator.push(
    //  context,
    //  MaterialPageRoute(
    //    builder: (context) =>
    //WebViewScreen(
    //  url: url,
    //  initialTitle: manga_?.title,
    //  sourceId: source_?.id,
    //),
    //  ),
    //);
    //}
  }

  void _shareManga(BuildContext context, Manga? manga, Source? source) {
    final lang = AppLocalizations.of(context);
    //try {
    //  getMangaUrl(manga, source)?.let { url ->
    //    final intent = url.toUri().toShareIntent(context, type = "text/plain")
    //    context.startActivity(
    //      Intent.createChooser(
    //        intent,
    //        lang.action_share,
    //      ),
    //    )
    //  }
    //} catch (e) {
    //  context.toast(e.message);
    //}
  }

  /// Perform a search using the provided query.
  Future<void> _performSearch(BuildContext context, String query, bool global) async {
    if (global) {
      //Navigator.push(
      //  context,
      //  MaterialPageRoute(
      //    builder: (context) => GlobalSearchScreen(query),
      //  ),
      //);
      return;
    }

    //if (navigator.size < 2) return;

    //when (val previousController = navigator.items[navigator.size - 2]) {
    //  is HomeScreen -> {
    //    navigator.pop()
    //    previousController.search(query);
    //  }
    //  is BrowseSourceScreen -> {
    //    navigator.pop()
    //    previousController.search(query);
    //  }
    //}
  }

  /// Performs a genre search using [genreName].
  Future<void> _performGenreSearch(BuildContext context, genreName, Source source) async {
    //if (navigator.size < 2) return;

    //final previousController = navigator.items[navigator.size - 2];
    //if (previousController is BrowseSourceScreen && source is HttpSource) {
    //  Navigator.of(context).pop();
    //  previousController.searchGenre(genreName)
    //} else {
    //  _performSearch(genreName, global: false);
    //}
  }

  /// Copy manga URL to clipboard
  void _copyMangaUrl(Manga? manga, Source? source) {
    if (manga == null || source == null) return;
    //(source as HttpSource?)
    //final url = source.getMangaUrl(manga.toSManga());
    //context.copyToClipboard(url, url);
  }
}

class MangaScreenContent extends ConsumerWidget {
  const MangaScreenContent({
    super.key,
    required this.mangaId,
    required this.fromSource,

    this.nextUpdate,
    required this.isTabletUi,
    required this.chapterSwipeStartAction,
    required this.chapterSwipeEndAction,
    required this.onBackClicked,
    required this.onChapterClicked,
    this.onDownloadChapter,
    required this.onAddToLibraryClicked,
    this.onWebViewClicked,
    this.onWebViewLongClicked,
    required this.onTrackingClicked,

    // For tags menu
    required this.onTagSearch,

    required this.onFilterButtonClicked,
    required this.onRefresh,
    required this.onContinueReading,
    required this.onSearch,

    // For cover dialog
    required this.onCoverClicked,

    // For top action menu
    this.onShareClicked,
    this.onDownloadActionClicked,
    this.onEditCategoryClicked,
    this.onEditFetchIntervalClicked,
    this.onMigrateClicked,

    // For bottom action menu
    required this.onMultiBookmarkClicked,
    required this.onMultiMarkAsReadClicked,
    required this.onMarkPreviousAsReadClicked,
    required this.onMultiDeleteClicked,

    // For chapter swipe
    required this.onChapterSwipe,

    // Chapter selection
    required this.onChapterSelected,
    required this.onAllChapterSelected,
    required this.onInvertSelection,
  });

  final int mangaId;
  final bool fromSource;

  final DateTime? nextUpdate;
  final bool isTabletUi;
  final ChapterSwipeAction chapterSwipeStartAction;
  final ChapterSwipeAction chapterSwipeEndAction;
  final VoidCallback onBackClicked;
  final ValueChanged<Chapter> onChapterClicked;
  final void Function(List<ChapterListItem>, ChapterDownloadAction)? onDownloadChapter;
  final VoidCallback onAddToLibraryClicked;
  final VoidCallback? onWebViewClicked;
  final VoidCallback? onWebViewLongClicked;
  final VoidCallback onTrackingClicked;

  // For tags menu
  final ValueChanged<String> onTagSearch;

  final VoidCallback onFilterButtonClicked;
  final VoidCallback onRefresh;
  final VoidCallback onContinueReading;
  final void Function(String query, bool global) onSearch;

  // For cover dialog
  final VoidCallback onCoverClicked;

  // For top action menu
  final VoidCallback? onShareClicked;
  final ValueChanged<DownloadAction>? onDownloadActionClicked;
  final VoidCallback? onEditCategoryClicked;
  final VoidCallback? onEditFetchIntervalClicked;
  final VoidCallback? onMigrateClicked;

  // For bottom action menu
  final void Function(List<Chapter>, bool bookmarked) onMultiBookmarkClicked;
  final void Function(List<Chapter>, bool markAsRead) onMultiMarkAsReadClicked;
  final ValueChanged<Chapter> onMarkPreviousAsReadClicked;
  final ValueChanged<List<Chapter>> onMultiDeleteClicked;

  // For chapter swipe
  final void Function(ChapterListItem, ChapterSwipeAction) onChapterSwipe;

  // Chapter selection
  final void Function(ChapterListItem, bool, bool, bool) onChapterSelected;
  final ValueChanged<bool> onAllChapterSelected;
  final VoidCallback onInvertSelection;

  void onCopyTagToClipboard (String tag) async {
    if (tag.isNotEmpty) {
      await Clipboard.setData(ClipboardData(text: tag));
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return !isTabletUi
        ? _MangaScreenSmallImpl(
            mangaId: mangaId,
            fromSource: fromSource,
            nextUpdate: nextUpdate,
            chapterSwipeStartAction: chapterSwipeStartAction,
            chapterSwipeEndAction: chapterSwipeEndAction,
            onBackClicked: onBackClicked,
            onChapterClicked: onChapterClicked,
            onDownloadChapter: onDownloadChapter,
            onAddToLibraryClicked: onAddToLibraryClicked,
            onWebViewClicked: onWebViewClicked,
            onWebViewLongClicked: onWebViewLongClicked,
            onTrackingClicked: onTrackingClicked,
            onTagSearch: onTagSearch,
            onCopyTagToClipboard: onCopyTagToClipboard,
            onFilterClicked: onFilterButtonClicked,
            onRefresh: onRefresh,
            onContinueReading: onContinueReading,
            onSearch: onSearch,
            onCoverClicked: onCoverClicked,
            onShareClicked: onShareClicked,
            onDownloadActionClicked: onDownloadActionClicked,
            onEditCategoryClicked: onEditCategoryClicked,
            onEditIntervalClicked: onEditFetchIntervalClicked,
            onMigrateClicked: onMigrateClicked,
            onMultiBookmarkClicked: onMultiBookmarkClicked,
            onMultiMarkAsReadClicked: onMultiMarkAsReadClicked,
            onMarkPreviousAsReadClicked: onMarkPreviousAsReadClicked,
            onMultiDeleteClicked: onMultiDeleteClicked,
            onChapterSwipe: onChapterSwipe,
            onChapterSelected: onChapterSelected,
            onAllChapterSelected: onAllChapterSelected,
            onInvertSelection: onInvertSelection,
          )
        : _MangaScreenLargeImpl(
            mangaId: mangaId,
            fromSource: fromSource,
            chapterSwipeStartAction: chapterSwipeStartAction,
            chapterSwipeEndAction: chapterSwipeEndAction,
            nextUpdate: nextUpdate,
            onBackClicked: onBackClicked,
            onChapterClicked: onChapterClicked,
            onDownloadChapter: onDownloadChapter,
            onAddToLibraryClicked: onAddToLibraryClicked,
            onWebViewClicked: onWebViewClicked,
            onWebViewLongClicked: onWebViewLongClicked,
            onTrackingClicked: onTrackingClicked,
            onTagSearch: onTagSearch,
            onCopyTagToClipboard: onCopyTagToClipboard,
            onFilterButtonClicked: onFilterButtonClicked,
            onRefresh: onRefresh,
            onContinueReading: onContinueReading,
            onSearch: onSearch,
            onCoverClicked: onCoverClicked,
            onShareClicked: onShareClicked,
            onDownloadActionClicked: onDownloadActionClicked,
            onEditCategoryClicked: onEditCategoryClicked,
            onEditIntervalClicked: onEditFetchIntervalClicked,
            onMigrateClicked: onMigrateClicked,
            onMultiBookmarkClicked: onMultiBookmarkClicked,
            onMultiMarkAsReadClicked: onMultiMarkAsReadClicked,
            onMarkPreviousAsReadClicked: onMarkPreviousAsReadClicked,
            onMultiDeleteClicked: onMultiDeleteClicked,
            onChapterSwipe: onChapterSwipe,
            onChapterSelected: onChapterSelected,
            onAllChapterSelected: onAllChapterSelected,
            onInvertSelection: onInvertSelection,
          );
  }
}

//TODO: Convert to slivers
class _MangaScreenSmallImpl extends ConsumerWidget {
  const _MangaScreenSmallImpl({
    super.key,
    required this.mangaId,
    required this.fromSource,

    this.nextUpdate,
    required this.chapterSwipeStartAction,
    required this.chapterSwipeEndAction,
    required this.onBackClicked,
    required this.onChapterClicked,
    this.onDownloadChapter,
    required this.onAddToLibraryClicked,
    this.onWebViewClicked,
    this.onWebViewLongClicked,
    required this.onTrackingClicked,

    // For tags menu
    required this.onTagSearch,
    required this.onCopyTagToClipboard,

    required this.onFilterClicked,
    required this.onRefresh,
    required this.onContinueReading,
    required this.onSearch,

    // For cover dialog
    required this.onCoverClicked,

    // For top action menu
    this.onShareClicked,
    this.onDownloadActionClicked,
    this.onEditCategoryClicked,
    this.onEditIntervalClicked,
    this.onMigrateClicked,

    // For bottom action menu
    required this.onMultiBookmarkClicked,
    required this.onMultiMarkAsReadClicked,
    required this.onMarkPreviousAsReadClicked,
    required this.onMultiDeleteClicked,

    // For chapter swipe
    required this.onChapterSwipe,

    // Chapter selection
    required this.onChapterSelected,
    required this.onAllChapterSelected,
    required this.onInvertSelection,
  });

  final int mangaId;
  final bool fromSource;

  final DateTime? nextUpdate;
  final ChapterSwipeAction chapterSwipeStartAction;
  final ChapterSwipeAction chapterSwipeEndAction;
  final VoidCallback onBackClicked;
  final ValueChanged<Chapter> onChapterClicked;
  final void Function(List<ChapterListItem>, ChapterDownloadAction)? onDownloadChapter;
  final VoidCallback onAddToLibraryClicked;
  final VoidCallback? onWebViewClicked;
  final VoidCallback? onWebViewLongClicked;
  final VoidCallback onTrackingClicked;

  // For tags menu
  final ValueChanged<String> onTagSearch;
  final void Function(String tag) onCopyTagToClipboard;

  final VoidCallback onFilterClicked;
  final VoidCallback onRefresh;
  final VoidCallback onContinueReading;
  final void Function(String query, bool global) onSearch;

  // For cover dialog
  final VoidCallback onCoverClicked;

  // For top action menu
  final VoidCallback? onShareClicked;
  final ValueChanged<DownloadAction>? onDownloadActionClicked;
  final VoidCallback? onEditCategoryClicked;
  final VoidCallback? onEditIntervalClicked;
  final VoidCallback? onMigrateClicked;

  // For bottom action menu
  final void Function(List<Chapter>, bool bookmarked) onMultiBookmarkClicked;
  final void Function(List<Chapter>, bool markAsRead) onMultiMarkAsReadClicked;
  final ValueChanged<Chapter> onMarkPreviousAsReadClicked;
  final ValueChanged<List<Chapter>> onMultiDeleteClicked;

  // For chapter swipe
  final void Function(ChapterListItem, ChapterSwipeAction) onChapterSwipe;

  // Chapter selection
  final void Function(ChapterListItem, bool, bool, bool) onChapterSelected;
  final ValueChanged<bool> onAllChapterSelected;
  final VoidCallback onInvertSelection;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final lang = AppLocalizations.of(context);
    final provider = mangaScreenModelProvider(mangaId: mangaId, isFromSource: fromSource);
    final state = ref.watch(provider);
    final (chapters, listItem, isAnySelected) = (
      state.valueOrNull?.processedChapters ?? [],
      state.valueOrNull?.chapterListItems ?? [],
      state.valueOrNull?.isAnySelected ?? false,
    );

    final onBackPressed = isAnySelected
        ? () => onAllChapterSelected(false)
        : onBackClicked;

    final selectedChapterCount = chapters.where((it) => it.selected).length;

    final isReading = state.valueOrNull?.chapters.any((it) => it.chapter.read) ?? false;
    final selectedChapters = chapters.where((it) => it.selected).toList();

    final isFABVisible = chapters.any((it) => !it.chapter.read) && !isAnySelected;
    return PopScope(
      onPopInvoked: (_) => onBackPressed,
      child: Scaffold(
        appBar: MangaToolbar(
          title: state.valueOrNull?.manga.title ?? '',
          hasFilters: state.valueOrNull?.filterActive ?? false,
          onBackClicked: onBackPressed,
          onClickFilter: onFilterClicked,
          onClickShare: onShareClicked,
          onClickDownload: onDownloadActionClicked,
          onClickEditCategory: onEditCategoryClicked,
          onClickRefresh: onRefresh,
          onClickMigrate: onMigrateClicked,
          actionModeCounter: selectedChapterCount,
          onSelectAll: () => onAllChapterSelected(true),
          onInvertSelection: onInvertSelection,
        ),
        bottomNavigationBar: _SharedMangaBottomActionMenu(
          selected: selectedChapters,
          onMultiBookmarkClicked: onMultiBookmarkClicked,
          onMultiMarkAsReadClicked: onMultiMarkAsReadClicked,
          onMarkPreviousAsReadClicked: onMarkPreviousAsReadClicked,
          onDownloadChapter: onDownloadChapter,
          onMultiDeleteClicked: onMultiDeleteClicked,
          fillFraction: 1.0,
        ),
        floatingActionButton: isFABVisible
            ? FloatingActionButton.extended(
                label: Text(isReading ? lang.action_resume : lang.action_start),
                icon: const Icon(Icons.play_arrow),
                onPressed: onContinueReading,
              )
            : null,
        body: state.when(
          loading: () => const LoadingScreen(),
          // TODO: Error handling
          error: (error, stackTrace) {
            debugPrintStack(
              label: error.toString(),
              stackTrace: stackTrace,
            );
            return const LoadingScreen();
          },
          data: (data) {
            return RefreshIndicator.adaptive(
              onRefresh: () async => onRefresh(),
              notificationPredicate: (_) => !isAnySelected,
              child: CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: MangaInfoBox(
                      isTabletUi: false,
                      appBarPadding: 0,
                      title: data.manga.title,
                      author: data.manga.author,
                      artist: data.manga.artist,
                      //TODO
                      //sourceName: data.source.getNameForMangaInfo(),
                      sourceName: 'TODO',
                      isStubSource: data.source is StubSource,
                      coverDataProvider: () => data.manga,
                      status: data.manga.status,
                      onCoverClick: onCoverClicked,
                      doSearch: onSearch,
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: MangaActionRow(
                      favorite: data.manga.favorite,
                      trackingCount: data.trackingCount,
                      nextUpdate: nextUpdate,
                      isUserIntervalMode: data.manga.fetchInterval < 0,
                      onAddToLibraryClicked: onAddToLibraryClicked,
                      onWebViewClicked: onWebViewClicked,
                      onWebViewLongClicked: onWebViewLongClicked,
                      onTrackingClicked: onTrackingClicked,
                      onEditIntervalClicked: onEditIntervalClicked,
                      onEditCategory: onEditCategoryClicked,
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: ExpandableMangaDescription(
                      defaultExpandState: data.isFromSource,
                      description: data.manga.description,
                      tagsProvider: () => data.manga.genre ?? [],
                      onTagSearch: onTagSearch,
                      onCopyTagToClipboard: onCopyTagToClipboard,
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: ChapterHeader(
                      enabled: !isAnySelected,
                      chapterCount: chapters.length,
                      missingChapterCount: chapters
                          .map((it) => it.chapter.chapterNumber)
                          .missingChaptersCount(),
                      onClick: onFilterClicked,
                    ),
                  ),
                  _SharedChapterItems(
                    manga: data.manga,
                    chapters: listItem,
                    isAnyChapterSelected: chapters.any((it) => it.selected),
                    chapterSwipeStartAction: chapterSwipeStartAction,
                    chapterSwipeEndAction: chapterSwipeEndAction,
                    onChapterClicked: onChapterClicked,
                    onDownloadChapter: onDownloadChapter,
                    onChapterSelected: onChapterSelected,
                    onChapterSwipe: onChapterSwipe,
                  ),
                ],
              ),
            );
          }
        ),
      ),
    );
  }
}

class _MangaScreenLargeImpl extends ConsumerWidget {
  const _MangaScreenLargeImpl({
    super.key,
    required this.mangaId,
    required this.fromSource,

    this.nextUpdate,
    required this.chapterSwipeStartAction,
    required this.chapterSwipeEndAction,
    required this.onBackClicked,
    required this.onChapterClicked,
    this.onDownloadChapter,
    required this.onAddToLibraryClicked,
    this.onWebViewClicked,
    this.onWebViewLongClicked,
    required this.onTrackingClicked,

    // For tags menu
    required this.onTagSearch,
    required this.onCopyTagToClipboard,

    required this.onFilterButtonClicked,
    required this.onRefresh,
    required this.onContinueReading,
    required this.onSearch,

    // For cover dialog
    required this.onCoverClicked,

    // For top action menu
    this.onShareClicked,
    this.onDownloadActionClicked,
    this.onEditCategoryClicked,
    this.onEditIntervalClicked,
    this.onMigrateClicked,

    // For bottom action menu
    required this.onMultiBookmarkClicked,
    required this.onMultiMarkAsReadClicked,
    required this.onMarkPreviousAsReadClicked,
    required this.onMultiDeleteClicked,

    // For chapter swipe
    required this.onChapterSwipe,

    // Chapter selection
    required this.onChapterSelected,
    required this.onAllChapterSelected,
    required this.onInvertSelection,
  });

  final int mangaId;
  final bool fromSource;

  final DateTime? nextUpdate;
  final ChapterSwipeAction chapterSwipeStartAction;
  final ChapterSwipeAction chapterSwipeEndAction;
  final VoidCallback onBackClicked;
  final ValueChanged<Chapter> onChapterClicked;
  final void Function(List<ChapterListItem>, ChapterDownloadAction)? onDownloadChapter;
  final VoidCallback onAddToLibraryClicked;
  final VoidCallback? onWebViewClicked;
  final VoidCallback? onWebViewLongClicked;
  final VoidCallback onTrackingClicked;

  // For tags menu
  final ValueChanged<String> onTagSearch;
  final void Function(String tag) onCopyTagToClipboard;

  final VoidCallback onFilterButtonClicked;
  final VoidCallback onRefresh;
  final VoidCallback onContinueReading;
  final void Function(String query, bool global) onSearch;

  // For cover dialog
  final VoidCallback onCoverClicked;

  // For top action menu
  final VoidCallback? onShareClicked;
  final ValueChanged<DownloadAction>? onDownloadActionClicked;
  final VoidCallback? onEditCategoryClicked;
  final VoidCallback? onEditIntervalClicked;
  final VoidCallback? onMigrateClicked;

  // For bottom action menu
  final void Function(List<Chapter>, bool bookmarked) onMultiBookmarkClicked;
  final void Function(List<Chapter>, bool markAsRead) onMultiMarkAsReadClicked;
  final ValueChanged<Chapter> onMarkPreviousAsReadClicked;
  final ValueChanged<List<Chapter>> onMultiDeleteClicked;

  // For chapter swipe
  final void Function(ChapterListItem, ChapterSwipeAction) onChapterSwipe;

  // Chapter selection
  final void Function(ChapterListItem, bool, bool, bool) onChapterSelected;
  final ValueChanged<bool> onAllChapterSelected;
  final VoidCallback onInvertSelection;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final lang = AppLocalizations.of(context);
    final provider = mangaScreenModelProvider(mangaId: mangaId, isFromSource: fromSource);
    final state = ref.watch(provider);
    final (chapters, listItem, isAnySelected) = (
      state.valueOrNull?.processedChapters ?? [],
      state.valueOrNull?.chapterListItems ?? [],
      state.valueOrNull?.isAnySelected ?? false,
    );

    final onBackPressed = isAnySelected
        ? () => onAllChapterSelected(false)
        : onBackClicked;

    final selectedChapterCount = chapters.where((it) => it.selected).length;

    final isReading = state.valueOrNull?.chapters.any((it) => it.chapter.read) ?? false;
    final selectedChapters = chapters.where((it) => it.selected).toList();

    final isFABVisible = chapters.any((it) => !it.chapter.read) && !isAnySelected;
    return PopScope(
      onPopInvoked: (_) => onBackPressed,
      child: Scaffold(
        appBar: MangaToolbar(
          title: state.valueOrNull?.manga.title ?? '',
          hasFilters: state.valueOrNull?.filterActive ?? false,
          onBackClicked: onBackPressed,
          onClickFilter: onFilterButtonClicked,
          onClickShare: onShareClicked,
          onClickDownload: onDownloadActionClicked,
          onClickEditCategory: onEditCategoryClicked,
          onClickRefresh: onRefresh,
          onClickMigrate: onMigrateClicked,
          actionModeCounter: selectedChapterCount,
          onSelectAll: () => onAllChapterSelected(true),
          onInvertSelection: onInvertSelection,
        ),
        bottomNavigationBar: _SharedMangaBottomActionMenu(
          selected: selectedChapters,
          onMultiBookmarkClicked: onMultiBookmarkClicked,
          onMultiMarkAsReadClicked: onMultiMarkAsReadClicked,
          onMarkPreviousAsReadClicked: onMarkPreviousAsReadClicked,
          onDownloadChapter: onDownloadChapter,
          onMultiDeleteClicked: onMultiDeleteClicked,
          fillFraction: 0.5,
        ),
        floatingActionButton: isFABVisible
            ? FloatingActionButton.extended(
                label: Text(isReading ? lang.action_resume : lang.action_start),
                icon: const Icon(Icons.play_arrow),
                onPressed: onContinueReading,
              )
            : null,
        body: state.when(
          loading: () => const LoadingScreen(),
          // TODO: Error handling
          error: (error, stackTrace) {
            debugPrintStack(
              label: error.toString(),
              stackTrace: stackTrace,
            );
            return const LoadingScreen();
          },
          data: (data) {
            return RefreshIndicator.adaptive(
              onRefresh: () async => onRefresh(),
              notificationPredicate: (_) => !isAnySelected,
              child: TwoPanelBox(
                startChild: Column(
                  children: [
                    MangaInfoBox(
                      isTabletUi: true,
                      appBarPadding: 0,
                      title: data.manga.title,
                      author: data.manga.author,
                      artist: data.manga.artist,
                      //TODO
                      //sourceName: data.source.getNameForMangaInfo(),
                      sourceName: 'TODO',
                      isStubSource: data.source is StubSource,
                      coverDataProvider: () => data.manga,
                      status: data.manga.status,
                      onCoverClick: onCoverClicked,
                      doSearch: onSearch,
                    ),
                    MangaActionRow(
                      favorite: data.manga.favorite,
                      trackingCount: data.trackingCount,
                      nextUpdate: nextUpdate,
                      isUserIntervalMode: data.manga.fetchInterval < 0,
                      onAddToLibraryClicked: onAddToLibraryClicked,
                      onWebViewClicked: onWebViewClicked,
                      onWebViewLongClicked: onWebViewLongClicked,
                      onTrackingClicked: onTrackingClicked,
                      onEditIntervalClicked: onEditIntervalClicked,
                      onEditCategory: onEditCategoryClicked,
                    ),
                    ExpandableMangaDescription(
                      defaultExpandState: true,
                      description: data.manga.description,
                      tagsProvider: () => data.manga.genre ?? [],
                      onTagSearch: onTagSearch,
                      onCopyTagToClipboard: onCopyTagToClipboard,
                    ),
                  ],
                ),
                endChild: CustomScrollView(
                  slivers: [
                    SliverToBoxAdapter(
                      child: ChapterHeader(
                        enabled: !isAnySelected,
                        chapterCount: chapters.length,
                        missingChapterCount: chapters
                            .map((it) => it.chapter.chapterNumber)
                            .missingChaptersCount(),
                        onClick: onFilterButtonClicked,
                      ),
                    ),
                    _SharedChapterItems(
                      manga: data.manga,
                      chapters: listItem,
                      isAnyChapterSelected: chapters.any((it) => it.selected),
                      chapterSwipeStartAction: chapterSwipeStartAction,
                      chapterSwipeEndAction: chapterSwipeEndAction,
                      onChapterClicked: onChapterClicked,
                      onDownloadChapter: onDownloadChapter,
                      onChapterSelected: onChapterSelected,
                      onChapterSwipe: onChapterSwipe,
                    ),
                  ],
                ),
              ),
            );
          }
        ),
      ),
    );
  }
}

class _SharedMangaBottomActionMenu extends StatelessWidget {
  const _SharedMangaBottomActionMenu({
    super.key,
    required this.selected,
    required this.onMultiBookmarkClicked,
    required this.onMultiMarkAsReadClicked,
    required this.onMarkPreviousAsReadClicked,
    this.onDownloadChapter,
    required this.onMultiDeleteClicked,
    required this.fillFraction,
  });

  final List<ChapterListItem> selected;
  final void Function(List<Chapter>, bool bookmarked) onMultiBookmarkClicked;
  final void Function(List<Chapter>, bool markAsRead) onMultiMarkAsReadClicked;
  final ValueChanged<Chapter> onMarkPreviousAsReadClicked;
  final void Function(List<ChapterListItem>, ChapterDownloadAction)?
      onDownloadChapter;
  final ValueChanged<List<Chapter>> onMultiDeleteClicked;
  final double fillFraction;

  @override
  Widget build(BuildContext context) {
    return MangaBottomActionMenu(
      visible: selected.isNotEmpty,
      onBookmarkClicked: selected.any((it) => !it.chapter.bookmark)
          ? () => onMultiBookmarkClicked(
              selected.map((it) => it.chapter).toList(), true)
          : null,
      onRemoveBookmarkClicked: selected.every((it) => it.chapter.bookmark)
          ? () => onMultiBookmarkClicked(
              selected.map((it) => it.chapter).toList(), false)
          : null,
      onMarkAsReadClicked: selected.any((it) => !it.chapter.read)
          ? () => onMultiMarkAsReadClicked(
              selected.map((it) => it.chapter).toList(), true)
          : null,
      onMarkAsUnreadClicked:
          selected.any((it) => it.chapter.read || it.chapter.lastPageRead > 0)
              ? () => onMultiMarkAsReadClicked(
                  selected.map((it) => it.chapter).toList(), false)
              : null,
      onMarkPreviousAsReadClicked: selected.length == 1
          ? () => onMarkPreviousAsReadClicked(selected[0].chapter)
          : null,
      onDownloadClicked: onDownloadChapter != null &&
              selected.any((it) => it.downloadState != DownloadState.downloaded)
          ? () =>
              onDownloadChapter!(selected.toList(), ChapterDownloadAction.start)
          : null,
      onDeleteClicked: selected
              .any((it) => it.downloadState == DownloadState.downloaded)
          ? () =>
              onMultiDeleteClicked(selected.map((it) => it.chapter).toList())
          : null,
    );
  }
}

class _SharedChapterItems extends StatelessWidget {
  const _SharedChapterItems({
    super.key,
    required this.manga,
    required this.chapters,
    required this.isAnyChapterSelected,
    required this.chapterSwipeStartAction,
    required this.chapterSwipeEndAction,
    required this.onChapterClicked,
    this.onDownloadChapter,
    required this.onChapterSelected,
    required this.onChapterSwipe,
  });

  final Manga manga;
  final List<ChapterList> chapters;
  final bool isAnyChapterSelected;
  final ChapterSwipeAction chapterSwipeStartAction;
  final ChapterSwipeAction chapterSwipeEndAction;
  final ValueChanged<Chapter> onChapterClicked;
  final void Function(List<ChapterListItem>, ChapterDownloadAction)? onDownloadChapter;
  final void Function(ChapterListItem, bool, bool, bool) onChapterSelected;
  final void Function(ChapterListItem, ChapterSwipeAction) onChapterSwipe;

  @override
  Widget build(BuildContext context) {
    final lang = AppLocalizations.of(context);
    return SliverList.builder(
      itemCount: chapters.length,
      itemBuilder: (context, index) {
        final item = chapters[index];
        return switch (item) {
          ChapterListMissingCount() => MissingChapterCountListItem(
              count: item.count,
              key: Key('missing-count-${item.id}'),
            ),
          ChapterListItem() => MangaChapterListItem(
              key: Key('chapter-${item.id}'),
              title: manga.displayMode == MangaUtils.chapterDisplayNumber
                  ? lang.display_mode_chapter(
                      formatChapterNumber(item.chapter.chapterNumber),
                    )
                  : item.chapter.name,
              date: relativeDateText(
                context: context,
                date: item.chapter.dateUpload,
                relativeTime: false,
                //TODO
                dateFormat: '',
              ),
              readProgress: !item.chapter.read && item.chapter.lastPageRead > 0
                  ? lang.chapter_progress(item.chapter.lastPageRead + 1)
                  : null,
              scanlator: !item.chapter.scanlator.isNullOrBlank
                  ? item.chapter.scanlator
                  : null,
              read: item.chapter.read,
              bookmark: item.chapter.bookmark,
              selected: item.selected,
              //downloadIndicatorEnabled: !isAnyChapterSelected && !manga.isLocal(),
              downloadIndicatorEnabled: !isAnyChapterSelected,
              downloadStateProvider: () => item.downloadState,
              downloadProgressProvider: () => item.downloadProgress,
              chapterSwipeStartAction: chapterSwipeStartAction,
              chapterSwipeEndAction: chapterSwipeEndAction,
              onLongClick: () {
                onChapterSelected(item, !item.selected, true, true);
                Feedback.forLongPress(context);
              },
              onClick: () {
                _onChapterItemClick(
                  chapterItem: item,
                  isAnyChapterSelected: isAnyChapterSelected,
                  onToggleSelection: (_) => onChapterSelected(item, !item.selected, true, false),
                  onChapterClicked: onChapterClicked,
                );
              },
              onDownloadClick: onDownloadChapter != null
                  ? (it) => onDownloadChapter!([item], it)
                  : null,
              onChapterSwipe: (it) => onChapterSwipe(item, it),
            ),
        };
      },
    );
  }
}

void _onChapterItemClick({
  required ChapterListItem chapterItem,
  required bool isAnyChapterSelected,
  required ValueChanged<bool> onToggleSelection,
  required ValueChanged<Chapter> onChapterClicked,
}) {
  if (chapterItem.selected) {
    onToggleSelection(false);
  } else if (isAnyChapterSelected) {
    onToggleSelection(true);
  } else {
    onChapterClicked(chapterItem.chapter);
  }
}
