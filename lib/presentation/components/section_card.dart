import 'package:flutter/material.dart';

import 'package:flutteryomi/presentation/components/material/constants.dart';

class SectionCard extends StatelessWidget {
  const SectionCard({
    super.key,
    this.title,
    required this.content,
  });

  final String? title;
  final List<Widget> content;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (title != null)
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: MaterialPadding.extraLarge,
            ),
            child: Text(
              title!,
              style: Theme.of(context).textTheme.titleSmall,
            ),
          ),
        Card(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(MaterialCorner.extraLarge),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: MaterialPadding.medium + MaterialPadding.medium,
              vertical: MaterialPadding.small + MaterialPadding.medium,
            ),
            child: Column(children: content),
          ),
        )
      ],
    );
  }
}
