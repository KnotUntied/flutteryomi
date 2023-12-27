import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:flutteryomi/domain/category/model/category.dart';
import 'package:flutteryomi/presentation/category/components/category_list_item.dart';
import 'package:flutteryomi/presentation/components/app_bar.dart';
import 'package:flutteryomi/presentation/components/material/constants.dart';
import 'package:flutteryomi/presentation/screens/empty_screen.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({
    super.key,
    required this.state,
    required this.onClickCreate,
    required this.onClickSortAlphabetically,
    required this.onClickRename,
    required this.onClickDelete,
    required this.onClickMoveUp,
    required this.onClickMoveDown,
  });

  //final CategoryScreenState.Success state;
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
                // TODO: Use state
                //categories: state.categories,
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
        //padding: const EdgeInsets.all(8),
        //padding: paddingValues,
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
        });
  }
}
