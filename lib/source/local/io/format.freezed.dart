// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'format.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$Format {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Directory dir) directory,
    required TResult Function(File file) zip,
    required TResult Function(File file) rar,
    required TResult Function(File file) epub,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Directory dir)? directory,
    TResult? Function(File file)? zip,
    TResult? Function(File file)? rar,
    TResult? Function(File file)? epub,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Directory dir)? directory,
    TResult Function(File file)? zip,
    TResult Function(File file)? rar,
    TResult Function(File file)? epub,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FormatDirectory value) directory,
    required TResult Function(Zip value) zip,
    required TResult Function(Rar value) rar,
    required TResult Function(Epub value) epub,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FormatDirectory value)? directory,
    TResult? Function(Zip value)? zip,
    TResult? Function(Rar value)? rar,
    TResult? Function(Epub value)? epub,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FormatDirectory value)? directory,
    TResult Function(Zip value)? zip,
    TResult Function(Rar value)? rar,
    TResult Function(Epub value)? epub,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FormatCopyWith<$Res> {
  factory $FormatCopyWith(Format value, $Res Function(Format) then) =
      _$FormatCopyWithImpl<$Res, Format>;
}

/// @nodoc
class _$FormatCopyWithImpl<$Res, $Val extends Format>
    implements $FormatCopyWith<$Res> {
  _$FormatCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$FormatDirectoryImplCopyWith<$Res> {
  factory _$$FormatDirectoryImplCopyWith(_$FormatDirectoryImpl value,
          $Res Function(_$FormatDirectoryImpl) then) =
      __$$FormatDirectoryImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Directory dir});
}

/// @nodoc
class __$$FormatDirectoryImplCopyWithImpl<$Res>
    extends _$FormatCopyWithImpl<$Res, _$FormatDirectoryImpl>
    implements _$$FormatDirectoryImplCopyWith<$Res> {
  __$$FormatDirectoryImplCopyWithImpl(
      _$FormatDirectoryImpl _value, $Res Function(_$FormatDirectoryImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dir = null,
  }) {
    return _then(_$FormatDirectoryImpl(
      null == dir
          ? _value.dir
          : dir // ignore: cast_nullable_to_non_nullable
              as Directory,
    ));
  }
}

/// @nodoc

class _$FormatDirectoryImpl extends FormatDirectory {
  const _$FormatDirectoryImpl(this.dir) : super._();

  @override
  final Directory dir;

  @override
  String toString() {
    return 'Format.directory(dir: $dir)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FormatDirectoryImpl &&
            (identical(other.dir, dir) || other.dir == dir));
  }

  @override
  int get hashCode => Object.hash(runtimeType, dir);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FormatDirectoryImplCopyWith<_$FormatDirectoryImpl> get copyWith =>
      __$$FormatDirectoryImplCopyWithImpl<_$FormatDirectoryImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Directory dir) directory,
    required TResult Function(File file) zip,
    required TResult Function(File file) rar,
    required TResult Function(File file) epub,
  }) {
    return directory(dir);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Directory dir)? directory,
    TResult? Function(File file)? zip,
    TResult? Function(File file)? rar,
    TResult? Function(File file)? epub,
  }) {
    return directory?.call(dir);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Directory dir)? directory,
    TResult Function(File file)? zip,
    TResult Function(File file)? rar,
    TResult Function(File file)? epub,
    required TResult orElse(),
  }) {
    if (directory != null) {
      return directory(dir);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FormatDirectory value) directory,
    required TResult Function(Zip value) zip,
    required TResult Function(Rar value) rar,
    required TResult Function(Epub value) epub,
  }) {
    return directory(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FormatDirectory value)? directory,
    TResult? Function(Zip value)? zip,
    TResult? Function(Rar value)? rar,
    TResult? Function(Epub value)? epub,
  }) {
    return directory?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FormatDirectory value)? directory,
    TResult Function(Zip value)? zip,
    TResult Function(Rar value)? rar,
    TResult Function(Epub value)? epub,
    required TResult orElse(),
  }) {
    if (directory != null) {
      return directory(this);
    }
    return orElse();
  }
}

abstract class FormatDirectory extends Format {
  const factory FormatDirectory(final Directory dir) = _$FormatDirectoryImpl;
  const FormatDirectory._() : super._();

