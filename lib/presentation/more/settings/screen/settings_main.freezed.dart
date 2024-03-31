// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'settings_main.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SettingsMainScreenItem {
  String get title => throw _privateConstructorUsedError;
  String? get subtitle => throw _privateConstructorUsedError;
  IconData get iconData => throw _privateConstructorUsedError;
  Widget get screen => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SettingsMainScreenItemCopyWith<SettingsMainScreenItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SettingsMainScreenItemCopyWith<$Res> {
  factory $SettingsMainScreenItemCopyWith(SettingsMainScreenItem value,
          $Res Function(SettingsMainScreenItem) then) =
      _$SettingsMainScreenItemCopyWithImpl<$Res, SettingsMainScreenItem>;
  @useResult
  $Res call({String title, String? subtitle, IconData iconData, Widget screen});
}

/// @nodoc
class _$SettingsMainScreenItemCopyWithImpl<$Res,
        $Val extends SettingsMainScreenItem>
    implements $SettingsMainScreenItemCopyWith<$Res> {
  _$SettingsMainScreenItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? subtitle = freezed,
    Object? iconData = null,
    Object? screen = null,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      subtitle: freezed == subtitle
          ? _value.subtitle
          : subtitle // ignore: cast_nullable_to_non_nullable
              as String?,
      iconData: null == iconData
          ? _value.iconData
          : iconData // ignore: cast_nullable_to_non_nullable
              as IconData,
      screen: null == screen
          ? _value.screen
          : screen // ignore: cast_nullable_to_non_nullable
              as Widget,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SettingsMainScreenItemImplCopyWith<$Res>
    implements $SettingsMainScreenItemCopyWith<$Res> {
  factory _$$SettingsMainScreenItemImplCopyWith(
          _$SettingsMainScreenItemImpl value,
          $Res Function(_$SettingsMainScreenItemImpl) then) =
      __$$SettingsMainScreenItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String title, String? subtitle, IconData iconData, Widget screen});
}

/// @nodoc
class __$$SettingsMainScreenItemImplCopyWithImpl<$Res>
    extends _$SettingsMainScreenItemCopyWithImpl<$Res,
        _$SettingsMainScreenItemImpl>
    implements _$$SettingsMainScreenItemImplCopyWith<$Res> {
  __$$SettingsMainScreenItemImplCopyWithImpl(
      _$SettingsMainScreenItemImpl _value,
      $Res Function(_$SettingsMainScreenItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? subtitle = freezed,
    Object? iconData = null,
    Object? screen = null,
  }) {
    return _then(_$SettingsMainScreenItemImpl(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      subtitle: freezed == subtitle
          ? _value.subtitle
          : subtitle // ignore: cast_nullable_to_non_nullable
              as String?,
      iconData: null == iconData
          ? _value.iconData
          : iconData // ignore: cast_nullable_to_non_nullable
              as IconData,
      screen: null == screen
          ? _value.screen
          : screen // ignore: cast_nullable_to_non_nullable
              as Widget,
    ));
  }
}

/// @nodoc

class _$SettingsMainScreenItemImpl implements _SettingsMainScreenItem {
  const _$SettingsMainScreenItemImpl(
      {required this.title,
      this.subtitle,
      required this.iconData,
      required this.screen});

  @override
  final String title;
  @override
  final String? subtitle;
  @override
  final IconData iconData;
  @override
  final Widget screen;

  @override
  String toString() {
    return 'SettingsMainScreenItem(title: $title, subtitle: $subtitle, iconData: $iconData, screen: $screen)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SettingsMainScreenItemImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.subtitle, subtitle) ||
                other.subtitle == subtitle) &&
            (identical(other.iconData, iconData) ||
                other.iconData == iconData) &&
            (identical(other.screen, screen) || other.screen == screen));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, title, subtitle, iconData, screen);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SettingsMainScreenItemImplCopyWith<_$SettingsMainScreenItemImpl>
      get copyWith => __$$SettingsMainScreenItemImplCopyWithImpl<
          _$SettingsMainScreenItemImpl>(this, _$identity);
}

abstract class _SettingsMainScreenItem implements SettingsMainScreenItem {
  const factory _SettingsMainScreenItem(
      {required final String title,
      final String? subtitle,
      required final IconData iconData,
      required final Widget screen}) = _$SettingsMainScreenItemImpl;

  @override
  String get title;
  @override
  String? get subtitle;
  @override
  IconData get iconData;
  @override
  Widget get screen;
  @override
  @JsonKey(ignore: true)
  _$$SettingsMainScreenItemImplCopyWith<_$SettingsMainScreenItemImpl>
      get copyWith => throw _privateConstructorUsedError;
}
