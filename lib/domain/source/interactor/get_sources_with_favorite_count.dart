import 'dart:async';

import 'package:dartx/dartx_io.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:rxdart/rxdart.dart';

import 'package:flutteryomi/domain/source/interactor/set_migrate_sorting.dart';
import 'package:flutteryomi/domain/source/model/domain_source.dart';
import 'package:flutteryomi/domain/source/repository/source_repository.dart';
import 'package:flutteryomi/domain/source/service/source_preferences.dart';
import 'package:flutteryomi/source/local/local_source.dart';

part 'get_sources_with_favorite_count.g.dart';

class GetSourcesWithFavoriteCount {
  final SourceRepository repository;
  final SourcePreferences preferences;
  GetSourcesWithFavoriteCount({
    required this.repository,
    required this.preferences,
  });

  Stream<List<(Source, int)>> subscribe() => Rx.combineLatest3(
        preferences.migrationSortingDirection().changes(),
        preferences.migrationSortingMode().changes(),
        repository.getSourcesWithFavoriteCount(),
        (direction, mode, list) => list
            .whereNot((it) => it.$1.isLocal())
            .sortedWith(_sortFn(direction, mode))
            .toList(),
      );

  Comparator<(Source, int)> _sortFn(
    SetMigrateSortingDirection direction,
    SetMigrateSortingMode sorting,
  ) {
    int sortFn((Source, int) a, (Source, int) b) {
      switch (sorting) {
        case SetMigrateSortingMode.alphabetical:
          if (a.$1.isStub && !b.$1.isStub) {
            return -1;
          } else if (b.$1.isStub && !a.$1.isStub) {
            return 1;
          } else {
            return a.$1.name.toLowerCase().compareTo(b.$1.name.toLowerCase());
          }
        case SetMigrateSortingMode.total:
          if (a.$1.isStub && !b.$1.isStub) {
            return -1;
          } else if (b.$1.isStub && !a.$1.isStub) {
            return 1;
          } else {
            return a.$2.compareTo(b.$2);
          }
      }
    }

    return switch (direction) {
      SetMigrateSortingDirection.ascending => sortFn,
      SetMigrateSortingDirection.descending => sortFn.reverse(),
    };
  }
}

@riverpod
GetSourcesWithFavoriteCount getSourcesWithFavoriteCount(GetSourcesWithFavoriteCountRef ref) =>
    GetSourcesWithFavoriteCount(
      repository: ref.watch(sourceRepositoryProvider),
      preferences: ref.watch(sourcePreferencesProvider),
    );
