// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'manga_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MangaDetailsImpl _$$MangaDetailsImplFromJson(Map<String, dynamic> json) =>
    _$MangaDetailsImpl(
      title: json['title'] as String?,
      author: json['author'] as String?,
      artist: json['artist'] as String?,
      description: json['description'] as String?,
      genre:
          (json['genre'] as List<dynamic>?)?.map((e) => e as String).toList(),
      status: (json['status'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$MangaDetailsImplToJson(_$MangaDetailsImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'author': instance.author,
      'artist': instance.artist,
      'description': instance.description,
      'genre': instance.genre,
      'status': instance.status,
    };
