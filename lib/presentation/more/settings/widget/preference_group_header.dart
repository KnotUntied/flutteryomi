import 'package:flutter/material.dart';

import 'package:flutteryomi/presentation/more/settings/widget/base_preference_widget.dart';

class PreferenceGroupHeader extends StatelessWidget {
  const PreferenceGroupHeader({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: AlignmentDirectional.centerStart,
      padding: const EdgeInsets.only(bottom: 8.0, top: 14.0),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: prefsHorizontalPadding),
        child: Text(
          title,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: Theme.of(context).colorScheme.secondary,
          ),
        ),
      ),
    );
  }
}
