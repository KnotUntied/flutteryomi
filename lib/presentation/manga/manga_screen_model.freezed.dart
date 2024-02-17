// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'manga_screen_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$MangaScreenState {
  Manga get manga => throw _privateConstructorUsedError;
  set manga(Manga value) => throw _privateConstructorUsedError;
  Source get source => throw _privateConstructorUsedError;
  set source(Source value) => throw _privateConstructorUsedError;
  bool get isFromSource => throw _privateConstructorUsedError;
  set isFromSource(bool value) => throw _privateConstructorUsedError;
  List<ChapterListItem> get chapters => throw _privateConstructorUsedError;
  set chapters(List<ChapterListItem> value) =>
      throw _privateConstructorUsedError;
  Set<String> get availableScanlators => throw _privateConstructorUsedError;
  set availableScanlators(Set<String> value) =>
      throw _privateConstructorUsedError;
  Set<String> get excludedScanlators => throw _privateConstructorUsedError;
  set excludedScanlators(Set<String> value) =>
      throw _privateConstructorUsedError;
  List<TrackItem> get trackItems => throw _privateConstructorUsedError;
  set trackItems(List<TrackItem> value) => throw _privateConstructorUsedError;
  bool get hasPromptedToAddBefore => throw _privateConstructorUsedError;
  set hasPromptedToAddBefore(bool value) => throw _privateConstructorUsedError;
  List<int> get selectedPositions => throw _privateConstructorUsedError;
  set selectedPositions(List<int> value) =>
      throw _privateConstructorUsedError; // first and last selected index in list
  Set<int> get selectedChapterIds =>
      throw _privateConstructorUsedError; // first and last selected index in list
  set selectedChapterIds(Set<int> value) => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MangaScreenStateCopyWith<MangaScreenState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MangaScreenStateCopyWith<$Res> {
  factory $MangaScreenStateCopyWith(
          MangaScreenState value, $Res Function(MangaScreenState) then) =
      _$MangaScreenStateCopyWithImpl<$Res, MangaScreenState>;
  @useResult
  $Res call(
      {Manga manga,
      Source source,
      bool isFromSource,
      List<ChapterListItem> chapters,
      Set<String> availableScanlators,
      Set<String> excludedScanlators,
      List<TrackItem> trackItems,
      bool hasPromptedToAddBefore,
      List<int> selectedPositions,
      Set<int> selectedChapterIds});
}

