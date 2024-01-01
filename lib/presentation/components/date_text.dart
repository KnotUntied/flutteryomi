import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:flutteryomi/domain/ui/ui_preferences.dart';
import 'package:flutteryomi/presentation/util/lang/date_extensions.dart';

String relativeDateTextFromMillis({
  required BuildContext context,
  required int dateEpochMillis,
  required bool relativeTime,
  required String dateFormat,
}) =>
    relativeDateText(
      context: context,
      date: dateEpochMillis > 0
          ? DateTime.fromMillisecondsSinceEpoch(dateEpochMillis)
          : null,
      relativeTime: relativeTime,
      dateFormat: dateFormat,
    );

String relativeDateText({
  required BuildContext context,
  DateTime? date,
  required bool relativeTime,
  required String dateFormat,
}) {
  final lang = AppLocalizations.of(context);
  return date?.toRelativeString(
        context: context,
        relative: relativeTime,
        dateFormat: UiPreferences.dateFormatFromString(dateFormat),
      ) ??
      lang.not_applicable;
}
