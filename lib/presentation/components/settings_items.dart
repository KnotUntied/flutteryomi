import 'package:flutter/material.dart';

import 'package:flutteryomi/core/preference/preference.dart';
import 'package:flutteryomi/core/preference/tri_state.dart';
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
    final arrowIcon = switch (sortDescending) {
      true => Icon(
          Icons.arrow_downward,
          color: Theme.of(context).colorScheme.primary,
        ),
      false => Icon(
          Icons.arrow_upward,
          color: Theme.of(context).colorScheme.primary,
        ),
      _ => const SizedBox.square(dimension: 24.0),
    };
    return ListTile(
      leading: arrowIcon,
      title: Text(label),
      onTap: onClick,
    );
  }
}

class CheckboxItem extends StatelessWidget {
  const CheckboxItem({super.key, required this.label, required this.pref});

  final String label;
  final Preference<bool> pref;

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      controlAffinity: ListTileControlAffinity.leading,
      title: Text(label),
      value: pref.get(),
      onChanged: (_) => pref.toggle(),
    );
  }
}

class SliderItem extends StatelessWidget {
  const SliderItem({
    super.key,
    required this.label,
    required this.value,
    required this.valueText,
    required this.onChange,
    required this.max,
    this.min = 0,
  });

  final String label;
  final int value;
  final String valueText;
  final ValueChanged<int> onChange;
  final int max;
  final int min;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Row(
        children: [
          Expanded(
            flex: 1,
            child: Column(
              children: [
                Text(label, style: Theme.of(context).textTheme.bodyMedium),
                Text(valueText),
              ],
            ),
          ),
          const SizedBox(width: 24.0);
          Expanded(
            flex: 3,
            child: Slider.adaptive(
              value: value.toDouble(),
              onChanged: (it) {
                final newValue = it.toInt();
                if (newValue != value) {
                  Feedback.forTap(context);
                  onChange(newValue);
                }
              },
              min: min.toDouble(),
              max: max.toDouble(),
              divisions: max - min,
            ),
          ),
        ],
      ),
    );
  }
}

//TODO
class SelectItem extends StatelessWidget {
  const SelectItem({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class TriStateItem extends StatelessWidget {
  const TriStateItem({
    super.key,
    required this.label,
    required this.state,
    this.enabled = true,
    this.onClick,
  });

  final String label;
  final TriState state;
  final bool enabled;
  final ValueChanged<TriState>? onClick;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      enabled: enabled && onClick != null,
      leading: Icon(
        switch (state) {
          TriState.disabled => Icons.check_box_outline_blank_rounded,
          TriState.enabledIs => Icons.check_box_rounded,
          TriState.enabledNot => Icons.disabled_by_default_rounded,
        },
        color: !enabled || state == TriState.disabled
            ? Theme.of(context).colorScheme.onSurfaceVariant
            : switch (onClick) {
                null => Theme.of(context).colorScheme.onSurface,
                _ => Theme.of(context).colorScheme.primary,
              },
      ),
      title: Text(label),
      titleTextStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: Theme.of(context).colorScheme.onSurface,
          ),
      onTap: onClick != null
          ? () => switch (state) {
                TriState.disabled => onClick!(TriState.enabledIs),
                TriState.enabledIs => onClick!(TriState.enabledNot),
                TriState.enabledNot => onClick!(TriState.disabled),
              }
          : null,
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
    required this.label,
    required this.content,
  });

  final String label;
  final List<Widget> content;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HeadingItem(label),
        Wrap(
          spacing: 8.0,
          runSpacing: 4.0,
          children: content,
        ),
      ],
    );
  }
}
