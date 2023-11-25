import 'package:flutter/material.dart';

import 'package:flutteryomi/presentation/theme/typography.dart';

class HeadingItem extends StatelessWidget {
  const HeadingItem(this.text, {super.key});

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

class TriStateItem extends StatelessWidget {
  const TriStateItem({
    super.key,
    required this.label,
    this.state,
    this.enabled = true,
    this.onClick,
  });

  final String label;
  final bool? state;
  final bool enabled;
  final ValueChanged<bool?>? onClick;

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile.adaptive(
      controlAffinity: ListTileControlAffinity.leading,
      enabled: enabled,
      title: Text(label),
      onChanged: onClick,
      tristate: true,
      value: state,
    );
  }
}

class TextItem extends StatefulWidget {
  const TextItem({
    super.key,
    required this.label,
    required this.value,
    required this.onChange,
  });

  final String label;
  final String value;
  final ValueChanged<String> onChange;

  @override
  State<TextItem> createState() => _TextItemState();
}

class _TextItemState extends State<TextItem> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.value);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: TextField(
        controller: _controller,
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          labelText: widget.label,
        ),
        onChanged: widget.onChange,
      ),
    );
  }
}

class SettingsChipRow extends StatelessWidget {
  const SettingsChipRow({
    super.key,
    required this.labelRes,
    required this.content,
  });

  final String labelRes;
  final List<Widget> content;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HeadingItem(labelRes),
        Wrap(
          spacing: 8.0,
          runSpacing: 4.0,
          children: content,
        ),
      ],
    );
  }
}
