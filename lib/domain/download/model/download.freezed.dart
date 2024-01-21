// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'download.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Download {
//HttpSource source,
  Manga get manga => throw _privateConstructorUsedError; //HttpSource source,
  set manga(Manga value) => throw _privateConstructorUsedError;
  Chapter get chapter => throw _privateConstructorUsedError;
  set chapter(Chapter value) => throw _privateConstructorUsedError;
  List<Page>? get pages => throw _privateConstructorUsedError;
  set pages(List<Page>? value) => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DownloadCopyWith<Download> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DownloadCopyWith<$Res> {
  factory $DownloadCopyWith(Download value, $Res Function(Download) then) =
      _$DownloadCopyWithImpl<$Res, Download>;
  @useResult
  $Res call({Manga manga, Chapter chapter, List<Page>? pages});
}

/// @nodoc
class _$DownloadCopyWithImpl<$Res, $Val extends Download>
    implements $DownloadCopyWith<$Res> {
  _$DownloadCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? manga = null,
    Object? chapter = null,
    Object? pages = freezed,
  }) {
    return _then(_value.copyWith(
      manga: null == manga
          ? _value.manga
          : manga // ignore: cast_nullable_to_non_nullable
              as Manga,
      chapter: null == chapter
          ? _value.chapter
          : chapter // ignore: cast_nullable_to_non_nullable
              as Chapter,
      pages: freezed == pages
          ? _value.pages
          : pages // ignore: cast_nullable_to_non_nullable
              as List<Page>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DownloadImplCopyWith<$Res>
    implements $DownloadCopyWith<$Res> {
  factory _$$DownloadImplCopyWith(
          _$DownloadImpl value, $Res Function(_$DownloadImpl) then) =
      __$$DownloadImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Manga manga, Chapter chapter, List<Page>? pages});
}

/// @nodoc
class __$$DownloadImplCopyWithImpl<$Res>
    extends _$DownloadCopyWithImpl<$Res, _$DownloadImpl>
    implements _$$DownloadImplCopyWith<$Res> {
  __$$DownloadImplCopyWithImpl(
      _$DownloadImpl _value, $Res Function(_$DownloadImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? manga = null,
    Object? chapter = null,
    Object? pages = freezed,
  }) {
    return _then(_$DownloadImpl(
      null == manga
          ? _value.manga
          : manga // ignore: cast_nullable_to_non_nullable
              as Manga,
      null == chapter
          ? _value.chapter
          : chapter // ignore: cast_nullable_to_non_nullable
              as Chapter,
      freezed == pages
          ? _value.pages
          : pages // ignore: cast_nullable_to_non_nullable
              as List<Page>?,
    ));
  }
}

/// @nodoc

class _$DownloadImpl extends _Download {
  _$DownloadImpl(this.manga, this.chapter, [this.pages]) : super._();

//HttpSource source,
  @override
  Manga manga;
  @override
  Chapter chapter;
  @override
  List<Page>? pages;

  @override
  String toString() {
    return 'Download(manga: $manga, chapter: $chapter, pages: $pages)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DownloadImplCopyWith<_$DownloadImpl> get copyWith =>
      __$$DownloadImplCopyWithImpl<_$DownloadImpl>(this, _$identity);
}

abstract class _Download extends Download {
  factory _Download(Manga manga, Chapter chapter, [List<Page>? pages]) =
      _$DownloadImpl;
  _Download._() : super._();

  @override //HttpSource source,
  Manga get manga; //HttpSource source,
  set manga(Manga value);
  @override
  Chapter get chapter;
  set chapter(Chapter value);
  @override
  List<Page>? get pages;
  set pages(List<Page>? value);
  @override
  @JsonKey(ignore: true)
  _$$DownloadImplCopyWith<_$DownloadImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
