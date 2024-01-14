import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:flutteryomi/presentation/manga/components/manga_screen_constants.dart';

class _DownloadDropdownMenuItem {
  const _DownloadDropdownMenuItem({
    required this.value,
    required this.label,
  });

  final DownloadAction value;
  final String label;
}

class DownloadDropdownMenu extends StatelessWidget {
  const DownloadDropdownMenu({
    super.key,
    required this.onDownloadClicked,
  });

  final ValueChanged<DownloadAction> onDownloadClicked;

  @override
  Widget build(BuildContext context) {
    final lang = AppLocalizations.of(context);
    final dropdownItems = <_DownloadDropdownMenuItem>[
      _DownloadDropdownMenuItem(
        value: DownloadAction.next1Chapter,
        label: lang.download_amount(1),
      ),
      _DownloadDropdownMenuItem(
        value: DownloadAction.next5Chapters,
        label: lang.download_amount(5),
      ),
      _DownloadDropdownMenuItem(
        value: DownloadAction.next10Chapters,
        label: lang.download_amount(10),
      ),
      _DownloadDropdownMenuItem(
        value: DownloadAction.next25Chapters,
        label: lang.download_amount(25),
      ),
      _DownloadDropdownMenuItem(
        value: DownloadAction.unreadChapters,
        label: lang.download_unread,
      ),
    ];
    return MenuAnchor(
      builder: (context, controller, child) {
        return IconButton(
          onPressed: () => controller.isOpen //
              ? controller.close()
              : controller.open(),
          icon: Icon(
            Icons.download_outlined,
            semanticLabel: lang.action_download,
          ),
          tooltip: lang.action_download,
        );
      },
      menuChildren: dropdownItems
          .map((item) => MenuItemButton(
                onPressed: () => onDownloadClicked(item.value),
                child: Text(item.label),
              ))
          .toList(),
    );
  }
}
