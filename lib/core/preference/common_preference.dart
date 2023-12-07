import 'package:flutteryomi/core/preference/preference.dart';
import 'package:shared_preferences/shared_preferences.dart';

sealed class CommonPreference<T> extends Preference<T> {
  CommonPreference(
    this.preferences,
    //this.keyStream,
    this.key_,
    this.defaultValue_,
  );

  final SharedPreferences preferences;
  //final Stream<String?> keyStream;
  final String key_;
  final T defaultValue_;

  T read(SharedPreferences preferences, String key, T defaultValue);

  void write(String key, T value);

  @override
  String key() => key_;

  @override
  T get() {
    try {
      return read(preferences, key_, defaultValue_);
    } catch (e) {
      delete();
      return defaultValue_;
    }
  }

  @override
  void set(T value) => write(key_, value);

  @override
  bool isSet() => preferences.containsKey(key_);

  @override
  Future<void> delete() async => await preferences.remove(key_);

  @override
  T defaultValue() => defaultValue_;
}

class StringPrimitive extends CommonPreference<String> {
  StringPrimitive(
    super.preferences,
    super.key_,
    super.defaultValue_,
  );

  @override
  String read(SharedPreferences preferences, String key, String defaultValue) =>
      preferences.getString(key) ?? defaultValue;

  @override
  Future<void> write(String key, String value) async =>
      await preferences.setString(key, value);
}

class IntPrimitive extends CommonPreference<int> {
  IntPrimitive(
    super.preferences,
    super.key_,
    super.defaultValue_,
  );

  @override
  int read(SharedPreferences preferences, String key, int defaultValue) =>
      preferences.getInt(key) ?? defaultValue;

  @override
  Future<void> write(String key, int value) async =>
      await preferences.setInt(key, value);
}

class DoublePrimitive extends CommonPreference<double> {
  DoublePrimitive(
    super.preferences,
    super.key_,
    super.defaultValue_,
  );

  @override
  double read(SharedPreferences preferences, String key, double defaultValue) =>
      preferences.getDouble(key) ?? defaultValue;

  @override
  Future<void> write(String key, double value) async =>
      await preferences.setDouble(key, value);
}

class BoolPrimitive extends CommonPreference<bool> {
  BoolPrimitive(
    super.preferences,
    super.key_,
    super.defaultValue_,
  );

  @override
  bool read(SharedPreferences preferences, String key, bool defaultValue) =>
      preferences.getBool(key) ?? defaultValue;

  @override
  Future<void> write(String key, bool value) async =>
      await preferences.setBool(key, value);
}

class StringSetPrimitive extends CommonPreference<Set<String>> {
  StringSetPrimitive(
    super.preferences,
    super.key_,
    super.defaultValue_,
  );

  @override
  Set<String> read(
    SharedPreferences preferences,
    String key,
    Set<String> defaultValue,
  ) =>
      preferences.getStringList(key)?.toSet() ?? defaultValue;

  @override
  Future<void> write(String key, Set<String> value) async =>
      await preferences.setStringList(key, value.toList());
}

class ObjectPrimitive<T> extends CommonPreference<T> {
  ObjectPrimitive(
    super.preferences,
    super.key_,
    super.defaultValue_,
    this.serializer,
    this.deserializer,
  );

  final String Function(T) serializer;
  final T Function(String) deserializer;

  @override
  T read(SharedPreferences preferences, String key, T defaultValue) {
    try {
      String? pref = preferences.getString(key);
      return pref != null ? deserializer(pref) : defaultValue;
    } catch (e) {
      return defaultValue_;
    }
  }

  @override
  Future<void> write(String key, T value) async =>
      await preferences.setString(key, serializer(value));
}
