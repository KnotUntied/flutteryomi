import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';
import 'package:intl/locale.dart' as intl;
import 'package:locale_names/locale_names.dart';
import 'package:riverpod/riverpod.dart';

import 'package:flutteryomi/l10n/l10n.dart';
//bruh
import 'package:flutteryomi/presentation/browse/source/sources_screen_model.dart';

/// Utility class to change the application's language in runtime.
abstract class LocaleHelper {
  /// Sorts by display name, except keeps the "all" (displayed as "Multi") locale at the top.
  static int comparator(String a, String b) {
    if (a == "all") {
      return -1;
    } else if (b == "all") {
      return 1;
    } else {
      return getLocalizedDisplayName(a).compareTo(getLocalizedDisplayName(b));
    }
  }

  /// Returns display name of a string language code.
  static String getSourceDisplayName(String? lang, Ref ref) {
    final t = ref.read(appLocalizationsProvider);
    return switch (lang) {
      SourcesScreenModel.lastUsedKey => t.last_used_source,
      SourcesScreenModel.pinnedKey => t.pinned_sources,
      "other" => t.other_source,
      "all" => t.multi_lang,
      _ => getLocalizedDisplayName(lang),
    };
  }

  /// Returns display name of a string language code.
  static String getSourceDisplayNameUsingContext(String? lang, BuildContext context) {
    final t = AppLocalizations.of(context);
    return switch (lang) {
      SourcesScreenModel.lastUsedKey => t.last_used_source,
      SourcesScreenModel.pinnedKey => t.pinned_sources,
      "other" => t.other_source,
      "all" => t.multi_lang,
      _ => getLocalizedDisplayName(lang),
    };
  }

  static String getDisplayName(String lang) {
    final normalizedLang = switch (lang) {
      "zh-CN" => "zh-Hans",
      "zh-TW" => "zh-Hant",
      _ => lang,
    };

    final intlLocale = intl.Locale.parse(normalizedLang);
    return Locale.fromSubtags(
      languageCode: intlLocale.languageCode,
      scriptCode: intlLocale.scriptCode,
      countryCode: intlLocale.countryCode,
    ).defaultDisplayLanguage;
  }

  /// Returns display name of a string language code. Set [lang] to null for the system language.
  static String getLocalizedDisplayName(String? lang) {
    if (lang == null) return "";

    final Locale locale;
    if (lang == "") {
      locale = AppLocalizations.supportedLocales[0];
    } else if (lang == "zh-CN") {
      locale = const Locale.fromSubtags(
        languageCode: 'zh',
        scriptCode: 'Hans',
      );
    } else if (lang == "zh-TW") {
      locale = const Locale.fromSubtags(
        languageCode: 'zh',
        scriptCode: 'Hant',
      );
    } else {
      final intlLocale = intl.Locale.parse(lang);
      locale = Locale.fromSubtags(
        languageCode: intlLocale.languageCode,
        scriptCode: intlLocale.scriptCode,
        countryCode: intlLocale.countryCode,
      );
    }
    return locale.displayLanguageIn(locale);
  }

  /// Return the default languages enabled for the sources.
  static Set<String> getDefaultEnabledLanguages() => {
    "all",
    "en",
    Intl.getCurrentLocale(),
  };
}
