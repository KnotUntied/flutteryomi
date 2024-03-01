// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'page.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Page _$PageFromJson(Map<String, dynamic> json) => Page(
      json['index'] as int,
      json['url'] as String? ?? '',
      json['imageUrl'] as String?,
    )
      ..status = $enumDecode(_$PageStateEnumMap, json['status'])
      ..progress = json['progress'] as int;

Map<String, dynamic> _$PageToJson(Page instance) => <String, dynamic>{
      'index': instance.index,
      'url': instance.url,
      'imageUrl': instance.imageUrl,
      'status': _$PageStateEnumMap[instance.status]!,
      'progress': instance.progress,
    };

const _$PageStateEnumMap = {
  PageState.queue: 'queue',
  PageState.loadPage: 'loadPage',
  PageState.downloadImage: 'downloadImage',
  PageState.ready: 'ready',
  PageState.error: 'error',
};
