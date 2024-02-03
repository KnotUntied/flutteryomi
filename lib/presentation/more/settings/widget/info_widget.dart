import 'package:flutter/material.dart';

import 'package:flutteryomi/presentation/components/material/constants.dart';
import 'package:flutteryomi/presentation/more/settings/widget/base_preference_widget.dart';

class InfoWidget extends StatelessWidget {
  const InfoWidget({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: secondaryItemAlpha,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: prefsHorizontalPadding,
          vertical: MaterialPadding.medium,
        ),
        child: Column(
          children: [
            const Icon(Icons.info_outlined),
            Text(text, style: Theme.of(context).textTheme.bodySmall),
          ],
        ),
      ),
    );
  }
}
