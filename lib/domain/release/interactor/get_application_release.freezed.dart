// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_application_release.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$Result {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Release release) newUpdate,
    required TResult Function() noNewUpdate,
    required TResult Function() osTooOld,
    required TResult Function() thirdPartyInstallation,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Release release)? newUpdate,
    TResult? Function()? noNewUpdate,
    TResult? Function()? osTooOld,
    TResult? Function()? thirdPartyInstallation,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Release release)? newUpdate,
    TResult Function()? noNewUpdate,
    TResult Function()? osTooOld,
    TResult Function()? thirdPartyInstallation,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NewUpdate value) newUpdate,
    required TResult Function(NoNewUpdate value) noNewUpdate,
    required TResult Function(OsTooOld value) osTooOld,
    required TResult Function(ThirdPartyInstallation value)
        thirdPartyInstallation,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NewUpdate value)? newUpdate,
    TResult? Function(NoNewUpdate value)? noNewUpdate,
    TResult? Function(OsTooOld value)? osTooOld,
    TResult? Function(ThirdPartyInstallation value)? thirdPartyInstallation,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NewUpdate value)? newUpdate,
    TResult Function(NoNewUpdate value)? noNewUpdate,
    TResult Function(OsTooOld value)? osTooOld,
    TResult Function(ThirdPartyInstallation value)? thirdPartyInstallation,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResultCopyWith<$Res> {
  factory $ResultCopyWith(Result value, $Res Function(Result) then) =
      _$ResultCopyWithImpl<$Res, Result>;
}

/// @nodoc
class _$ResultCopyWithImpl<$Res, $Val extends Result>
    implements $ResultCopyWith<$Res> {
  _$ResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$NewUpdateImplCopyWith<$Res> {
  factory _$$NewUpdateImplCopyWith(
          _$NewUpdateImpl value, $Res Function(_$NewUpdateImpl) then) =
      __$$NewUpdateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Release release});

  $ReleaseCopyWith<$Res> get release;
}

/// @nodoc
class __$$NewUpdateImplCopyWithImpl<$Res>
    extends _$ResultCopyWithImpl<$Res, _$NewUpdateImpl>
    implements _$$NewUpdateImplCopyWith<$Res> {
  __$$NewUpdateImplCopyWithImpl(
      _$NewUpdateImpl _value, $Res Function(_$NewUpdateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? release = null,
  }) {
    return _then(_$NewUpdateImpl(
      null == release
          ? _value.release
          : release // ignore: cast_nullable_to_non_nullable
              as Release,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $ReleaseCopyWith<$Res> get release {
    return $ReleaseCopyWith<$Res>(_value.release, (value) {
      return _then(_value.copyWith(release: value));
    });
  }
}

/// @nodoc

class _$NewUpdateImpl implements NewUpdate {
  const _$NewUpdateImpl(this.release);

  @override
  final Release release;

  @override
  String toString() {
    return 'Result.newUpdate(release: $release)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NewUpdateImpl &&
            (identical(other.release, release) || other.release == release));
  }

  @override
  int get hashCode => Object.hash(runtimeType, release);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NewUpdateImplCopyWith<_$NewUpdateImpl> get copyWith =>
      __$$NewUpdateImplCopyWithImpl<_$NewUpdateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Release release) newUpdate,
    required TResult Function() noNewUpdate,
    required TResult Function() osTooOld,
    required TResult Function() thirdPartyInstallation,
  }) {
    return newUpdate(release);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Release release)? newUpdate,
    TResult? Function()? noNewUpdate,
    TResult? Function()? osTooOld,
    TResult? Function()? thirdPartyInstallation,
  }) {
    return newUpdate?.call(release);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Release release)? newUpdate,
    TResult Function()? noNewUpdate,
    TResult Function()? osTooOld,
    TResult Function()? thirdPartyInstallation,
    required TResult orElse(),
  }) {
    if (newUpdate != null) {
      return newUpdate(release);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NewUpdate value) newUpdate,
    required TResult Function(NoNewUpdate value) noNewUpdate,
    required TResult Function(OsTooOld value) osTooOld,
    required TResult Function(ThirdPartyInstallation value)
        thirdPartyInstallation,
  }) {
    return newUpdate(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NewUpdate value)? newUpdate,
    TResult? Function(NoNewUpdate value)? noNewUpdate,
    TResult? Function(OsTooOld value)? osTooOld,
    TResult? Function(ThirdPartyInstallation value)? thirdPartyInstallation,
  }) {
    return newUpdate?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NewUpdate value)? newUpdate,
    TResult Function(NoNewUpdate value)? noNewUpdate,
    TResult Function(OsTooOld value)? osTooOld,
    TResult Function(ThirdPartyInstallation value)? thirdPartyInstallation,
    required TResult orElse(),
  }) {
    if (newUpdate != null) {
      return newUpdate(this);
    }
    return orElse();
  }
}

