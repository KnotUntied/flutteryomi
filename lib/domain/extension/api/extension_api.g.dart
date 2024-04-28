// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'extension_api.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ExtensionJsonObjectImpl _$$ExtensionJsonObjectImplFromJson(
        Map<String, dynamic> json) =>
    _$ExtensionJsonObjectImpl(
      name: json['name'] as String,
      pkg: json['pkg'] as String,
      apk: json['apk'] as String,
      lang: json['lang'] as String,
      code: (json['code'] as num).toInt(),
      version: json['version'] as String,
      nsfw: (json['nsfw'] as num).toInt(),
      sources: (json['sources'] as List<dynamic>?)
          ?.map((e) =>
              ExtensionSourceJsonObject.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ExtensionJsonObjectImplToJson(
        _$ExtensionJsonObjectImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'pkg': instance.pkg,
      'apk': instance.apk,
      'lang': instance.lang,
      'code': instance.code,
      'version': instance.version,
      'nsfw': instance.nsfw,
      'sources': instance.sources,
    };

_$ExtensionSourceJsonObjectImpl _$$ExtensionSourceJsonObjectImplFromJson(
        Map<String, dynamic> json) =>
    _$ExtensionSourceJsonObjectImpl(
      id: (json['id'] as num).toInt(),
      lang: json['lang'] as String,
      name: json['name'] as String,
      baseUrl: json['baseUrl'] as String,
    );

Map<String, dynamic> _$$ExtensionSourceJsonObjectImplToJson(
        _$ExtensionSourceJsonObjectImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'lang': instance.lang,
      'name': instance.name,
      'baseUrl': instance.baseUrl,
    };
