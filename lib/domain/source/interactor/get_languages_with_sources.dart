import 'dart:async';
import 'dart:collection';

import 'package:dartx/dartx_io.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:rxdart/rxdart.dart';

import 'package:flutteryomi/core/util/system/locale_helper.dart';
import 'package:flutteryomi/domain/source/model/domain_source.dart';
import 'package:flutteryomi/domain/source/repository/source_repository.dart';
import 'package:flutteryomi/domain/source/service/source_preferences.dart';

part 'get_languages_with_sources.g.dart';

class GetLanguagesWithSources {
  final SourceRepository repository;
  final SourcePreferences preferences;
  GetLanguagesWithSources({
    required this.repository,
    required this.preferences,
  });

  Stream<SplayTreeMap<String, List<Source>>> subscribe() => Rx.combineLatest3(
        preferences.enabledLanguages().changes(),
        preferences.disabledSources().changes(),
        repository.getOnlineSources(),
        (enabledLanguage, disabledSource, onlineSources) {
          final sortedSources = onlineSources
              .sortedBy((it) => disabledSource.contains(it.id.toString()) ? 1 : -1)
              .thenBy((it) => it.name.toLowerCase());
          return SplayTreeMap.from(
            sortedSources.groupBy((it) => it.lang),
            (a, b) {
              final compare = Comparable.compare(
                !enabledLanguage.contains(a) ? 1 : -1,
                !enabledLanguage.contains(b) ? 1 : -1,
              );
              return compare == 0 ? LocaleHelper.comparator(a, b) : compare;
            },
          );
        },
      );
}

@riverpod
GetLanguagesWithSources getLanguagesWithSources(GetLanguagesWithSourcesRef ref) =>
    GetLanguagesWithSources(
      repository: ref.watch(sourceRepositoryProvider),
      preferences: ref.watch(sourcePreferencesProvider),
    );
