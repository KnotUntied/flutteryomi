import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

//TODO
class ChapterNavigator extends StatelessWidget {
  const ChapterNavigator({
    super.key,
    required this.isRtl,
    required this.onNextChapter,
    required this.enabledNext,
    required this.onPreviousChapter,
    required this.enabledPrevious,
    required this.currentPage,
    required this.totalPages,
    required this.onSliderValueChange,
  });

  final bool isRtl;
  final VoidCallback onNextChapter;
  final bool enabledNext;
  final VoidCallback onPreviousChapter;
  final bool enabledPrevious;
  final int currentPage;
  final int totalPages;
  final ValueChanged<int> onSliderValueChange;

  @override
  Widget build(BuildContext context) {
    final lang = AppLocalizations.of(context);
    //final isTabletUi = isTabletUi();
    const isTabletUi = false;
    final horizontalPadding = isTabletUi ? 24.0 : 16.0;
    final layoutDirection = isRtl ? TextDirection.rtl : TextDirection.ltr;
    // Match with toolbar background color set in ReaderScreen
    final backgroundColor =
        Theme.of(context).colorScheme.surfaceTint.withOpacity(
              MediaQuery.platformBrightnessOf(context) == Brightness.dark
                  ? 0.9
                  : 0.95,
            );
    final buttonColor = IconButton.styleFrom(
      backgroundColor: backgroundColor,
      disabledBackgroundColor: backgroundColor,
    );

    return Directionality(
      textDirection: TextDirection.ltr,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
        child: Row(
          children: [
            IconButton.filled(
              icon: const Icon(Icons.skip_previous_outlined),
              onPressed: isRtl
                  ? enabledNext
                      ? onNextChapter
                      : null
                  : enabledPrevious
                      ? onPreviousChapter
                      : null,
              style: buttonColor,
              tooltip: isRtl
                  ? lang.action_next_chapter
                  : lang.action_previous_chapter,
            ),
            if (totalPages > 1)
              Directionality(
                textDirection: layoutDirection,
                child: Container(
                  color: backgroundColor,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(24)),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    children: [
                      Text(currentPage.toString()),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          //TODO: Haptic feedback
                          child: Slider.adaptive(
                            value: currentPage.toDouble(),
                            min: 1,
                            max: totalPages.toDouble(),
                            divisions: totalPages - 2,
                            onChanged: (value) =>
                                onSliderValueChange(value.round() - 1),
                          ),
                        ),
                      ),
                      Text(totalPages.toString()),
                    ],
                  ),
                ),
              )
            else
              const Spacer(),
            IconButton.filled(
              icon: const Icon(Icons.skip_next_outlined),
              onPressed: isRtl
                  ? enabledPrevious
                      ? onPreviousChapter
                      : null
                  : enabledNext
                      ? onNextChapter
                      : null,
              style: buttonColor,
              tooltip: isRtl
                  ? lang.action_previous_chapter
                  : lang.action_next_chapter,
            ),
          ],
        ),
      ),
    );
  }
}
