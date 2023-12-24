// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'schapter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SChapter {
  String get url => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  DateTime? get dateUpload => throw _privateConstructorUsedError;
  double get chapterNumber => throw _privateConstructorUsedError;
  String? get scanlator => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String url, String name, DateTime? dateUpload,
            double chapterNumber, String? scanlator)
        def,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String url, String name, DateTime? dateUpload,
            double chapterNumber, String? scanlator)?
        def,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String url, String name, DateTime? dateUpload,
            double chapterNumber, String? scanlator)?
        def,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SChapter value) def,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SChapter value)? def,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SChapter value)? def,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SChapterCopyWith<SChapter> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SChapterCopyWith<$Res> {
  factory $SChapterCopyWith(SChapter value, $Res Function(SChapter) then) =
      _$SChapterCopyWithImpl<$Res, SChapter>;
  @useResult
  $Res call(
      {String url,
      String name,
      DateTime? dateUpload,
      double chapterNumber,
      String? scanlator});
}

/// @nodoc
class _$SChapterCopyWithImpl<$Res, $Val extends SChapter>
    implements $SChapterCopyWith<$Res> {
  _$SChapterCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? url = null,
    Object? name = null,
    Object? dateUpload = freezed,
    Object? chapterNumber = null,
    Object? scanlator = freezed,
  }) {
    return _then(_value.copyWith(
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      dateUpload: freezed == dateUpload
          ? _value.dateUpload
          : dateUpload // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      chapterNumber: null == chapterNumber
          ? _value.chapterNumber
          : chapterNumber // ignore: cast_nullable_to_non_nullable
              as double,
      scanlator: freezed == scanlator
          ? _value.scanlator
          : scanlator // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SChapterImplCopyWith<$Res>
    implements $SChapterCopyWith<$Res> {
  factory _$$SChapterImplCopyWith(
          _$SChapterImpl value, $Res Function(_$SChapterImpl) then) =
      __$$SChapterImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String url,
      String name,
      DateTime? dateUpload,
      double chapterNumber,
      String? scanlator});
}

/// @nodoc
class __$$SChapterImplCopyWithImpl<$Res>
    extends _$SChapterCopyWithImpl<$Res, _$SChapterImpl>
    implements _$$SChapterImplCopyWith<$Res> {
  __$$SChapterImplCopyWithImpl(
      _$SChapterImpl _value, $Res Function(_$SChapterImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? url = null,
    Object? name = null,
    Object? dateUpload = freezed,
    Object? chapterNumber = null,
    Object? scanlator = freezed,
  }) {
    return _then(_$SChapterImpl(
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      dateUpload: freezed == dateUpload
          ? _value.dateUpload
          : dateUpload // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      chapterNumber: null == chapterNumber
          ? _value.chapterNumber
          : chapterNumber // ignore: cast_nullable_to_non_nullable
              as double,
      scanlator: freezed == scanlator
          ? _value.scanlator
          : scanlator // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$SChapterImpl implements _SChapter {
  const _$SChapterImpl(
      {required this.url,
      required this.name,
      this.dateUpload,
      required this.chapterNumber = -1.0,
      this.scanlator});

  @override
  final String url;
  @override
  final String name;
  @override
  final DateTime? dateUpload;
  @override
  @JsonKey()
  final double chapterNumber;
  @override
  final String? scanlator;

  @override
  String toString() {
    return 'SChapter.def(url: $url, name: $name, dateUpload: $dateUpload, chapterNumber: $chapterNumber, scanlator: $scanlator)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SChapterImpl &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.dateUpload, dateUpload) ||
                other.dateUpload == dateUpload) &&
            (identical(other.chapterNumber, chapterNumber) ||
                other.chapterNumber == chapterNumber) &&
            (identical(other.scanlator, scanlator) ||
                other.scanlator == scanlator));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, url, name, dateUpload, chapterNumber, scanlator);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SChapterImplCopyWith<_$SChapterImpl> get copyWith =>
      __$$SChapterImplCopyWithImpl<_$SChapterImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String url, String name, DateTime? dateUpload,
            double chapterNumber, String? scanlator)
        def,
  }) {
    return def(url, name, dateUpload, chapterNumber, scanlator);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String url, String name, DateTime? dateUpload,
            double chapterNumber, String? scanlator)?
        def,
  }) {
    return def?.call(url, name, dateUpload, chapterNumber, scanlator);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String url, String name, DateTime? dateUpload,
            double chapterNumber, String? scanlator)?
        def,
    required TResult orElse(),
  }) {
    if (def != null) {
      return def(url, name, dateUpload, chapterNumber, scanlator);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SChapter value) def,
  }) {
    return def(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SChapter value)? def,
  }) {
    return def?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SChapter value)? def,
    required TResult orElse(),
  }) {
    if (def != null) {
      return def(this);
    }
    return orElse();
  }
}

abstract class _SChapter implements SChapter {
  const factory _SChapter(
      {required final String url,
      required final String name,
      final DateTime? dateUpload,
      required final double chapterNumber,
      final String? scanlator}) = _$SChapterImpl;

  @override
  String get url;
  @override
  String get name;
  @override
  DateTime? get dateUpload;
  @override
  double get chapterNumber;
  @override
  String? get scanlator;
  @override
  @JsonKey(ignore: true)
  _$$SChapterImplCopyWith<_$SChapterImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
