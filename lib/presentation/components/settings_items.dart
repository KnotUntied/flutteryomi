import 'package:flutter/material.dart';

import 'package:flutteryomi/presentation/theme/typography.dart';

class HeadingItem extends StatelessWidget {
  const HeadingItem({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(text),
      titleTextStyle: header(context),
    );
  }
}

class IconItem extends StatelessWidget {
  const IconItem({
    super.key,
    required this.label,
    required this.iconData,
    required this.onClick,
  });

  final String label;
  final IconData iconData;
  final VoidCallback onClick;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        iconData,
        color: Theme.of(context).colorScheme.primary,
      ),
      title: Text(label),
      onTap: onClick,
    );
  }
}

class SortItem extends StatelessWidget {
  const SortItem({
    super.key,
    required this.label,
    required this.sortDescending,
    required this.onClick,
  });

  final String label;
  final bool? sortDescending;
  final VoidCallback onClick;

  @override
  Widget build(BuildContext context) {
    Widget arrowIcon;
    switch (sortDescending) {
      case true:
        arrowIcon = Icon(
          Icons.arrow_downward,
          color: Theme.of(context).colorScheme.primary,
        );
      case false:
        arrowIcon = Icon(
          Icons.arrow_upward,
          color: Theme.of(context).colorScheme.primary,
        );
      default:
        arrowIcon = const SizedBox.square(dimension: 24.0);
    }
    return ListTile(
      leading: arrowIcon,
      title: Text(label),
      onTap: onClick,
    );
  }
}
