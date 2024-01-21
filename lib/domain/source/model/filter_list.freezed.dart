// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'filter_list.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$FilterList {
  List<Filter> get list => throw _privateConstructorUsedError;
  set list(List<Filter> value) => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FilterListCopyWith<FilterList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FilterListCopyWith<$Res> {
  factory $FilterListCopyWith(
          FilterList value, $Res Function(FilterList) then) =
      _$FilterListCopyWithImpl<$Res, FilterList>;
  @useResult
  $Res call({List<Filter> list});
}

/// @nodoc
class _$FilterListCopyWithImpl<$Res, $Val extends FilterList>
    implements $FilterListCopyWith<$Res> {
  _$FilterListCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? list = null,
  }) {
    return _then(_value.copyWith(
      list: null == list
          ? _value.list
          : list // ignore: cast_nullable_to_non_nullable
              as List<Filter>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FilterListImplCopyWith<$Res>
    implements $FilterListCopyWith<$Res> {
  factory _$$FilterListImplCopyWith(
          _$FilterListImpl value, $Res Function(_$FilterListImpl) then) =
      __$$FilterListImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Filter> list});
}

/// @nodoc
class __$$FilterListImplCopyWithImpl<$Res>
    extends _$FilterListCopyWithImpl<$Res, _$FilterListImpl>
    implements _$$FilterListImplCopyWith<$Res> {
  __$$FilterListImplCopyWithImpl(
      _$FilterListImpl _value, $Res Function(_$FilterListImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? list = null,
  }) {
    return _then(_$FilterListImpl(
      null == list
          ? _value.list
          : list // ignore: cast_nullable_to_non_nullable
              as List<Filter>,
    ));
  }
}

/// @nodoc

class _$FilterListImpl extends _FilterList {
  _$FilterListImpl(this.list) : super._();

  @override
  List<Filter> list;

  @override
  String toString() {
    return 'FilterList(list: $list)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FilterListImplCopyWith<_$FilterListImpl> get copyWith =>
      __$$FilterListImplCopyWithImpl<_$FilterListImpl>(this, _$identity);
}

abstract class _FilterList extends FilterList {
  factory _FilterList(List<Filter> list) = _$FilterListImpl;
  _FilterList._() : super._();

  @override
  List<Filter> get list;
  set list(List<Filter> value);
  @override
  @JsonKey(ignore: true)
  _$$FilterListImplCopyWith<_$FilterListImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
