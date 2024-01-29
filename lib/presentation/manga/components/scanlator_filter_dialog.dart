import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ScanlatorFilterDialog extends StatefulWidget {
  const ScanlatorFilterDialog({
    super.key,
    required this.availableScanlators,
    required this.excludedScanlators,
    required this.onConfirm,
  });

  final Set<String> availableScanlators;
  final Set<String> excludedScanlators;
  final ValueChanged<Set<String>> onConfirm;

  @override
  State<ScanlatorFilterDialog> createState() => _ScanlatorFilterDialogState();
}

class _ScanlatorFilterDialogState extends State<ScanlatorFilterDialog> {
  late List<String> mutableExcludedScanlators =
      widget.excludedScanlators.toList();
  late List<String> sortedAvailableScanlators =
      widget.availableScanlators.toList();

  @override
  void initState() {
    super.initState();
    sortedAvailableScanlators.sort(compareAsciiLowerCase);
  }

  @override
  Widget build(BuildContext context) {
    final lang = AppLocalizations.of(context);
    return AlertDialog.adaptive(
      title: Text(lang.exclude_scanlators),
      content: sortedAvailableScanlators.isEmpty
          ? Text(lang.confirm_add_duplicate_manga)
          : ListView.builder(
              itemCount: sortedAvailableScanlators.length,
              itemBuilder: (context, index) {
                final scanlator = sortedAvailableScanlators[index];
                final isExcluded =
                    mutableExcludedScanlators.contains(scanlator);
                return ListTile(
                  leading: Icon(
                    isExcluded
                        ? Icons.disabled_by_default_rounded
                        : Icons.check_box_outline_blank_rounded,
                    color: isExcluded
                        ? Theme.of(context).colorScheme.primary
                        : null,
                  ),
                  title: Text(scanlator),
                  onTap: () => isExcluded
                      ? setState(
                          () => mutableExcludedScanlators.remove(scanlator))
                      : setState(
                          () => mutableExcludedScanlators.add(scanlator)),
                );
              },
            ),
      actions: [
        if (sortedAvailableScanlators.isEmpty)
          TextButton(
            child: Text(lang.action_cancel),
            onPressed: () => setState(() => mutableExcludedScanlators.clear),
          )
        else ...[
          TextButton(
            child: Text(lang.action_reset),
            onPressed: () => Navigator.of(context).pop(),
          ),
          const Spacer(),
          TextButton(
            child: Text(lang.action_cancel),
            onPressed: () => Navigator.of(context).pop(),
          ),
          TextButton(
            child: Text(lang.action_ok),
            onPressed: () {
              widget.onConfirm(mutableExcludedScanlators.toSet());
              Navigator.of(context).pop();
            },
          ),
        ],
      ],
    );
  }
}
