// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'checkbox_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CheckboxRegularState<T> {
  T get value => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T value) checked,
    required TResult Function(T value) none,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(T value)? checked,
    TResult? Function(T value)? none,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T value)? checked,
    TResult Function(T value)? none,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CheckboxRegularStateChecked<T> value) checked,
    required TResult Function(CheckboxRegularStateNone<T> value) none,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CheckboxRegularStateChecked<T> value)? checked,
    TResult? Function(CheckboxRegularStateNone<T> value)? none,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CheckboxRegularStateChecked<T> value)? checked,
    TResult Function(CheckboxRegularStateNone<T> value)? none,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CheckboxRegularStateCopyWith<T, CheckboxRegularState<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CheckboxRegularStateCopyWith<T, $Res> {
  factory $CheckboxRegularStateCopyWith(CheckboxRegularState<T> value,
          $Res Function(CheckboxRegularState<T>) then) =
      _$CheckboxRegularStateCopyWithImpl<T, $Res, CheckboxRegularState<T>>;
  @useResult
  $Res call({T value});
}

/// @nodoc
class _$CheckboxRegularStateCopyWithImpl<T, $Res,
        $Val extends CheckboxRegularState<T>>
    implements $CheckboxRegularStateCopyWith<T, $Res> {
  _$CheckboxRegularStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_value.copyWith(
      value: freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as T,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CheckboxRegularStateCheckedImplCopyWith<T, $Res>
    implements $CheckboxRegularStateCopyWith<T, $Res> {
  factory _$$CheckboxRegularStateCheckedImplCopyWith(
          _$CheckboxRegularStateCheckedImpl<T> value,
          $Res Function(_$CheckboxRegularStateCheckedImpl<T>) then) =
      __$$CheckboxRegularStateCheckedImplCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call({T value});
}

/// @nodoc
class __$$CheckboxRegularStateCheckedImplCopyWithImpl<T, $Res>
    extends _$CheckboxRegularStateCopyWithImpl<T, $Res,
        _$CheckboxRegularStateCheckedImpl<T>>
    implements _$$CheckboxRegularStateCheckedImplCopyWith<T, $Res> {
  __$$CheckboxRegularStateCheckedImplCopyWithImpl(
      _$CheckboxRegularStateCheckedImpl<T> _value,
      $Res Function(_$CheckboxRegularStateCheckedImpl<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_$CheckboxRegularStateCheckedImpl<T>(
      freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc

class _$CheckboxRegularStateCheckedImpl<T>
    extends CheckboxRegularStateChecked<T> {
  const _$CheckboxRegularStateCheckedImpl(this.value) : super._();

  @override
  final T value;

  @override
  String toString() {
    return 'CheckboxRegularState<$T>.checked(value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CheckboxRegularStateCheckedImpl<T> &&
            const DeepCollectionEquality().equals(other.value, value));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(value));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CheckboxRegularStateCheckedImplCopyWith<T,
          _$CheckboxRegularStateCheckedImpl<T>>
      get copyWith => __$$CheckboxRegularStateCheckedImplCopyWithImpl<T,
          _$CheckboxRegularStateCheckedImpl<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T value) checked,
    required TResult Function(T value) none,
  }) {
    return checked(value);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(T value)? checked,
    TResult? Function(T value)? none,
  }) {
    return checked?.call(value);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T value)? checked,
    TResult Function(T value)? none,
    required TResult orElse(),
  }) {
    if (checked != null) {
      return checked(value);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CheckboxRegularStateChecked<T> value) checked,
    required TResult Function(CheckboxRegularStateNone<T> value) none,
  }) {
    return checked(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CheckboxRegularStateChecked<T> value)? checked,
    TResult? Function(CheckboxRegularStateNone<T> value)? none,
  }) {
    return checked?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CheckboxRegularStateChecked<T> value)? checked,
    TResult Function(CheckboxRegularStateNone<T> value)? none,
    required TResult orElse(),
  }) {
    if (checked != null) {
      return checked(this);
    }
    return orElse();
  }
}

abstract class CheckboxRegularStateChecked<T> extends CheckboxRegularState<T> {
  const factory CheckboxRegularStateChecked(final T value) =
      _$CheckboxRegularStateCheckedImpl<T>;
  const CheckboxRegularStateChecked._() : super._();

