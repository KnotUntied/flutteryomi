// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'stats_screen_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$StatsScreenState {
  Overview get overview => throw _privateConstructorUsedError;
  Titles get titles => throw _privateConstructorUsedError;
  Chapters get chapters => throw _privateConstructorUsedError;
  Trackers get trackers => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $StatsScreenStateCopyWith<StatsScreenState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StatsScreenStateCopyWith<$Res> {
  factory $StatsScreenStateCopyWith(
          StatsScreenState value, $Res Function(StatsScreenState) then) =
      _$StatsScreenStateCopyWithImpl<$Res, StatsScreenState>;
  @useResult
  $Res call(
      {Overview overview, Titles titles, Chapters chapters, Trackers trackers});
}

/// @nodoc
class _$StatsScreenStateCopyWithImpl<$Res, $Val extends StatsScreenState>
    implements $StatsScreenStateCopyWith<$Res> {
  _$StatsScreenStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? overview = freezed,
    Object? titles = freezed,
    Object? chapters = freezed,
    Object? trackers = freezed,
  }) {
    return _then(_value.copyWith(
      overview: freezed == overview
          ? _value.overview
          : overview // ignore: cast_nullable_to_non_nullable
              as Overview,
      titles: freezed == titles
          ? _value.titles
          : titles // ignore: cast_nullable_to_non_nullable
              as Titles,
      chapters: freezed == chapters
          ? _value.chapters
          : chapters // ignore: cast_nullable_to_non_nullable
              as Chapters,
      trackers: freezed == trackers
          ? _value.trackers
          : trackers // ignore: cast_nullable_to_non_nullable
              as Trackers,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StatsScreenStateImplCopyWith<$Res>
    implements $StatsScreenStateCopyWith<$Res> {
  factory _$$StatsScreenStateImplCopyWith(_$StatsScreenStateImpl value,
          $Res Function(_$StatsScreenStateImpl) then) =
      __$$StatsScreenStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Overview overview, Titles titles, Chapters chapters, Trackers trackers});
}

/// @nodoc
class __$$StatsScreenStateImplCopyWithImpl<$Res>
    extends _$StatsScreenStateCopyWithImpl<$Res, _$StatsScreenStateImpl>
    implements _$$StatsScreenStateImplCopyWith<$Res> {
  __$$StatsScreenStateImplCopyWithImpl(_$StatsScreenStateImpl _value,
      $Res Function(_$StatsScreenStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? overview = freezed,
    Object? titles = freezed,
    Object? chapters = freezed,
    Object? trackers = freezed,
  }) {
    return _then(_$StatsScreenStateImpl(
      overview: freezed == overview
          ? _value.overview
          : overview // ignore: cast_nullable_to_non_nullable
              as Overview,
      titles: freezed == titles
          ? _value.titles
          : titles // ignore: cast_nullable_to_non_nullable
              as Titles,
      chapters: freezed == chapters
          ? _value.chapters
          : chapters // ignore: cast_nullable_to_non_nullable
              as Chapters,
      trackers: freezed == trackers
          ? _value.trackers
          : trackers // ignore: cast_nullable_to_non_nullable
              as Trackers,
    ));
  }
}

/// @nodoc

class _$StatsScreenStateImpl implements _StatsScreenState {
  const _$StatsScreenStateImpl(
      {this.overview, this.titles, this.chapters, this.trackers});

  @override
  final Overview overview;
  @override
  final Titles titles;
  @override
  final Chapters chapters;
  @override
  final Trackers trackers;

  @override
  String toString() {
    return 'StatsScreenState(overview: $overview, titles: $titles, chapters: $chapters, trackers: $trackers)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StatsScreenStateImpl &&
            const DeepCollectionEquality().equals(other.overview, overview) &&
            const DeepCollectionEquality().equals(other.titles, titles) &&
            const DeepCollectionEquality().equals(other.chapters, chapters) &&
            const DeepCollectionEquality().equals(other.trackers, trackers));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(overview),
      const DeepCollectionEquality().hash(titles),
      const DeepCollectionEquality().hash(chapters),
      const DeepCollectionEquality().hash(trackers));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StatsScreenStateImplCopyWith<_$StatsScreenStateImpl> get copyWith =>
      __$$StatsScreenStateImplCopyWithImpl<_$StatsScreenStateImpl>(
          this, _$identity);
}

abstract class _StatsScreenState implements StatsScreenState {
  const factory _StatsScreenState(
      {final Overview overview,
      final Titles titles,
      final Chapters chapters,
      final Trackers trackers}) = _$StatsScreenStateImpl;

  @override
  Overview get overview;
  @override
  Titles get titles;
  @override
  Chapters get chapters;
  @override
  Trackers get trackers;
  @override
  @JsonKey(ignore: true)
  _$$StatsScreenStateImplCopyWith<_$StatsScreenStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
