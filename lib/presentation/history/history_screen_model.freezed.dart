// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'history_screen_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$HistoryScreenState {
  String? get searchQuery => throw _privateConstructorUsedError;
  List<HistoryUiModel>? get list => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HistoryScreenStateCopyWith<HistoryScreenState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HistoryScreenStateCopyWith<$Res> {
  factory $HistoryScreenStateCopyWith(
          HistoryScreenState value, $Res Function(HistoryScreenState) then) =
      _$HistoryScreenStateCopyWithImpl<$Res, HistoryScreenState>;
  @useResult
  $Res call({String? searchQuery, List<HistoryUiModel>? list});
}

/// @nodoc
class _$HistoryScreenStateCopyWithImpl<$Res, $Val extends HistoryScreenState>
    implements $HistoryScreenStateCopyWith<$Res> {
  _$HistoryScreenStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? searchQuery = freezed,
    Object? list = freezed,
  }) {
    return _then(_value.copyWith(
      searchQuery: freezed == searchQuery
          ? _value.searchQuery
          : searchQuery // ignore: cast_nullable_to_non_nullable
              as String?,
      list: freezed == list
          ? _value.list
          : list // ignore: cast_nullable_to_non_nullable
              as List<HistoryUiModel>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HistoryScreenStateImplCopyWith<$Res>
    implements $HistoryScreenStateCopyWith<$Res> {
  factory _$$HistoryScreenStateImplCopyWith(_$HistoryScreenStateImpl value,
          $Res Function(_$HistoryScreenStateImpl) then) =
      __$$HistoryScreenStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? searchQuery, List<HistoryUiModel>? list});
}

/// @nodoc
class __$$HistoryScreenStateImplCopyWithImpl<$Res>
    extends _$HistoryScreenStateCopyWithImpl<$Res, _$HistoryScreenStateImpl>
    implements _$$HistoryScreenStateImplCopyWith<$Res> {
  __$$HistoryScreenStateImplCopyWithImpl(_$HistoryScreenStateImpl _value,
      $Res Function(_$HistoryScreenStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? searchQuery = freezed,
    Object? list = freezed,
  }) {
    return _then(_$HistoryScreenStateImpl(
      searchQuery: freezed == searchQuery
          ? _value.searchQuery
          : searchQuery // ignore: cast_nullable_to_non_nullable
              as String?,
      list: freezed == list
          ? _value._list
          : list // ignore: cast_nullable_to_non_nullable
              as List<HistoryUiModel>?,
    ));
  }
}

/// @nodoc

class _$HistoryScreenStateImpl implements _HistoryScreenState {
  const _$HistoryScreenStateImpl(
      {this.searchQuery, final List<HistoryUiModel>? list})
      : _list = list;

  @override
  final String? searchQuery;
  final List<HistoryUiModel>? _list;
  @override
  List<HistoryUiModel>? get list {
    final value = _list;
    if (value == null) return null;
    if (_list is EqualUnmodifiableListView) return _list;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'HistoryScreenState(searchQuery: $searchQuery, list: $list)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HistoryScreenStateImpl &&
            (identical(other.searchQuery, searchQuery) ||
                other.searchQuery == searchQuery) &&
            const DeepCollectionEquality().equals(other._list, _list));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, searchQuery, const DeepCollectionEquality().hash(_list));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HistoryScreenStateImplCopyWith<_$HistoryScreenStateImpl> get copyWith =>
      __$$HistoryScreenStateImplCopyWithImpl<_$HistoryScreenStateImpl>(
          this, _$identity);
}

abstract class _HistoryScreenState implements HistoryScreenState {
  const factory _HistoryScreenState(
      {final String? searchQuery,
      final List<HistoryUiModel>? list}) = _$HistoryScreenStateImpl;

  @override
  String? get searchQuery;
  @override
  List<HistoryUiModel>? get list;
  @override
  @JsonKey(ignore: true)
  _$$HistoryScreenStateImplCopyWith<_$HistoryScreenStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
