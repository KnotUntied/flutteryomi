import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:streaming_shared_preferences/streaming_shared_preferences.dart';

import 'package:flutteryomi/core/preference/common_preference.dart';
import 'package:flutteryomi/core/preference/preference.dart' as base;
import 'package:flutteryomi/core/preference/preference_store.dart';

part 'common_preference_store.g.dart';

class CommonPreferenceStore extends PreferenceStore {
  CommonPreferenceStore(this.prefs);
  final StreamingSharedPreferences prefs;

  @override
  base.Preference<String> getString(String key, [String defaultValue = '']) =>
      StringPrimitive(prefs, key, defaultValue);

  @override
  base.Preference<int> getInt(String key, [int defaultValue = 0]) =>
      IntPrimitive(prefs, key, defaultValue);

  @override
  base.Preference<double> getDouble(String key, [double defaultValue = 0.0]) =>
      DoublePrimitive(prefs, key, defaultValue);

  @override
  base.Preference<bool> getBool(String key, [bool defaultValue = false]) =>
      BoolPrimitive(prefs, key, defaultValue);

  @override
  base.Preference<Set<String>> getStringSet(
    String key, [
    Set<String> defaultValue = const {},
  ]) =>
      StringSetPrimitive(prefs, key, defaultValue);

  @override
  base.Preference<T> getObject<T>(
    String key,
    T defaultValue,
    String Function(T) serializer,
    T Function(String) deserializer,
  ) =>
      ObjectPrimitive(prefs, key, defaultValue, serializer, deserializer);

  // streaming_shared_preferences has no generic get()
  // For now, haphazardly use getString() as we haven't seen this function in use yet
  @override
  Map<String, dynamic> getAll() => {
        for (final k in prefs.getKeys().getValue())
          k: prefs.getString(k, defaultValue: '').getValue()
      };
}

@riverpod
StreamingSharedPreferences sharedPreferences(SharedPreferencesRef ref) =>
    throw UnimplementedError();

@riverpod
CommonPreferenceStore commonPreferenceStore(CommonPreferenceStoreRef ref) =>
    CommonPreferenceStore(ref.watch(sharedPreferencesProvider));
