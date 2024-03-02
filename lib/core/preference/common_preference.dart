import 'package:streaming_shared_preferences/streaming_shared_preferences.dart';

import 'package:flutteryomi/core/preference/preference.dart' as base;

sealed class CommonPreference<T> extends base.Preference<T> {
  CommonPreference(this.preferences, this.key_, this.defaultValue_);

  final StreamingSharedPreferences preferences;
  final String key_;
  final T defaultValue_;

  T read(StreamingSharedPreferences preferences, String key, T defaultValue);

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
  bool isSet() => preferences.getKeys().getValue().contains(key_);

  @override
  void delete() async => await preferences.remove(key_);

  @override
  T defaultValue() => defaultValue_;

  // streaming_shared_preferences has no generic get() or watch()
  // Override this function instead
  Stream<T> _watch();

  @override
  Stream<T> changes() => _watch();
}

class StringPrimitive extends CommonPreference<String> {
  StringPrimitive(super.preferences, super.key_, super.defaultValue_);

  @override
  String read(
    StreamingSharedPreferences preferences,
    String key,
    String defaultValue,
  ) =>
      preferences.getString(key, defaultValue: defaultValue).getValue();

  @override
  Future<void> write(String key, String value) async =>
      await preferences.setString(key, value);

  @override
  Stream<String> _watch() =>
      preferences.getString(key_, defaultValue: defaultValue_);
}

class IntPrimitive extends CommonPreference<int> {
  IntPrimitive(super.preferences, super.key_, super.defaultValue_);

  @override
  int read(
    StreamingSharedPreferences preferences,
    String key,
    int defaultValue,
  ) =>
      preferences.getInt(key, defaultValue: defaultValue).getValue();

  @override
  Future<void> write(String key, int value) async =>
      await preferences.setInt(key, value);

  @override
  Stream<int> _watch() => preferences.getInt(key_, defaultValue: defaultValue_);
}

class DoublePrimitive extends CommonPreference<double> {
  DoublePrimitive(super.preferences, super.key_, super.defaultValue_);

  @override
  double read(
    StreamingSharedPreferences preferences,
    String key,
    double defaultValue,
  ) =>
      preferences.getDouble(key, defaultValue: defaultValue).getValue();

  @override
  Future<void> write(String key, double value) async =>
      await preferences.setDouble(key, value);

  @override
  Stream<double> _watch() =>
      preferences.getDouble(key_, defaultValue: defaultValue_);
}

class BoolPrimitive extends CommonPreference<bool> {
  BoolPrimitive(super.preferences, super.key_, super.defaultValue_);

  @override
  bool read(
    StreamingSharedPreferences preferences,
    String key,
    bool defaultValue,
  ) =>
      preferences.getBool(key, defaultValue: defaultValue).getValue();

  @override
  Future<void> write(String key, bool value) async =>
      await preferences.setBool(key, value);

  @override
  Stream<bool> _watch() =>
      preferences.getBool(key_, defaultValue: defaultValue_);
}

class StringSetPrimitive extends CommonPreference<Set<String>> {
  StringSetPrimitive(super.preferences, super.key_, super.defaultValue_);

  @override
  Set<String> read(
    StreamingSharedPreferences preferences,
    String key,
    Set<String> defaultValue,
  ) =>
      preferences
          .getStringList(key, defaultValue: defaultValue.toList())
          .getValue()
          .toSet();

  @override
  Future<void> write(String key, Set<String> value) async =>
      await preferences.setStringList(key, value.toList());

  @override
  Stream<Set<String>> _watch() => preferences
      .getStringList(key_, defaultValue: defaultValue_.toList())
      .map((it) => it.toSet());
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
  T read(StreamingSharedPreferences preferences, String key, T defaultValue) {
    try {
      String? pref = preferences.getString(key, defaultValue: '').getValue();
      return pref != '' ? deserializer(pref) : defaultValue;
    } catch (e) {
      return defaultValue;
    }
  }

  @override
  Future<void> write(String key, T value) async =>
      await preferences.setString(key, serializer(value));

  @override
  Stream<T> _watch() => preferences
      .getString(key_, defaultValue: '')
      .map((it) => deserializer(it));
}
