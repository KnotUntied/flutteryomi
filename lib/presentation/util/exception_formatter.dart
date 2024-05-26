import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

extension ExceptionFormatter on Exception {
  String formattedMessage(BuildContext context) {
    final lang = AppLocalizations.of(context);
    switch (this) {
      case HttpException _:
        //TODO: Get status code
        return lang.exception_http(500);
      //TODO
      //case UnknownHostException _:
      //  return !isOnline()
      //      ? lang.exception_offline
      //      : lang.exception_unknown_host(message) ?? '';
      //case NoResultsException _:
      //return lang.no_results_found;
      //case SourceNotInstalledException _:
      //return lang.loader_not_implemented_error;
      //case LicensedMangaChaptersException _:
      //  return lang.licensed_manga_chapters_error;
    }
    //TODO
    //final className = this.simpleName;
    //return switch (className) {
    //  'Exception' || 'IOException' => message ?? className,
    //  _ => '$className: $message',
    //}
    return 'dummy text';
  }
}
