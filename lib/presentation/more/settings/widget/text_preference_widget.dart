import 'package:dartx/dartx.dart';
import 'package:flutter/material.dart';

import 'package:flutteryomi/presentation/components/material/constants.dart';
import 'package:flutteryomi/presentation/more/settings/widget/base_preference_widget.dart';

class TextPreferenceWidget extends StatelessWidget {
  const TextPreferenceWidget({
    super.key,
    this.title,
    this.subtitle,
    this.icon,
    this.iconTint,
    this.widget,
    this.onPreferenceClick,
  });

  final String? title;
  final String? subtitle;
  final IconData? icon;
  final Color? iconTint;
  final Widget? widget;
  final VoidCallback? onPreferenceClick;

  @override
  Widget build(BuildContext context) {
    return BasePreferenceWidget(
      title: title,
      subcomponent: !subtitle.isNullOrBlank
          ? Opacity(
              opacity: secondaryItemAlpha,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: prefsHorizontalPadding,
                ),
                child: Text(
                  subtitle!,
                  style: Theme.of(context).textTheme.bodySmall,
                  maxLines: 10,
                ),
              ),
            )
          : null,
      icon: icon != null
          ? Icon(icon, color: iconTint ?? Theme.of(context).colorScheme.primary)
          : null,
      onClick: onPreferenceClick,
      widget: widget,
    );
  }
}
