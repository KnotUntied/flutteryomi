// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'history_with_relations.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;


final _privateConstructorUsedError = UnsupportedError('It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$HistoryWithRelations {

 int get id => throw _privateConstructorUsedError; int get chapterId => throw _privateConstructorUsedError; int get mangaId => throw _privateConstructorUsedError; String get title => throw _privateConstructorUsedError; double get chapterNumber => throw _privateConstructorUsedError; DateTime? get readAt => throw _privateConstructorUsedError; int get readDuration => throw _privateConstructorUsedError; MangaCover get coverData => throw _privateConstructorUsedError;







@JsonKey(ignore: true)
$HistoryWithRelationsCopyWith<HistoryWithRelations> get copyWith => throw _privateConstructorUsedError;

}

/// @nodoc
abstract class $HistoryWithRelationsCopyWith<$Res>  {
  factory $HistoryWithRelationsCopyWith(HistoryWithRelations value, $Res Function(HistoryWithRelations) then) = _$HistoryWithRelationsCopyWithImpl<$Res, HistoryWithRelations>;
@useResult
$Res call({
 int id, int chapterId, int mangaId, String title, double chapterNumber, DateTime? readAt, int readDuration, MangaCover coverData
});


$MangaCoverCopyWith<$Res> get coverData;
}

/// @nodoc
class _$HistoryWithRelationsCopyWithImpl<$Res,$Val extends HistoryWithRelations> implements $HistoryWithRelationsCopyWith<$Res> {
  _$HistoryWithRelationsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? chapterId = null,Object? mangaId = null,Object? title = null,Object? chapterNumber = null,Object? readAt = freezed,Object? readDuration = null,Object? coverData = null,}) {
  return _then(_value.copyWith(
id: null == id ? _value.id : id // ignore: cast_nullable_to_non_nullable
as int,chapterId: null == chapterId ? _value.chapterId : chapterId // ignore: cast_nullable_to_non_nullable
as int,mangaId: null == mangaId ? _value.mangaId : mangaId // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _value.title : title // ignore: cast_nullable_to_non_nullable
as String,chapterNumber: null == chapterNumber ? _value.chapterNumber : chapterNumber // ignore: cast_nullable_to_non_nullable
as double,readAt: freezed == readAt ? _value.readAt : readAt // ignore: cast_nullable_to_non_nullable
as DateTime?,readDuration: null == readDuration ? _value.readDuration : readDuration // ignore: cast_nullable_to_non_nullable
as int,coverData: null == coverData ? _value.coverData : coverData // ignore: cast_nullable_to_non_nullable
as MangaCover,
  )as $Val);
}
@override
@pragma('vm:prefer-inline')
$MangaCoverCopyWith<$Res> get coverData {
  
  return $MangaCoverCopyWith<$Res>(_value.coverData, (value) {
    return _then(_value.copyWith(coverData: value) as $Val);
  });
}
}


/// @nodoc
abstract class _$$HistoryWithRelationsImplCopyWith<$Res> implements $HistoryWithRelationsCopyWith<$Res> {
  factory _$$HistoryWithRelationsImplCopyWith(_$HistoryWithRelationsImpl value, $Res Function(_$HistoryWithRelationsImpl) then) = __$$HistoryWithRelationsImplCopyWithImpl<$Res>;
@override @useResult
$Res call({
 int id, int chapterId, int mangaId, String title, double chapterNumber, DateTime? readAt, int readDuration, MangaCover coverData
});


@override $MangaCoverCopyWith<$Res> get coverData;
}

/// @nodoc
class __$$HistoryWithRelationsImplCopyWithImpl<$Res> extends _$HistoryWithRelationsCopyWithImpl<$Res, _$HistoryWithRelationsImpl> implements _$$HistoryWithRelationsImplCopyWith<$Res> {
  __$$HistoryWithRelationsImplCopyWithImpl(_$HistoryWithRelationsImpl _value, $Res Function(_$HistoryWithRelationsImpl) _then)
      : super(_value, _then);


@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? chapterId = null,Object? mangaId = null,Object? title = null,Object? chapterNumber = null,Object? readAt = freezed,Object? readDuration = null,Object? coverData = null,}) {
  return _then(_$HistoryWithRelationsImpl(
id: null == id ? _value.id : id // ignore: cast_nullable_to_non_nullable
as int,chapterId: null == chapterId ? _value.chapterId : chapterId // ignore: cast_nullable_to_non_nullable
as int,mangaId: null == mangaId ? _value.mangaId : mangaId // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _value.title : title // ignore: cast_nullable_to_non_nullable
as String,chapterNumber: null == chapterNumber ? _value.chapterNumber : chapterNumber // ignore: cast_nullable_to_non_nullable
as double,readAt: freezed == readAt ? _value.readAt : readAt // ignore: cast_nullable_to_non_nullable
as DateTime?,readDuration: null == readDuration ? _value.readDuration : readDuration // ignore: cast_nullable_to_non_nullable
as int,coverData: null == coverData ? _value.coverData : coverData // ignore: cast_nullable_to_non_nullable
as MangaCover,
  ));
}


}

/// @nodoc


class _$HistoryWithRelationsImpl  implements _HistoryWithRelations {
  const _$HistoryWithRelationsImpl({required this.id, required this.chapterId, required this.mangaId, required this.title, required this.chapterNumber, this.readAt, required this.readDuration, required this.coverData});

  

@override final  int id;
@override final  int chapterId;
@override final  int mangaId;
@override final  String title;
@override final  double chapterNumber;
@override final  DateTime? readAt;
@override final  int readDuration;
@override final  MangaCover coverData;

@override
String toString() {
  return 'HistoryWithRelations(id: $id, chapterId: $chapterId, mangaId: $mangaId, title: $title, chapterNumber: $chapterNumber, readAt: $readAt, readDuration: $readDuration, coverData: $coverData)';
}


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _$HistoryWithRelationsImpl&&(identical(other.id, id) || other.id == id)&&(identical(other.chapterId, chapterId) || other.chapterId == chapterId)&&(identical(other.mangaId, mangaId) || other.mangaId == mangaId)&&(identical(other.title, title) || other.title == title)&&(identical(other.chapterNumber, chapterNumber) || other.chapterNumber == chapterNumber)&&(identical(other.readAt, readAt) || other.readAt == readAt)&&(identical(other.readDuration, readDuration) || other.readDuration == readDuration)&&(identical(other.coverData, coverData) || other.coverData == coverData));
}


@override
int get hashCode => Object.hash(runtimeType,id,chapterId,mangaId,title,chapterNumber,readAt,readDuration,coverData);

@JsonKey(ignore: true)
@override
@pragma('vm:prefer-inline')
_$$HistoryWithRelationsImplCopyWith<_$HistoryWithRelationsImpl> get copyWith => __$$HistoryWithRelationsImplCopyWithImpl<_$HistoryWithRelationsImpl>(this, _$identity);








}


abstract class _HistoryWithRelations implements HistoryWithRelations {
  const factory _HistoryWithRelations({required final  int id, required final  int chapterId, required final  int mangaId, required final  String title, required final  double chapterNumber, final  DateTime? readAt, required final  int readDuration, required final  MangaCover coverData}) = _$HistoryWithRelationsImpl;
  

  

@override  int get id;@override  int get chapterId;@override  int get mangaId;@override  String get title;@override  double get chapterNumber;@override  DateTime? get readAt;@override  int get readDuration;@override  MangaCover get coverData;
@override @JsonKey(ignore: true)
_$$HistoryWithRelationsImplCopyWith<_$HistoryWithRelationsImpl> get copyWith => throw _privateConstructorUsedError;

}
