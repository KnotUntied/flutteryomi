import 'package:flutter/material.dart';

class Pill extends StatelessWidget {
  const Pill({
    super.key,
    required this.text,
    this.color,
    this.contentColor,
    this.elevation = 1.0,
    this.fontSize,
  });

  final String text;
  final Color? color;
  final Color? contentColor;
  final double elevation;
  final double? fontSize;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 4.0),
      child: Card(
        color: color ?? Theme.of(context).colorScheme.primary,
        elevation: elevation,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24.0)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 1.0),
          child: Text(
            text,
            maxLines: 1,
            style: TextStyle(
              color: contentColor ?? Theme.of(context).colorScheme.onPrimary,
              fontSize: fontSize,
            ),
          ),
        ),
      ),
    );
  }
}
