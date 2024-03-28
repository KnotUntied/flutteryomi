import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:flutteryomi/domain/source/model/domain_source.dart';
import 'package:flutteryomi/domain/source/service/source_preferences.dart';

part 'toggle_source.g.dart';

class ToggleSource {
  final SourcePreferences preferences;
  ToggleSource(this.preferences);

  Future<void> await_(Source source, {bool? enable}) async {
    enable ??= _isEnabled(source.id);
    awaitById(source.id, enable: enable);
  }

  Future<void> awaitById(int sourceId, {bool? enable}) async {
    enable ??= _isEnabled(sourceId);
    preferences.disabledSources().getAndSet(
          (disabled) => enable!
              ? disabled.difference({"$sourceId"})
              : disabled.union({"$sourceId"}),
        );
  }

  Future<void> awaitByIds(List<int> sourceIds, {required bool enable}) async {
    final transformedSourceIds = sourceIds.map((it) => it.toString()).toSet();
    preferences.disabledSources().getAndSet(
          (disabled) => enable
              ? disabled.difference(transformedSourceIds)
              : disabled.union(transformedSourceIds),
        );
  }

  bool _isEnabled(int sourceId) =>
      preferences.disabledSources().get().contains(sourceId.toString());
}

@riverpod
ToggleSource toggleSource(ToggleSourceRef ref) =>
    ToggleSource(ref.watch(sourcePreferencesProvider));
