// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'updates_screen_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$UpdatesScreenState {
  List<UpdatesItem> get items => throw _privateConstructorUsedError;
  set items(List<UpdatesItem> value) => throw _privateConstructorUsedError;
  DateTime get lastUpdated => throw _privateConstructorUsedError;
  set lastUpdated(DateTime value) => throw _privateConstructorUsedError;
  List<int> get selectedPositions => throw _privateConstructorUsedError;
  set selectedPositions(List<int> value) => throw _privateConstructorUsedError;
  Set<int> get selectedChapterIds => throw _privateConstructorUsedError;
  set selectedChapterIds(Set<int> value) => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UpdatesScreenStateCopyWith<UpdatesScreenState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdatesScreenStateCopyWith<$Res> {
  factory $UpdatesScreenStateCopyWith(
          UpdatesScreenState value, $Res Function(UpdatesScreenState) then) =
      _$UpdatesScreenStateCopyWithImpl<$Res, UpdatesScreenState>;
  @useResult
  $Res call(
      {List<UpdatesItem> items,
      DateTime lastUpdated,
      List<int> selectedPositions,
      Set<int> selectedChapterIds});
}

/// @nodoc
class _$UpdatesScreenStateCopyWithImpl<$Res, $Val extends UpdatesScreenState>
    implements $UpdatesScreenStateCopyWith<$Res> {
  _$UpdatesScreenStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
    Object? lastUpdated = null,
    Object? selectedPositions = null,
    Object? selectedChapterIds = null,
  }) {
    return _then(_value.copyWith(
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<UpdatesItem>,
      lastUpdated: null == lastUpdated
          ? _value.lastUpdated
          : lastUpdated // ignore: cast_nullable_to_non_nullable
              as DateTime,
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
abstract class _$$UpdatesScreenStateImplCopyWith<$Res>
    implements $UpdatesScreenStateCopyWith<$Res> {
  factory _$$UpdatesScreenStateImplCopyWith(_$UpdatesScreenStateImpl value,
          $Res Function(_$UpdatesScreenStateImpl) then) =
      __$$UpdatesScreenStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<UpdatesItem> items,
      DateTime lastUpdated,
      List<int> selectedPositions,
      Set<int> selectedChapterIds});
}

/// @nodoc
class __$$UpdatesScreenStateImplCopyWithImpl<$Res>
    extends _$UpdatesScreenStateCopyWithImpl<$Res, _$UpdatesScreenStateImpl>
    implements _$$UpdatesScreenStateImplCopyWith<$Res> {
  __$$UpdatesScreenStateImplCopyWithImpl(_$UpdatesScreenStateImpl _value,
      $Res Function(_$UpdatesScreenStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
    Object? lastUpdated = null,
    Object? selectedPositions = null,
    Object? selectedChapterIds = null,
  }) {
    return _then(_$UpdatesScreenStateImpl(
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<UpdatesItem>,
      lastUpdated: null == lastUpdated
          ? _value.lastUpdated
          : lastUpdated // ignore: cast_nullable_to_non_nullable
              as DateTime,
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

class _$UpdatesScreenStateImpl extends _UpdatesScreenState {
  _$UpdatesScreenStateImpl(
      {required this.items,
      required this.lastUpdated,
      this.selectedPositions = const [-1, -1],
      this.selectedChapterIds = const {}})
      : super._();

  @override
  List<UpdatesItem> items;
  @override
  DateTime lastUpdated;
  @override
  @JsonKey()
  List<int> selectedPositions;
  @override
  @JsonKey()
  Set<int> selectedChapterIds;

  @override
  String toString() {
    return 'UpdatesScreenState(items: $items, lastUpdated: $lastUpdated, selectedPositions: $selectedPositions, selectedChapterIds: $selectedChapterIds)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdatesScreenStateImplCopyWith<_$UpdatesScreenStateImpl> get copyWith =>
      __$$UpdatesScreenStateImplCopyWithImpl<_$UpdatesScreenStateImpl>(
          this, _$identity);
}

abstract class _UpdatesScreenState extends UpdatesScreenState {
  factory _UpdatesScreenState(
      {required List<UpdatesItem> items,
      required DateTime lastUpdated,
      List<int> selectedPositions,
      Set<int> selectedChapterIds}) = _$UpdatesScreenStateImpl;
  _UpdatesScreenState._() : super._();

  @override
  List<UpdatesItem> get items;
  set items(List<UpdatesItem> value);
  @override
  DateTime get lastUpdated;
  set lastUpdated(DateTime value);
  @override
  List<int> get selectedPositions;
  set selectedPositions(List<int> value);
  @override
  Set<int> get selectedChapterIds;
  set selectedChapterIds(Set<int> value);
  @override
  @JsonKey(ignore: true)
  _$$UpdatesScreenStateImplCopyWith<_$UpdatesScreenStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$UpdatesItem {
  UpdatesWithRelations get update => throw _privateConstructorUsedError;
  DownloadState Function() get downloadStateProvider =>
      throw _privateConstructorUsedError;
  int Function() get downloadProgressProvider =>
      throw _privateConstructorUsedError;
  bool get selected => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UpdatesItemCopyWith<UpdatesItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdatesItemCopyWith<$Res> {
  factory $UpdatesItemCopyWith(
          UpdatesItem value, $Res Function(UpdatesItem) then) =
      _$UpdatesItemCopyWithImpl<$Res, UpdatesItem>;
  @useResult
  $Res call(
      {UpdatesWithRelations update,
      DownloadState Function() downloadStateProvider,
      int Function() downloadProgressProvider,
      bool selected});

  $UpdatesWithRelationsCopyWith<$Res> get update;
}

/// @nodoc
class _$UpdatesItemCopyWithImpl<$Res, $Val extends UpdatesItem>
    implements $UpdatesItemCopyWith<$Res> {
  _$UpdatesItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? update = null,
    Object? downloadStateProvider = null,
    Object? downloadProgressProvider = null,
    Object? selected = null,
  }) {
    return _then(_value.copyWith(
      update: null == update
          ? _value.update
          : update // ignore: cast_nullable_to_non_nullable
              as UpdatesWithRelations,
      downloadStateProvider: null == downloadStateProvider
          ? _value.downloadStateProvider
          : downloadStateProvider // ignore: cast_nullable_to_non_nullable
              as DownloadState Function(),
      downloadProgressProvider: null == downloadProgressProvider
          ? _value.downloadProgressProvider
          : downloadProgressProvider // ignore: cast_nullable_to_non_nullable
              as int Function(),
      selected: null == selected
          ? _value.selected
          : selected // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UpdatesWithRelationsCopyWith<$Res> get update {
    return $UpdatesWithRelationsCopyWith<$Res>(_value.update, (value) {
      return _then(_value.copyWith(update: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$UpdatesItemImplCopyWith<$Res>
    implements $UpdatesItemCopyWith<$Res> {
  factory _$$UpdatesItemImplCopyWith(
          _$UpdatesItemImpl value, $Res Function(_$UpdatesItemImpl) then) =
      __$$UpdatesItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {UpdatesWithRelations update,
      DownloadState Function() downloadStateProvider,
      int Function() downloadProgressProvider,
      bool selected});

  @override
  $UpdatesWithRelationsCopyWith<$Res> get update;
}

/// @nodoc
class __$$UpdatesItemImplCopyWithImpl<$Res>
    extends _$UpdatesItemCopyWithImpl<$Res, _$UpdatesItemImpl>
    implements _$$UpdatesItemImplCopyWith<$Res> {
  __$$UpdatesItemImplCopyWithImpl(
      _$UpdatesItemImpl _value, $Res Function(_$UpdatesItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? update = null,
    Object? downloadStateProvider = null,
    Object? downloadProgressProvider = null,
    Object? selected = null,
  }) {
    return _then(_$UpdatesItemImpl(
      update: null == update
          ? _value.update
          : update // ignore: cast_nullable_to_non_nullable
              as UpdatesWithRelations,
      downloadStateProvider: null == downloadStateProvider
          ? _value.downloadStateProvider
          : downloadStateProvider // ignore: cast_nullable_to_non_nullable
              as DownloadState Function(),
      downloadProgressProvider: null == downloadProgressProvider
          ? _value.downloadProgressProvider
          : downloadProgressProvider // ignore: cast_nullable_to_non_nullable
              as int Function(),
      selected: null == selected
          ? _value.selected
          : selected // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$UpdatesItemImpl implements _UpdatesItem {
  const _$UpdatesItemImpl(
      {required this.update,
      required this.downloadStateProvider,
      required this.downloadProgressProvider,
      this.selected = false});

  @override
  final UpdatesWithRelations update;
  @override
  final DownloadState Function() downloadStateProvider;
  @override
  final int Function() downloadProgressProvider;
  @override
  @JsonKey()
  final bool selected;

  @override
  String toString() {
    return 'UpdatesItem(update: $update, downloadStateProvider: $downloadStateProvider, downloadProgressProvider: $downloadProgressProvider, selected: $selected)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdatesItemImpl &&
            (identical(other.update, update) || other.update == update) &&
            (identical(other.downloadStateProvider, downloadStateProvider) ||
                other.downloadStateProvider == downloadStateProvider) &&
            (identical(
                    other.downloadProgressProvider, downloadProgressProvider) ||
                other.downloadProgressProvider == downloadProgressProvider) &&
            (identical(other.selected, selected) ||
                other.selected == selected));
  }

  @override
  int get hashCode => Object.hash(runtimeType, update, downloadStateProvider,
      downloadProgressProvider, selected);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdatesItemImplCopyWith<_$UpdatesItemImpl> get copyWith =>
      __$$UpdatesItemImplCopyWithImpl<_$UpdatesItemImpl>(this, _$identity);
}

abstract class _UpdatesItem implements UpdatesItem {
  const factory _UpdatesItem(
      {required final UpdatesWithRelations update,
      required final DownloadState Function() downloadStateProvider,
      required final int Function() downloadProgressProvider,
      final bool selected}) = _$UpdatesItemImpl;

  @override
  UpdatesWithRelations get update;
  @override
  DownloadState Function() get downloadStateProvider;
  @override
  int Function() get downloadProgressProvider;
  @override
  bool get selected;
  @override
  @JsonKey(ignore: true)
  _$$UpdatesItemImplCopyWith<_$UpdatesItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
