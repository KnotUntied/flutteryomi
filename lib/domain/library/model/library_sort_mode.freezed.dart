// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'library_sort_mode.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$LibrarySort {
  Type get type => throw _privateConstructorUsedError;
  Direction get direction => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LibrarySortCopyWith<LibrarySort> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LibrarySortCopyWith<$Res> {
  factory $LibrarySortCopyWith(
          LibrarySort value, $Res Function(LibrarySort) then) =
      _$LibrarySortCopyWithImpl<$Res, LibrarySort>;
  @useResult
  $Res call({Type type, Direction direction});
}

/// @nodoc
class _$LibrarySortCopyWithImpl<$Res, $Val extends LibrarySort>
    implements $LibrarySortCopyWith<$Res> {
  _$LibrarySortCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? direction = null,
  }) {
    return _then(_value.copyWith(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as Type,
      direction: null == direction
          ? _value.direction
          : direction // ignore: cast_nullable_to_non_nullable
              as Direction,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LibrarySortImplCopyWith<$Res>
    implements $LibrarySortCopyWith<$Res> {
  factory _$$LibrarySortImplCopyWith(
          _$LibrarySortImpl value, $Res Function(_$LibrarySortImpl) then) =
      __$$LibrarySortImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Type type, Direction direction});
}

/// @nodoc
class __$$LibrarySortImplCopyWithImpl<$Res>
    extends _$LibrarySortCopyWithImpl<$Res, _$LibrarySortImpl>
    implements _$$LibrarySortImplCopyWith<$Res> {
  __$$LibrarySortImplCopyWithImpl(
      _$LibrarySortImpl _value, $Res Function(_$LibrarySortImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? direction = null,
  }) {
    return _then(_$LibrarySortImpl(
      null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as Type,
      null == direction
          ? _value.direction
          : direction // ignore: cast_nullable_to_non_nullable
              as Direction,
    ));
  }
}

/// @nodoc

class _$LibrarySortImpl extends _LibrarySort {
  const _$LibrarySortImpl(this.type, this.direction) : super._();

  @override
  final Type type;
  @override
  final Direction direction;

  @override
  String toString() {
    return 'LibrarySort(type: $type, direction: $direction)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LibrarySortImpl &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.direction, direction) ||
                other.direction == direction));
  }

  @override
  int get hashCode => Object.hash(runtimeType, type, direction);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LibrarySortImplCopyWith<_$LibrarySortImpl> get copyWith =>
      __$$LibrarySortImplCopyWithImpl<_$LibrarySortImpl>(this, _$identity);
}

abstract class _LibrarySort extends LibrarySort {
  const factory _LibrarySort(final Type type, final Direction direction) =
      _$LibrarySortImpl;
  const _LibrarySort._() : super._();

  @override
  Type get type;
  @override
  Direction get direction;
  @override
  @JsonKey(ignore: true)
  _$$LibrarySortImplCopyWith<_$LibrarySortImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
