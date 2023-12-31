import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:flutteryomi/core/preference/preference_store.dart';
import 'package:flutteryomi/core/preference/common_preference_store.dart';
import 'package:flutteryomi/data/category/category_repository_impl.dart';
import 'package:flutteryomi/data/chapter/chapter_repository_impl.dart';
import 'package:flutteryomi/data/history/history_repository_impl.dart';
import 'package:flutteryomi/data/manga/manga_repository_impl.dart';
import 'package:flutteryomi/data/track/track_repository_impl.dart';
import 'package:flutteryomi/data/updates/updates_repository_impl.dart';
import 'package:flutteryomi/domain/category/repository/category_repository.dart';
import 'package:flutteryomi/domain/chapter/repository/chapter_repository.dart';
import 'package:flutteryomi/domain/history/repository/history_repository.dart';
import 'package:flutteryomi/domain/manga/repository/manga_repository.dart';
import 'package:flutteryomi/domain/track/repository/track_repository.dart';
import 'package:flutteryomi/domain/updates/repository/updates_repository.dart';
import 'package:flutteryomi/presentation/home/home.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  return runApp(
    ProviderScope(
      overrides: [
        // Might be better to ditch the abstract repositories in the future
        sharedPreferencesProvider.overrideWithValue(prefs),
        preferenceStoreProvider.overrideWith((ref) => ref.watch(commonPreferenceStoreProvider)),
        categoryRepositoryProvider.overrideWith((ref) => ref.watch(categoryRepositoryImplProvider)),
        chapterRepositoryProvider.overrideWith((ref) => ref.watch(chapterRepositoryImplProvider)),
        historyRepositoryProvider.overrideWith((ref) => ref.watch(historyRepositoryImplProvider)),
        mangaRepositoryProvider.overrideWith((ref) => ref.watch(mangaRepositoryImplProvider)),
        trackRepositoryProvider.overrideWith((ref) => ref.watch(trackRepositoryImplProvider)),
        updatesRepositoryProvider.overrideWith((ref) => ref.watch(updatesRepositoryImplProvider)),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const MaterialApp(
      title: 'Flutteryomi',
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: HomeScreen(),
    );
  }
}