  Directory get dir;
  @JsonKey(ignore: true)
  _$$FormatDirectoryImplCopyWith<_$FormatDirectoryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ZipImplCopyWith<$Res> {
  factory _$$ZipImplCopyWith(_$ZipImpl value, $Res Function(_$ZipImpl) then) =
      __$$ZipImplCopyWithImpl<$Res>;
  @useResult
  $Res call({File file});
}

/// @nodoc
class __$$ZipImplCopyWithImpl<$Res>
    extends _$FormatCopyWithImpl<$Res, _$ZipImpl>
    implements _$$ZipImplCopyWith<$Res> {
  __$$ZipImplCopyWithImpl(_$ZipImpl _value, $Res Function(_$ZipImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? file = null,
  }) {
    return _then(_$ZipImpl(
      null == file
          ? _value.file
          : file // ignore: cast_nullable_to_non_nullable
              as File,
    ));
  }
}

/// @nodoc

class _$ZipImpl extends Zip {
  const _$ZipImpl(this.file) : super._();

  @override
  final File file;

  @override
  String toString() {
    return 'Format.zip(file: $file)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ZipImpl &&
            (identical(other.file, file) || other.file == file));
  }

  @override
  int get hashCode => Object.hash(runtimeType, file);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ZipImplCopyWith<_$ZipImpl> get copyWith =>
      __$$ZipImplCopyWithImpl<_$ZipImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Directory dir) directory,
    required TResult Function(File file) zip,
    required TResult Function(File file) rar,
    required TResult Function(File file) epub,
  }) {
    return zip(file);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Directory dir)? directory,
    TResult? Function(File file)? zip,
    TResult? Function(File file)? rar,
    TResult? Function(File file)? epub,
  }) {
    return zip?.call(file);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Directory dir)? directory,
    TResult Function(File file)? zip,
    TResult Function(File file)? rar,
    TResult Function(File file)? epub,
    required TResult orElse(),
  }) {
    if (zip != null) {
      return zip(file);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FormatDirectory value) directory,
    required TResult Function(Zip value) zip,
    required TResult Function(Rar value) rar,
    required TResult Function(Epub value) epub,
  }) {
    return zip(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FormatDirectory value)? directory,
    TResult? Function(Zip value)? zip,
    TResult? Function(Rar value)? rar,
    TResult? Function(Epub value)? epub,
  }) {
    return zip?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FormatDirectory value)? directory,
    TResult Function(Zip value)? zip,
    TResult Function(Rar value)? rar,
    TResult Function(Epub value)? epub,
    required TResult orElse(),
  }) {
    if (zip != null) {
      return zip(this);
    }
    return orElse();
  }
}

abstract class Zip extends Format {
  const factory Zip(final File file) = _$ZipImpl;
  const Zip._() : super._();

  File get file;
  @JsonKey(ignore: true)
  _$$ZipImplCopyWith<_$ZipImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RarImplCopyWith<$Res> {
  factory _$$RarImplCopyWith(_$RarImpl value, $Res Function(_$RarImpl) then) =
      __$$RarImplCopyWithImpl<$Res>;
  @useResult
  $Res call({File file});
}

/// @nodoc
class __$$RarImplCopyWithImpl<$Res>
    extends _$FormatCopyWithImpl<$Res, _$RarImpl>
    implements _$$RarImplCopyWith<$Res> {
  __$$RarImplCopyWithImpl(_$RarImpl _value, $Res Function(_$RarImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? file = null,
  }) {
    return _then(_$RarImpl(
      null == file
          ? _value.file
          : file // ignore: cast_nullable_to_non_nullable
              as File,
    ));
  }
}

/// @nodoc

class _$RarImpl extends Rar {
  const _$RarImpl(this.file) : super._();

  @override
  final File file;

  @override
  String toString() {
    return 'Format.rar(file: $file)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RarImpl &&
            (identical(other.file, file) || other.file == file));
  }

