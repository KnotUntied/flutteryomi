import 'package:shared_preferences/shared_preferences.dart';

import 'package:flutteryomi/core/common_preference.dart';
import 'package:flutteryomi/core/preference.dart';
import 'package:flutteryomi/core/preference_store.dart';

class CommonPreferenceStore implements PreferenceStore {
  CommonPreferenceStore(this.prefs);
  final SharedPreferences prefs;

  @override
  Preference<String> getString(String key, {String defaultValue = ''}) =>
      StringPrimitive(prefs, key, defaultValue);

  @override
  Preference<int> getInt(String key, {int defaultValue = 0}) =>
      IntPrimitive(prefs, key, defaultValue);

  @override
  Preference<double> getDouble(String key, {double defaultValue = 0.0}) =>
      DoublePrimitive(prefs, key, defaultValue);

  @override
  Preference<bool> getBool(String key, {bool defaultValue = false}) =>
      BoolPrimitive(prefs, key, defaultValue);

  @override
  Preference<Set<String>> getStringSet(
    String key, {
    Set<String> defaultValue = const <String>{},
  }) =>
      StringSetPrimitive(prefs, key, defaultValue);

  @override
  Preference<T> getObject<T>(
    String key,
    T defaultValue,
    String Function(T) serializer,
    T Function(String) deserializer,
  ) =>
      ObjectPrimitive(prefs, key, defaultValue, serializer, deserializer);
}
