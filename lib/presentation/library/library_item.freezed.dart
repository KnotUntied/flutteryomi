// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'library_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$LibraryItem {
  LibraryManga get libraryManga => throw _privateConstructorUsedError;
  int get downloadCount => throw _privateConstructorUsedError;
  int get unreadCount => throw _privateConstructorUsedError;
  bool get isLocal => throw _privateConstructorUsedError;
  String get sourceLanguage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LibraryItemCopyWith<LibraryItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LibraryItemCopyWith<$Res> {
  factory $LibraryItemCopyWith(
          LibraryItem value, $Res Function(LibraryItem) then) =
      _$LibraryItemCopyWithImpl<$Res, LibraryItem>;
  @useResult
  $Res call(
      {LibraryManga libraryManga,
      int downloadCount,
      int unreadCount,
      bool isLocal,
      String sourceLanguage});

  $LibraryMangaCopyWith<$Res> get libraryManga;
}

/// @nodoc
class _$LibraryItemCopyWithImpl<$Res, $Val extends LibraryItem>
    implements $LibraryItemCopyWith<$Res> {
  _$LibraryItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? libraryManga = null,
    Object? downloadCount = null,
    Object? unreadCount = null,
    Object? isLocal = null,
    Object? sourceLanguage = null,
  }) {
    return _then(_value.copyWith(
      libraryManga: null == libraryManga
          ? _value.libraryManga
          : libraryManga // ignore: cast_nullable_to_non_nullable
              as LibraryManga,
      downloadCount: null == downloadCount
          ? _value.downloadCount
          : downloadCount // ignore: cast_nullable_to_non_nullable
              as int,
      unreadCount: null == unreadCount
          ? _value.unreadCount
          : unreadCount // ignore: cast_nullable_to_non_nullable
              as int,
      isLocal: null == isLocal
          ? _value.isLocal
          : isLocal // ignore: cast_nullable_to_non_nullable
              as bool,
      sourceLanguage: null == sourceLanguage
          ? _value.sourceLanguage
          : sourceLanguage // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $LibraryMangaCopyWith<$Res> get libraryManga {
    return $LibraryMangaCopyWith<$Res>(_value.libraryManga, (value) {
      return _then(_value.copyWith(libraryManga: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$LibraryItemImplCopyWith<$Res>
    implements $LibraryItemCopyWith<$Res> {
  factory _$$LibraryItemImplCopyWith(
          _$LibraryItemImpl value, $Res Function(_$LibraryItemImpl) then) =
      __$$LibraryItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {LibraryManga libraryManga,
      int downloadCount,
      int unreadCount,
      bool isLocal,
      String sourceLanguage});

  @override
  $LibraryMangaCopyWith<$Res> get libraryManga;
}

/// @nodoc
class __$$LibraryItemImplCopyWithImpl<$Res>
    extends _$LibraryItemCopyWithImpl<$Res, _$LibraryItemImpl>
    implements _$$LibraryItemImplCopyWith<$Res> {
  __$$LibraryItemImplCopyWithImpl(
      _$LibraryItemImpl _value, $Res Function(_$LibraryItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? libraryManga = null,
    Object? downloadCount = null,
    Object? unreadCount = null,
    Object? isLocal = null,
    Object? sourceLanguage = null,
  }) {
    return _then(_$LibraryItemImpl(
      libraryManga: null == libraryManga
          ? _value.libraryManga
          : libraryManga // ignore: cast_nullable_to_non_nullable
              as LibraryManga,
      downloadCount: null == downloadCount
          ? _value.downloadCount
          : downloadCount // ignore: cast_nullable_to_non_nullable
              as int,
      unreadCount: null == unreadCount
          ? _value.unreadCount
          : unreadCount // ignore: cast_nullable_to_non_nullable
              as int,
      isLocal: null == isLocal
          ? _value.isLocal
          : isLocal // ignore: cast_nullable_to_non_nullable
              as bool,
      sourceLanguage: null == sourceLanguage
          ? _value.sourceLanguage
          : sourceLanguage // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$LibraryItemImpl extends _LibraryItem {
  const _$LibraryItemImpl(
      {required this.libraryManga,
      this.downloadCount = -1,
      this.unreadCount = -1,
      this.isLocal = false,
      this.sourceLanguage = ''})
      : super._();

  @override
  final LibraryManga libraryManga;
  @override
  @JsonKey()
  final int downloadCount;
  @override
  @JsonKey()
  final int unreadCount;
  @override
  @JsonKey()
  final bool isLocal;
  @override
  @JsonKey()
  final String sourceLanguage;

  @override
  String toString() {
    return 'LibraryItem(libraryManga: $libraryManga, downloadCount: $downloadCount, unreadCount: $unreadCount, isLocal: $isLocal, sourceLanguage: $sourceLanguage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LibraryItemImpl &&
            (identical(other.libraryManga, libraryManga) ||
                other.libraryManga == libraryManga) &&
            (identical(other.downloadCount, downloadCount) ||
                other.downloadCount == downloadCount) &&
            (identical(other.unreadCount, unreadCount) ||
                other.unreadCount == unreadCount) &&
            (identical(other.isLocal, isLocal) || other.isLocal == isLocal) &&
            (identical(other.sourceLanguage, sourceLanguage) ||
                other.sourceLanguage == sourceLanguage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, libraryManga, downloadCount,
      unreadCount, isLocal, sourceLanguage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LibraryItemImplCopyWith<_$LibraryItemImpl> get copyWith =>
      __$$LibraryItemImplCopyWithImpl<_$LibraryItemImpl>(this, _$identity);
}

abstract class _LibraryItem extends LibraryItem {
  const factory _LibraryItem(
      {required final LibraryManga libraryManga,
      final int downloadCount,
      final int unreadCount,
      final bool isLocal,
      final String sourceLanguage}) = _$LibraryItemImpl;
  const _LibraryItem._() : super._();

  @override
  LibraryManga get libraryManga;
  @override
  int get downloadCount;
  @override
  int get unreadCount;
  @override
  bool get isLocal;
  @override
  String get sourceLanguage;
  @override
  @JsonKey(ignore: true)
  _$$LibraryItemImplCopyWith<_$LibraryItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
