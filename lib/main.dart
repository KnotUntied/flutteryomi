import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:flutteryomi/database.dart';
import 'package:flutteryomi/pages/home.dart';
import 'package:flutteryomi/providers/home.dart';

void main() {
  runApp(
    //Provider<AppDatabase>(
    //  create: (context) => AppDatabase(),
    //  child: const MyApp(),
    //  dispose: (context, db) => db.close(),
    //),
    const ProviderScope(child: MyApp()),
  );
}

//class MyApp extends StatelessWidget {
class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //return MultiProvider(
    //  providers: [
    //    ChangeNotifierProvider<HomeProvider>(
    //        create: (BuildContext context) => HomeProvider()),
    //  ],
    //  child: MaterialApp(
    //    title: 'Flutteryomi',
    //    localizationsDelegates: const [
    //      AppLocalizations.delegate,
    //      GlobalMaterialLocalizations.delegate,
    //      GlobalWidgetsLocalizations.delegate,
    //      GlobalCupertinoLocalizations.delegate,
    //    ],
    //    supportedLocales: AppLocalizations.supportedLocales,
    //    theme: ThemeData(
    //      useMaterial3: true,
    //    ),
    //    home: const HomePage(),
    //  ),
    //);
    return MaterialApp(
      title: 'Flutteryomi',
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
      theme: ThemeData(useMaterial3: true),
      home: const HomePage(),
    );
  }
}
