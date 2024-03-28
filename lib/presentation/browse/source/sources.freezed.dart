// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sources.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SourceUiModel {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Source source) item,
    required TResult Function(String language) header,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Source source)? item,
    TResult? Function(String language)? header,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Source source)? item,
    TResult Function(String language)? header,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SourceUiModelItem value) item,
    required TResult Function(SourceUiModelHeader value) header,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SourceUiModelItem value)? item,
    TResult? Function(SourceUiModelHeader value)? header,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SourceUiModelItem value)? item,
    TResult Function(SourceUiModelHeader value)? header,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SourceUiModelCopyWith<$Res> {
  factory $SourceUiModelCopyWith(
          SourceUiModel value, $Res Function(SourceUiModel) then) =
      _$SourceUiModelCopyWithImpl<$Res, SourceUiModel>;
}

/// @nodoc
class _$SourceUiModelCopyWithImpl<$Res, $Val extends SourceUiModel>
    implements $SourceUiModelCopyWith<$Res> {
  _$SourceUiModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$SourceUiModelItemImplCopyWith<$Res> {
  factory _$$SourceUiModelItemImplCopyWith(_$SourceUiModelItemImpl value,
          $Res Function(_$SourceUiModelItemImpl) then) =
      __$$SourceUiModelItemImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Source source});

  $SourceCopyWith<$Res> get source;
}

/// @nodoc
class __$$SourceUiModelItemImplCopyWithImpl<$Res>
    extends _$SourceUiModelCopyWithImpl<$Res, _$SourceUiModelItemImpl>
    implements _$$SourceUiModelItemImplCopyWith<$Res> {
  __$$SourceUiModelItemImplCopyWithImpl(_$SourceUiModelItemImpl _value,
      $Res Function(_$SourceUiModelItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? source = null,
  }) {
    return _then(_$SourceUiModelItemImpl(
      null == source
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as Source,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $SourceCopyWith<$Res> get source {
    return $SourceCopyWith<$Res>(_value.source, (value) {
      return _then(_value.copyWith(source: value));
    });
  }
}

/// @nodoc

class _$SourceUiModelItemImpl implements SourceUiModelItem {
  _$SourceUiModelItemImpl(this.source);

  @override
  final Source source;

  @override
  String toString() {
    return 'SourceUiModel.item(source: $source)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SourceUiModelItemImpl &&
            (identical(other.source, source) || other.source == source));
  }

  @override
  int get hashCode => Object.hash(runtimeType, source);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SourceUiModelItemImplCopyWith<_$SourceUiModelItemImpl> get copyWith =>
      __$$SourceUiModelItemImplCopyWithImpl<_$SourceUiModelItemImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Source source) item,
    required TResult Function(String language) header,
  }) {
    return item(source);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Source source)? item,
    TResult? Function(String language)? header,
  }) {
    return item?.call(source);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Source source)? item,
    TResult Function(String language)? header,
    required TResult orElse(),
  }) {
    if (item != null) {
      return item(source);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SourceUiModelItem value) item,
    required TResult Function(SourceUiModelHeader value) header,
  }) {
    return item(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SourceUiModelItem value)? item,
    TResult? Function(SourceUiModelHeader value)? header,
  }) {
    return item?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SourceUiModelItem value)? item,
    TResult Function(SourceUiModelHeader value)? header,
    required TResult orElse(),
  }) {
    if (item != null) {
      return item(this);
    }
    return orElse();
  }
}

abstract class SourceUiModelItem implements SourceUiModel {
  factory SourceUiModelItem(final Source source) = _$SourceUiModelItemImpl;

  Source get source;
  @JsonKey(ignore: true)
  _$$SourceUiModelItemImplCopyWith<_$SourceUiModelItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SourceUiModelHeaderImplCopyWith<$Res> {
  factory _$$SourceUiModelHeaderImplCopyWith(_$SourceUiModelHeaderImpl value,
          $Res Function(_$SourceUiModelHeaderImpl) then) =
      __$$SourceUiModelHeaderImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String language});
}

/// @nodoc
class __$$SourceUiModelHeaderImplCopyWithImpl<$Res>
    extends _$SourceUiModelCopyWithImpl<$Res, _$SourceUiModelHeaderImpl>
    implements _$$SourceUiModelHeaderImplCopyWith<$Res> {
  __$$SourceUiModelHeaderImplCopyWithImpl(_$SourceUiModelHeaderImpl _value,
      $Res Function(_$SourceUiModelHeaderImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? language = null,
  }) {
    return _then(_$SourceUiModelHeaderImpl(
      null == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SourceUiModelHeaderImpl implements SourceUiModelHeader {
  _$SourceUiModelHeaderImpl(this.language);

  @override
  final String language;

  @override
  String toString() {
    return 'SourceUiModel.header(language: $language)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SourceUiModelHeaderImpl &&
            (identical(other.language, language) ||
                other.language == language));
  }

  @override
  int get hashCode => Object.hash(runtimeType, language);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SourceUiModelHeaderImplCopyWith<_$SourceUiModelHeaderImpl> get copyWith =>
      __$$SourceUiModelHeaderImplCopyWithImpl<_$SourceUiModelHeaderImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Source source) item,
    required TResult Function(String language) header,
  }) {
    return header(language);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Source source)? item,
    TResult? Function(String language)? header,
  }) {
    return header?.call(language);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Source source)? item,
    TResult Function(String language)? header,
    required TResult orElse(),
  }) {
    if (header != null) {
      return header(language);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SourceUiModelItem value) item,
    required TResult Function(SourceUiModelHeader value) header,
  }) {
    return header(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SourceUiModelItem value)? item,
    TResult? Function(SourceUiModelHeader value)? header,
  }) {
    return header?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SourceUiModelItem value)? item,
    TResult Function(SourceUiModelHeader value)? header,
    required TResult orElse(),
  }) {
    if (header != null) {
      return header(this);
    }
    return orElse();
  }
}

abstract class SourceUiModelHeader implements SourceUiModel {
  factory SourceUiModelHeader(final String language) =
      _$SourceUiModelHeaderImpl;

  String get language;
  @JsonKey(ignore: true)
  _$$SourceUiModelHeaderImplCopyWith<_$SourceUiModelHeaderImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