  @override
  int get hashCode => Object.hash(runtimeType, file);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RarImplCopyWith<_$RarImpl> get copyWith =>
      __$$RarImplCopyWithImpl<_$RarImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Directory dir) directory,
    required TResult Function(File file) zip,
    required TResult Function(File file) rar,
    required TResult Function(File file) epub,
  }) {
    return rar(file);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Directory dir)? directory,
    TResult? Function(File file)? zip,
    TResult? Function(File file)? rar,
    TResult? Function(File file)? epub,
  }) {
    return rar?.call(file);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Directory dir)? directory,
    TResult Function(File file)? zip,
    TResult Function(File file)? rar,
    TResult Function(File file)? epub,
    required TResult orElse(),
  }) {
    if (rar != null) {
      return rar(file);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FormatDirectory value) directory,
    required TResult Function(Zip value) zip,
    required TResult Function(Rar value) rar,
    required TResult Function(Epub value) epub,
  }) {
    return rar(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FormatDirectory value)? directory,
    TResult? Function(Zip value)? zip,
    TResult? Function(Rar value)? rar,
    TResult? Function(Epub value)? epub,
  }) {
    return rar?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FormatDirectory value)? directory,
    TResult Function(Zip value)? zip,
    TResult Function(Rar value)? rar,
    TResult Function(Epub value)? epub,
    required TResult orElse(),
  }) {
    if (rar != null) {
      return rar(this);
    }
    return orElse();
  }
}

abstract class Rar extends Format {
  const factory Rar(final File file) = _$RarImpl;
  const Rar._() : super._();

  File get file;
  @JsonKey(ignore: true)
  _$$RarImplCopyWith<_$RarImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$EpubImplCopyWith<$Res> {
  factory _$$EpubImplCopyWith(
          _$EpubImpl value, $Res Function(_$EpubImpl) then) =
      __$$EpubImplCopyWithImpl<$Res>;
  @useResult
  $Res call({File file});
}

/// @nodoc
class __$$EpubImplCopyWithImpl<$Res>
    extends _$FormatCopyWithImpl<$Res, _$EpubImpl>
    implements _$$EpubImplCopyWith<$Res> {
  __$$EpubImplCopyWithImpl(_$EpubImpl _value, $Res Function(_$EpubImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? file = null,
  }) {
    return _then(_$EpubImpl(
      null == file
          ? _value.file
          : file // ignore: cast_nullable_to_non_nullable
              as File,
    ));
  }
}

/// @nodoc

class _$EpubImpl extends Epub {
  const _$EpubImpl(this.file) : super._();

  @override
  final File file;

  @override
  String toString() {
    return 'Format.epub(file: $file)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EpubImpl &&
            (identical(other.file, file) || other.file == file));
  }

  @override
  int get hashCode => Object.hash(runtimeType, file);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EpubImplCopyWith<_$EpubImpl> get copyWith =>
      __$$EpubImplCopyWithImpl<_$EpubImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Directory dir) directory,
    required TResult Function(File file) zip,
    required TResult Function(File file) rar,
    required TResult Function(File file) epub,
  }) {
    return epub(file);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Directory dir)? directory,
    TResult? Function(File file)? zip,
    TResult? Function(File file)? rar,
    TResult? Function(File file)? epub,
  }) {
    return epub?.call(file);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Directory dir)? directory,
    TResult Function(File file)? zip,
    TResult Function(File file)? rar,
    TResult Function(File file)? epub,
    required TResult orElse(),
  }) {
    if (epub != null) {
      return epub(file);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FormatDirectory value) directory,
    required TResult Function(Zip value) zip,
    required TResult Function(Rar value) rar,
    required TResult Function(Epub value) epub,
  }) {
    return epub(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FormatDirectory value)? directory,
    TResult? Function(Zip value)? zip,
    TResult? Function(Rar value)? rar,
    TResult? Function(Epub value)? epub,
  }) {
    return epub?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FormatDirectory value)? directory,
    TResult Function(Zip value)? zip,
    TResult Function(Rar value)? rar,
    TResult Function(Epub value)? epub,
    required TResult orElse(),
  }) {
    if (epub != null) {
      return epub(this);
    }
    return orElse();
  }
}

abstract class Epub extends Format {
  const factory Epub(final File file) = _$EpubImpl;
  const Epub._() : super._();

  File get file;
  @JsonKey(ignore: true)
  _$$EpubImplCopyWith<_$EpubImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
