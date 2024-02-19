import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:flutteryomi/domain/reader/setting/reader_orientation.dart';
import 'package:flutteryomi/domain/reader/setting/reading_mode.dart';
import 'package:flutteryomi/presentation/icons/custom_icons.dart';

class BottomReaderBar extends StatelessWidget {
  const BottomReaderBar({
    super.key,
    required this.backgroundColor,
    required this.readingMode,
    required this.onClickReadingMode,
    required this.orientation,
    required this.onClickOrientation,
    required this.cropEnabled,
    required this.onClickCropBorder,
    required this.onClickSettings,
  });

  final Color backgroundColor;
  final ReadingMode readingMode;
  final VoidCallback onClickReadingMode;
  final ReaderOrientation orientation;
  final VoidCallback onClickOrientation;
  final bool cropEnabled;
  final VoidCallback onClickCropBorder;
  final VoidCallback onClickSettings;

  @override
  Widget build(BuildContext context) {
    final lang = AppLocalizations.of(context);
    return Container(
      color: backgroundColor,
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
            onPressed: onClickReadingMode,
            icon: Icon(
              readingMode.icon,
              semanticLabel: lang.viewer,
            ),
          ),
          IconButton(
            onPressed: onClickOrientation,
            icon: Icon(
              orientation.icon,
              semanticLabel: lang.rotation_type,
            ),
          ),
          IconButton(
            onPressed: onClickCropBorder,
            icon: Icon(
              cropEnabled ? Icons.crop : CustomIcons.cropOff,
              semanticLabel: lang.pref_crop_borders,
            ),
          ),
          IconButton(
            onPressed: onClickSettings,
            icon: Icon(
              Icons.settings_outlined,
              semanticLabel: lang.action_settings,
            ),
          ),
        ],
      ),
    );
  }
}
