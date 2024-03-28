import 'dart:collection';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:flutteryomi/domain/source/interactor/get_languages_with_sources.dart';
import 'package:flutteryomi/domain/source/interactor/toggle_language.dart';
import 'package:flutteryomi/domain/source/interactor/toggle_source.dart';
import 'package:flutteryomi/domain/source/model/domain_source.dart';
import 'package:flutteryomi/domain/source/service/source_preferences.dart';
import 'package:rxdart/rxdart.dart';

part 'sources_filter_screen_model.freezed.dart';
part 'sources_filter_screen_model.g.dart';

@riverpod
class SourcesFilterScreenModel extends _$SourcesFilterScreenModel {
  @override
  Stream<SourcesFilterScreenState> build() {
    final getLanguagesWithSources = ref.watch(getLanguagesWithSourcesProvider);
    final preferences = ref.watch(sourcePreferencesProvider);
    return Rx.combineLatest3(
      getLanguagesWithSources.subscribe(),
      preferences.enabledLanguages().changes(),
      preferences.disabledSources().changes(),
      (languagesWithSources, enabledLanguages, disabledSources) {
        return SourcesFilterScreenState(
          items: languagesWithSources,
          enabledLanguages: enabledLanguages,
          disabledSources: disabledSources,
        );
      },
    );
  }

  Future<void> toggleSource(Source source) async {
    final toggleSourceInteractor = ref.watch(toggleSourceProvider);
    await toggleSourceInteractor.await_(source);
  }

  Future<void> toggleLanguage(String language) async {
    final toggleLanguage = ref.watch(toggleLanguageProvider);
    await toggleLanguage.await_(language);
  }
}

@freezed
class SourcesFilterScreenState with _$SourcesFilterScreenState {
  const SourcesFilterScreenState._();
  const factory SourcesFilterScreenState({
    required SplayTreeMap<String, List<Source>> items,
    required Set<String> enabledLanguages,
    required Set<String> disabledSources,
  }) = _SourcesFilterScreenState;

  bool get isEmpty => items.isEmpty;
}
