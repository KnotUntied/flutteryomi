abstract class Preference<T> {
  String key();
  T get();
  void set(T value);
  bool isSet();
  void delete();
  T defaultValue();
  void getAndSet(T Function(T) block) => set(block(get()));
  Stream<T> changes();
  /// A preference that should not be exposed in places like backups without user consent.
  static bool isPrivate(String key) => key.startsWith(_privatePrefix);
  static String privateKey(String key) => '$_privatePrefix$key';
  /// A preference used for internal app state that isn't really a user preference
  /// and therefore should not be in places like backups.
  static bool isAppState(String key) => key.startsWith(_appStatePrefix);
  static String appStateKey(String key) => '$_appStatePrefix$key';
  static const _appStatePrefix = "__APP_STATE_";
  static const _privatePrefix = "__PRIVATE_";
}

// Currently not allowed to overload operators += and -=
extension PreferenceSet<T> on Preference<Set<T>> {
  void add(T item) {
    final mySet = get();
    mySet.add(item);
    set(mySet);
  }

  void remove(T item) {
    final mySet = get();
    mySet.remove(item);
    set(mySet);
  }
}

extension Toggle on Preference<bool> {
  bool toggle() {
    set(!get());
    return get();
  }
}