abstract class NewUpdate implements Result {
  const factory NewUpdate(final Release release) = _$NewUpdateImpl;

  Release get release;
  @JsonKey(ignore: true)
  _$$NewUpdateImplCopyWith<_$NewUpdateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$NoNewUpdateImplCopyWith<$Res> {
  factory _$$NoNewUpdateImplCopyWith(
          _$NoNewUpdateImpl value, $Res Function(_$NoNewUpdateImpl) then) =
      __$$NoNewUpdateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$NoNewUpdateImplCopyWithImpl<$Res>
    extends _$ResultCopyWithImpl<$Res, _$NoNewUpdateImpl>
    implements _$$NoNewUpdateImplCopyWith<$Res> {
  __$$NoNewUpdateImplCopyWithImpl(
      _$NoNewUpdateImpl _value, $Res Function(_$NoNewUpdateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$NoNewUpdateImpl implements NoNewUpdate {
  const _$NoNewUpdateImpl();

  @override
  String toString() {
    return 'Result.noNewUpdate()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$NoNewUpdateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Release release) newUpdate,
    required TResult Function() noNewUpdate,
    required TResult Function() osTooOld,
    required TResult Function() thirdPartyInstallation,
  }) {
    return noNewUpdate();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Release release)? newUpdate,
    TResult? Function()? noNewUpdate,
    TResult? Function()? osTooOld,
    TResult? Function()? thirdPartyInstallation,
  }) {
    return noNewUpdate?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Release release)? newUpdate,
    TResult Function()? noNewUpdate,
    TResult Function()? osTooOld,
    TResult Function()? thirdPartyInstallation,
    required TResult orElse(),
  }) {
    if (noNewUpdate != null) {
      return noNewUpdate();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NewUpdate value) newUpdate,
    required TResult Function(NoNewUpdate value) noNewUpdate,
    required TResult Function(OsTooOld value) osTooOld,
    required TResult Function(ThirdPartyInstallation value)
        thirdPartyInstallation,
  }) {
    return noNewUpdate(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NewUpdate value)? newUpdate,
    TResult? Function(NoNewUpdate value)? noNewUpdate,
    TResult? Function(OsTooOld value)? osTooOld,
    TResult? Function(ThirdPartyInstallation value)? thirdPartyInstallation,
  }) {
    return noNewUpdate?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NewUpdate value)? newUpdate,
    TResult Function(NoNewUpdate value)? noNewUpdate,
    TResult Function(OsTooOld value)? osTooOld,
    TResult Function(ThirdPartyInstallation value)? thirdPartyInstallation,
    required TResult orElse(),
  }) {
    if (noNewUpdate != null) {
      return noNewUpdate(this);
    }
    return orElse();
  }
}

abstract class NoNewUpdate implements Result {
  const factory NoNewUpdate() = _$NoNewUpdateImpl;
}

