import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:flutteryomi/domain/library/model/library_display_mode.dart';
import 'package:flutteryomi/domain/library/service/library_preferences.dart';

part 'set_display_mode.g.dart';

class SetDisplayMode {
  final LibraryPreferences preferences;
  SetDisplayMode({
    required this.preferences,
  });


  void await_(LibraryDisplayMode display) {
    preferences.displayMode().set(display);
  }
}

@riverpod
SetDisplayMode setDisplayMode(SetDisplayModeRef ref) =>
    SetDisplayMode(
      preferences: ref.watch(libraryPreferencesProvider),
    );
