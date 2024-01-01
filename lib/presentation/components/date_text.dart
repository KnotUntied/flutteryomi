import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:flutteryomi/presentation/util/lang/date_extensions.dart';

String relativeDateTextFromMillis({
  required BuildContext context,
  required int dateEpochMillis,
}) =>
    relativeDateText(
      context: context,
      date: dateEpochMillis > 0
          ? DateTime.fromMillisecondsSinceEpoch(dateEpochMillis)
          : null,
    );

String relativeDateText({
  required BuildContext context,
  DateTime? date,
}) {
  final lang = AppLocalizations.of(context);
  //TODO: Find way to fetch UiPreferences
  //final preferences = remember { Injekt.get<UiPreferences>() };
  //final relativeTime = remember { preferences.relativeTime().get() };
  //final dateFormat = remember { UiPreferences.dateFormat(preferences.dateFormat().get()) };

  //return date
  //    ?.toRelativeString(
  //      context: context,
  //      relative: relativeTime,
  //      dateFormat: dateFormat,
  //    )
  //    ?? lang.not_applicable;
  return lang.not_applicable;
}
