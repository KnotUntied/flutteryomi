import 'package:dartx/dartx.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

enum _State { checked, inversed, unchecked }

class TriStateListDialog<T> extends StatefulWidget {
  const TriStateListDialog({
    super.key,
    required this.title,
    this.message,
    required this.items,
    required this.initialChecked,
    required this.initialInversed,
    required this.itemLabel,
    required this.onValueChanged,
  });

  final String title;
  final String? message;
  final List<T> items;
  final List<T> initialChecked;
  final List<T> initialInversed;
  final String Function(T) itemLabel;
  final void Function(List<T> newIncluded, List<T> newExcluded) onValueChanged;

  @override
  State<TriStateListDialog> createState() => _TriStateListDialogState();
}

class _TriStateListDialogState<T> extends State<TriStateListDialog<T>> {
  late final selected = widget.items.map((it) {
    if (widget.initialChecked.contains(it)) {
      return _State.checked;
    } else if (widget.initialInversed.contains(it)) {
      return _State.inversed;
    } else {
      return _State.unchecked;
    }
  }).toList();

  @override
  Widget build(BuildContext context) {
    final lang = AppLocalizations.of(context);
    return AlertDialog.adaptive(
      title: Text(widget.title),
      content: CustomScrollView(
        slivers: [
          if (widget.message != null)
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Text(widget.message!),
              ),
            ),
          SliverList.builder(
            itemCount: widget.items.length,
            itemBuilder: (context, index) {
              final item = widget.items[index];
              final state = selected[index];
              return ListTile(
                leading: Icon(
                  switch (state) {
                    _State.unchecked => Icons.check_box_outline_blank_rounded,
                    _State.checked => Icons.check_box_rounded,
                    _State.inversed => Icons.disabled_by_default_rounded,
                  },
                  color: state == _State.unchecked
                      ? null
                      : Theme.of(context).colorScheme.primary,
                  semanticLabel: switch (state) {
                    _State.unchecked => lang.not_selected,
                    _State.checked => lang.selected,
                    _State.inversed => lang.disabled,
                  },
                ),
                title: Text(widget.itemLabel(item)),
                onTap: () => setState(
                  () => selected[index] = switch (state) {
                    _State.unchecked => _State.inversed,
                    _State.checked => _State.unchecked,
                    _State.inversed => _State.checked,
                  },
                ),
              );
            },
          ),
        ],
      ),
      actions: [
        TextButton(
          child: Text(lang.action_cancel),
          onPressed: () => Navigator.of(context).pop(),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
            final included = widget.items
                .mapIndexedNotNull((index, category) =>
                    selected[index] == _State.checked ? category : null)
                .toList();
            final excluded = widget.items
                .mapIndexedNotNull((index, category) =>
                    selected[index] == _State.inversed ? category : null)
                .toList();
            widget.onValueChanged(included, excluded);
          },
          child: Text(lang.action_ok),
        ),
      ],
    );
  }
}
