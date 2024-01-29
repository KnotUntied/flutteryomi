// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'smanga.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SMangaImpl _$$SMangaImplFromJson(Map<String, dynamic> json) => _$SMangaImpl(
      url: json['url'] as String,
      title: json['title'] as String,
      artist: json['artist'] as String?,
      author: json['author'] as String?,
      description: json['description'] as String?,
      genre: json['genre'] as String?,
      status: json['status'] as int? ?? 4,
      thumbnailUrl: json['thumbnailUrl'] as String?,
      updateStrategy: $enumDecodeNullable(
              _$UpdateStrategyEnumMap, json['updateStrategy']) ??
          UpdateStrategy.alwaysUpdate,
      initialized: json['initialized'] as bool? ?? false,
    );

Map<String, dynamic> _$$SMangaImplToJson(_$SMangaImpl instance) =>
    <String, dynamic>{
      'url': instance.url,
      'title': instance.title,
      'artist': instance.artist,
      'author': instance.author,
      'description': instance.description,
      'genre': instance.genre,
      'status': instance.status,
      'thumbnailUrl': instance.thumbnailUrl,
      'updateStrategy': _$UpdateStrategyEnumMap[instance.updateStrategy]!,
      'initialized': instance.initialized,
    };

const _$UpdateStrategyEnumMap = {
  UpdateStrategy.alwaysUpdate: 'alwaysUpdate',
  UpdateStrategy.onlyFetchOnce: 'onlyFetchOnce',
};
