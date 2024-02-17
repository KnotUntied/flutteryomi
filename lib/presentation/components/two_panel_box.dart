import 'package:flutter/material.dart';

class TwoPanelBox extends StatelessWidget {
  const TwoPanelBox({
    super.key,
    required this.startChild,
    required this.endChild,
  });

  final Widget startChild;
  final Widget endChild;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          child: Container(
            constraints: const BoxConstraints(maxWidth: 450),
            child: startChild,
          ),
        ),
        Expanded(child: endChild),
      ],
    );
  }
}
