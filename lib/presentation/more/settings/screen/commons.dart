import 'package:dartx/dartx.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:flutteryomi/domain/category/model/category.dart';
import 'package:flutteryomi/presentation/category/category_extensions.dart';

String getCategoriesLabel(
  BuildContext context, {
  required List<Category> allCategories,
  required Set<String> included,
  required Set<String> excluded,
}) {
  final lang = AppLocalizations.of(context);
  final includedCategories = included
      .mapNotNull((id) => allCategories.firstWhere((it) => it.id == id.toInt()))
      .sortedBy((it) => it.sort);
  final excludedCategories = excluded
      .mapNotNull((id) => allCategories.firstWhere((it) => it.id == id.toInt()))
      .sortedBy((it) => it.sort);
  final allExcluded = excludedCategories.length == allCategories.length;

  final String includedItemsText;
  if (includedCategories.isNotEmpty &&
      includedCategories.length != allCategories.length) {
    // Some selected, but not all
    includedItemsText = includedCategories.joinToString(
      transform: (it) => it.visualName(context),
    );
  } else if (includedCategories.length == allCategories.length) {
    // All explicitly selected
    includedItemsText = lang.all;
  } else if (allExcluded) {
    includedItemsText = lang.none;
  } else {
    includedItemsText = lang.all;
  }

  final String excludedItemsText;
  if (excludedCategories.isEmpty) {
    excludedItemsText = lang.none;
  } else if (allExcluded) {
    excludedItemsText = lang.all;
  } else {
    excludedItemsText = excludedCategories.joinToString(
      transform: (it) => it.visualName(context),
    );
  }

  return "${lang.include(includedItemsText)}\n${lang.exclude(excludedItemsText)}";
}
