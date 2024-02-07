// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'download_store.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$DownloadObject {
  int get mangaId => throw _privateConstructorUsedError;
  int get chapterId => throw _privateConstructorUsedError;
  int get order => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DownloadObjectCopyWith<DownloadObject> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DownloadObjectCopyWith<$Res> {
  factory $DownloadObjectCopyWith(
          DownloadObject value, $Res Function(DownloadObject) then) =
      _$DownloadObjectCopyWithImpl<$Res, DownloadObject>;
  @useResult
  $Res call({int mangaId, int chapterId, int order});
}

/// @nodoc
class _$DownloadObjectCopyWithImpl<$Res, $Val extends DownloadObject>
    implements $DownloadObjectCopyWith<$Res> {
  _$DownloadObjectCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mangaId = null,
    Object? chapterId = null,
    Object? order = null,
  }) {
    return _then(_value.copyWith(
      mangaId: null == mangaId
          ? _value.mangaId
          : mangaId // ignore: cast_nullable_to_non_nullable
              as int,
      chapterId: null == chapterId
          ? _value.chapterId
          : chapterId // ignore: cast_nullable_to_non_nullable
              as int,
      order: null == order
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DownloadObjectImplCopyWith<$Res>
    implements $DownloadObjectCopyWith<$Res> {
  factory _$$DownloadObjectImplCopyWith(_$DownloadObjectImpl value,
          $Res Function(_$DownloadObjectImpl) then) =
      __$$DownloadObjectImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int mangaId, int chapterId, int order});
}

/// @nodoc
class __$$DownloadObjectImplCopyWithImpl<$Res>
    extends _$DownloadObjectCopyWithImpl<$Res, _$DownloadObjectImpl>
    implements _$$DownloadObjectImplCopyWith<$Res> {
  __$$DownloadObjectImplCopyWithImpl(
      _$DownloadObjectImpl _value, $Res Function(_$DownloadObjectImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mangaId = null,
    Object? chapterId = null,
    Object? order = null,
  }) {
    return _then(_$DownloadObjectImpl(
      null == mangaId
          ? _value.mangaId
          : mangaId // ignore: cast_nullable_to_non_nullable
              as int,
      null == chapterId
          ? _value.chapterId
          : chapterId // ignore: cast_nullable_to_non_nullable
              as int,
      null == order
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$DownloadObjectImpl extends _DownloadObject {
  const _$DownloadObjectImpl(this.mangaId, this.chapterId, this.order)
      : super._();

  @override
  final int mangaId;
  @override
  final int chapterId;
  @override
  final int order;

  @override
  String toString() {
    return 'DownloadObject(mangaId: $mangaId, chapterId: $chapterId, order: $order)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DownloadObjectImpl &&
            (identical(other.mangaId, mangaId) || other.mangaId == mangaId) &&
            (identical(other.chapterId, chapterId) ||
                other.chapterId == chapterId) &&
            (identical(other.order, order) || other.order == order));
  }

  @override
  int get hashCode => Object.hash(runtimeType, mangaId, chapterId, order);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DownloadObjectImplCopyWith<_$DownloadObjectImpl> get copyWith =>
      __$$DownloadObjectImplCopyWithImpl<_$DownloadObjectImpl>(
          this, _$identity);
}

abstract class _DownloadObject extends DownloadObject {
  const factory _DownloadObject(
          final int mangaId, final int chapterId, final int order) =
      _$DownloadObjectImpl;
  const _DownloadObject._() : super._();

  @override
  int get mangaId;
  @override
  int get chapterId;
  @override
  int get order;
  @override
  @JsonKey(ignore: true)
  _$$DownloadObjectImplCopyWith<_$DownloadObjectImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
