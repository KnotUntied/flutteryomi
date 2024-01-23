import 'package:flutter/material.dart';

class BadgeGroup extends StatelessWidget {
  const BadgeGroup({
    super.key,
    //this.shape = ,
    required this.content,
  });

  final List<Widget> content;

  @override
  Widget build(BuildContext context) {
    return Row(children: content);
  }
}

class Badge extends StatelessWidget {
  const Badge({
    super.key,
    required this.text,
    this.color,
    this.textColor,
    this.shape,
  });

  final String text;
  final Color? color;
  final Color? textColor;
  final Widget? shape;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color ?? Theme.of(context).colorScheme.secondary,
      padding: const EdgeInsets.symmetric(horizontal: 3.0, vertical: 1.0),
      child: Text(
        text,
        maxLines: 1,
        style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: textColor ?? Theme.of(context).colorScheme.onSecondary,
              fontWeight: FontWeight.w500,
            ),
      ),
    );
  }
}

// LanguageBadge is supposed to use this but I can't see it actually in use in Tachiyomi proper
//class IconBadge extends StatelessWidget {
//  const IconBadge({
//    super.key,
//    required this.imageVector,
//    this.color,
//    this.iconColor,
//    this.shape,
//  });

//  final Icon imageVector;
//  final Color? color;
//  final Color? iconColor;
//  final Widget? shape;

//  @override
//  Widget build(BuildContext context) {
//    return Container(
//      color: color ?? Theme.of(context).colorScheme.secondary,
//      padding: const EdgeInsets.symmetric(horizontal: 3.0, vertical: 1.0),
//      child: Text(
//        text,
//        maxLines: 1,
//        style: Theme.of(context).textTheme.bodySmall?.copyWith(
//          color: iconColor ?? Theme.of(context).colorScheme.onSecondary,
//          fontWeight: FontWeight.w500,
//        ),
//      ),
//    );
//  }
//}
