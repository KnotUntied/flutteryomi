// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sources_filter_screen_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SourcesFilterScreenState {
  SplayTreeMap<String, List<Source>> get items =>
      throw _privateConstructorUsedError;
  Set<String> get enabledLanguages => throw _privateConstructorUsedError;
  Set<String> get disabledSources => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SourcesFilterScreenStateCopyWith<SourcesFilterScreenState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SourcesFilterScreenStateCopyWith<$Res> {
  factory $SourcesFilterScreenStateCopyWith(SourcesFilterScreenState value,
          $Res Function(SourcesFilterScreenState) then) =
      _$SourcesFilterScreenStateCopyWithImpl<$Res, SourcesFilterScreenState>;
  @useResult
  $Res call(
      {SplayTreeMap<String, List<Source>> items,
      Set<String> enabledLanguages,
      Set<String> disabledSources});
}

/// @nodoc
class _$SourcesFilterScreenStateCopyWithImpl<$Res,
        $Val extends SourcesFilterScreenState>
    implements $SourcesFilterScreenStateCopyWith<$Res> {
  _$SourcesFilterScreenStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
    Object? enabledLanguages = null,
    Object? disabledSources = null,
  }) {
    return _then(_value.copyWith(
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as SplayTreeMap<String, List<Source>>,
      enabledLanguages: null == enabledLanguages
          ? _value.enabledLanguages
          : enabledLanguages // ignore: cast_nullable_to_non_nullable
              as Set<String>,
      disabledSources: null == disabledSources
          ? _value.disabledSources
          : disabledSources // ignore: cast_nullable_to_non_nullable
              as Set<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SourcesFilterScreenStateImplCopyWith<$Res>
    implements $SourcesFilterScreenStateCopyWith<$Res> {
  factory _$$SourcesFilterScreenStateImplCopyWith(
          _$SourcesFilterScreenStateImpl value,
          $Res Function(_$SourcesFilterScreenStateImpl) then) =
      __$$SourcesFilterScreenStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {SplayTreeMap<String, List<Source>> items,
      Set<String> enabledLanguages,
      Set<String> disabledSources});
}

/// @nodoc
class __$$SourcesFilterScreenStateImplCopyWithImpl<$Res>
    extends _$SourcesFilterScreenStateCopyWithImpl<$Res,
        _$SourcesFilterScreenStateImpl>
    implements _$$SourcesFilterScreenStateImplCopyWith<$Res> {
  __$$SourcesFilterScreenStateImplCopyWithImpl(
      _$SourcesFilterScreenStateImpl _value,
      $Res Function(_$SourcesFilterScreenStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
    Object? enabledLanguages = null,
    Object? disabledSources = null,
  }) {
    return _then(_$SourcesFilterScreenStateImpl(
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as SplayTreeMap<String, List<Source>>,
      enabledLanguages: null == enabledLanguages
          ? _value._enabledLanguages
          : enabledLanguages // ignore: cast_nullable_to_non_nullable
              as Set<String>,
      disabledSources: null == disabledSources
          ? _value._disabledSources
          : disabledSources // ignore: cast_nullable_to_non_nullable
              as Set<String>,
    ));
  }
}

/// @nodoc

class _$SourcesFilterScreenStateImpl extends _SourcesFilterScreenState {
  const _$SourcesFilterScreenStateImpl(
      {required this.items,
      required final Set<String> enabledLanguages,
      required final Set<String> disabledSources})
      : _enabledLanguages = enabledLanguages,
        _disabledSources = disabledSources,
        super._();

  @override
  final SplayTreeMap<String, List<Source>> items;
  final Set<String> _enabledLanguages;
  @override
  Set<String> get enabledLanguages {
    if (_enabledLanguages is EqualUnmodifiableSetView) return _enabledLanguages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(_enabledLanguages);
  }

  final Set<String> _disabledSources;
  @override
  Set<String> get disabledSources {
    if (_disabledSources is EqualUnmodifiableSetView) return _disabledSources;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(_disabledSources);
  }

  @override
  String toString() {
    return 'SourcesFilterScreenState(items: $items, enabledLanguages: $enabledLanguages, disabledSources: $disabledSources)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SourcesFilterScreenStateImpl &&
            const DeepCollectionEquality().equals(other.items, items) &&
            const DeepCollectionEquality()
                .equals(other._enabledLanguages, _enabledLanguages) &&
            const DeepCollectionEquality()
                .equals(other._disabledSources, _disabledSources));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(items),
      const DeepCollectionEquality().hash(_enabledLanguages),
      const DeepCollectionEquality().hash(_disabledSources));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SourcesFilterScreenStateImplCopyWith<_$SourcesFilterScreenStateImpl>
      get copyWith => __$$SourcesFilterScreenStateImplCopyWithImpl<
          _$SourcesFilterScreenStateImpl>(this, _$identity);
}

abstract class _SourcesFilterScreenState extends SourcesFilterScreenState {
  const factory _SourcesFilterScreenState(
          {required final SplayTreeMap<String, List<Source>> items,
          required final Set<String> enabledLanguages,
          required final Set<String> disabledSources}) =
      _$SourcesFilterScreenStateImpl;
  const _SourcesFilterScreenState._() : super._();

  @override
  SplayTreeMap<String, List<Source>> get items;
  @override
  Set<String> get enabledLanguages;
  @override
  Set<String> get disabledSources;
  @override
  @JsonKey(ignore: true)
  _$$SourcesFilterScreenStateImplCopyWith<_$SourcesFilterScreenStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
