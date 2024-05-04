import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:flutteryomi/domain/category/repository/category_repository.dart';
import 'package:flutteryomi/domain/library/model/flag.dart';
import 'package:flutteryomi/domain/library/service/library_preferences.dart';

part 'reset_category_flags.g.dart';

class ResetCategoryFlags {
  final CategoryRepository repository;
  final LibraryPreferences preferences;
  ResetCategoryFlags({
    required this.repository,
    required this.preferences,
  });


  Future<void> await_() {
    final sort = preferences.sortingMode().get();
    return repository.updateAllFlags(sort.type + sort.direction);
  }
}

@riverpod
ResetCategoryFlags resetCategoryFlags(ResetCategoryFlagsRef ref) =>
    ResetCategoryFlags(
      repository: ref.watch(categoryRepositoryProvider),
      preferences: ref.watch(libraryPreferencesProvider),
    );
