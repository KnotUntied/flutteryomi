import 'package:dartx/dartx.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutteryomi/presentation/screens/loading_screen.dart';

class ReaderScreen extends ConsumerWidget {
  const ReaderScreen({
    super.key,
    required this.mangaId,
    this.fromSource = false,
  });

  final int mangaId;
  final bool fromSource;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Placeholder();
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
