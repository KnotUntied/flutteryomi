import 'package:flutter/material.dart';

class BaseBrowseItem extends StatelessWidget {
  const BaseBrowseItem({
    super.key,
    required this.onClickItem,
    required this.onLongClickItem,
    required this.icon,
    required this.action,
    required this.content,
    this.subtitle,
  });

  final VoidCallback onClickItem;
  final VoidCallback onLongClickItem;
  final Widget icon;
  final Widget action;
  final Widget content;
  final Widget? subtitle;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: content,
      subtitle: subtitle,
      leading: icon,
      trailing: action,
      onTap: onClickItem,
      onLongPress: onLongClickItem,
    );
  }
}
