// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'clear_database.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;


final _privateConstructorUsedError = UnsupportedError('It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ClearDatabaseScreenState {

 List<SourceWithCount> get items => throw _privateConstructorUsedError; List<int> get selection => throw _privateConstructorUsedError;







@JsonKey(ignore: true)
$ClearDatabaseScreenStateCopyWith<ClearDatabaseScreenState> get copyWith => throw _privateConstructorUsedError;

}

/// @nodoc
abstract class $ClearDatabaseScreenStateCopyWith<$Res>  {
  factory $ClearDatabaseScreenStateCopyWith(ClearDatabaseScreenState value, $Res Function(ClearDatabaseScreenState) then) = _$ClearDatabaseScreenStateCopyWithImpl<$Res, ClearDatabaseScreenState>;
@useResult
$Res call({
 List<SourceWithCount> items, List<int> selection
});



}

/// @nodoc
class _$ClearDatabaseScreenStateCopyWithImpl<$Res,$Val extends ClearDatabaseScreenState> implements $ClearDatabaseScreenStateCopyWith<$Res> {
  _$ClearDatabaseScreenStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

@pragma('vm:prefer-inline') @override $Res call({Object? items = null,Object? selection = null,}) {
  return _then(_value.copyWith(
items: null == items ? _value.items : items // ignore: cast_nullable_to_non_nullable
as List<SourceWithCount>,selection: null == selection ? _value.selection : selection // ignore: cast_nullable_to_non_nullable
as List<int>,
  )as $Val);
}

}


/// @nodoc
abstract class _$$ClearDatabaseScreenStateImplCopyWith<$Res> implements $ClearDatabaseScreenStateCopyWith<$Res> {
  factory _$$ClearDatabaseScreenStateImplCopyWith(_$ClearDatabaseScreenStateImpl value, $Res Function(_$ClearDatabaseScreenStateImpl) then) = __$$ClearDatabaseScreenStateImplCopyWithImpl<$Res>;
@override @useResult
$Res call({
 List<SourceWithCount> items, List<int> selection
});



}

/// @nodoc
class __$$ClearDatabaseScreenStateImplCopyWithImpl<$Res> extends _$ClearDatabaseScreenStateCopyWithImpl<$Res, _$ClearDatabaseScreenStateImpl> implements _$$ClearDatabaseScreenStateImplCopyWith<$Res> {
  __$$ClearDatabaseScreenStateImplCopyWithImpl(_$ClearDatabaseScreenStateImpl _value, $Res Function(_$ClearDatabaseScreenStateImpl) _then)
      : super(_value, _then);


@pragma('vm:prefer-inline') @override $Res call({Object? items = null,Object? selection = null,}) {
  return _then(_$ClearDatabaseScreenStateImpl(
items: null == items ? _value._items : items // ignore: cast_nullable_to_non_nullable
as List<SourceWithCount>,selection: null == selection ? _value._selection : selection // ignore: cast_nullable_to_non_nullable
as List<int>,
  ));
}


}

/// @nodoc


class _$ClearDatabaseScreenStateImpl  implements _ClearDatabaseScreenState {
  const _$ClearDatabaseScreenStateImpl({required final  List<SourceWithCount> items, final  List<int> selection = const []}): _items = items,_selection = selection;

  

 final  List<SourceWithCount> _items;
@override List<SourceWithCount> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

 final  List<int> _selection;
@override@JsonKey() List<int> get selection {
  if (_selection is EqualUnmodifiableListView) return _selection;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_selection);
}


@override
String toString() {
  return 'ClearDatabaseScreenState(items: $items, selection: $selection)';
}


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _$ClearDatabaseScreenStateImpl&&const DeepCollectionEquality().equals(other._items, _items)&&const DeepCollectionEquality().equals(other._selection, _selection));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_items),const DeepCollectionEquality().hash(_selection));

@JsonKey(ignore: true)
@override
@pragma('vm:prefer-inline')
_$$ClearDatabaseScreenStateImplCopyWith<_$ClearDatabaseScreenStateImpl> get copyWith => __$$ClearDatabaseScreenStateImplCopyWithImpl<_$ClearDatabaseScreenStateImpl>(this, _$identity);








}


abstract class _ClearDatabaseScreenState implements ClearDatabaseScreenState {
  const factory _ClearDatabaseScreenState({required final  List<SourceWithCount> items, final  List<int> selection}) = _$ClearDatabaseScreenStateImpl;
  

  

@override  List<SourceWithCount> get items;@override  List<int> get selection;
@override @JsonKey(ignore: true)
_$$ClearDatabaseScreenStateImplCopyWith<_$ClearDatabaseScreenStateImpl> get copyWith => throw _privateConstructorUsedError;

}
