// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'source.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Source {
  int get id => throw _privateConstructorUsedError;
  String get lang => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  bool get supportsLatest => throw _privateConstructorUsedError;
  bool get isStub => throw _privateConstructorUsedError;
  Pins get pin => throw _privateConstructorUsedError;
  bool get isUsedLast => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SourceCopyWith<Source> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SourceCopyWith<$Res> {
  factory $SourceCopyWith(Source value, $Res Function(Source) then) =
      _$SourceCopyWithImpl<$Res, Source>;
  @useResult
  $Res call(
      {int id,
      String lang,
      String name,
      bool supportsLatest,
      bool isStub,
      Pins pin,
      bool isUsedLast});

  $PinsCopyWith<$Res> get pin;
}

/// @nodoc
class _$SourceCopyWithImpl<$Res, $Val extends Source>
    implements $SourceCopyWith<$Res> {
  _$SourceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? lang = null,
    Object? name = null,
    Object? supportsLatest = null,
    Object? isStub = null,
    Object? pin = null,
    Object? isUsedLast = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      lang: null == lang
          ? _value.lang
          : lang // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      supportsLatest: null == supportsLatest
          ? _value.supportsLatest
          : supportsLatest // ignore: cast_nullable_to_non_nullable
              as bool,
      isStub: null == isStub
          ? _value.isStub
          : isStub // ignore: cast_nullable_to_non_nullable
              as bool,
      pin: null == pin
          ? _value.pin
          : pin // ignore: cast_nullable_to_non_nullable
              as Pins,
      isUsedLast: null == isUsedLast
          ? _value.isUsedLast
          : isUsedLast // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PinsCopyWith<$Res> get pin {
    return $PinsCopyWith<$Res>(_value.pin, (value) {
      return _then(_value.copyWith(pin: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SourceImplCopyWith<$Res> implements $SourceCopyWith<$Res> {
  factory _$$SourceImplCopyWith(
          _$SourceImpl value, $Res Function(_$SourceImpl) then) =
      __$$SourceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String lang,
      String name,
      bool supportsLatest,
      bool isStub,
      Pins pin,
      bool isUsedLast});

  @override
  $PinsCopyWith<$Res> get pin;
}

/// @nodoc
class __$$SourceImplCopyWithImpl<$Res>
    extends _$SourceCopyWithImpl<$Res, _$SourceImpl>
    implements _$$SourceImplCopyWith<$Res> {
  __$$SourceImplCopyWithImpl(
      _$SourceImpl _value, $Res Function(_$SourceImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? lang = null,
    Object? name = null,
    Object? supportsLatest = null,
    Object? isStub = null,
    Object? pin = null,
    Object? isUsedLast = null,
  }) {
    return _then(_$SourceImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      lang: null == lang
          ? _value.lang
          : lang // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      supportsLatest: null == supportsLatest
          ? _value.supportsLatest
          : supportsLatest // ignore: cast_nullable_to_non_nullable
              as bool,
      isStub: null == isStub
          ? _value.isStub
          : isStub // ignore: cast_nullable_to_non_nullable
              as bool,
      pin: null == pin
          ? _value.pin
          : pin // ignore: cast_nullable_to_non_nullable
              as Pins,
      isUsedLast: null == isUsedLast
          ? _value.isUsedLast
          : isUsedLast // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$SourceImpl extends _Source {
  const _$SourceImpl(
      {required this.id,
      required this.lang,
      required this.name,
      required this.supportsLatest,
      required this.isStub,
      required this.pin = Pins.unpinned,
      required this.isUsedLast = false})
      : super._();

  @override
  final int id;
  @override
  final String lang;
  @override
  final String name;
  @override
  final bool supportsLatest;
  @override
  final bool isStub;
  @override
  @JsonKey()
  final Pins pin;
  @override
  @JsonKey()
  final bool isUsedLast;

  @override
  String toString() {
    return 'Source(id: $id, lang: $lang, name: $name, supportsLatest: $supportsLatest, isStub: $isStub, pin: $pin, isUsedLast: $isUsedLast)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SourceImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.lang, lang) || other.lang == lang) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.supportsLatest, supportsLatest) ||
                other.supportsLatest == supportsLatest) &&
            (identical(other.isStub, isStub) || other.isStub == isStub) &&
            (identical(other.pin, pin) || other.pin == pin) &&
            (identical(other.isUsedLast, isUsedLast) ||
                other.isUsedLast == isUsedLast));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, id, lang, name, supportsLatest, isStub, pin, isUsedLast);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SourceImplCopyWith<_$SourceImpl> get copyWith =>
      __$$SourceImplCopyWithImpl<_$SourceImpl>(this, _$identity);
}

abstract class _Source extends Source {
  const factory _Source(
      {required final int id,
      required final String lang,
      required final String name,
      required final bool supportsLatest,
      required final bool isStub,
      required final Pins pin,
      required final bool isUsedLast}) = _$SourceImpl;
  const _Source._() : super._();

  @override
  int get id;
  @override
  String get lang;
  @override
  String get name;
  @override
  bool get supportsLatest;
  @override
  bool get isStub;
  @override
  Pins get pin;
  @override
  bool get isUsedLast;
  @override
  @JsonKey(ignore: true)
  _$$SourceImplCopyWith<_$SourceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
