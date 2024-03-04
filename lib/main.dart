import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
//import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:flutteryomi/core/preference/common_preference_store.dart';
import 'package:flutteryomi/core/preference/preference_store.dart';
import 'package:flutteryomi/data/category/category_repository_impl.dart';
import 'package:flutteryomi/data/chapter/chapter_repository_impl.dart';
import 'package:flutteryomi/data/history/history_repository_impl.dart';
import 'package:flutteryomi/data/manga/manga_repository_impl.dart';
import 'package:flutteryomi/data/source/common_source_manager.dart';
import 'package:flutteryomi/data/source/stub_source_repository_impl.dart';
import 'package:flutteryomi/data/track/track_repository_impl.dart';
import 'package:flutteryomi/data/updates/updates_repository_impl.dart';
import 'package:flutteryomi/domain/category/repository/category_repository.dart';
import 'package:flutteryomi/domain/chapter/repository/chapter_repository.dart';
import 'package:flutteryomi/domain/history/repository/history_repository.dart';
import 'package:flutteryomi/domain/manga/repository/manga_repository.dart';
import 'package:flutteryomi/domain/source/repository/stub_source_repository.dart';
import 'package:flutteryomi/domain/source/service/source_manager.dart';
import 'package:flutteryomi/domain/track/repository/track_repository.dart';
import 'package:flutteryomi/domain/updates/repository/updates_repository.dart';
//import 'package:flutteryomi/l10n/strings.g.dart';
import 'package:flutteryomi/presentation/home/home.dart';
import 'package:streaming_shared_preferences/streaming_shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  final prefs = await StreamingSharedPreferences.instance;
  return runApp(
    ProviderScope(
      overrides: [
        // Might be better to ditch the abstract repositories in the future
        sharedPreferencesProvider.overrideWithValue(prefs),
        preferenceStoreProvider.overrideWith((ref) => ref.watch(commonPreferenceStoreProvider)),
        sourceManagerProvider.overrideWith((ref) => ref.watch(commonSourceManagerProvider)),
        categoryRepositoryProvider.overrideWith((ref) => ref.watch(categoryRepositoryImplProvider)),
        chapterRepositoryProvider.overrideWith((ref) => ref.watch(chapterRepositoryImplProvider)),
        historyRepositoryProvider.overrideWith((ref) => ref.watch(historyRepositoryImplProvider)),
        mangaRepositoryProvider.overrideWith((ref) => ref.watch(mangaRepositoryImplProvider)),
        stubSourceRepositoryProvider.overrideWith((ref) => ref.watch(stubSourceRepositoryImplProvider)),
        trackRepositoryProvider.overrideWith((ref) => ref.watch(trackRepositoryImplProvider)),
        updatesRepositoryProvider.overrideWith((ref) => ref.watch(updatesRepositoryImplProvider)),
      ],
      child: const MyApp(),
      //child: TranslationProvider(
      //  child: const MyApp(),
      //),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutteryomi',
      //onGenerateTitle: (context) => lang.app_name,
      //localizationsDelegates: const [
      //  GlobalMaterialLocalizations.delegate,
      //  GlobalWidgetsLocalizations.delegate,
      //  GlobalCupertinoLocalizations.delegate,
      //],
      //supportedLocales: AppLocaleUtils.supportedLocales,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: HomeScreen(),
    );
  }
}
