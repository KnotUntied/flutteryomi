// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'download_pending_deleter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_EntryImpl _$$_EntryImplFromJson(Map<String, dynamic> json) => _$_EntryImpl(
      chapters: (json['chapters'] as List<dynamic>)
          .map((e) => _ChapterEntry.fromJson(e as Map<String, dynamic>))
          .toList(),
      manga: _MangaEntry.fromJson(json['manga'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_EntryImplToJson(_$_EntryImpl instance) =>
    <String, dynamic>{
      'chapters': instance.chapters,
      'manga': instance.manga,
    };

_$_ChapterEntryImpl _$$_ChapterEntryImplFromJson(Map<String, dynamic> json) =>
    _$_ChapterEntryImpl(
      id: json['id'] as int,
      url: json['url'] as String,
      name: json['name'] as String,
      scanlator: json['scanlator'] as String?,
    );

Map<String, dynamic> _$$_ChapterEntryImplToJson(_$_ChapterEntryImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'url': instance.url,
      'name': instance.name,
      'scanlator': instance.scanlator,
    };

_$_MangaEntryImpl _$$_MangaEntryImplFromJson(Map<String, dynamic> json) =>
    _$_MangaEntryImpl(
      id: json['id'] as int,
      url: json['url'] as String,
      title: json['title'] as String,
      source: json['source'] as int,
    );

Map<String, dynamic> _$$_MangaEntryImplToJson(_$_MangaEntryImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'url': instance.url,
      'title': instance.title,
      'source': instance.source,
    };
