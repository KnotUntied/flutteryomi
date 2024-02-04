import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:flutteryomi/domain/ui/model/app_theme.dart';
import 'package:flutteryomi/presentation/components/material/constants.dart';
import 'package:flutteryomi/presentation/more/settings/widget/base_preference_widget.dart';

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
      (AppTheme.default_, title: lang.label_default),
      (AppTheme.monet, title: lang.theme_monet),
      (AppTheme.greenApple, title: lang.theme_greenapple),
      (AppTheme.lavender, title: lang.theme_lavender),
      (AppTheme.midnightDusk, title: lang.theme_midnightdusk),
      (AppTheme.strawberryDaiquiri, title: lang.theme_strawberrydaiquiri),
      (AppTheme.tako, title: lang.theme_tako),
      (AppTheme.tealturquoise, title: lang.theme_tealturquoise),
      (AppTheme.tidalWave, title: lang.theme_tidalwave),
      (AppTheme.yinyang, title: lang.theme_yinyang),
      (AppTheme.yotsuba, title: lang.theme_yotsuba),
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
                //TODO
                TachiyomiTheme(
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
    return InkWell(
      onTap: onClick,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(13.0),
        ),
        child: AspectRatio(
          aspectRatio: 9.0 / 16.0,
          child: Column(
            children: [
              Row(),
              Stack(),
              Stack(),
            ],
          ),
        ),
      ),
    );
  }
}
