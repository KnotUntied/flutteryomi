// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'release.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;


final _privateConstructorUsedError = UnsupportedError('It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$Release {

 String get version => throw _privateConstructorUsedError; String get info => throw _privateConstructorUsedError; String get releaseInfo => throw _privateConstructorUsedError; List<String> get assets => throw _privateConstructorUsedError;







@JsonKey(ignore: true)
$ReleaseCopyWith<Release> get copyWith => throw _privateConstructorUsedError;

}

/// @nodoc
abstract class $ReleaseCopyWith<$Res>  {
  factory $ReleaseCopyWith(Release value, $Res Function(Release) then) = _$ReleaseCopyWithImpl<$Res, Release>;
@useResult
$Res call({
 String version, String info, String releaseInfo, List<String> assets
});



}

/// @nodoc
class _$ReleaseCopyWithImpl<$Res,$Val extends Release> implements $ReleaseCopyWith<$Res> {
  _$ReleaseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

@pragma('vm:prefer-inline') @override $Res call({Object? version = null,Object? info = null,Object? releaseInfo = null,Object? assets = null,}) {
  return _then(_value.copyWith(
version: null == version ? _value.version : version // ignore: cast_nullable_to_non_nullable
as String,info: null == info ? _value.info : info // ignore: cast_nullable_to_non_nullable
as String,releaseInfo: null == releaseInfo ? _value.releaseInfo : releaseInfo // ignore: cast_nullable_to_non_nullable
as String,assets: null == assets ? _value.assets : assets // ignore: cast_nullable_to_non_nullable
as List<String>,
  )as $Val);
}

}


/// @nodoc
abstract class _$$ReleaseImplCopyWith<$Res> implements $ReleaseCopyWith<$Res> {
  factory _$$ReleaseImplCopyWith(_$ReleaseImpl value, $Res Function(_$ReleaseImpl) then) = __$$ReleaseImplCopyWithImpl<$Res>;
@override @useResult
$Res call({
 String version, String info, String releaseInfo, List<String> assets
});



}

