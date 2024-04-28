// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'track_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;


final _privateConstructorUsedError = UnsupportedError('It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TrackItem {

 MangaSyncData? get track => throw _privateConstructorUsedError; Tracker get tracker => throw _privateConstructorUsedError;







@JsonKey(ignore: true)
$TrackItemCopyWith<TrackItem> get copyWith => throw _privateConstructorUsedError;

}

/// @nodoc
abstract class $TrackItemCopyWith<$Res>  {
  factory $TrackItemCopyWith(TrackItem value, $Res Function(TrackItem) then) = _$TrackItemCopyWithImpl<$Res, TrackItem>;
@useResult
$Res call({
 MangaSyncData? track, Tracker tracker
});



}

/// @nodoc
class _$TrackItemCopyWithImpl<$Res,$Val extends TrackItem> implements $TrackItemCopyWith<$Res> {
  _$TrackItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

@pragma('vm:prefer-inline') @override $Res call({Object? track = freezed,Object? tracker = null,}) {
  return _then(_value.copyWith(
track: freezed == track ? _value.track : track // ignore: cast_nullable_to_non_nullable
as MangaSyncData?,tracker: null == tracker ? _value.tracker : tracker // ignore: cast_nullable_to_non_nullable
as Tracker,
  )as $Val);
}

}


/// @nodoc
abstract class _$$TrackItemImplCopyWith<$Res> implements $TrackItemCopyWith<$Res> {
  factory _$$TrackItemImplCopyWith(_$TrackItemImpl value, $Res Function(_$TrackItemImpl) then) = __$$TrackItemImplCopyWithImpl<$Res>;
@override @useResult
$Res call({
 MangaSyncData? track, Tracker tracker
});



}

/// @nodoc
class __$$TrackItemImplCopyWithImpl<$Res> extends _$TrackItemCopyWithImpl<$Res, _$TrackItemImpl> implements _$$TrackItemImplCopyWith<$Res> {
  __$$TrackItemImplCopyWithImpl(_$TrackItemImpl _value, $Res Function(_$TrackItemImpl) _then)
      : super(_value, _then);


@pragma('vm:prefer-inline') @override $Res call({Object? track = freezed,Object? tracker = null,}) {
  return _then(_$TrackItemImpl(
track: freezed == track ? _value.track : track // ignore: cast_nullable_to_non_nullable
as MangaSyncData?,tracker: null == tracker ? _value.tracker : tracker // ignore: cast_nullable_to_non_nullable
as Tracker,
  ));
}


}

/// @nodoc


class _$TrackItemImpl  implements _TrackItem {
  const _$TrackItemImpl({this.track, required this.tracker});

  

@override final  MangaSyncData? track;
@override final  Tracker tracker;

@override
String toString() {
  return 'TrackItem(track: $track, tracker: $tracker)';
}


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _$TrackItemImpl&&(identical(other.track, track) || other.track == track)&&(identical(other.tracker, tracker) || other.tracker == tracker));
}


@override
int get hashCode => Object.hash(runtimeType,track,tracker);

@JsonKey(ignore: true)
@override
@pragma('vm:prefer-inline')
_$$TrackItemImplCopyWith<_$TrackItemImpl> get copyWith => __$$TrackItemImplCopyWithImpl<_$TrackItemImpl>(this, _$identity);








}


abstract class _TrackItem implements TrackItem {
  const factory _TrackItem({final  MangaSyncData? track, required final  Tracker tracker}) = _$TrackItemImpl;
  

  

@override  MangaSyncData? get track;@override  Tracker get tracker;
@override @JsonKey(ignore: true)
_$$TrackItemImplCopyWith<_$TrackItemImpl> get copyWith => throw _privateConstructorUsedError;

}
