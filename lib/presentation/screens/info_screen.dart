import 'package:flutter/material.dart';

class InfoScreen extends StatelessWidget {
  const InfoScreen({
    super.key,
    required this.icon,
    required this.headingText,
    required this.subtitleText,
    required this.acceptText,
    required this.onAcceptClick,
    required this.rejectText,
    required this.onRejectClick,
    required this.content,
  });

  final IconData icon;
  final String headingText;
  final String subtitleText;
  final String acceptText;
  final VoidCallback onAcceptClick;
  final String rejectText;
  final VoidCallback onRejectClick;
  final List<Widget> content;

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      bottomNavigationBar: Placeholder(),
      body: Placeholder(),
    );
  }
}
