import 'package:flutter/material.dart';

import 'package:flutteryomi/presentation/components/material/constants.dart';

class ListGroupHeader extends StatelessWidget {
  const ListGroupHeader(this.text, {super.key});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: MaterialPadding.medium,
        vertical: MaterialPadding.small,
      ),
      child: Text(
        text,
        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              color: Theme.of(context).colorScheme.onSurfaceVariant,
              fontWeight: FontWeight.w600,
            ),
      ),
    );
  }
}
