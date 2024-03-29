import 'package:collection/collection.dart';
import 'package:riverpod/riverpod.dart';

import 'package:flutteryomi/domain/source/model/stub_source.dart';
import 'package:flutteryomi/domain/source/service/source_preferences.dart';
import 'package:flutteryomi/source/api/source.dart';
import 'package:flutteryomi/source/local/local_source.dart';

extension SourceExtensions on Source {
  String getNameForMangaInfo(Ref ref) {
    final preferences = ref.read(sourcePreferencesProvider);
    final enabledLanguages = preferences
        .enabledLanguages()
        .get()
        .whereNot((it) => const ["all", "other"].contains(it));
    final hasOneActiveLanguages = enabledLanguages.length == 1;
    final isInEnabledLanguages = enabledLanguages.contains(lang);
    if (hasOneActiveLanguages && !isInEnabledLanguages) {
      // For edge cases where user disables a source they got manga of in their library.
      return toString();
    } else if (hasOneActiveLanguages && isInEnabledLanguages) {
      // Hide the language tag when only one language is used.
      return name;
    } else {
      return toString();
    }
  }

  bool isLocalOrStub() => isLocal() || this is StubSource;
}
