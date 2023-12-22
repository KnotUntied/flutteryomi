// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'manga_cover.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$MangaCover {
  int get mangaId => throw _privateConstructorUsedError;
  int get sourceId => throw _privateConstructorUsedError;
  bool get isMangaFavorite => throw _privateConstructorUsedError;
  String? get url => throw _privateConstructorUsedError;
  DateTime get lastModified => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MangaCoverCopyWith<MangaCover> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MangaCoverCopyWith<$Res> {
  factory $MangaCoverCopyWith(
          MangaCover value, $Res Function(MangaCover) then) =
      _$MangaCoverCopyWithImpl<$Res, MangaCover>;
  @useResult
  $Res call(
      {int mangaId,
      int sourceId,
      bool isMangaFavorite,
      String? url,
      DateTime lastModified});
}

/// @nodoc
class _$MangaCoverCopyWithImpl<$Res, $Val extends MangaCover>
    implements $MangaCoverCopyWith<$Res> {
  _$MangaCoverCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mangaId = null,
    Object? sourceId = null,
    Object? isMangaFavorite = null,
    Object? url = freezed,
    Object? lastModified = null,
  }) {
    return _then(_value.copyWith(
      mangaId: null == mangaId
          ? _value.mangaId
          : mangaId // ignore: cast_nullable_to_non_nullable
              as int,
      sourceId: null == sourceId
          ? _value.sourceId
          : sourceId // ignore: cast_nullable_to_non_nullable
              as int,
      isMangaFavorite: null == isMangaFavorite
          ? _value.isMangaFavorite
          : isMangaFavorite // ignore: cast_nullable_to_non_nullable
              as bool,
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      lastModified: null == lastModified
          ? _value.lastModified
          : lastModified // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MangaCoverImplCopyWith<$Res>
    implements $MangaCoverCopyWith<$Res> {
  factory _$$MangaCoverImplCopyWith(
          _$MangaCoverImpl value, $Res Function(_$MangaCoverImpl) then) =
      __$$MangaCoverImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int mangaId,
      int sourceId,
      bool isMangaFavorite,
      String? url,
      DateTime lastModified});
}

/// @nodoc
class __$$MangaCoverImplCopyWithImpl<$Res>
    extends _$MangaCoverCopyWithImpl<$Res, _$MangaCoverImpl>
    implements _$$MangaCoverImplCopyWith<$Res> {
  __$$MangaCoverImplCopyWithImpl(
      _$MangaCoverImpl _value, $Res Function(_$MangaCoverImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mangaId = null,
    Object? sourceId = null,
    Object? isMangaFavorite = null,
    Object? url = freezed,
    Object? lastModified = null,
  }) {
    return _then(_$MangaCoverImpl(
      mangaId: null == mangaId
          ? _value.mangaId
          : mangaId // ignore: cast_nullable_to_non_nullable
              as int,
      sourceId: null == sourceId
          ? _value.sourceId
          : sourceId // ignore: cast_nullable_to_non_nullable
              as int,
      isMangaFavorite: null == isMangaFavorite
          ? _value.isMangaFavorite
          : isMangaFavorite // ignore: cast_nullable_to_non_nullable
              as bool,
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      lastModified: null == lastModified
          ? _value.lastModified
          : lastModified // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

class _$MangaCoverImpl implements _MangaCover {
  _$MangaCoverImpl(
      {required this.mangaId,
      required this.sourceId,
      required this.isMangaFavorite,
      this.url,
      required this.lastModified});

  @override
  final int mangaId;
  @override
  final int sourceId;
  @override
  final bool isMangaFavorite;
  @override
  final String? url;
  @override
  final DateTime lastModified;

  @override
  String toString() {
    return 'MangaCover(mangaId: $mangaId, sourceId: $sourceId, isMangaFavorite: $isMangaFavorite, url: $url, lastModified: $lastModified)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MangaCoverImpl &&
            (identical(other.mangaId, mangaId) || other.mangaId == mangaId) &&
            (identical(other.sourceId, sourceId) ||
                other.sourceId == sourceId) &&
            (identical(other.isMangaFavorite, isMangaFavorite) ||
                other.isMangaFavorite == isMangaFavorite) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.lastModified, lastModified) ||
                other.lastModified == lastModified));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, mangaId, sourceId, isMangaFavorite, url, lastModified);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MangaCoverImplCopyWith<_$MangaCoverImpl> get copyWith =>
      __$$MangaCoverImplCopyWithImpl<_$MangaCoverImpl>(this, _$identity);
}

abstract class _MangaCover implements MangaCover {
  factory _MangaCover(
      {required final int mangaId,
      required final int sourceId,
      required final bool isMangaFavorite,
      final String? url,
      required final DateTime lastModified}) = _$MangaCoverImpl;

  @override
  int get mangaId;
  @override
  int get sourceId;
  @override
  bool get isMangaFavorite;
  @override
  String? get url;
  @override
  DateTime get lastModified;
  @override
  @JsonKey(ignore: true)
  _$$MangaCoverImplCopyWith<_$MangaCoverImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
