import 'package:dartx/dartx.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:sprintf/sprintf.dart';

import 'package:flutteryomi/presentation/more/settings/widget/text_preference_widget.dart';

class EditTextPreferenceWidget extends StatelessWidget {
  const EditTextPreferenceWidget({
    super.key,
    this.title,
    this.subtitle,
    this.icon,
    required this.value,
    required this.onConfirm,
  });

  final String? title;
  final String? subtitle;
  final IconData? icon;
  final String value;
  final Future<bool> Function(String) onConfirm;

  @override
  Widget build(BuildContext context) {
    return TextPreferenceWidget(
      title: title,
      subtitle: subtitle != null ? sprintf(subtitle!, value) : null,
      icon: icon,
      onPreferenceClick: () => showAdaptiveDialog(
        context: context,
        builder: (context) => _EditTextPreferenceDialog(
          title: title,
          value: value,
          onConfirm: onConfirm,
        ),
      ),
    );
  }
}

class _EditTextPreferenceDialog extends StatefulWidget {
  const _EditTextPreferenceDialog({
    super.key,
    this.title,
    required this.value,
    required this.onConfirm,
  });

  final String? title;
  final String value;
  final Future<bool> Function(String) onConfirm;

  @override
  State<_EditTextPreferenceDialog> createState() =>
      _EditTextPreferenceDialogState();
}

class _EditTextPreferenceDialogState extends State<_EditTextPreferenceDialog> {
  late final TextEditingController _controller;

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
    final lang = AppLocalizations.of(context);
    return AlertDialog.adaptive(
      title: widget.title != null ? Text(widget.title!) : null,
      content: TextField(
        controller: _controller,
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          errorText: _controller.text.isBlank ? '' : null,
          suffixIcon: _controller.text.isBlank
              ? const Icon(Icons.error)
              : IconButton(
                  icon: const Icon(Icons.cancel),
                  onPressed: _controller.clear,
                ),
        ),
      ),
      actions: [
        TextButton(
          child: Text(lang.action_cancel),
          onPressed: () => Navigator.pop(context),
        ),
        TextButton(
          onPressed:
              _controller.text != widget.value && _controller.text.isNotBlank
                  ? () async {
                      if (await widget.onConfirm(_controller.text)) {
                        if (mounted) Navigator.pop(context);
                      }
                    }
                  : null,
          child: Text(lang.action_ok),
        ),
      ],
    );
  }
}
