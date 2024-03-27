import 'package:riverpod/riverpod.dart';

import 'package:flutteryomi/l10n/l10n.dart';

//TODO
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
      //SourcesScreenModel.lastUsedKey => t.last_used_source,
      //SourcesScreenModel.pinnedKey => t.pinned_sources,
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

    return normalizedLang;
    //return Locale.forLanguageTag(normalizedLang).displayName;
  }

  /// Returns display name of a string language code. Set [lang] to null for the system language.
  static String getLocalizedDisplayName(String? lang) {
    if (lang == null) return "";

    //final locale = switch (lang) {
    //  "" => LocaleListCompat.getAdjustedDefault()[0],
    //  "zh-CN" => Locale.forLanguageTag("zh-Hans"),
    //  "zh-TW" => Locale.forLanguageTag("zh-Hant"),
    //  _ => Locale.forLanguageTag(lang),
    //};
    //return locale!.getDisplayName(locale).replaceFirstChar((it) => it.toUpperCase(locale));
    return '';
  }

  /// Return the default languages enabled for the sources.
  static Set<String> getDefaultEnabledLanguages() => {
    "all",
    "en",
    //Locale.getDefault().language,
    'fr',
  };
}