  @override
  T get value;
  @override
  @JsonKey(ignore: true)
  _$$CheckboxRegularStateCheckedImplCopyWith<T,
          _$CheckboxRegularStateCheckedImpl<T>>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CheckboxRegularStateNoneImplCopyWith<T, $Res>
    implements $CheckboxRegularStateCopyWith<T, $Res> {
  factory _$$CheckboxRegularStateNoneImplCopyWith(
          _$CheckboxRegularStateNoneImpl<T> value,
          $Res Function(_$CheckboxRegularStateNoneImpl<T>) then) =
      __$$CheckboxRegularStateNoneImplCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call({T value});
}

/// @nodoc
class __$$CheckboxRegularStateNoneImplCopyWithImpl<T, $Res>
    extends _$CheckboxRegularStateCopyWithImpl<T, $Res,
        _$CheckboxRegularStateNoneImpl<T>>
    implements _$$CheckboxRegularStateNoneImplCopyWith<T, $Res> {
  __$$CheckboxRegularStateNoneImplCopyWithImpl(
      _$CheckboxRegularStateNoneImpl<T> _value,
      $Res Function(_$CheckboxRegularStateNoneImpl<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_$CheckboxRegularStateNoneImpl<T>(
      freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc

class _$CheckboxRegularStateNoneImpl<T> extends CheckboxRegularStateNone<T> {
  const _$CheckboxRegularStateNoneImpl(this.value) : super._();

  @override
  final T value;

  @override
  String toString() {
    return 'CheckboxRegularState<$T>.none(value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CheckboxRegularStateNoneImpl<T> &&
            const DeepCollectionEquality().equals(other.value, value));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(value));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CheckboxRegularStateNoneImplCopyWith<T, _$CheckboxRegularStateNoneImpl<T>>
      get copyWith => __$$CheckboxRegularStateNoneImplCopyWithImpl<T,
          _$CheckboxRegularStateNoneImpl<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T value) checked,
    required TResult Function(T value) none,
  }) {
    return none(value);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(T value)? checked,
    TResult? Function(T value)? none,
  }) {
    return none?.call(value);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T value)? checked,
    TResult Function(T value)? none,
    required TResult orElse(),
  }) {
    if (none != null) {
      return none(value);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CheckboxRegularStateChecked<T> value) checked,
    required TResult Function(CheckboxRegularStateNone<T> value) none,
  }) {
    return none(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CheckboxRegularStateChecked<T> value)? checked,
    TResult? Function(CheckboxRegularStateNone<T> value)? none,
  }) {
    return none?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CheckboxRegularStateChecked<T> value)? checked,
    TResult Function(CheckboxRegularStateNone<T> value)? none,
    required TResult orElse(),
  }) {
    if (none != null) {
      return none(this);
    }
    return orElse();
  }
}

abstract class CheckboxRegularStateNone<T> extends CheckboxRegularState<T> {
  const factory CheckboxRegularStateNone(final T value) =
      _$CheckboxRegularStateNoneImpl<T>;
  const CheckboxRegularStateNone._() : super._();

  @override
  T get value;
  @override
  @JsonKey(ignore: true)
  _$$CheckboxRegularStateNoneImplCopyWith<T, _$CheckboxRegularStateNoneImpl<T>>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$CheckboxTriState<T> {
  T get value => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T value) include,
    required TResult Function(T value) exclude,
    required TResult Function(T value) none,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(T value)? include,
    TResult? Function(T value)? exclude,
    TResult? Function(T value)? none,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T value)? include,
    TResult Function(T value)? exclude,
    TResult Function(T value)? none,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CheckboxTriStateInclude<T> value) include,
    required TResult Function(CheckboxTriStateExclude<T> value) exclude,
    required TResult Function(CheckboxTriStateNone<T> value) none,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CheckboxTriStateInclude<T> value)? include,
    TResult? Function(CheckboxTriStateExclude<T> value)? exclude,
    TResult? Function(CheckboxTriStateNone<T> value)? none,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CheckboxTriStateInclude<T> value)? include,
    TResult Function(CheckboxTriStateExclude<T> value)? exclude,
    TResult Function(CheckboxTriStateNone<T> value)? none,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CheckboxTriStateCopyWith<T, CheckboxTriState<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CheckboxTriStateCopyWith<T, $Res> {
  factory $CheckboxTriStateCopyWith(
          CheckboxTriState<T> value, $Res Function(CheckboxTriState<T>) then) =
      _$CheckboxTriStateCopyWithImpl<T, $Res, CheckboxTriState<T>>;
  @useResult
  $Res call({T value});
}

