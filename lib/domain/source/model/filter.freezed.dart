// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'filter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;


final _privateConstructorUsedError = UnsupportedError('It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$FilterSortSelection {

 int get index => throw _privateConstructorUsedError; bool get ascending => throw _privateConstructorUsedError;







@JsonKey(ignore: true)
$FilterSortSelectionCopyWith<FilterSortSelection> get copyWith => throw _privateConstructorUsedError;

}

/// @nodoc
abstract class $FilterSortSelectionCopyWith<$Res>  {
  factory $FilterSortSelectionCopyWith(FilterSortSelection value, $Res Function(FilterSortSelection) then) = _$FilterSortSelectionCopyWithImpl<$Res, FilterSortSelection>;
@useResult
$Res call({
 int index, bool ascending
});



}

/// @nodoc
class _$FilterSortSelectionCopyWithImpl<$Res,$Val extends FilterSortSelection> implements $FilterSortSelectionCopyWith<$Res> {
  _$FilterSortSelectionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

@pragma('vm:prefer-inline') @override $Res call({Object? index = null,Object? ascending = null,}) {
  return _then(_value.copyWith(
index: null == index ? _value.index : index // ignore: cast_nullable_to_non_nullable
as int,ascending: null == ascending ? _value.ascending : ascending // ignore: cast_nullable_to_non_nullable
as bool,
  )as $Val);
}

}


/// @nodoc
abstract class _$$FilterSortSelectionImplCopyWith<$Res> implements $FilterSortSelectionCopyWith<$Res> {
  factory _$$FilterSortSelectionImplCopyWith(_$FilterSortSelectionImpl value, $Res Function(_$FilterSortSelectionImpl) then) = __$$FilterSortSelectionImplCopyWithImpl<$Res>;
@override @useResult
$Res call({
 int index, bool ascending
});



}

/// @nodoc
class __$$FilterSortSelectionImplCopyWithImpl<$Res> extends _$FilterSortSelectionCopyWithImpl<$Res, _$FilterSortSelectionImpl> implements _$$FilterSortSelectionImplCopyWith<$Res> {
  __$$FilterSortSelectionImplCopyWithImpl(_$FilterSortSelectionImpl _value, $Res Function(_$FilterSortSelectionImpl) _then)
      : super(_value, _then);


@pragma('vm:prefer-inline') @override $Res call({Object? index = null,Object? ascending = null,}) {
  return _then(_$FilterSortSelectionImpl(
index: null == index ? _value.index : index // ignore: cast_nullable_to_non_nullable
as int,ascending: null == ascending ? _value.ascending : ascending // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc


class _$FilterSortSelectionImpl  implements _FilterSortSelection {
  const _$FilterSortSelectionImpl({required this.index, required this.ascending});

  

@override final  int index;
@override final  bool ascending;

@override
String toString() {
  return 'FilterSortSelection(index: $index, ascending: $ascending)';
}


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _$FilterSortSelectionImpl&&(identical(other.index, index) || other.index == index)&&(identical(other.ascending, ascending) || other.ascending == ascending));
}


@override
int get hashCode => Object.hash(runtimeType,index,ascending);

@JsonKey(ignore: true)
@override
@pragma('vm:prefer-inline')
_$$FilterSortSelectionImplCopyWith<_$FilterSortSelectionImpl> get copyWith => __$$FilterSortSelectionImplCopyWithImpl<_$FilterSortSelectionImpl>(this, _$identity);








}


abstract class _FilterSortSelection implements FilterSortSelection {
  const factory _FilterSortSelection({required final  int index, required final  bool ascending}) = _$FilterSortSelectionImpl;
  

  

@override  int get index;@override  bool get ascending;
@override @JsonKey(ignore: true)
_$$FilterSortSelectionImplCopyWith<_$FilterSortSelectionImpl> get copyWith => throw _privateConstructorUsedError;

}