/// @nodoc
abstract class _$$OsTooOldImplCopyWith<$Res> {
  factory _$$OsTooOldImplCopyWith(
          _$OsTooOldImpl value, $Res Function(_$OsTooOldImpl) then) =
      __$$OsTooOldImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$OsTooOldImplCopyWithImpl<$Res>
    extends _$ResultCopyWithImpl<$Res, _$OsTooOldImpl>
    implements _$$OsTooOldImplCopyWith<$Res> {
  __$$OsTooOldImplCopyWithImpl(
      _$OsTooOldImpl _value, $Res Function(_$OsTooOldImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$OsTooOldImpl implements OsTooOld {
  const _$OsTooOldImpl();

  @override
  String toString() {
    return 'Result.osTooOld()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$OsTooOldImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Release release) newUpdate,
    required TResult Function() noNewUpdate,
    required TResult Function() osTooOld,
    required TResult Function() thirdPartyInstallation,
  }) {
    return osTooOld();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Release release)? newUpdate,
    TResult? Function()? noNewUpdate,
    TResult? Function()? osTooOld,
    TResult? Function()? thirdPartyInstallation,
  }) {
    return osTooOld?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Release release)? newUpdate,
    TResult Function()? noNewUpdate,
    TResult Function()? osTooOld,
    TResult Function()? thirdPartyInstallation,
    required TResult orElse(),
  }) {
    if (osTooOld != null) {
      return osTooOld();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NewUpdate value) newUpdate,
    required TResult Function(NoNewUpdate value) noNewUpdate,
    required TResult Function(OsTooOld value) osTooOld,
    required TResult Function(ThirdPartyInstallation value)
        thirdPartyInstallation,
  }) {
    return osTooOld(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NewUpdate value)? newUpdate,
    TResult? Function(NoNewUpdate value)? noNewUpdate,
    TResult? Function(OsTooOld value)? osTooOld,
    TResult? Function(ThirdPartyInstallation value)? thirdPartyInstallation,
  }) {
    return osTooOld?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NewUpdate value)? newUpdate,
    TResult Function(NoNewUpdate value)? noNewUpdate,
    TResult Function(OsTooOld value)? osTooOld,
    TResult Function(ThirdPartyInstallation value)? thirdPartyInstallation,
    required TResult orElse(),
  }) {
    if (osTooOld != null) {
      return osTooOld(this);
    }
    return orElse();
  }
}

abstract class OsTooOld implements Result {
  const factory OsTooOld() = _$OsTooOldImpl;
}

/// @nodoc
abstract class _$$ThirdPartyInstallationImplCopyWith<$Res> {
  factory _$$ThirdPartyInstallationImplCopyWith(
          _$ThirdPartyInstallationImpl value,
          $Res Function(_$ThirdPartyInstallationImpl) then) =
      __$$ThirdPartyInstallationImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ThirdPartyInstallationImplCopyWithImpl<$Res>
    extends _$ResultCopyWithImpl<$Res, _$ThirdPartyInstallationImpl>
    implements _$$ThirdPartyInstallationImplCopyWith<$Res> {
  __$$ThirdPartyInstallationImplCopyWithImpl(
      _$ThirdPartyInstallationImpl _value,
      $Res Function(_$ThirdPartyInstallationImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ThirdPartyInstallationImpl implements ThirdPartyInstallation {
  const _$ThirdPartyInstallationImpl();

  @override
  String toString() {
    return 'Result.thirdPartyInstallation()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ThirdPartyInstallationImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Release release) newUpdate,
    required TResult Function() noNewUpdate,
    required TResult Function() osTooOld,
    required TResult Function() thirdPartyInstallation,
  }) {
    return thirdPartyInstallation();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Release release)? newUpdate,
    TResult? Function()? noNewUpdate,
    TResult? Function()? osTooOld,
    TResult? Function()? thirdPartyInstallation,
  }) {
    return thirdPartyInstallation?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Release release)? newUpdate,
    TResult Function()? noNewUpdate,
    TResult Function()? osTooOld,
    TResult Function()? thirdPartyInstallation,
    required TResult orElse(),
  }) {
    if (thirdPartyInstallation != null) {
      return thirdPartyInstallation();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NewUpdate value) newUpdate,
    required TResult Function(NoNewUpdate value) noNewUpdate,
    required TResult Function(OsTooOld value) osTooOld,
    required TResult Function(ThirdPartyInstallation value)
        thirdPartyInstallation,
  }) {
    return thirdPartyInstallation(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NewUpdate value)? newUpdate,
    TResult? Function(NoNewUpdate value)? noNewUpdate,
    TResult? Function(OsTooOld value)? osTooOld,
    TResult? Function(ThirdPartyInstallation value)? thirdPartyInstallation,
  }) {
    return thirdPartyInstallation?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NewUpdate value)? newUpdate,
    TResult Function(NoNewUpdate value)? noNewUpdate,
    TResult Function(OsTooOld value)? osTooOld,
    TResult Function(ThirdPartyInstallation value)? thirdPartyInstallation,
    required TResult orElse(),
  }) {
    if (thirdPartyInstallation != null) {
      return thirdPartyInstallation(this);
    }
    return orElse();
  }
}

abstract class ThirdPartyInstallation implements Result {
  const factory ThirdPartyInstallation() = _$ThirdPartyInstallationImpl;
}
