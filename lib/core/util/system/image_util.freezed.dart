// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'image_util.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;


final _privateConstructorUsedError = UnsupportedError('It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SplitData {

 int get index => throw _privateConstructorUsedError; int get topOffset => throw _privateConstructorUsedError; int get splitHeight => throw _privateConstructorUsedError; int get splitWidth => throw _privateConstructorUsedError;







@JsonKey(ignore: true)
$SplitDataCopyWith<SplitData> get copyWith => throw _privateConstructorUsedError;

}

/// @nodoc
abstract class $SplitDataCopyWith<$Res>  {
  factory $SplitDataCopyWith(SplitData value, $Res Function(SplitData) then) = _$SplitDataCopyWithImpl<$Res, SplitData>;
@useResult
$Res call({
 int index, int topOffset, int splitHeight, int splitWidth
});



}

/// @nodoc
class _$SplitDataCopyWithImpl<$Res,$Val extends SplitData> implements $SplitDataCopyWith<$Res> {
  _$SplitDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

@pragma('vm:prefer-inline') @override $Res call({Object? index = null,Object? topOffset = null,Object? splitHeight = null,Object? splitWidth = null,}) {
  return _then(_value.copyWith(
index: null == index ? _value.index : index // ignore: cast_nullable_to_non_nullable
as int,topOffset: null == topOffset ? _value.topOffset : topOffset // ignore: cast_nullable_to_non_nullable
as int,splitHeight: null == splitHeight ? _value.splitHeight : splitHeight // ignore: cast_nullable_to_non_nullable
as int,splitWidth: null == splitWidth ? _value.splitWidth : splitWidth // ignore: cast_nullable_to_non_nullable
as int,
  )as $Val);
}

}


/// @nodoc
abstract class _$$SplitDataImplCopyWith<$Res> implements $SplitDataCopyWith<$Res> {
  factory _$$SplitDataImplCopyWith(_$SplitDataImpl value, $Res Function(_$SplitDataImpl) then) = __$$SplitDataImplCopyWithImpl<$Res>;
@override @useResult
$Res call({
 int index, int topOffset, int splitHeight, int splitWidth
});



}

/// @nodoc
class __$$SplitDataImplCopyWithImpl<$Res> extends _$SplitDataCopyWithImpl<$Res, _$SplitDataImpl> implements _$$SplitDataImplCopyWith<$Res> {
  __$$SplitDataImplCopyWithImpl(_$SplitDataImpl _value, $Res Function(_$SplitDataImpl) _then)
      : super(_value, _then);


@pragma('vm:prefer-inline') @override $Res call({Object? index = null,Object? topOffset = null,Object? splitHeight = null,Object? splitWidth = null,}) {
  return _then(_$SplitDataImpl(
null == index ? _value.index : index // ignore: cast_nullable_to_non_nullable
as int,null == topOffset ? _value.topOffset : topOffset // ignore: cast_nullable_to_non_nullable
as int,null == splitHeight ? _value.splitHeight : splitHeight // ignore: cast_nullable_to_non_nullable
as int,null == splitWidth ? _value.splitWidth : splitWidth // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class _$SplitDataImpl extends _SplitData  {
  const _$SplitDataImpl(this.index, this.topOffset, this.splitHeight, this.splitWidth): super._();

  

@override final  int index;
@override final  int topOffset;
@override final  int splitHeight;
@override final  int splitWidth;

@override
String toString() {
  return 'SplitData(index: $index, topOffset: $topOffset, splitHeight: $splitHeight, splitWidth: $splitWidth)';
}


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _$SplitDataImpl&&(identical(other.index, index) || other.index == index)&&(identical(other.topOffset, topOffset) || other.topOffset == topOffset)&&(identical(other.splitHeight, splitHeight) || other.splitHeight == splitHeight)&&(identical(other.splitWidth, splitWidth) || other.splitWidth == splitWidth));
}


@override
int get hashCode => Object.hash(runtimeType,index,topOffset,splitHeight,splitWidth);

@JsonKey(ignore: true)
@override
@pragma('vm:prefer-inline')
_$$SplitDataImplCopyWith<_$SplitDataImpl> get copyWith => __$$SplitDataImplCopyWithImpl<_$SplitDataImpl>(this, _$identity);








}


abstract class _SplitData extends SplitData {
  const factory _SplitData(final  int index, final  int topOffset, final  int splitHeight, final  int splitWidth) = _$SplitDataImpl;
  const _SplitData._(): super._();

  

@override  int get index;@override  int get topOffset;@override  int get splitHeight;@override  int get splitWidth;
@override @JsonKey(ignore: true)
_$$SplitDataImplCopyWith<_$SplitDataImpl> get copyWith => throw _privateConstructorUsedError;

}
