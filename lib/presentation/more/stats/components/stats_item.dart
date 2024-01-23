import 'package:flutter/material.dart';
import 'package:flutteryomi/presentation/components/material/constants.dart';

class StatsOverviewItem extends StatelessWidget {
  const StatsOverviewItem({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
  });

  final String title;
  final String subtitle;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return _BaseStatsItem(
      title: title,
      titleStyle: Theme.of(context).textTheme.bodyMedium,
      subtitle: subtitle,
      subtitleStyle: Theme.of(context).textTheme.labelSmall,
      icon: icon,
    );
  }
}

class StatsItem extends StatelessWidget {
  const StatsItem(
    this.title,
    this.subtitle, {
    super.key,
  });

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return _BaseStatsItem(
      title: title,
      titleStyle: Theme.of(context).textTheme.bodyMedium,
      subtitle: subtitle,
      subtitleStyle: Theme.of(context).textTheme.labelSmall,
    );
  }
}

class _BaseStatsItem extends StatelessWidget {
  const _BaseStatsItem({
    super.key,
    required this.title,
    this.titleStyle,
    required this.subtitle,
    this.subtitleStyle,
    this.icon,
  });

  final String title;
  final TextStyle? titleStyle;
  final String subtitle;
  final TextStyle? subtitleStyle;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    final iconWidgets = [
      const Spacer(),
      Icon(icon, color: Theme.of(context).colorScheme.primary),
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          title,
          maxLines: 1,
          style: titleStyle?.copyWith(fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        const SizedBox.square(dimension: MaterialPadding.small),
        Text(
          subtitle,
          style: subtitleStyle?.copyWith(
            color: Theme.of(context)
                .colorScheme
                .onSurface
                .withOpacity(secondaryItemAlpha),
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        if (icon != null) ...iconWidgets,
      ],
    );
  }
}
