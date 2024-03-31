import 'package:dartx/dartx.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutteryomi/presentation/screens/loading_screen.dart';

class ReaderScreen extends ConsumerStatefulWidget {
  const ReaderScreen({
    super.key,
    required this.mangaId,
    required this.initialChapterId,
  });

  final int mangaId;
  final int initialChapterId;

  @override
  ConsumerState<ReaderScreen> createState() => _ReaderScreenState();
}

class _ReaderScreenState extends ConsumerState<ReaderScreen> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        PageView(),
        Scaffold(
          appBar: AppBar(),
          bottomNavigationBar: BottomNavigationBar(
            items: const [
            ],
          ),
        ),
      ],
    );
    //return state.when(
    //  loading: () => const LoadingScreen(),
    //  // TODO: Error handling
    //  error: (error, stackTrace) {
    //    debugPrintStack(
    //      label: error.toString(),
    //      stackTrace: stackTrace,
    //    );
    //    return const LoadingScreen();
    //  },
    //  data: (data) {
    //    return const Placeholder();
    //  }
    //);
  }
}
