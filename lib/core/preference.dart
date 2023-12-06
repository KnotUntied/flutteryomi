abstract interface class Preference<T> {
  String key();
  T get();
  //void set(T value);
  bool isSet();
  void delete();
  T defaultValue();
//  Stream<T> changes();
  static bool isPrivate(String key) => key.startsWith(_privatePrefix);
  static String privateKey(String key) => '$_privatePrefix$key';
  static bool isAppState(String key) => key.startsWith(_appStatePrefix);
  static String appStateKey(String key) => '$_appStatePrefix$key';
  static const _appStatePrefix = "__APP_STATE_";
  static const _privatePrefix = "__PRIVATE_";
}

// Currently not allowed to overload operators += and -=
//extension PreferenceSet<T> on Preference<Set<T>> {
//  void add(T item) {
//    Set<T> mySet = get();
//    mySet.add(item);
//    set(mySet);
//  }

//  void remove(T item) {
//    Set<T> mySet = get();
//    mySet.remove(item);
//    set(mySet);
//  }
//}

//extension Toggle on Preference<bool> {
//  bool toggle() {
//    set(!get());
//    return get();
//  }
//}
