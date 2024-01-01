import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';

extension DateExtensions on DateTime {
  String toRelativeString({
    required BuildContext context,
    required bool relative,
    DateFormat? dateFormat,
  }) {
    final lang = AppLocalizations.of(context);
    dateFormat = dateFormat ?? DateFormat.yMd();
    if (!relative) return dateFormat.format(this);
    final now = DateTime.now();
    final difference = now.dateOnly.difference(dateOnly);
    final days = difference ~/ Duration.millisecondsPerDay;
    return switch (difference) {
      < const Duration(days: 0) => dateFormat.format(this),
      < const Duration(days: 1) => lang.relative_time_today,
      < const Duration(days: 7) => lang.relative_time(days.inDays),
      _ => dateFormat.format(this),
    };
  }

  DateTime get dateOnly => DateUtils.dateOnly(this);
}