/// @nodoc
class _$CheckboxTriStateCopyWithImpl<T, $Res, $Val extends CheckboxTriState<T>>
    implements $CheckboxTriStateCopyWith<T, $Res> {
  _$CheckboxTriStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_value.copyWith(
      value: freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as T,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CheckboxTriStateIncludeImplCopyWith<T, $Res>
    implements $CheckboxTriStateCopyWith<T, $Res> {
  factory _$$CheckboxTriStateIncludeImplCopyWith(
          _$CheckboxTriStateIncludeImpl<T> value,
          $Res Function(_$CheckboxTriStateIncludeImpl<T>) then) =
      __$$CheckboxTriStateIncludeImplCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call({T value});
}

/// @nodoc
class __$$CheckboxTriStateIncludeImplCopyWithImpl<T, $Res>
    extends _$CheckboxTriStateCopyWithImpl<T, $Res,
        _$CheckboxTriStateIncludeImpl<T>>
    implements _$$CheckboxTriStateIncludeImplCopyWith<T, $Res> {
  __$$CheckboxTriStateIncludeImplCopyWithImpl(
      _$CheckboxTriStateIncludeImpl<T> _value,
      $Res Function(_$CheckboxTriStateIncludeImpl<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_$CheckboxTriStateIncludeImpl<T>(
      freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc

class _$CheckboxTriStateIncludeImpl<T> extends CheckboxTriStateInclude<T> {
  const _$CheckboxTriStateIncludeImpl(this.value) : super._();

  @override
  final T value;

  @override
  String toString() {
    return 'CheckboxTriState<$T>.include(value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CheckboxTriStateIncludeImpl<T> &&
            const DeepCollectionEquality().equals(other.value, value));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(value));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CheckboxTriStateIncludeImplCopyWith<T, _$CheckboxTriStateIncludeImpl<T>>
      get copyWith => __$$CheckboxTriStateIncludeImplCopyWithImpl<T,
          _$CheckboxTriStateIncludeImpl<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T value) include,
    required TResult Function(T value) exclude,
    required TResult Function(T value) none,
  }) {
    return include(value);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(T value)? include,
    TResult? Function(T value)? exclude,
    TResult? Function(T value)? none,
  }) {
    return include?.call(value);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T value)? include,
    TResult Function(T value)? exclude,
    TResult Function(T value)? none,
    required TResult orElse(),
  }) {
    if (include != null) {
      return include(value);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CheckboxTriStateInclude<T> value) include,
    required TResult Function(CheckboxTriStateExclude<T> value) exclude,
    required TResult Function(CheckboxTriStateNone<T> value) none,
  }) {
    return include(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CheckboxTriStateInclude<T> value)? include,
    TResult? Function(CheckboxTriStateExclude<T> value)? exclude,
    TResult? Function(CheckboxTriStateNone<T> value)? none,
  }) {
    return include?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CheckboxTriStateInclude<T> value)? include,
    TResult Function(CheckboxTriStateExclude<T> value)? exclude,
    TResult Function(CheckboxTriStateNone<T> value)? none,
    required TResult orElse(),
  }) {
    if (include != null) {
      return include(this);
    }
    return orElse();
  }
}

abstract class CheckboxTriStateInclude<T> extends CheckboxTriState<T> {
  const factory CheckboxTriStateInclude(final T value) =
      _$CheckboxTriStateIncludeImpl<T>;
  const CheckboxTriStateInclude._() : super._();

  @override
  T get value;
  @override
  @JsonKey(ignore: true)
  _$$CheckboxTriStateIncludeImplCopyWith<T, _$CheckboxTriStateIncludeImpl<T>>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CheckboxTriStateExcludeImplCopyWith<T, $Res>
    implements $CheckboxTriStateCopyWith<T, $Res> {
  factory _$$CheckboxTriStateExcludeImplCopyWith(
          _$CheckboxTriStateExcludeImpl<T> value,
          $Res Function(_$CheckboxTriStateExcludeImpl<T>) then) =
      __$$CheckboxTriStateExcludeImplCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call({T value});
}

/// @nodoc
class __$$CheckboxTriStateExcludeImplCopyWithImpl<T, $Res>
    extends _$CheckboxTriStateCopyWithImpl<T, $Res,
        _$CheckboxTriStateExcludeImpl<T>>
    implements _$$CheckboxTriStateExcludeImplCopyWith<T, $Res> {
  __$$CheckboxTriStateExcludeImplCopyWithImpl(
      _$CheckboxTriStateExcludeImpl<T> _value,
      $Res Function(_$CheckboxTriStateExcludeImpl<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_$CheckboxTriStateExcludeImpl<T>(
      freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc

class _$CheckboxTriStateExcludeImpl<T> extends CheckboxTriStateExclude<T> {
  const _$CheckboxTriStateExcludeImpl(this.value) : super._();

  @override
  final T value;

  @override
  String toString() {
    return 'CheckboxTriState<$T>.exclude(value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CheckboxTriStateExcludeImpl<T> &&
            const DeepCollectionEquality().equals(other.value, value));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(value));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CheckboxTriStateExcludeImplCopyWith<T, _$CheckboxTriStateExcludeImpl<T>>
      get copyWith => __$$CheckboxTriStateExcludeImplCopyWithImpl<T,
          _$CheckboxTriStateExcludeImpl<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T value) include,
    required TResult Function(T value) exclude,
    required TResult Function(T value) none,
  }) {
    return exclude(value);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(T value)? include,
    TResult? Function(T value)? exclude,
    TResult? Function(T value)? none,
  }) {
    return exclude?.call(value);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T value)? include,
    TResult Function(T value)? exclude,
    TResult Function(T value)? none,
    required TResult orElse(),
  }) {
    if (exclude != null) {
      return exclude(value);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CheckboxTriStateInclude<T> value) include,
    required TResult Function(CheckboxTriStateExclude<T> value) exclude,
    required TResult Function(CheckboxTriStateNone<T> value) none,
  }) {
    return exclude(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CheckboxTriStateInclude<T> value)? include,
    TResult? Function(CheckboxTriStateExclude<T> value)? exclude,
    TResult? Function(CheckboxTriStateNone<T> value)? none,
  }) {
    return exclude?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CheckboxTriStateInclude<T> value)? include,
    TResult Function(CheckboxTriStateExclude<T> value)? exclude,
    TResult Function(CheckboxTriStateNone<T> value)? none,
    required TResult orElse(),
  }) {
    if (exclude != null) {
      return exclude(this);
    }
    return orElse();
  }
}