/// @nodoc
class __$$ReleaseImplCopyWithImpl<$Res> extends _$ReleaseCopyWithImpl<$Res, _$ReleaseImpl> implements _$$ReleaseImplCopyWith<$Res> {
  __$$ReleaseImplCopyWithImpl(_$ReleaseImpl _value, $Res Function(_$ReleaseImpl) _then)
      : super(_value, _then);


@pragma('vm:prefer-inline') @override $Res call({Object? version = null,Object? info = null,Object? releaseInfo = null,Object? assets = null,}) {
  return _then(_$ReleaseImpl(
null == version ? _value.version : version // ignore: cast_nullable_to_non_nullable
as String,null == info ? _value.info : info // ignore: cast_nullable_to_non_nullable
as String,null == releaseInfo ? _value.releaseInfo : releaseInfo // ignore: cast_nullable_to_non_nullable
as String,null == assets ? _value._assets : assets // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}

/// @nodoc


class _$ReleaseImpl extends _Release  {
  const _$ReleaseImpl(this.version, this.info, this.releaseInfo, final  List<String> assets): _assets = assets,super._();

  

@override final  String version;
@override final  String info;
@override final  String releaseInfo;
 final  List<String> _assets;
@override List<String> get assets {
  if (_assets is EqualUnmodifiableListView) return _assets;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_assets);
}


@override
String toString() {
  return 'Release(version: $version, info: $info, releaseInfo: $releaseInfo, assets: $assets)';
}


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _$ReleaseImpl&&(identical(other.version, version) || other.version == version)&&(identical(other.info, info) || other.info == info)&&(identical(other.releaseInfo, releaseInfo) || other.releaseInfo == releaseInfo)&&const DeepCollectionEquality().equals(other._assets, _assets));
}


@override
int get hashCode => Object.hash(runtimeType,version,info,releaseInfo,const DeepCollectionEquality().hash(_assets));

@JsonKey(ignore: true)
@override
@pragma('vm:prefer-inline')
_$$ReleaseImplCopyWith<_$ReleaseImpl> get copyWith => __$$ReleaseImplCopyWithImpl<_$ReleaseImpl>(this, _$identity);








}


abstract class _Release extends Release {
  const factory _Release(final  String version, final  String info, final  String releaseInfo, final  List<String> assets) = _$ReleaseImpl;
  const _Release._(): super._();

  

@override  String get version;@override  String get info;@override  String get releaseInfo;@override  List<String> get assets;
@override @JsonKey(ignore: true)
_$$ReleaseImplCopyWith<_$ReleaseImpl> get copyWith => throw _privateConstructorUsedError;

}

/// @nodoc
mixin _$ReleaseAssets {

 String get downloadLink => throw _privateConstructorUsedError;







@JsonKey(ignore: true)
$ReleaseAssetsCopyWith<ReleaseAssets> get copyWith => throw _privateConstructorUsedError;

}

/// @nodoc
abstract class $ReleaseAssetsCopyWith<$Res>  {
  factory $ReleaseAssetsCopyWith(ReleaseAssets value, $Res Function(ReleaseAssets) then) = _$ReleaseAssetsCopyWithImpl<$Res, ReleaseAssets>;
@useResult
$Res call({
 String downloadLink
});



}

/// @nodoc
class _$ReleaseAssetsCopyWithImpl<$Res,$Val extends ReleaseAssets> implements $ReleaseAssetsCopyWith<$Res> {
  _$ReleaseAssetsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

@pragma('vm:prefer-inline') @override $Res call({Object? downloadLink = null,}) {
  return _then(_value.copyWith(
downloadLink: null == downloadLink ? _value.downloadLink : downloadLink // ignore: cast_nullable_to_non_nullable
as String,
  )as $Val);
}

}


/// @nodoc
abstract class _$$ReleaseAssetsImplCopyWith<$Res> implements $ReleaseAssetsCopyWith<$Res> {
  factory _$$ReleaseAssetsImplCopyWith(_$ReleaseAssetsImpl value, $Res Function(_$ReleaseAssetsImpl) then) = __$$ReleaseAssetsImplCopyWithImpl<$Res>;
@override @useResult
$Res call({
 String downloadLink
});



}

/// @nodoc
class __$$ReleaseAssetsImplCopyWithImpl<$Res> extends _$ReleaseAssetsCopyWithImpl<$Res, _$ReleaseAssetsImpl> implements _$$ReleaseAssetsImplCopyWith<$Res> {
  __$$ReleaseAssetsImplCopyWithImpl(_$ReleaseAssetsImpl _value, $Res Function(_$ReleaseAssetsImpl) _then)
      : super(_value, _then);


@pragma('vm:prefer-inline') @override $Res call({Object? downloadLink = null,}) {
  return _then(_$ReleaseAssetsImpl(
downloadLink: null == downloadLink ? _value.downloadLink : downloadLink // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _$ReleaseAssetsImpl  implements _ReleaseAssets {
  const _$ReleaseAssetsImpl({required this.downloadLink});

  

@override final  String downloadLink;

@override
String toString() {
  return 'ReleaseAssets(downloadLink: $downloadLink)';
}


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _$ReleaseAssetsImpl&&(identical(other.downloadLink, downloadLink) || other.downloadLink == downloadLink));
}


@override
int get hashCode => Object.hash(runtimeType,downloadLink);

@JsonKey(ignore: true)
@override
@pragma('vm:prefer-inline')
_$$ReleaseAssetsImplCopyWith<_$ReleaseAssetsImpl> get copyWith => __$$ReleaseAssetsImplCopyWithImpl<_$ReleaseAssetsImpl>(this, _$identity);








}


abstract class _ReleaseAssets implements ReleaseAssets {
  const factory _ReleaseAssets({required final  String downloadLink}) = _$ReleaseAssetsImpl;
  

  

@override  String get downloadLink;
@override @JsonKey(ignore: true)
_$$ReleaseAssetsImplCopyWith<_$ReleaseAssetsImpl> get copyWith => throw _privateConstructorUsedError;

}
