import 'package:flutter/material.dart';

class Pill extends StatelessWidget {
  const Pill({
    super.key,
    required this.text,
    this.elevation = 1.0,
    this.color,
    this.contentColor,
  });

  final String text;
  final double elevation;
  final Color? color;
  final Color? contentColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 4.0),
      child: Card(
        color: color ?? Theme.of(context).colorScheme.primary,
        elevation: elevation,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 1.0),
          child: Text(
            text,
            style: TextStyle(
              color: contentColor ?? Theme.of(context).colorScheme.onPrimary,
            ),
          ),
        ),
      ),
    );
  }
}
