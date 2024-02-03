import 'package:dartx/dartx.dart';
import 'package:flutter/material.dart';

class BasePreferenceWidget extends StatelessWidget {
  const BasePreferenceWidget({
    super.key,
    this.title,
    this.subcomponent,
    this.icon,
    this.onClick,
    this.widget,
  });

  final String? title;
  final Widget? subcomponent;
  final Widget? icon;
  final VoidCallback? onClick;
  final Widget? widget;

  @override
  Widget build(BuildContext context) {
    // TODO: Highlight animation
    return ListTile(
      leading: icon,
      tileColor: Colors.transparent,
      title: !title.isNullOrBlank
          ? Text(
              title!,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              style: Theme.of(context).textTheme.titleLarge,
            )
          : null,
      subtitle: subcomponent,
      trailing: widget,
      onTap: onClick,
    );
  }
}

class HighlightBackground extends StatefulWidget {
  const HighlightBackground({
    super.key,
    required this.highlighted,
    this.child,
  });

  final bool highlighted;
  final Widget? child;

  @override
  State<HighlightBackground> createState() => _HighlightBackgroundState();
}

class _HighlightBackgroundState extends State<HighlightBackground> {
  late bool highlightFlag = widget.highlighted;

  @override
  void initState() {
    super.initState();
    if (widget.highlighted) {
      Future.delayed(
        const Duration(seconds: 3),
        () => setState(() => highlightFlag = false),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      color: highlightFlag
          ? Theme.of(context).colorScheme.surfaceTint.withOpacity(0.12)
          : Colors.transparent,
      duration: const Duration(seconds: 3),
      child: widget.child,
    );
  }
}

const trailingWidgetBuffer = 16.0;
const prefsHorizontalPadding = 16.0;
const prefsVerticalPadding = 16.0;
const titleFontSize = 16.0;
