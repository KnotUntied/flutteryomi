import 'package:flutter/material.dart';

class CrashScreen extends StatelessWidget {
  const CrashScreen({
    super.key,
    required this.exception,
    required this.onRestartClick,
  });

  final Exception exception;
  final VoidCallback onRestartClick;

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      bottomNavigationBar: Placeholder(),
      body: Placeholder(),
    );
  }
}