/// @nodoc
class _$MangaScreenStateCopyWithImpl<$Res, $Val extends MangaScreenState>
    implements $MangaScreenStateCopyWith<$Res> {
  _$MangaScreenStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? manga = null,
    Object? source = null,
    Object? isFromSource = null,
    Object? chapters = null,
    Object? availableScanlators = null,
    Object? excludedScanlators = null,
    Object? trackItems = null,
    Object? hasPromptedToAddBefore = null,
    Object? selectedPositions = null,
    Object? selectedChapterIds = null,
  }) {
    return _then(_value.copyWith(
      manga: null == manga
          ? _value.manga
          : manga // ignore: cast_nullable_to_non_nullable
              as Manga,
      source: null == source
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as Source,
      isFromSource: null == isFromSource
          ? _value.isFromSource
          : isFromSource // ignore: cast_nullable_to_non_nullable
              as bool,
      chapters: null == chapters
          ? _value.chapters
          : chapters // ignore: cast_nullable_to_non_nullable
              as List<ChapterListItem>,
      availableScanlators: null == availableScanlators
          ? _value.availableScanlators
          : availableScanlators // ignore: cast_nullable_to_non_nullable
              as Set<String>,
      excludedScanlators: null == excludedScanlators
          ? _value.excludedScanlators
          : excludedScanlators // ignore: cast_nullable_to_non_nullable
              as Set<String>,
      trackItems: null == trackItems
          ? _value.trackItems
          : trackItems // ignore: cast_nullable_to_non_nullable
              as List<TrackItem>,
      hasPromptedToAddBefore: null == hasPromptedToAddBefore
          ? _value.hasPromptedToAddBefore
          : hasPromptedToAddBefore // ignore: cast_nullable_to_non_nullable
              as bool,
      selectedPositions: null == selectedPositions
          ? _value.selectedPositions
          : selectedPositions // ignore: cast_nullable_to_non_nullable
              as List<int>,
      selectedChapterIds: null == selectedChapterIds
          ? _value.selectedChapterIds
          : selectedChapterIds // ignore: cast_nullable_to_non_nullable
              as Set<int>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MangaScreenStateImplCopyWith<$Res>
    implements $MangaScreenStateCopyWith<$Res> {
  factory _$$MangaScreenStateImplCopyWith(_$MangaScreenStateImpl value,
          $Res Function(_$MangaScreenStateImpl) then) =
      __$$MangaScreenStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Manga manga,
      Source source,
      bool isFromSource,
      List<ChapterListItem> chapters,
      Set<String> availableScanlators,
      Set<String> excludedScanlators,
      List<TrackItem> trackItems,
      bool hasPromptedToAddBefore,
      List<int> selectedPositions,
      Set<int> selectedChapterIds});
}

/// @nodoc
class __$$MangaScreenStateImplCopyWithImpl<$Res>
    extends _$MangaScreenStateCopyWithImpl<$Res, _$MangaScreenStateImpl>
    implements _$$MangaScreenStateImplCopyWith<$Res> {
  __$$MangaScreenStateImplCopyWithImpl(_$MangaScreenStateImpl _value,
      $Res Function(_$MangaScreenStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? manga = null,
    Object? source = null,
    Object? isFromSource = null,
    Object? chapters = null,
    Object? availableScanlators = null,
    Object? excludedScanlators = null,
    Object? trackItems = null,
    Object? hasPromptedToAddBefore = null,
    Object? selectedPositions = null,
    Object? selectedChapterIds = null,
  }) {
    return _then(_$MangaScreenStateImpl(
      manga: null == manga
          ? _value.manga
          : manga // ignore: cast_nullable_to_non_nullable
              as Manga,
      source: null == source
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as Source,
      isFromSource: null == isFromSource
          ? _value.isFromSource
          : isFromSource // ignore: cast_nullable_to_non_nullable
              as bool,
      chapters: null == chapters
          ? _value.chapters
          : chapters // ignore: cast_nullable_to_non_nullable
              as List<ChapterListItem>,
      availableScanlators: null == availableScanlators
          ? _value.availableScanlators
          : availableScanlators // ignore: cast_nullable_to_non_nullable
              as Set<String>,
      excludedScanlators: null == excludedScanlators
          ? _value.excludedScanlators
          : excludedScanlators // ignore: cast_nullable_to_non_nullable
              as Set<String>,
      trackItems: null == trackItems
          ? _value.trackItems
          : trackItems // ignore: cast_nullable_to_non_nullable
              as List<TrackItem>,
      hasPromptedToAddBefore: null == hasPromptedToAddBefore
          ? _value.hasPromptedToAddBefore
          : hasPromptedToAddBefore // ignore: cast_nullable_to_non_nullable
              as bool,
      selectedPositions: null == selectedPositions
          ? _value.selectedPositions
          : selectedPositions // ignore: cast_nullable_to_non_nullable
              as List<int>,
      selectedChapterIds: null == selectedChapterIds
          ? _value.selectedChapterIds
          : selectedChapterIds // ignore: cast_nullable_to_non_nullable
              as Set<int>,
    ));
  }
}

/// @nodoc

class _$MangaScreenStateImpl extends _MangaScreenState {
  _$MangaScreenStateImpl(
      {required this.manga,
      required this.source,
      required this.isFromSource,
      required this.chapters,
      required this.availableScanlators,
      required this.excludedScanlators,
      this.trackItems = const [],
      this.hasPromptedToAddBefore = false,
      this.selectedPositions = const [-1, -1],
      this.selectedChapterIds = const {}})
      : super._();

  @override
  Manga manga;
  @override
  Source source;
  @override
  bool isFromSource;
  @override
  List<ChapterListItem> chapters;
  @override
  Set<String> availableScanlators;
  @override
  Set<String> excludedScanlators;
  @override
  @JsonKey()
  List<TrackItem> trackItems;
  @override
  @JsonKey()
  bool hasPromptedToAddBefore;
  @override
  @JsonKey()
  List<int> selectedPositions;
// first and last selected index in list
  @override
  @JsonKey()
  Set<int> selectedChapterIds;

  @override
  String toString() {
    return 'MangaScreenState(manga: $manga, source: $source, isFromSource: $isFromSource, chapters: $chapters, availableScanlators: $availableScanlators, excludedScanlators: $excludedScanlators, trackItems: $trackItems, hasPromptedToAddBefore: $hasPromptedToAddBefore, selectedPositions: $selectedPositions, selectedChapterIds: $selectedChapterIds)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MangaScreenStateImplCopyWith<_$MangaScreenStateImpl> get copyWith =>
      __$$MangaScreenStateImplCopyWithImpl<_$MangaScreenStateImpl>(
          this, _$identity);
}

abstract class _MangaScreenState extends MangaScreenState {
  factory _MangaScreenState(
      {required Manga manga,
      required Source source,
      required bool isFromSource,
      required List<ChapterListItem> chapters,
      required Set<String> availableScanlators,
      required Set<String> excludedScanlators,
      List<TrackItem> trackItems,
      bool hasPromptedToAddBefore,
      List<int> selectedPositions,
      Set<int> selectedChapterIds}) = _$MangaScreenStateImpl;
  _MangaScreenState._() : super._();

  @override
  Manga get manga;
  set manga(Manga value);
  @override
  Source get source;
  set source(Source value);
  @override
  bool get isFromSource;
  set isFromSource(bool value);
  @override
  List<ChapterListItem> get chapters;
  set chapters(List<ChapterListItem> value);
  @override
  Set<String> get availableScanlators;
  set availableScanlators(Set<String> value);
  @override
  Set<String> get excludedScanlators;
  set excludedScanlators(Set<String> value);
  @override
  List<TrackItem> get trackItems;
  set trackItems(List<TrackItem> value);
  @override
  bool get hasPromptedToAddBefore;
  set hasPromptedToAddBefore(bool value);
  @override
  List<int> get selectedPositions;
  set selectedPositions(List<int> value);
  @override // first and last selected index in list
  Set<int> get selectedChapterIds; // first and last selected index in list
  set selectedChapterIds(Set<int> value);
  @override
  @JsonKey(ignore: true)
  _$$MangaScreenStateImplCopyWith<_$MangaScreenStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ChapterListMissingCount {
  String get id => throw _privateConstructorUsedError;
  int get count => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ChapterListMissingCountCopyWith<ChapterListMissingCount> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChapterListMissingCountCopyWith<$Res> {
  factory $ChapterListMissingCountCopyWith(ChapterListMissingCount value,
          $Res Function(ChapterListMissingCount) then) =
      _$ChapterListMissingCountCopyWithImpl<$Res, ChapterListMissingCount>;
  @useResult
  $Res call({String id, int count});
}

/// @nodoc
class _$ChapterListMissingCountCopyWithImpl<$Res,
        $Val extends ChapterListMissingCount>
    implements $ChapterListMissingCountCopyWith<$Res> {
  _$ChapterListMissingCountCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? count = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChapterListMissingCountImplCopyWith<$Res>
    implements $ChapterListMissingCountCopyWith<$Res> {
  factory _$$ChapterListMissingCountImplCopyWith(
          _$ChapterListMissingCountImpl value,
          $Res Function(_$ChapterListMissingCountImpl) then) =
      __$$ChapterListMissingCountImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, int count});
}

/// @nodoc
class __$$ChapterListMissingCountImplCopyWithImpl<$Res>
    extends _$ChapterListMissingCountCopyWithImpl<$Res,
        _$ChapterListMissingCountImpl>
    implements _$$ChapterListMissingCountImplCopyWith<$Res> {
  __$$ChapterListMissingCountImplCopyWithImpl(
      _$ChapterListMissingCountImpl _value,
      $Res Function(_$ChapterListMissingCountImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? count = null,
  }) {
    return _then(_$ChapterListMissingCountImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$ChapterListMissingCountImpl implements _ChapterListMissingCount {
  const _$ChapterListMissingCountImpl({required this.id, required this.count});

  @override
  final String id;
  @override
  final int count;

  @override
  String toString() {
    return 'ChapterListMissingCount(id: $id, count: $count)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChapterListMissingCountImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.count, count) || other.count == count));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, count);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChapterListMissingCountImplCopyWith<_$ChapterListMissingCountImpl>
      get copyWith => __$$ChapterListMissingCountImplCopyWithImpl<
          _$ChapterListMissingCountImpl>(this, _$identity);
}

abstract class _ChapterListMissingCount implements ChapterListMissingCount {
  const factory _ChapterListMissingCount(
      {required final String id,
      required final int count}) = _$ChapterListMissingCountImpl;

  @override
  String get id;
  @override
  int get count;
  @override
  @JsonKey(ignore: true)
  _$$ChapterListMissingCountImplCopyWith<_$ChapterListMissingCountImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ChapterListItem {
  Chapter get chapter => throw _privateConstructorUsedError;
  DownloadState get downloadState => throw _privateConstructorUsedError;
  int get downloadProgress => throw _privateConstructorUsedError;
  bool get selected => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ChapterListItemCopyWith<ChapterListItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChapterListItemCopyWith<$Res> {
  factory $ChapterListItemCopyWith(
          ChapterListItem value, $Res Function(ChapterListItem) then) =
      _$ChapterListItemCopyWithImpl<$Res, ChapterListItem>;
  @useResult
  $Res call(
      {Chapter chapter,
      DownloadState downloadState,
      int downloadProgress,
      bool selected});
}

/// @nodoc
class _$ChapterListItemCopyWithImpl<$Res, $Val extends ChapterListItem>
    implements $ChapterListItemCopyWith<$Res> {
  _$ChapterListItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? chapter = null,
    Object? downloadState = null,
    Object? downloadProgress = null,
    Object? selected = null,
  }) {
    return _then(_value.copyWith(
      chapter: null == chapter
          ? _value.chapter
          : chapter // ignore: cast_nullable_to_non_nullable
              as Chapter,
      downloadState: null == downloadState
          ? _value.downloadState
          : downloadState // ignore: cast_nullable_to_non_nullable
              as DownloadState,
      downloadProgress: null == downloadProgress
          ? _value.downloadProgress
          : downloadProgress // ignore: cast_nullable_to_non_nullable
              as int,
      selected: null == selected
          ? _value.selected
          : selected // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChapterListItemImplCopyWith<$Res>
    implements $ChapterListItemCopyWith<$Res> {
  factory _$$ChapterListItemImplCopyWith(_$ChapterListItemImpl value,
          $Res Function(_$ChapterListItemImpl) then) =
      __$$ChapterListItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Chapter chapter,
      DownloadState downloadState,
      int downloadProgress,
      bool selected});
}

/// @nodoc
class __$$ChapterListItemImplCopyWithImpl<$Res>
    extends _$ChapterListItemCopyWithImpl<$Res, _$ChapterListItemImpl>
    implements _$$ChapterListItemImplCopyWith<$Res> {
  __$$ChapterListItemImplCopyWithImpl(
      _$ChapterListItemImpl _value, $Res Function(_$ChapterListItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? chapter = null,
    Object? downloadState = null,
    Object? downloadProgress = null,
    Object? selected = null,
  }) {
    return _then(_$ChapterListItemImpl(
      chapter: null == chapter
          ? _value.chapter
          : chapter // ignore: cast_nullable_to_non_nullable
              as Chapter,
      downloadState: null == downloadState
          ? _value.downloadState
          : downloadState // ignore: cast_nullable_to_non_nullable
              as DownloadState,
      downloadProgress: null == downloadProgress
          ? _value.downloadProgress
          : downloadProgress // ignore: cast_nullable_to_non_nullable
              as int,
      selected: null == selected
          ? _value.selected
          : selected // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$ChapterListItemImpl extends _ChapterListItem {
  _$ChapterListItemImpl(
      {required this.chapter,
      required this.downloadState,
      required this.downloadProgress,
      this.selected = false})
      : super._();

  @override
  final Chapter chapter;
  @override
  final DownloadState downloadState;
  @override
  final int downloadProgress;
  @override
  @JsonKey()
  final bool selected;

  @override
  String toString() {
    return 'ChapterListItem(chapter: $chapter, downloadState: $downloadState, downloadProgress: $downloadProgress, selected: $selected)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChapterListItemImpl &&
            (identical(other.chapter, chapter) || other.chapter == chapter) &&
            (identical(other.downloadState, downloadState) ||
                other.downloadState == downloadState) &&
            (identical(other.downloadProgress, downloadProgress) ||
                other.downloadProgress == downloadProgress) &&
            (identical(other.selected, selected) ||
                other.selected == selected));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, chapter, downloadState, downloadProgress, selected);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChapterListItemImplCopyWith<_$ChapterListItemImpl> get copyWith =>
      __$$ChapterListItemImplCopyWithImpl<_$ChapterListItemImpl>(
          this, _$identity);
}

abstract class _ChapterListItem extends ChapterListItem {
  factory _ChapterListItem(
      {required final Chapter chapter,
      required final DownloadState downloadState,
      required final int downloadProgress,
      final bool selected}) = _$ChapterListItemImpl;
  _ChapterListItem._() : super._();

  @override
  Chapter get chapter;
  @override
  DownloadState get downloadState;
  @override
  int get downloadProgress;
  @override
  bool get selected;
  @override
  @JsonKey(ignore: true)
  _$$ChapterListItemImplCopyWith<_$ChapterListItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
