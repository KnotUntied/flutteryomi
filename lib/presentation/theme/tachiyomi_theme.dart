import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutteryomi/domain/ui/model/app_theme.dart';
import 'package:flutteryomi/domain/ui/ui_preferences.dart';
import 'package:flutteryomi/presentation/more/settings/widget/base_preference_widget.dart';
import 'package:flutteryomi/presentation/theme/colorscheme/green_apple_color_scheme.dart';
import 'package:flutteryomi/presentation/theme/colorscheme/lavender_color_scheme.dart';
import 'package:flutteryomi/presentation/theme/colorscheme/midnight_dusk_color_scheme.dart';
import 'package:flutteryomi/presentation/theme/colorscheme/nord_color_scheme.dart';
import 'package:flutteryomi/presentation/theme/colorscheme/strawberry_color_scheme.dart';
import 'package:flutteryomi/presentation/theme/colorscheme/tachiyomi_color_scheme.dart';
import 'package:flutteryomi/presentation/theme/colorscheme/tako_color_scheme.dart';
import 'package:flutteryomi/presentation/theme/colorscheme/teal_turquoise_color_scheme.dart';
import 'package:flutteryomi/presentation/theme/colorscheme/tidal_wave_color_scheme.dart';
import 'package:flutteryomi/presentation/theme/colorscheme/yin_yang_color_scheme.dart';
import 'package:flutteryomi/presentation/theme/colorscheme/yotsuba_color_scheme.dart';

class TachiyomiTheme extends ConsumerWidget {
  const TachiyomiTheme({
    super.key,
    this.appTheme,
    this.amoled,
    required this.child,
  });

  final AppTheme? appTheme;
  final bool? amoled;
  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final uiPreferences = ref.watch(uiPreferencesProvider);
    return BasePreferenceWidget(
      subcomponent: _BaseTachiyomiTheme(
        appTheme: appTheme ?? uiPreferences.appTheme().get(),
        isAmoled: amoled ?? uiPreferences.themeDarkAmoled().get(),
        child: child,
      ),
    );
  }
}

class TachiyomiPreviewTheme extends StatelessWidget {
  const TachiyomiPreviewTheme({
    super.key,
    this.appTheme = AppTheme.default_,
    this.isAmoled = false,
    required this.child,
  });

  final AppTheme appTheme;
  final bool isAmoled;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return _BaseTachiyomiTheme(
      appTheme: appTheme,
      isAmoled: isAmoled,
      child: child,
    );
  }
}

class _BaseTachiyomiTheme extends StatelessWidget {
  const _BaseTachiyomiTheme({
    super.key,
    this.appTheme = AppTheme.default_,
    this.isAmoled = false,
    required this.child,
  });

  final AppTheme appTheme;
  final bool isAmoled;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        colorScheme: _getThemeColorScheme(context, appTheme, isAmoled),
      ),
      child: child,
    );
  }
}

ColorScheme _getThemeColorScheme(
    BuildContext context, AppTheme appTheme, bool isAmoled) {
  final colorScheme = switch (appTheme) {
    AppTheme.default_ => TachiyomiColorScheme(),
    //AppTheme.monet => MonetColorScheme(context),
    AppTheme.greenApple => GreenAppleColorScheme(),
    AppTheme.lavender => LavenderColorScheme(),
    AppTheme.midnightDusk => MidnightDuskColorScheme(),
    AppTheme.nord => NordColorScheme(),
    AppTheme.strawberryDaiquiri => StrawberryColorScheme(),
    AppTheme.tako => TakoColorScheme(),
    AppTheme.tealturquoise => TealTurquoiseColorScheme(),
    AppTheme.tidalWave => TidalWaveColorScheme(),
    AppTheme.yinyang => YinYangColorScheme(),
    AppTheme.yotsuba => YotsubaColorScheme(),
    _ => TachiyomiColorScheme(),
  };
  return colorScheme.getColorScheme(
    MediaQuery.platformBrightnessOf(context) == Brightness.dark,
    isAmoled,
  );
}
