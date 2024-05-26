import 'package:dartx/dartx.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:flutteryomi/core/preference/checkbox_state.dart';
import 'package:flutteryomi/domain/category/model/category.dart';
import 'package:flutteryomi/domain/library/service/library_preferences.dart';
import 'package:flutteryomi/presentation/category/category.dart';
import 'package:flutteryomi/presentation/category/components/category_dialogs.dart';
import 'package:flutteryomi/presentation/library/components/library_content.dart';
import 'package:flutteryomi/presentation/library/components/library_tabs.dart';
import 'package:flutteryomi/presentation/library/components/library_toolbar.dart';
import 'package:flutteryomi/presentation/library/delete_library_manga_dialog.dart';
import 'package:flutteryomi/presentation/library/library_screen_model.dart';
import 'package:flutteryomi/presentation/library/library_settings_dialog.dart';
import 'package:flutteryomi/presentation/library/library_settings_screen_model.dart';
import 'package:flutteryomi/presentation/manga/components/manga_bottom_action_menu.dart';
import 'package:flutteryomi/presentation/manga/manga.dart';
import 'package:flutteryomi/presentation/more/onboarding/guides_step.dart';
import 'package:flutteryomi/presentation/reader/reader.dart';
import 'package:flutteryomi/presentation/screens/empty_screen.dart';
import 'package:flutteryomi/presentation/screens/loading_screen.dart';
import 'package:flutteryomi/source/local/local_source.dart';

class LibraryTab extends ConsumerStatefulWidget {
  const LibraryTab({super.key});

  @override
  ConsumerState<LibraryTab> createState() => _LibraryTabState();
}

