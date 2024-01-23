import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:flutteryomi/presentation/components/download_dropdown_menu.dart';
import 'package:flutteryomi/presentation/icons/custom_icons.dart';
import 'package:flutteryomi/presentation/manga/manga_screen_constants.dart';

class MangaBottomActionMenu extends StatelessWidget {
  const MangaBottomActionMenu({
    super.key,
    required this.visible,
    this.onBookmarkClicked,
    this.onRemoveBookmarkClicked,
    this.onMarkAsReadClicked,
    this.onMarkAsUnreadClicked,
    this.onMarkPreviousAsReadClicked,
    this.onDownloadClicked,
    this.onDeleteClicked,
  });

  final bool visible;
  final VoidCallback? onBookmarkClicked;
  final VoidCallback? onRemoveBookmarkClicked;
  final VoidCallback? onMarkAsReadClicked;
  final VoidCallback? onMarkAsUnreadClicked;
  final VoidCallback? onMarkPreviousAsReadClicked;
  final VoidCallback? onDownloadClicked;
  final VoidCallback? onDeleteClicked;

  @override
  Widget build(BuildContext context) {
    final lang = AppLocalizations.of(context);
    return Card(
      color: Theme.of(context).navigationBarTheme.backgroundColor,
      elevation: 3.0,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24.0),
          topRight: Radius.circular(24.0),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 8.0,
          vertical: 12.0,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            if (onBookmarkClicked != null)
              IconButton(
                tooltip: lang.action_bookmark,
                icon: const Icon(Icons.bookmark_add_outlined),
                onPressed: onBookmarkClicked,
              ),
            if (onRemoveBookmarkClicked != null)
              IconButton(
                tooltip: lang.action_remove_bookmark,
                icon: const Icon(Icons.bookmark_remove_outlined),
                onPressed: onRemoveBookmarkClicked,
              ),
            if (onMarkAsReadClicked != null)
              IconButton(
                tooltip: lang.action_mark_as_read,
                icon: const Icon(Icons.done_all_outlined),
                onPressed: onMarkAsReadClicked,
              ),
            if (onMarkAsUnreadClicked != null)
              IconButton(
                tooltip: lang.action_mark_as_unread,
                icon: const Icon(Icons.remove_done_outlined),
                onPressed: onMarkAsUnreadClicked,
              ),
            if (onMarkPreviousAsReadClicked != null)
              IconButton(
                tooltip: lang.action_mark_previous_as_read,
                icon: const Icon(CustomIcons.donePrev),
                onPressed: onMarkPreviousAsReadClicked,
              ),
            if (onDownloadClicked != null)
              IconButton(
                tooltip: lang.action_download,
                icon: const Icon(Icons.download_outlined),
                onPressed: onDownloadClicked,
              ),
            if (onDeleteClicked != null)
              IconButton(
                tooltip: lang.action_delete,
                icon: const Icon(Icons.delete_outlined),
                onPressed: onDeleteClicked,
              ),
          ],
        ),
      ),
    );
  }
}

class LibraryBottomActionMenu extends StatelessWidget {
  const LibraryBottomActionMenu({
    super.key,
    required this.visible,
    this.onChangeCategoryClicked,
    this.onMarkAsReadClicked,
    this.onMarkAsUnreadClicked,
    this.onDownloadClicked,
    this.onDeleteClicked,
  });

  final bool visible;
  final VoidCallback? onChangeCategoryClicked;
  final VoidCallback? onMarkAsReadClicked;
  final VoidCallback? onMarkAsUnreadClicked;
  final ValueChanged<DownloadAction>? onDownloadClicked;
  final VoidCallback? onDeleteClicked;

  @override
  Widget build(BuildContext context) {
    final lang = AppLocalizations.of(context);
    return Card(
      color: Theme.of(context).navigationBarTheme.backgroundColor,
      elevation: 3.0,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24.0),
          topRight: Radius.circular(24.0),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 8.0,
          vertical: 12.0,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            if (onChangeCategoryClicked != null)
              IconButton(
                tooltip: lang.action_move_category,
                icon: const Icon(Icons.label_outlined),
                onPressed: onChangeCategoryClicked,
              ),
            if (onMarkAsReadClicked != null)
              IconButton(
                tooltip: lang.action_mark_as_read,
                icon: const Icon(Icons.done_all_outlined),
                onPressed: onMarkAsReadClicked,
              ),
            if (onMarkAsUnreadClicked != null)
              IconButton(
                tooltip: lang.action_mark_as_unread,
                icon: const Icon(Icons.remove_done_outlined),
                onPressed: onMarkAsUnreadClicked,
              ),
            if (onDownloadClicked != null)
              DownloadDropdownMenu(
                onDownloadClicked: onDownloadClicked!,
              ),
            if (onDeleteClicked != null)
              IconButton(
                tooltip: lang.action_delete,
                icon: const Icon(Icons.delete_outlined),
                onPressed: onDeleteClicked,
              ),
          ],
        ),
      ),
    );
  }
}
