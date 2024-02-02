import 'package:flutteryomi/core/preference/preference.dart';
import 'package:flutteryomi/domain/category/interactor/set_display_mode.dart';
import 'package:flutteryomi/domain/category/interactor/set_sort_mode_for_category.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:flutteryomi/core/preference/tri_state.dart';
import 'package:flutteryomi/domain/category/model/category.dart';
import 'package:flutteryomi/domain/library/model/library_display_mode.dart';
import 'package:flutteryomi/domain/library/model/library_sort_mode.dart';
import 'package:flutteryomi/domain/library/service/library_preferences.dart';

part 'library_settings_screen_model.g.dart';

@riverpod
class LibrarySettingsScreenModel extends _$LibrarySettingsScreenModel {
  @override
  void build() {}

  //TODO: Convert to state
  //get trackers {
  //  final trackerManager = ref.watch(trackerManagerProvider);
  //  return trackerManager.trackers.where((it) => it.isLoggedIn);
  //}

  void toggleFilter(Preference<TriState> Function(LibraryPreferences) preference) {
    final libraryPreferences = ref.watch(libraryPreferencesProvider);
    preference(libraryPreferences).getAndSet((it) => it.next());
  }

  void toggleTracker(int id) {
    toggleFilter((prefs) => prefs.filterTracking(id));
  }

  void setDisplayMode(LibraryDisplayMode mode) {
    final setDisplayMode = ref.watch(setDisplayModeProvider);
    setDisplayMode.await_(mode);
  }

  void setSort(Category? category, Type mode, Direction direction) async  {
    final setSortModeForCategory = ref.watch(setSortModeForCategoryProvider);
    await setSortModeForCategory.awaitWithCategory(category, mode, direction);
  }
}
