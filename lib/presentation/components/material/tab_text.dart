import 'package:flutter/material.dart';

import 'package:flutteryomi/presentation/components/pill.dart';

class TabText extends StatelessWidget {
  const TabText({
    super.key,
    required this.text,
    this.badgeCount,
  });

  final String text;
  final int? badgeCount;

  @override
  Widget build(BuildContext context) {
    final pillOpacity =
        MediaQuery.platformBrightnessOf(context) == Brightness.dark
            ? 0.12
            : 0.08;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(text, maxLines: 1, overflow: TextOverflow.ellipsis),
        if (badgeCount != null)
          Pill(
            text: '$badgeCount',
            color: Theme.of(context)
                .colorScheme
                .onBackground
                .withOpacity(pillOpacity),
            fontSize: 10.0,
          ),
      ],
    );
  }
}
