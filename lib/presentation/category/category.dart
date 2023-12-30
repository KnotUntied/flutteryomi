import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutteryomi/domain/category/model/category.dart';
import 'package:flutteryomi/presentation/category/category_screen_model.dart';
import 'package:flutteryomi/presentation/category/components/category_dialogs.dart';
import 'package:flutteryomi/presentation/category/components/category_list_item.dart';
import 'package:flutteryomi/presentation/components/app_bar.dart';
import 'package:flutteryomi/presentation/components/material/constants.dart';
import 'package:flutteryomi/presentation/screens/empty_screen.dart';
import 'package:flutteryomi/presentation/screens/loading_screen.dart';

class CategoryScreen extends ConsumerWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final screenModel = ref.watch(categoryScreenModelProvider.notifier);
    final state = ref.watch(categoryScreenModelProvider);
    return state.when(
      loading: () => const LoadingScreen(),
      // TODO: Error handling
      error: (Object error, StackTrace stackTrace) {
        debugPrintStack(
          label: error.toString(),
          stackTrace: stackTrace,
        );
        return const LoadingScreen();
      },
      data: (data) {
        return CategoryScreenContent(
          state: data,
          onClickCreate: () => showDialog(
            context: context,
            builder: (BuildContext context) => CategoryCreateDialog(
              onCreate: screenModel.createCategory,
              categories: data,
            ),
          ),
          onClickSortAlphabetically: () => showDialog(
            context: context,
            builder: (BuildContext context) => CategorySortAlphabeticallyDialog(
              onSort: screenModel.sortAlphabetically,
            ),
          ),
          onClickRename: (Category category) => showDialog(
            context: context,
            builder: (BuildContext context) => CategoryRenameDialog(
              onRename: (String name) => screenModel.renameCategory(category, name),
              categories: data,
              category: category,
            ),
          ),
          onClickDelete: (Category category) => showDialog(
            context: context,
            builder: (BuildContext context) => CategoryDeleteDialog(
              onDelete: () => screenModel.deleteCategory(category.id),
              category: category,
            ),
          ),
          onClickMoveUp: screenModel.moveUp,
          onClickMoveDown: screenModel.moveDown,
        );
      },
    );
  }
}

class CategoryScreenContent extends StatelessWidget {
  const CategoryScreenContent({
    super.key,
    required this.state,
    required this.onClickCreate,
    required this.onClickSortAlphabetically,
    required this.onClickRename,
    required this.onClickDelete,
    required this.onClickMoveUp,
    required this.onClickMoveDown,
  });

  final List<Category> state;
  final VoidCallback onClickCreate;
  final VoidCallback onClickSortAlphabetically;
  final ValueChanged<Category> onClickRename;
  final ValueChanged<Category> onClickDelete;
  final ValueChanged<Category> onClickMoveUp;
  final ValueChanged<Category> onClickMoveDown;

  @override
  Widget build(BuildContext context) {
    final lang = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(lang.action_edit_categories),
        actions: <Widget>[
          AppBarAction(
            title: lang.action_sort,
            iconData: Icons.sort_by_alpha_outlined,
            onClick: onClickSortAlphabetically,
          ),
        ],
      ),
      body: state.isEmpty
          ? EmptyScreen(message: lang.information_empty_category)
          : Padding(
              padding: topSmallPaddingValues.add(
                const EdgeInsets.symmetric(horizontal: MaterialPadding.medium),
              ),
              child: _CategoryContent(
                categories: state,
                onClickRename: onClickRename,
                onClickDelete: onClickDelete,
                onMoveUp: onClickMoveUp,
                onMoveDown: onClickMoveDown,
              ),
            ),
      // TODO: Create or wait for dynamically extending FAB
      floatingActionButton: FloatingActionButton.extended(
        label: Text(lang.action_add),
        icon: const Icon(Icons.add),
        onPressed: onClickCreate,
      ),
    );
  }
}

class _CategoryContent extends StatelessWidget {
  const _CategoryContent({
    super.key,
    required this.categories,
    required this.onClickRename,
    required this.onClickDelete,
    required this.onMoveUp,
    required this.onMoveDown,
  });

  final List<Category> categories;
  final ValueChanged<Category> onClickRename;
  final ValueChanged<Category> onClickDelete;
  final ValueChanged<Category> onMoveUp;
  final ValueChanged<Category> onMoveDown;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      // TODO: Animate on move
      itemCount: categories.length,
      itemBuilder: (BuildContext context, int index) {
        final category = categories[index];
        return CategoryListItem(
          key: Key('category-${category.id}'),
          category: category,
          canMoveUp: index != 0,
          canMoveDown: index != categories.length - 1,
          onMoveUp: onMoveUp,
          onMoveDown: onMoveDown,
          onRename: () => onClickRename(category),
          onDelete: () => onClickDelete(category),
        );
      },
    );
  }
}
