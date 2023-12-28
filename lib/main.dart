import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
//import 'package:shared_preferences/shared_preferences.dart';

import 'package:flutteryomi/data/category/category_repository_impl.dart';
import 'package:flutteryomi/data/manga/manga_repository_impl.dart';
import 'package:flutteryomi/domain/category/repository/category_repository.dart';
import 'package:flutteryomi/domain/manga/repository/manga_repository.dart';
import 'package:flutteryomi/presentation/home/home.dart';

void main() {
  runApp(
    ProviderScope(
      overrides: [
        // Might be better to ditch the abstract repositories in the future
        categoryRepositoryProvider.overrideWith((ref) => ref.watch(categoryRepositoryImplProvider)),
        mangaRepositoryProvider.overrideWith((ref) => ref.watch(mangaRepositoryImplProvider)),
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