class _LibraryTabState extends ConsumerState<LibraryTab>
    with AutomaticKeepAliveClientMixin<LibraryTab> {
  @override
  bool get wantKeepAlive => true;

  bool onClickRefresh([Category? category]) {
    final lang = AppLocalizations.of(context);
    //TODO
    //final started = LibraryUpdateJob.startNow(context, category);
    const started = true;
    final String msg;
    //if (!started) {
    //  msg = lang.update_already_running;
    //} else if (category != null) {
    if (category != null) {
      msg = lang.updating_category;
    } else {
      msg = lang.updating_library;
    }
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(msg)),
    );
    return started;
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final lang = AppLocalizations.of(context);
    final libraryPreferences = ref.watch(libraryPreferencesProvider);
    final screenModel = ref.watch(libraryScreenModelProvider.notifier);
    final settingsScreenModel =
        ref.watch(librarySettingsScreenModelProvider.notifier);
    final state = ref.watch(libraryScreenModelProvider);
    final currentState = state.unwrapPrevious().valueOrNull;

    final tabVisible = (currentState?.showCategoryTabs ?? false) &&
        (currentState?.categories.length ?? 0) > 1;

    return DefaultTabController(
      initialIndex: libraryPreferences.lastUsedCategory().get(),
      length: currentState?.library.length ?? 0,
      child: Builder(builder: (context) {
        return Scaffold(
          appBar: LibraryToolbar(
            hasActiveFilters: currentState?.hasActiveFilters ?? false,
            selectedCount: currentState?.selection.length ?? 0,
            title: currentState?.getToolbarTitle(
                  defaultTitle: lang.label_library,
                  defaultCategoryTitle: lang.label_default,
                  page: DefaultTabController.of(context).index,
                ) ??
                const LibraryToolbarTitle(''),
            onClickUnselectAll: screenModel.clearSelection,
            onClickSelectAll: () =>
                screenModel.selectAll(DefaultTabController.of(context).index),
            onClickInvertSelection: () => screenModel
                .invertSelection(DefaultTabController.of(context).index),
            onClickFilter: () {
              final category = currentState?.categories
                  .elementAtOrNull(DefaultTabController.of(context).index);
              if (category == null) return;
              showModalBottomSheet<void>(
                context: context,
                isScrollControlled: true,
                useSafeArea: true,
                builder: (context) => LibrarySettingsDialog(
                  screenModel: settingsScreenModel,
                  category: category,
                ),
              );
            },
            onClickRefresh: () => onClickRefresh(currentState
                ?.categories[DefaultTabController.of(context).index]),
            onClickGlobalUpdate: () => onClickRefresh(null),
            onClickOpenRandomManga: () {
              final randomItem = screenModel.getRandomLibraryItemForCategory(
                  DefaultTabController.of(context).index);
              if (randomItem != null) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        MangaScreen(mangaId: randomItem.libraryManga.manga.id),
                  ),
                );
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(lang.information_no_entries_found)),
                );
              }
            },
            searchQuery: currentState?.searchQuery,
            onSearchQueryChange: screenModel.search,
            bottom: tabVisible
                ? LibraryTabs(
                    categories: currentState?.categories ?? [],
                    getNumberOfMangaForCategory: (it) =>
                        currentState?.getMangaCountForCategory(it),
                    onTabItemClick: (it) =>
                        currentState?.getLibraryItemsByPage(it),
                  )
                : null,
          ),
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
              if (data.searchQuery.isNullOrEmpty &&
                  !data.hasActiveFilters &&
                  data.isLibraryEmpty) {
                return EmptyScreen(
                  message: lang.information_empty_library,
                  actions: [
                    EmptyScreenAction(
                      text: lang.getting_started_guide,
                      icon: const Icon(Icons.help_outline_outlined),
                      onClick: () async {
                        final Uri parsedUrl = Uri.parse(gettingStartedUrl);
                        if (!await launchUrl(parsedUrl)) {
                          throw Exception('Could not open $parsedUrl');
                        }
                      },
                    ),
                  ],
                );
              } else {
                return LibraryContent(
                  categories: data.categories,
                  searchQuery: data.searchQuery,
                  selection: data.selection,
                  hasActiveFilters: data.hasActiveFilters,
                  onMangaClicked: (it) => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MangaScreen(mangaId: it),
                    ),
                  ),
                  onContinueReadingClicked: data.showMangaContinueButton
                      ? (it) async {
                          final chapter =
                              await screenModel.getNextUnreadChapter(it.manga);
                          if (context.mounted) {
                            if (chapter != null) {
                              //TODO
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ReaderScreen(
                                    mangaId: chapter.mangaId,
                                    initialChapterId: chapter.id,
                                  ),
                                ),
                              );
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text(lang.no_next_chapter)),
                              );
                            }
                          }
                        }
                      : null,
                  onToggleSelection: screenModel.toggleSelection,
                  onToggleRangeSelection: (it) {
                    Feedback.forLongPress(context);
                    screenModel.toggleRangeSelection(it);
                  },
                  onRefresh: onClickRefresh,
                  onGlobalSearchClicked: () {
                    //Navigator.push(
                    //  context,
                    //  MaterialPageRoute(
                    //    builder: (context) => GlobalSearchScreen(data.searchQuery ?? ""),
                    //  ),
                    //);
                  },
                  getDisplayMode: (_) => screenModel.getDisplayMode(),
                  getColumnsForOrientation: (it) =>
                      screenModel.getColumnsPreferenceForCurrentOrientation(it),
                  getLibraryForPage: (it) => data.getLibraryItemsByPage(it),
                );
              }
            },
          ),
          bottomNavigationBar: LibraryBottomActionMenu(
            visible: currentState?.selectionMode ?? false,
            onChangeCategoryClicked: currentState != null
                ? () async {
                    final mangaList =
                        currentState.selection.map((it) => it.manga).toList();
                    // Hide the default category because it has a different behavior than the ones from db.
                    final categories =
                        currentState.categories.where((it) => it.id != 0);
                    // Get indexes of the common categories to preselect.
                    final common =
                        await screenModel.getCommonCategories(mangaList);
                    // Get indexes of the mix categories to preselect.
                    final mix = await screenModel.getMixCategories(mangaList);
                    final preselected = categories.map((it) {
                      if (common.contains(it)) {
                        return CheckboxRegularState.checked(it);
                      } else if (mix.contains(it)) {
                        return CheckboxTriState.exclude(it);
                      } else {
                        return CheckboxRegularState.none(it);
                      }
                    }).toList();
                    if (context.mounted) {
                      showAdaptiveDialog(
                        context: context,
                        builder: (context) => ChangeCategoryDialog(
                          initialSelection: preselected,
                          onEditCategories: () {
                            screenModel.clearSelection();
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const CategoryScreen(),
                              ),
                            );
                          },
                          onConfirm: (include, exclude) {
                            screenModel.clearSelection();
                            screenModel.setMangaCategories(
                                mangaList, include, exclude);
                          },
                        ),
                      );
                    }
                  }
                : null,
            onMarkAsReadClicked: () => screenModel.markReadSelection(true),
            onMarkAsUnreadClicked: () => screenModel.markReadSelection(false),
            onDownloadClicked:
                currentState?.selection.every((it) => !it.manga.isLocal()) ??
                        false
                    ? screenModel.runDownloadActionSelection
                    : null,
            onDeleteClicked: currentState != null
                ? () async {
                    final mangaList =
                        currentState.selection.map((it) => it.manga).toList();
                    if (context.mounted) {
                      showAdaptiveDialog(
                        context: context,
                        builder: (context) => DeleteLibraryMangaDialog(
                          containsLocalManga:
                              mangaList.any((it) => it.isLocal()),
                          onConfirm: (deleteManga, deleteChapter) {
                            screenModel.removeMangas(
                                mangaList, deleteManga, deleteChapter);
                            screenModel.clearSelection();
                          },
                        ),
                      );
                    }
                  }
                : null,
          ),
        );
      }),
    );
  }
}
