import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:flutteryomi/domain/source/service/source_preferences.dart';

part 'toggle_language.g.dart';

class ToggleLanguage {
  final SourcePreferences preferences;
  ToggleLanguage(this.preferences);

  Future<void> await_(String language) async {
    final isEnabled = preferences.enabledLanguages().get().contains(language);
    preferences.enabledLanguages().getAndSet((enabled) => isEnabled
        ? enabled.difference({language})
        : enabled.union({language}));
  }
}

@riverpod
ToggleLanguage toggleLanguage(ToggleLanguageRef ref) =>
    ToggleLanguage(ref.watch(sourcePreferencesProvider));
