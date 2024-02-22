import 'package:flutter/material.dart';

class ListViewWithAction extends StatelessWidget {
  const ListViewWithAction({
    super.key,
    required this.actionLabel,
    required this.onClickAction,
    this.actionEnabled = true,
    required this.children,
  });

  final String actionLabel;
  final VoidCallback onClickAction;
  final bool actionEnabled;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView(children: children),
        ),
        const Divider(),
        SizedBox(
          width: double.infinity,
          child: FilledButton(
            onPressed: actionEnabled ? onClickAction : null,
            style: FilledButton.styleFrom(
              foregroundColor: Theme.of(context).colorScheme.onPrimary,
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            ),
            child: Text(actionLabel),
          ),
        ),
      ],
    );
  }
}

class ListViewBuilderWithAction extends StatelessWidget {
  const ListViewBuilderWithAction({
    super.key,
    required this.actionLabel,
    required this.onClickAction,
    this.actionEnabled = true,
    required this.itemCount,
    required this.itemBuilder,
  });

  final String actionLabel;
  final VoidCallback onClickAction;
  final bool actionEnabled;
  final int itemCount;
  final Widget? Function(BuildContext, int) itemBuilder;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: itemCount,
            itemBuilder: itemBuilder,
          ),
        ),
        const Divider(),
        SizedBox(
          width: double.infinity,
          child: FilledButton(
            onPressed: actionEnabled ? onClickAction : null,
            style: FilledButton.styleFrom(
              foregroundColor: Theme.of(context).colorScheme.onPrimary,
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            ),
            child: Text(actionLabel),
          ),
        ),
      ],
    );
  }
}
