// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reader_screen_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ReaderScreenState {
  /// The manga loaded in the reader.
  Manga? get manga => throw _privateConstructorUsedError;
  ViewerChapters? get viewerChapters => throw _privateConstructorUsedError;
  bool get bookmarked => throw _privateConstructorUsedError;
  bool get isLoadingAdjacentChapter => throw _privateConstructorUsedError;
  int get currentPage => throw _privateConstructorUsedError;

  /// Viewer used to display the pages (pager, webtoon, ...).
  Viewer? get viewer => throw _privateConstructorUsedError;
  bool get menuVisible => throw _privateConstructorUsedError;
  int get brightnessOverlayValue => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ReaderScreenStateCopyWith<ReaderScreenState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReaderScreenStateCopyWith<$Res> {
  factory $ReaderScreenStateCopyWith(
          ReaderScreenState value, $Res Function(ReaderScreenState) then) =
      _$ReaderScreenStateCopyWithImpl<$Res, ReaderScreenState>;
  @useResult
  $Res call(
      {Manga? manga,
      ViewerChapters? viewerChapters,
      bool bookmarked,
      bool isLoadingAdjacentChapter,
      int currentPage,
      Viewer? viewer,
      bool menuVisible,
      int brightnessOverlayValue});

  $ViewerChaptersCopyWith<$Res>? get viewerChapters;
}

