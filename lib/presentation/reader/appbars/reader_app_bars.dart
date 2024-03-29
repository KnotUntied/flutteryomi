import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:flutteryomi/domain/reader/setting/reader_orientation.dart';
import 'package:flutteryomi/domain/reader/setting/reading_mode.dart';
import 'package:flutteryomi/presentation/components/app_bar.dart';
import 'package:flutteryomi/presentation/components/material/constants.dart';
import 'package:flutteryomi/presentation/reader/appbars/bottom_reader_bar.dart';
import 'package:flutteryomi/presentation/reader/components/chapter_navigator.dart';
import 'package:flutteryomi/presentation/reader/viewer/viewer.dart';

//TODO
class ReaderAppBars extends StatelessWidget {
  const ReaderAppBars({
    super.key,
    required this.visible,
    required this.fullscreen,
    this.mangaTitle,
    this.chapterTitle,
    required this.navigateUp,
    required this.onClickTopAppBar,
    required this.bookmarked,
    required this.onToggleBookmarked,
    this.onOpenInWebView,
    this.onShare,
    this.viewer,
    required this.onNextChapter,
    required this.enabledNext,
    required this.onPreviousChapter,
    required this.enabledPrevious,
    required this.currentPage,
    required this.totalPages,
    required this.onSliderValueChange,
    required this.readingMode,
    required this.onClickReadingMode,
    required this.orientation,
    required this.onClickOrientation,
    required this.cropEnabled,
    required this.onClickCropBorder,
    required this.onClickSettings,
  });

  final bool visible;
  final bool fullscreen;

  final String? mangaTitle;
  final String? chapterTitle;
  final VoidCallback navigateUp;
  final VoidCallback onClickTopAppBar;
  final bool bookmarked;
  final VoidCallback onToggleBookmarked;
  final VoidCallback? onOpenInWebView;
  final VoidCallback? onShare;

  final Viewer? viewer;
  final VoidCallback onNextChapter;
  final bool enabledNext;
  final VoidCallback onPreviousChapter;
  final bool enabledPrevious;
  final int currentPage;
  final int totalPages;
  final ValueChanged<int> onSliderValueChange;

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
    //final isRtl = viewer is R2LPagerViewer;
    const isRtl = false;
    final backgroundColor =
        Theme.of(context).colorScheme.surfaceTint.withOpacity(
              MediaQuery.platformBrightnessOf(context) == Brightness.dark
                  ? 0.9
                  : 0.95,
            );

    //final modifierWithInsetsPadding = fullscreen
    //    ? Modifier.systemBarsPadding()
    //    : Modifier;

    return Column(
      children: [
        InkWell(
          onTap: onClickTopAppBar,
          child: AppBar(
            title: AppBarTitle(
              mangaTitle ?? '',
              chapterTitle ?? '',
            ),
            actions: [
              AppBarAction(
                title: bookmarked
                    ? lang.action_remove_bookmark
                    : lang.action_bookmark,
                iconData: bookmarked
                    ? Icons.bookmark_outlined
                    : Icons.bookmark_border_outlined,
                onClick: onToggleBookmarked,
              ),
              if (onOpenInWebView != null || onShare != null)
                AppBarOverflowActions([
                  if (onOpenInWebView != null)
                    AppBarOverflowAction(
                      title: lang.action_open_in_web_view,
                      onClick: onOpenInWebView!,
                    ),
                  if (onShare != null)
                    AppBarOverflowAction(
                      title: lang.action_share,
                      onClick: onShare!,
                    ),
                ]),
            ],
          ),
        ),
        const Spacer(),
        Column(
          children: [
            ChapterNavigator(
              isRtl: isRtl,
              onNextChapter: onNextChapter,
              enabledNext: enabledNext,
              onPreviousChapter: onPreviousChapter,
              enabledPrevious: enabledPrevious,
              currentPage: currentPage,
              totalPages: totalPages,
              onSliderValueChange: onSliderValueChange,
            ),
            const SizedBox(height: MaterialPadding.small),
            BottomReaderBar(
              backgroundColor: backgroundColor,
              readingMode: readingMode,
              onClickReadingMode: onClickReadingMode,
              orientation: orientation,
              onClickOrientation: onClickOrientation,
              cropEnabled: cropEnabled,
              onClickCropBorder: onClickCropBorder,
              onClickSettings: onClickSettings,
            )
          ],
        ),
      ],
    );
  }
}
