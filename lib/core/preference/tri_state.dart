/// Needed as shared_preferences does not support bool? for example.
enum TriState {
  /// Disable filter
  disabled,
  /// Enabled with "is" filter
  enabledIs,
  /// Enabled with "not" filter
  enabledNot,
}

extension TriStateNext on TriState {
  TriState next() => switch (this) {
    TriState.disabled => TriState.enabledIs,
    TriState.enabledIs => TriState.enabledNot,
    TriState.enabledNot => TriState.disabled,
  };
}
