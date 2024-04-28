// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'source_with_count.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;


final _privateConstructorUsedError = UnsupportedError('It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SourceWithCount {

 Source get source => throw _privateConstructorUsedError; int get count => throw _privateConstructorUsedError;







@JsonKey(ignore: true)
$SourceWithCountCopyWith<SourceWithCount> get copyWith => throw _privateConstructorUsedError;

}

/// @nodoc
abstract class $SourceWithCountCopyWith<$Res>  {
  factory $SourceWithCountCopyWith(SourceWithCount value, $Res Function(SourceWithCount) then) = _$SourceWithCountCopyWithImpl<$Res, SourceWithCount>;
@useResult
$Res call({
 Source source, int count
});


$SourceCopyWith<$Res> get source;
}

/// @nodoc
class _$SourceWithCountCopyWithImpl<$Res,$Val extends SourceWithCount> implements $SourceWithCountCopyWith<$Res> {
  _$SourceWithCountCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

@pragma('vm:prefer-inline') @override $Res call({Object? source = null,Object? count = null,}) {
  return _then(_value.copyWith(
source: null == source ? _value.source : source // ignore: cast_nullable_to_non_nullable
as Source,count: null == count ? _value.count : count // ignore: cast_nullable_to_non_nullable
as int,
  )as $Val);
}
@override
@pragma('vm:prefer-inline')
$SourceCopyWith<$Res> get source {
  
  return $SourceCopyWith<$Res>(_value.source, (value) {
    return _then(_value.copyWith(source: value) as $Val);
  });
}
}


/// @nodoc
abstract class _$$SourceWithCountImplCopyWith<$Res> implements $SourceWithCountCopyWith<$Res> {
  factory _$$SourceWithCountImplCopyWith(_$SourceWithCountImpl value, $Res Function(_$SourceWithCountImpl) then) = __$$SourceWithCountImplCopyWithImpl<$Res>;
@override @useResult
$Res call({
 Source source, int count
});


@override $SourceCopyWith<$Res> get source;
}

/// @nodoc
class __$$SourceWithCountImplCopyWithImpl<$Res> extends _$SourceWithCountCopyWithImpl<$Res, _$SourceWithCountImpl> implements _$$SourceWithCountImplCopyWith<$Res> {
  __$$SourceWithCountImplCopyWithImpl(_$SourceWithCountImpl _value, $Res Function(_$SourceWithCountImpl) _then)
      : super(_value, _then);


@pragma('vm:prefer-inline') @override $Res call({Object? source = null,Object? count = null,}) {
  return _then(_$SourceWithCountImpl(
source: null == source ? _value.source : source // ignore: cast_nullable_to_non_nullable
as Source,count: null == count ? _value.count : count // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class _$SourceWithCountImpl extends _SourceWithCount  {
  const _$SourceWithCountImpl({required this.source, required this.count}): super._();

  

@override final  Source source;
@override final  int count;

@override
String toString() {
  return 'SourceWithCount(source: $source, count: $count)';
}


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _$SourceWithCountImpl&&(identical(other.source, source) || other.source == source)&&(identical(other.count, count) || other.count == count));
}


@override
int get hashCode => Object.hash(runtimeType,source,count);

@JsonKey(ignore: true)
@override
@pragma('vm:prefer-inline')
_$$SourceWithCountImplCopyWith<_$SourceWithCountImpl> get copyWith => __$$SourceWithCountImplCopyWithImpl<_$SourceWithCountImpl>(this, _$identity);








}


abstract class _SourceWithCount extends SourceWithCount {
  const factory _SourceWithCount({required final  Source source, required final  int count}) = _$SourceWithCountImpl;
  const _SourceWithCount._(): super._();

  

@override  Source get source;@override  int get count;
@override @JsonKey(ignore: true)
_$$SourceWithCountImplCopyWith<_$SourceWithCountImpl> get copyWith => throw _privateConstructorUsedError;

}
