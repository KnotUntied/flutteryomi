import 'package:flutter/material.dart';

import 'pill.dart';

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
    final pillAlpha =
        MediaQuery.of(context).platformBrightness == Brightness.dark ? 31 : 20;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          text,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        if (badgeCount != null)
          Pill(
            text: badgeCount!.toString(),
            color:
                Theme.of(context).colorScheme.onBackground.withAlpha(pillAlpha),
            fontSize: 10.0,
          ),
      ],
    );
  }
}
