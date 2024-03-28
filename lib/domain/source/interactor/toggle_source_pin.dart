import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:flutteryomi/domain/source/model/domain_source.dart';
import 'package:flutteryomi/domain/source/service/source_preferences.dart';

part 'toggle_source_pin.g.dart';

class ToggleSourcePin {
  final SourcePreferences preferences;
  ToggleSourcePin(this.preferences);

  Future<void> await_(Source source) async {
    final isPinned =
        preferences.pinnedSources().get().contains(source.id.toString());
    preferences.pinnedSources().getAndSet((pinned) => isPinned
        ? pinned.difference({"${source.id}"})
        : pinned.union({"${source.id}"}));
  }
}

@riverpod
ToggleSourcePin toggleSourcePin(ToggleSourcePinRef ref) =>
    ToggleSourcePin(ref.watch(sourcePreferencesProvider));
