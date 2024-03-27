import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:flutteryomi/domain/source/service/source_preferences.dart';

part 'set_migrate_sorting.g.dart';

class SetMigrateSorting {
  final SourcePreferences preferences;
  SetMigrateSorting(this.preferences);

  void await_(
    SetMigrateSortingMode mode,
    SetMigrateSortingDirection direction,
  ) {
    preferences.migrationSortingMode().set(mode);
    preferences.migrationSortingDirection().set(direction);
  }
}

enum SetMigrateSortingMode { alphabetical, total }
enum SetMigrateSortingDirection { ascending, descending }

@riverpod
SetMigrateSorting setMigrateSorting(SetMigrateSortingRef ref) =>
    SetMigrateSorting(ref.watch(sourcePreferencesProvider));
