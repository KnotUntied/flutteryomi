import 'package:dartx/dartx.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;

extension DurationToDurationString on Duration {
  String toDurationString({
    required BuildContext context,
    required String fallback,
  }) {
    final lang = AppLocalizations.of(context);
    final components = toComponents();
    final output = [
      if (components.days != 0) lang.day_short(components.days),
      if (components.hours != 0) lang.hour_short(components.hours),
      if (components.minutes != 0 &&
          (components.days == 0 || components.hours == 0))
        lang.minute_short(components.minutes),
      if (components.seconds != 0 &&
          components.days == 0 &&
          components.hours == 0)
        lang.seconds_short(components.seconds),
    ].join(' ');
    return output.isBlank ? fallback : output;
  }

  DurationComponents toComponents() {
    Duration remaining = this;
    final days = remaining.inDays;
    remaining -= Duration(
      milliseconds: remaining.inDays * Duration.millisecondsPerDay,
    );
    final hours = remaining.inHours;
    remaining -= Duration(
      milliseconds: remaining.inHours * Duration.millisecondsPerHour,
    );
    final minutes = remaining.inMinutes;
    remaining -= Duration(
      milliseconds: remaining.inSeconds * Duration.millisecondsPerSecond,
    );
    final seconds = remaining.inSeconds;
    return DurationComponents(
      days: days,
      hours: hours,
      minutes: minutes,
      seconds: seconds,
    );
  }
}

// Dart's Duration doesn't have per-component data
class DurationComponents {
  final int days;
  final int hours;
  final int minutes;
  final int seconds;

  const DurationComponents({
    this.days = 0,
    this.hours = 0,
    this.minutes = 0,
    this.seconds = 0,
  });
}

String relativeTimeSpanString(BuildContext context, DateTime dateTime) {
  final now = DateTime.now();
  final lang = AppLocalizations.of(context);
  if (dateTime.millisecondsSinceEpoch <= 0) {
    return lang.relative_time_span_never;
  } else if (now.difference(dateTime) < 1.minutes) {
    return lang.updates_last_update_info_just_now;
  } else {
    return timeago.format(dateTime);
  }
}