/// @nodoc
class _$ReaderScreenStateCopyWithImpl<$Res, $Val extends ReaderScreenState>
    implements $ReaderScreenStateCopyWith<$Res> {
  _$ReaderScreenStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? manga = freezed,
    Object? viewerChapters = freezed,
    Object? bookmarked = null,
    Object? isLoadingAdjacentChapter = null,
    Object? currentPage = null,
    Object? viewer = freezed,
    Object? menuVisible = null,
    Object? brightnessOverlayValue = null,
  }) {
    return _then(_value.copyWith(
      manga: freezed == manga
          ? _value.manga
          : manga // ignore: cast_nullable_to_non_nullable
              as Manga?,
      viewerChapters: freezed == viewerChapters
          ? _value.viewerChapters
          : viewerChapters // ignore: cast_nullable_to_non_nullable
              as ViewerChapters?,
      bookmarked: null == bookmarked
          ? _value.bookmarked
          : bookmarked // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoadingAdjacentChapter: null == isLoadingAdjacentChapter
          ? _value.isLoadingAdjacentChapter
          : isLoadingAdjacentChapter // ignore: cast_nullable_to_non_nullable
              as bool,
      currentPage: null == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      viewer: freezed == viewer
          ? _value.viewer
          : viewer // ignore: cast_nullable_to_non_nullable
              as Viewer?,
      menuVisible: null == menuVisible
          ? _value.menuVisible
          : menuVisible // ignore: cast_nullable_to_non_nullable
              as bool,
      brightnessOverlayValue: null == brightnessOverlayValue
          ? _value.brightnessOverlayValue
          : brightnessOverlayValue // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ViewerChaptersCopyWith<$Res>? get viewerChapters {
    if (_value.viewerChapters == null) {
      return null;
    }

    return $ViewerChaptersCopyWith<$Res>(_value.viewerChapters!, (value) {
      return _then(_value.copyWith(viewerChapters: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ReaderScreenStateImplCopyWith<$Res>
    implements $ReaderScreenStateCopyWith<$Res> {
  factory _$$ReaderScreenStateImplCopyWith(_$ReaderScreenStateImpl value,
          $Res Function(_$ReaderScreenStateImpl) then) =
      __$$ReaderScreenStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Manga? manga,
      ViewerChapters? viewerChapters,
      bool bookmarked,
      bool isLoadingAdjacentChapter,
      int currentPage,
      Viewer? viewer,
      bool menuVisible,
      int brightnessOverlayValue});

  @override
  $ViewerChaptersCopyWith<$Res>? get viewerChapters;
}

/// @nodoc
class __$$ReaderScreenStateImplCopyWithImpl<$Res>
    extends _$ReaderScreenStateCopyWithImpl<$Res, _$ReaderScreenStateImpl>
    implements _$$ReaderScreenStateImplCopyWith<$Res> {
  __$$ReaderScreenStateImplCopyWithImpl(_$ReaderScreenStateImpl _value,
      $Res Function(_$ReaderScreenStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? manga = freezed,
    Object? viewerChapters = freezed,
    Object? bookmarked = null,
    Object? isLoadingAdjacentChapter = null,
    Object? currentPage = null,
    Object? viewer = freezed,
    Object? menuVisible = null,
    Object? brightnessOverlayValue = null,
  }) {
    return _then(_$ReaderScreenStateImpl(
      manga: freezed == manga
          ? _value.manga
          : manga // ignore: cast_nullable_to_non_nullable
              as Manga?,
      viewerChapters: freezed == viewerChapters
          ? _value.viewerChapters
          : viewerChapters // ignore: cast_nullable_to_non_nullable
              as ViewerChapters?,
      bookmarked: null == bookmarked
          ? _value.bookmarked
          : bookmarked // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoadingAdjacentChapter: null == isLoadingAdjacentChapter
          ? _value.isLoadingAdjacentChapter
          : isLoadingAdjacentChapter // ignore: cast_nullable_to_non_nullable
              as bool,
      currentPage: null == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      viewer: freezed == viewer
          ? _value.viewer
          : viewer // ignore: cast_nullable_to_non_nullable
              as Viewer?,
      menuVisible: null == menuVisible
          ? _value.menuVisible
          : menuVisible // ignore: cast_nullable_to_non_nullable
              as bool,
      brightnessOverlayValue: null == brightnessOverlayValue
          ? _value.brightnessOverlayValue
          : brightnessOverlayValue // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$ReaderScreenStateImpl extends _ReaderScreenState {
  const _$ReaderScreenStateImpl(
      {this.manga,
      this.viewerChapters,
      this.bookmarked = false,
      this.isLoadingAdjacentChapter = false,
      this.currentPage = -1,
      this.viewer,
      this.menuVisible = false,
      this.brightnessOverlayValue = 0})
      : assert(brightnessOverlayValue >= -100),
        assert(brightnessOverlayValue <= 100),
        super._();

  /// The manga loaded in the reader.
  @override
  final Manga? manga;
  @override
  final ViewerChapters? viewerChapters;
  @override
  @JsonKey()
  final bool bookmarked;
  @override
  @JsonKey()
  final bool isLoadingAdjacentChapter;
  @override
  @JsonKey()
  final int currentPage;

  /// Viewer used to display the pages (pager, webtoon, ...).
  @override
  final Viewer? viewer;
  @override
  @JsonKey()
  final bool menuVisible;
  @override
  @JsonKey()
  final int brightnessOverlayValue;

  @override
  String toString() {
    return 'ReaderScreenState(manga: $manga, viewerChapters: $viewerChapters, bookmarked: $bookmarked, isLoadingAdjacentChapter: $isLoadingAdjacentChapter, currentPage: $currentPage, viewer: $viewer, menuVisible: $menuVisible, brightnessOverlayValue: $brightnessOverlayValue)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReaderScreenStateImpl &&
            (identical(other.manga, manga) || other.manga == manga) &&
            (identical(other.viewerChapters, viewerChapters) ||
                other.viewerChapters == viewerChapters) &&
            (identical(other.bookmarked, bookmarked) ||
                other.bookmarked == bookmarked) &&
            (identical(
                    other.isLoadingAdjacentChapter, isLoadingAdjacentChapter) ||
                other.isLoadingAdjacentChapter == isLoadingAdjacentChapter) &&
            (identical(other.currentPage, currentPage) ||
                other.currentPage == currentPage) &&
            (identical(other.viewer, viewer) || other.viewer == viewer) &&
            (identical(other.menuVisible, menuVisible) ||
                other.menuVisible == menuVisible) &&
            (identical(other.brightnessOverlayValue, brightnessOverlayValue) ||
                other.brightnessOverlayValue == brightnessOverlayValue));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      manga,
      viewerChapters,
      bookmarked,
      isLoadingAdjacentChapter,
      currentPage,
      viewer,
      menuVisible,
      brightnessOverlayValue);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ReaderScreenStateImplCopyWith<_$ReaderScreenStateImpl> get copyWith =>
      __$$ReaderScreenStateImplCopyWithImpl<_$ReaderScreenStateImpl>(
          this, _$identity);
}

abstract class _ReaderScreenState extends ReaderScreenState {
  const factory _ReaderScreenState(
      {final Manga? manga,
      final ViewerChapters? viewerChapters,
      final bool bookmarked,
      final bool isLoadingAdjacentChapter,
      final int currentPage,
      final Viewer? viewer,
      final bool menuVisible,
      final int brightnessOverlayValue}) = _$ReaderScreenStateImpl;
  const _ReaderScreenState._() : super._();

  @override

  /// The manga loaded in the reader.
  Manga? get manga;
  @override
  ViewerChapters? get viewerChapters;
  @override
  bool get bookmarked;
  @override
  bool get isLoadingAdjacentChapter;
  @override
  int get currentPage;
  @override

  /// Viewer used to display the pages (pager, webtoon, ...).
  Viewer? get viewer;
  @override
  bool get menuVisible;
  @override
  int get brightnessOverlayValue;
  @override
  @JsonKey(ignore: true)
  _$$ReaderScreenStateImplCopyWith<_$ReaderScreenStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
