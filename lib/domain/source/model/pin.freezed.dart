// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pin.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Pins {
  int get code => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PinsCopyWith<Pins> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PinsCopyWith<$Res> {
  factory $PinsCopyWith(Pins value, $Res Function(Pins) then) =
      _$PinsCopyWithImpl<$Res, Pins>;
  @useResult
  $Res call({int code});
}

/// @nodoc
class _$PinsCopyWithImpl<$Res, $Val extends Pins>
    implements $PinsCopyWith<$Res> {
  _$PinsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
  }) {
    return _then(_value.copyWith(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PinsImplCopyWith<$Res> implements $PinsCopyWith<$Res> {
  factory _$$PinsImplCopyWith(
          _$PinsImpl value, $Res Function(_$PinsImpl) then) =
      __$$PinsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int code});
}

/// @nodoc
class __$$PinsImplCopyWithImpl<$Res>
    extends _$PinsCopyWithImpl<$Res, _$PinsImpl>
    implements _$$PinsImplCopyWith<$Res> {
  __$$PinsImplCopyWithImpl(_$PinsImpl _value, $Res Function(_$PinsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
  }) {
    return _then(_$PinsImpl(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$PinsImpl extends _Pins {
  const _$PinsImpl({required this.code = 0x0}) : super._();

  @override
  @JsonKey()
  final int code;

  @override
  String toString() {
    return 'Pins(code: $code)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PinsImpl &&
            (identical(other.code, code) || other.code == code));
  }

  @override
  int get hashCode => Object.hash(runtimeType, code);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PinsImplCopyWith<_$PinsImpl> get copyWith =>
      __$$PinsImplCopyWithImpl<_$PinsImpl>(this, _$identity);
}

abstract class _Pins extends Pins {
  const factory _Pins({required final int code}) = _$PinsImpl;
  const _Pins._() : super._();

  @override
  int get code;
  @override
  @JsonKey(ignore: true)
  _$$PinsImplCopyWith<_$PinsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
