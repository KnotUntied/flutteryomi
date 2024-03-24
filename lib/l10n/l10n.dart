import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'l10n.g.dart';

/// https://github.com/bizz84/localization_riverpod_flutter
///
/// Provider used to access the AppLocalizations object for the current locale.
///
/// Intended for Riverpod providers and anything else with access to ref.
@riverpod
AppLocalizations appLocalizations(AppLocalizationsRef ref) {
  // 1. initialize from the initial locale
  ref.state = lookupAppLocalizations(WidgetsBinding.instance.platformDispatcher.locale);
  // 2. create an observer to update the state
  final observer = _LocaleObserver((locales) {
    ref.state = lookupAppLocalizations(WidgetsBinding.instance.platformDispatcher.locale);
  });
  // 3. register the observer and dispose it when no longer needed
  final binding = WidgetsBinding.instance;
  binding.addObserver(observer);
  ref.onDispose(() => binding.removeObserver(observer));
  // 4. return the state
  return ref.state;
}

/// Observer used to notify the caller when the locale changes.
class _LocaleObserver extends WidgetsBindingObserver {
  _LocaleObserver(this._didChangeLocales);
  final void Function(List<Locale>? locales) _didChangeLocales;
  @override
  void didChangeLocales(List<Locale>? locales) {
    _didChangeLocales(locales);
  }
}
