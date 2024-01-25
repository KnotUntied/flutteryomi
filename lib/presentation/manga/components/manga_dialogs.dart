import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:flutteryomi/domain/manga/interactor/fetch_interval.dart';
import 'package:flutteryomi/presentation/components/material/constants.dart';
import 'package:flutteryomi/presentation/components/wheel_picker.dart';

class DeleteChaptersDialog extends StatelessWidget {
  const DeleteChaptersDialog({
    super.key,
    required this.onConfirm,
  });

  final VoidCallback onConfirm;

  @override
  Widget build(BuildContext context) {
    final lang = AppLocalizations.of(context);
    return AlertDialog.adaptive(
      title: Text(lang.are_you_sure),
      content: Text(lang.confirm_delete_chapters),
      actions: [
        TextButton(
          child: Text(lang.action_cancel),
          onPressed: () => Navigator.of(context).pop(),
        ),
        TextButton(
          child: Text(lang.action_ok),
          onPressed: () {
            Navigator.of(context).pop();
            onConfirm();
          },
        ),
      ],
    );
  }
}

class SetIntervalDialog extends StatefulWidget {
  const SetIntervalDialog({
    super.key,
    required this.interval,
    this.nextUpdate,
    this.onValueChanged,
  });

  final int interval;
  final DateTime? nextUpdate;
  final ValueChanged<int>? onValueChanged;

  @override
  State<SetIntervalDialog> createState() => _SetIntervalDialogState();
}

class _SetIntervalDialogState extends State<SetIntervalDialog> {
  late int selectedInterval = widget.interval < 0 ? -widget.interval : 0;
  late int? nextUpdateDays = widget.nextUpdate != null
      ? DateTime.now().difference(widget.nextUpdate!).inDays
      : null;

  @override
  Widget build(BuildContext context) {
    final lang = AppLocalizations.of(context);
    return AlertDialog.adaptive(
      title: Text(lang.pref_library_update_smart_update),
      content: Column(
        children: [
          if (nextUpdateDays != null &&
              nextUpdateDays! >= 0 &&
              widget.interval >= 0) ...[
            Text(
              lang.manga_interval_expected_update(
                lang.day(nextUpdateDays!),
                lang.day(widget.interval.abs()),
              ),
            ),
            const SizedBox(height: MaterialPadding.small),
          ],
          if (widget.onValueChanged != null) ...[
            Text(lang.manga_interval_custom_amount),
            Center(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return WheelTextPicker(
                    items: List.generate(
                      FetchInterval.maxInterval,
                      (it) => it == 0 ? lang.label_default : it.toString(),
                    ),
                    size: Size(constraints.maxWidth / 2, 128.0),
                    startIndex: selectedInterval,
                    onSelectionChanged: (it) => setState(
                      () => selectedInterval = it,
                    ),
                  );
                },
              ),
            ),
          ],
        ],
      ),
      actions: [
        TextButton(
          child: Text(lang.action_cancel),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        TextButton(
          child: Text(lang.action_ok),
          onPressed: () {
            if (widget.onValueChanged != null) {
              widget.onValueChanged!(selectedInterval);
            }
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
