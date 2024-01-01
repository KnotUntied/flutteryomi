import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:flutteryomi/domain/category/model/category.dart';
import 'package:flutteryomi/presentation/components/material/constants.dart';

class CategoryListItem extends StatelessWidget {
  const CategoryListItem({
    super.key,
    required this.category,
    required this.canMoveUp,
    required this.canMoveDown,
    required this.onMoveUp,
    required this.onMoveDown,
    required this.onRename,
    required this.onDelete,
  });

  final Category category;
  final bool canMoveUp;
  final bool canMoveDown;
  final ValueChanged<Category> onMoveUp;
  final ValueChanged<Category> onMoveDown;
  final VoidCallback onRename;
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    final lang = AppLocalizations.of(context);
    return Card(
      child: Column(
        children: <Widget>[
          InkWell(
            onTap: onRename,
            child: Padding(
              padding: const EdgeInsets.only(
                left: MaterialPadding.medium,
                top: MaterialPadding.medium,
                right: MaterialPadding.medium,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  const Icon(Icons.label_outlined),
                  Padding(
                    padding: const EdgeInsets.only(left: MaterialPadding.medium),
                    child: Text(category.name),
                  ),
                ],
              ),
            ),
          ),
          Row(
            children: <Widget>[
              IconButton(
                icon: const Icon(Icons.arrow_drop_up),
                onPressed: canMoveUp ? () => onMoveUp(category) : null,
              ),
              IconButton(
                icon: const Icon(Icons.arrow_drop_down),
                onPressed: canMoveDown ? () => onMoveDown(category) : null,
              ),
              const Spacer(),
              IconButton(
                icon: Icon(
                  Icons.edit_outlined,
                  semanticLabel: lang.action_rename_category,
                ),
                onPressed: onRename,
              ),
              IconButton(
                icon: Icon(
                  Icons.delete_outlined,
                  semanticLabel: lang.action_cancel,
                ),
                onPressed: onDelete,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
