import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:flutteryomi/domain/ui/model/app_theme.dart';
import 'package:flutteryomi/presentation/components/material/constants.dart';
import 'package:flutteryomi/presentation/manga/components/manga_cover.dart';
import 'package:flutteryomi/presentation/more/settings/widget/base_preference_widget.dart';
import 'package:flutteryomi/presentation/theme/tachiyomi_theme.dart';

class AppThemePreferenceWidget extends StatelessWidget {
  const AppThemePreferenceWidget({
    super.key,
    required this.value,
    required this.amoled,
    required this.onItemClick,
  });

  final AppTheme value;
  final bool amoled;
  final ValueChanged<AppTheme> onItemClick;

  @override
  Widget build(BuildContext context) {
    return BasePreferenceWidget(
      subcomponent: _AppThemesList(
        currentTheme: value,
        amoled: amoled,
        onItemClick: onItemClick,
      ),
    );
  }
}

class _AppThemesList extends StatelessWidget {
  const _AppThemesList({
    super.key,
    required this.currentTheme,
    required this.amoled,
    required this.onItemClick,
  });

  final AppTheme currentTheme;
  final bool amoled;
  final ValueChanged<AppTheme> onItemClick;

  @override
  Widget build(BuildContext context) {
    final lang = AppLocalizations.of(context);
    final appThemes = [
      (theme: AppTheme.default_, title: lang.label_default),
      (theme: AppTheme.monet, title: lang.theme_monet),
      (theme: AppTheme.greenApple, title: lang.theme_greenapple),
      (theme: AppTheme.lavender, title: lang.theme_lavender),
      (theme: AppTheme.midnightDusk, title: lang.theme_midnightdusk),
      (
        theme: AppTheme.strawberryDaiquiri,
        title: lang.theme_strawberrydaiquiri
      ),
      (theme: AppTheme.tako, title: lang.theme_tako),
      (theme: AppTheme.tealturquoise, title: lang.theme_tealturquoise),
      (theme: AppTheme.tidalWave, title: lang.theme_tidalwave),
      (theme: AppTheme.yinyang, title: lang.theme_yinyang),
      (theme: AppTheme.yotsuba, title: lang.theme_yotsuba),
    ];
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: prefsHorizontalPadding),
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) {
          return const SizedBox(width: MaterialPadding.small);
        },
        itemCount: appThemes.length,
        itemBuilder: (context, index) {
          final appTheme = appThemes[index];
          return Container(
            width: 114.0,
            padding: const EdgeInsets.only(top: 8.0),
            child: Column(
              children: [
                TachiyomiTheme(
                  appTheme: appTheme.theme,
                  amoled: amoled,
                  child: AppThemePreviewItem(
                    selected: currentTheme == appTheme.theme,
                    onClick: () {
                      onItemClick(appTheme.theme);
                      // TODO: Rebuild and change app's color scheme
                    },
                  ),
                ),
                const SizedBox(height: 8.0),
                Opacity(
                  opacity: secondaryItemAlpha,
                  child: Text(
                    appTheme.title,
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    //minLines: 2,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class AppThemePreviewItem extends StatelessWidget {
  const AppThemePreviewItem({
    super.key,
    required this.selected,
    required this.onClick,
  });

  final bool selected;
  final VoidCallback onClick;

  @override
  Widget build(BuildContext context) {
    final lang = AppLocalizations.of(context);
    return InkWell(
      onTap: onClick,
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          border: Border.all(
            width: 4.0,
            color: selected
                ? Theme.of(context).colorScheme.primary
                : Theme.of(context).dividerColor,
          ),
          borderRadius: BorderRadius.circular(17.0),
        ),
        child: AspectRatio(
          aspectRatio: 9.0 / 16.0,
          child: Column(
            children: [
              // App bar
              Container(
                height: 40,
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                      flex: 7,
                      child: Container(
                        padding: const EdgeInsetsDirectional.only(end: 4.0),
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.onSurface,
                          borderRadius: BorderRadius.circular(
                            MaterialPadding.small,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: selected
                          ? Center(
                              child: Icon(
                                Icons.check_circle,
                                semanticLabel: lang.selected,
                                color: Theme.of(context).colorScheme.primary,
                              ),
                            )
                          : const SizedBox.shrink(),
                    ),
                  ],
                ),
              ),
              // Cover
              AspectRatio(
                aspectRatio: MangaCover.bookRatio,
                child: Container(
                  padding:
                      const EdgeInsetsDirectional.only(start: 8.0, top: 2.0),
                  decoration: BoxDecoration(
                    color: Theme.of(context).dividerColor,
                    borderRadius: BorderRadius.circular(
                      MaterialPadding.small,
                    ),
                  ),
                  child: Container(
                    width: 24.0,
                    height: 16.0,
                    padding: const EdgeInsets.all(4.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 12.0,
                          color: Theme.of(context).colorScheme.tertiary,
                        ),
                        Container(
                          width: 12.0,
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              // Bottom bar
              Align(
                alignment: Alignment.bottomCenter,
                child: Card(
                  color: Theme.of(context).colorScheme.surfaceContainerHighest,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    height: 32.0,
                    child: Row(
                      children: [
                        Expanded(
                          child: Opacity(
                            opacity: 0.6,
                            child: Container(
                              height: 17.0,
                              padding: const EdgeInsetsDirectional.only(
                                start: 8.0,
                              ),
                              decoration: BoxDecoration(
                                color: Theme.of(context).colorScheme.onSurface,
                                borderRadius: BorderRadius.circular(
                                  MaterialPadding.small,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
