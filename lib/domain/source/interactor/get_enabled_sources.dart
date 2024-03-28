import 'dart:async';

import 'package:dartx/dartx_io.dart';
import 'package:quiver/strings.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:rxdart/rxdart.dart';

import 'package:flutteryomi/domain/source/model/domain_source.dart';
import 'package:flutteryomi/domain/source/model/pin.dart';
import 'package:flutteryomi/domain/source/repository/source_repository.dart';
import 'package:flutteryomi/domain/source/service/source_preferences.dart';
import 'package:flutteryomi/source/local/local_source.dart';

part 'get_enabled_sources.g.dart';

class GetEnabledSources {
  final SourceRepository repository;
  final SourcePreferences preferences;
  GetEnabledSources({
    required this.repository,
    required this.preferences,
  });

  Stream<List<Source>> subscribe() => Rx.combineLatest5(
        preferences.pinnedSources().changes(),
        preferences.enabledLanguages().changes(),
        preferences.disabledSources().changes(),
        preferences.lastUsedSource().changes(),
        repository.getSources(),
        (
          pinnedSourceIds,
          enabledLanguages,
          disabledSources,
          lastUsedSource,
          sources,
        ) =>
            sources
                .where(
                    (it) => enabledLanguages.contains(it.lang) || it.isLocal())
                .whereNot((it) => disabledSources.contains(it.id.toString()))
                .sortedWith((a, b) => compareIgnoreCase(a.name, b.name))
                .flatMap((it) {
          final flag = pinnedSourceIds.contains("${it.id}")
              ? Pins.pinned
              : Pins.unpinned;
          final source = it.copyWith(pin: flag);
          final toFlatten = [source];
          if (source.id == lastUsedSource) {
            toFlatten.add(
              source.copyWith(
                isUsedLast: true,
                pin: source.pin - Pin.actual,
              ),
            );
          }
          return toFlatten;
        }).toList(),
      ).distinct();
}

@riverpod
GetEnabledSources getEnabledSources(GetEnabledSourcesRef ref) =>
    GetEnabledSources(
      repository: ref.watch(sourceRepositoryProvider),
      preferences: ref.watch(sourcePreferencesProvider),
    );