abstract class CheckboxTriStateExclude<T> extends CheckboxTriState<T> {
  const factory CheckboxTriStateExclude(final T value) =
      _$CheckboxTriStateExcludeImpl<T>;
  const CheckboxTriStateExclude._() : super._();

  @override
  T get value;
  @override
  @JsonKey(ignore: true)
  _$$CheckboxTriStateExcludeImplCopyWith<T, _$CheckboxTriStateExcludeImpl<T>>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CheckboxTriStateNoneImplCopyWith<T, $Res>
    implements $CheckboxTriStateCopyWith<T, $Res> {
  factory _$$CheckboxTriStateNoneImplCopyWith(
          _$CheckboxTriStateNoneImpl<T> value,
          $Res Function(_$CheckboxTriStateNoneImpl<T>) then) =
      __$$CheckboxTriStateNoneImplCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call({T value});
}

/// @nodoc
class __$$CheckboxTriStateNoneImplCopyWithImpl<T, $Res>
    extends _$CheckboxTriStateCopyWithImpl<T, $Res,
        _$CheckboxTriStateNoneImpl<T>>
    implements _$$CheckboxTriStateNoneImplCopyWith<T, $Res> {
  __$$CheckboxTriStateNoneImplCopyWithImpl(_$CheckboxTriStateNoneImpl<T> _value,
      $Res Function(_$CheckboxTriStateNoneImpl<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_$CheckboxTriStateNoneImpl<T>(
      freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc

class _$CheckboxTriStateNoneImpl<T> extends CheckboxTriStateNone<T> {
  const _$CheckboxTriStateNoneImpl(this.value) : super._();

  @override
  final T value;

  @override
  String toString() {
    return 'CheckboxTriState<$T>.none(value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CheckboxTriStateNoneImpl<T> &&
            const DeepCollectionEquality().equals(other.value, value));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(value));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CheckboxTriStateNoneImplCopyWith<T, _$CheckboxTriStateNoneImpl<T>>
      get copyWith => __$$CheckboxTriStateNoneImplCopyWithImpl<T,
          _$CheckboxTriStateNoneImpl<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T value) include,
    required TResult Function(T value) exclude,
    required TResult Function(T value) none,
  }) {
    return none(value);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(T value)? include,
    TResult? Function(T value)? exclude,
    TResult? Function(T value)? none,
  }) {
    return none?.call(value);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T value)? include,
    TResult Function(T value)? exclude,
    TResult Function(T value)? none,
    required TResult orElse(),
  }) {
    if (none != null) {
      return none(value);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CheckboxTriStateInclude<T> value) include,
    required TResult Function(CheckboxTriStateExclude<T> value) exclude,
    required TResult Function(CheckboxTriStateNone<T> value) none,
  }) {
    return none(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CheckboxTriStateInclude<T> value)? include,
    TResult? Function(CheckboxTriStateExclude<T> value)? exclude,
    TResult? Function(CheckboxTriStateNone<T> value)? none,
  }) {
    return none?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CheckboxTriStateInclude<T> value)? include,
    TResult Function(CheckboxTriStateExclude<T> value)? exclude,
    TResult Function(CheckboxTriStateNone<T> value)? none,
    required TResult orElse(),
  }) {
    if (none != null) {
      return none(this);
    }
    return orElse();
  }
}

abstract class CheckboxTriStateNone<T> extends CheckboxTriState<T> {
  const factory CheckboxTriStateNone(final T value) =
      _$CheckboxTriStateNoneImpl<T>;
  const CheckboxTriStateNone._() : super._();

  @override
  T get value;
  @override
  @JsonKey(ignore: true)
  _$$CheckboxTriStateNoneImplCopyWith<T, _$CheckboxTriStateNoneImpl<T>>
      get copyWith => throw _privateConstructorUsedError;
}
