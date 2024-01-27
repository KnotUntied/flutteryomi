//TODO
//import 'package:flutter/material.dart';
//import 'package:flutter_gen/gen_l10n/app_localizations.dart';

//import 'package:flutteryomi/presentation/components/app_bar.dart';
//import 'package:flutteryomi/presentation/components/pill.dart';

//class MangaToolbar extends StatelessWidget {
//  const MangaToolbar({
//    required this.title,
//    required this.titleAlphaProvider,
//    required this.hasFilters,
//    required this.onBackClicked,
//    required this.onClickFilter,
//    this.onClickShare,
//    this.onClickDownload,
//    this.onClickEditCategory,
//    required this.onClickRefresh,
//    this.onClickMigrate,

//    // For action mode
//    required this.actionModeCounter,
//    required this.onSelectAll,
//    required this.onInvertSelection,

//    required this.backgroundAlphaProvider,
//  });

//  final String title;
//  final double Function() titleAlphaProvider;
//  final bool hasFilters;
//  final VoidCallback onBackClicked;
//  final VoidCallback onClickFilter;
//  final VoidCallback? onClickShare?;
//  final ValueChanged<DownloadAction>? onClickDownload;
//  final VoidCallback? onClickEditCategory;
//  final VoidCallback onClickRefresh;
//  final VoidCallback? onClickMigrate;


//  final int actionModeCounter;
//  final VoidCallback onSelectAll;
//  final VoidCallback onInvertSelection;

//  final double Function() backgroundAlphaProvider;

//  @override
//  Widget build(BuildContext context) {
//    final lang = AppLocalizations.of(context);
//    return ActionAppBar(
//      titleContent: Text(
//        selectedCount.toString(),
//        maxLines: 1,
//        overflow: TextOverflow.ellipsis,
//        color: LocalContentColor.current.copy(alpha = if (isActionMode) 1f else titleAlphaProvider()),
//      ),
//      actions: [
//        AppBarAction(
//          iconData: Icons.select_all_outlined,
//          onClick: onClickSelectAll,
//          title: lang.action_select_all,
//        ),
//        AppBarAction(
//          iconData: Icons.flip_to_back_outlined,
//          onClick: onClickInvertSelection,
//          title: lang.action_select_inverse,
//        ),
//      ],
//      isActionMode: actionModeCounter > 0,
//      onCancelActionMode: onClickUnselectAll,
//      bottom: bottom,
//    );
//  }
//}
