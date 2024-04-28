// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'extension_api.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;


final _privateConstructorUsedError = UnsupportedError('It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ExtensionJsonObject _$ExtensionJsonObjectFromJson(Map<String, dynamic> json) {
return _ExtensionJsonObject.fromJson(json);
}

/// @nodoc
mixin _$ExtensionJsonObject {

 String get name => throw _privateConstructorUsedError; String get pkg => throw _privateConstructorUsedError; String get apk => throw _privateConstructorUsedError; String get lang => throw _privateConstructorUsedError; int get code => throw _privateConstructorUsedError; String get version => throw _privateConstructorUsedError; int get nsfw => throw _privateConstructorUsedError; List<ExtensionSourceJsonObject>? get sources => throw _privateConstructorUsedError;






Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
@JsonKey(ignore: true)
$ExtensionJsonObjectCopyWith<ExtensionJsonObject> get copyWith => throw _privateConstructorUsedError;

}

/// @nodoc
abstract class $ExtensionJsonObjectCopyWith<$Res>  {
  factory $ExtensionJsonObjectCopyWith(ExtensionJsonObject value, $Res Function(ExtensionJsonObject) then) = _$ExtensionJsonObjectCopyWithImpl<$Res, ExtensionJsonObject>;
@useResult
$Res call({
 String name, String pkg, String apk, String lang, int code, String version, int nsfw, List<ExtensionSourceJsonObject>? sources
});



}

/// @nodoc
class _$ExtensionJsonObjectCopyWithImpl<$Res,$Val extends ExtensionJsonObject> implements $ExtensionJsonObjectCopyWith<$Res> {
  _$ExtensionJsonObjectCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? pkg = null,Object? apk = null,Object? lang = null,Object? code = null,Object? version = null,Object? nsfw = null,Object? sources = freezed,}) {
  return _then(_value.copyWith(
name: null == name ? _value.name : name // ignore: cast_nullable_to_non_nullable
as String,pkg: null == pkg ? _value.pkg : pkg // ignore: cast_nullable_to_non_nullable
as String,apk: null == apk ? _value.apk : apk // ignore: cast_nullable_to_non_nullable
as String,lang: null == lang ? _value.lang : lang // ignore: cast_nullable_to_non_nullable
as String,code: null == code ? _value.code : code // ignore: cast_nullable_to_non_nullable
as int,version: null == version ? _value.version : version // ignore: cast_nullable_to_non_nullable
as String,nsfw: null == nsfw ? _value.nsfw : nsfw // ignore: cast_nullable_to_non_nullable
as int,sources: freezed == sources ? _value.sources : sources // ignore: cast_nullable_to_non_nullable
as List<ExtensionSourceJsonObject>?,
  )as $Val);
}

}


/// @nodoc
abstract class _$$ExtensionJsonObjectImplCopyWith<$Res> implements $ExtensionJsonObjectCopyWith<$Res> {
  factory _$$ExtensionJsonObjectImplCopyWith(_$ExtensionJsonObjectImpl value, $Res Function(_$ExtensionJsonObjectImpl) then) = __$$ExtensionJsonObjectImplCopyWithImpl<$Res>;
@override @useResult
$Res call({
 String name, String pkg, String apk, String lang, int code, String version, int nsfw, List<ExtensionSourceJsonObject>? sources
});



}

/// @nodoc
class __$$ExtensionJsonObjectImplCopyWithImpl<$Res> extends _$ExtensionJsonObjectCopyWithImpl<$Res, _$ExtensionJsonObjectImpl> implements _$$ExtensionJsonObjectImplCopyWith<$Res> {
  __$$ExtensionJsonObjectImplCopyWithImpl(_$ExtensionJsonObjectImpl _value, $Res Function(_$ExtensionJsonObjectImpl) _then)
      : super(_value, _then);


@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? pkg = null,Object? apk = null,Object? lang = null,Object? code = null,Object? version = null,Object? nsfw = null,Object? sources = freezed,}) {
  return _then(_$ExtensionJsonObjectImpl(
name: null == name ? _value.name : name // ignore: cast_nullable_to_non_nullable
as String,pkg: null == pkg ? _value.pkg : pkg // ignore: cast_nullable_to_non_nullable
as String,apk: null == apk ? _value.apk : apk // ignore: cast_nullable_to_non_nullable
as String,lang: null == lang ? _value.lang : lang // ignore: cast_nullable_to_non_nullable
as String,code: null == code ? _value.code : code // ignore: cast_nullable_to_non_nullable
as int,version: null == version ? _value.version : version // ignore: cast_nullable_to_non_nullable
as String,nsfw: null == nsfw ? _value.nsfw : nsfw // ignore: cast_nullable_to_non_nullable
as int,sources: freezed == sources ? _value._sources : sources // ignore: cast_nullable_to_non_nullable
as List<ExtensionSourceJsonObject>?,
  ));
}


}

/// @nodoc
@JsonSerializable()

class _$ExtensionJsonObjectImpl extends _ExtensionJsonObject  {
  const _$ExtensionJsonObjectImpl({required this.name, required this.pkg, required this.apk, required this.lang, required this.code, required this.version, required this.nsfw, final  List<ExtensionSourceJsonObject>? sources}): _sources = sources,super._();

  factory _$ExtensionJsonObjectImpl.fromJson(Map<String, dynamic> json) => _$$ExtensionJsonObjectImplFromJson(json);

@override final  String name;
@override final  String pkg;
@override final  String apk;
@override final  String lang;
@override final  int code;
@override final  String version;
@override final  int nsfw;
 final  List<ExtensionSourceJsonObject>? _sources;
@override List<ExtensionSourceJsonObject>? get sources {
  final value = _sources;
  if (value == null) return null;
  if (_sources is EqualUnmodifiableListView) return _sources;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


@override
String toString() {
  return 'ExtensionJsonObject(name: $name, pkg: $pkg, apk: $apk, lang: $lang, code: $code, version: $version, nsfw: $nsfw, sources: $sources)';
}


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _$ExtensionJsonObjectImpl&&(identical(other.name, name) || other.name == name)&&(identical(other.pkg, pkg) || other.pkg == pkg)&&(identical(other.apk, apk) || other.apk == apk)&&(identical(other.lang, lang) || other.lang == lang)&&(identical(other.code, code) || other.code == code)&&(identical(other.version, version) || other.version == version)&&(identical(other.nsfw, nsfw) || other.nsfw == nsfw)&&const DeepCollectionEquality().equals(other._sources, _sources));
}

@JsonKey(ignore: true)
@override
int get hashCode => Object.hash(runtimeType,name,pkg,apk,lang,code,version,nsfw,const DeepCollectionEquality().hash(_sources));

@JsonKey(ignore: true)
@override
@pragma('vm:prefer-inline')
_$$ExtensionJsonObjectImplCopyWith<_$ExtensionJsonObjectImpl> get copyWith => __$$ExtensionJsonObjectImplCopyWithImpl<_$ExtensionJsonObjectImpl>(this, _$identity);







@override
Map<String, dynamic> toJson() {
  return _$$ExtensionJsonObjectImplToJson(this, );
}
}


abstract class _ExtensionJsonObject extends ExtensionJsonObject {
  const factory _ExtensionJsonObject({required final  String name, required final  String pkg, required final  String apk, required final  String lang, required final  int code, required final  String version, required final  int nsfw, final  List<ExtensionSourceJsonObject>? sources}) = _$ExtensionJsonObjectImpl;
  const _ExtensionJsonObject._(): super._();

  factory _ExtensionJsonObject.fromJson(Map<String, dynamic> json) = _$ExtensionJsonObjectImpl.fromJson;

@override  String get name;@override  String get pkg;@override  String get apk;@override  String get lang;@override  int get code;@override  String get version;@override  int get nsfw;@override  List<ExtensionSourceJsonObject>? get sources;
@override @JsonKey(ignore: true)
_$$ExtensionJsonObjectImplCopyWith<_$ExtensionJsonObjectImpl> get copyWith => throw _privateConstructorUsedError;

}

ExtensionSourceJsonObject _$ExtensionSourceJsonObjectFromJson(Map<String, dynamic> json) {
return _ExtensionSourceJsonObject.fromJson(json);
}

/// @nodoc
mixin _$ExtensionSourceJsonObject {

 int get id => throw _privateConstructorUsedError; String get lang => throw _privateConstructorUsedError; String get name => throw _privateConstructorUsedError; String get baseUrl => throw _privateConstructorUsedError;






Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
@JsonKey(ignore: true)
$ExtensionSourceJsonObjectCopyWith<ExtensionSourceJsonObject> get copyWith => throw _privateConstructorUsedError;

}

/// @nodoc
abstract class $ExtensionSourceJsonObjectCopyWith<$Res>  {
  factory $ExtensionSourceJsonObjectCopyWith(ExtensionSourceJsonObject value, $Res Function(ExtensionSourceJsonObject) then) = _$ExtensionSourceJsonObjectCopyWithImpl<$Res, ExtensionSourceJsonObject>;
@useResult
$Res call({
 int id, String lang, String name, String baseUrl
});



}

/// @nodoc
class _$ExtensionSourceJsonObjectCopyWithImpl<$Res,$Val extends ExtensionSourceJsonObject> implements $ExtensionSourceJsonObjectCopyWith<$Res> {
  _$ExtensionSourceJsonObjectCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? lang = null,Object? name = null,Object? baseUrl = null,}) {
  return _then(_value.copyWith(
id: null == id ? _value.id : id // ignore: cast_nullable_to_non_nullable
as int,lang: null == lang ? _value.lang : lang // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _value.name : name // ignore: cast_nullable_to_non_nullable
as String,baseUrl: null == baseUrl ? _value.baseUrl : baseUrl // ignore: cast_nullable_to_non_nullable
as String,
  )as $Val);
}

}


/// @nodoc
abstract class _$$ExtensionSourceJsonObjectImplCopyWith<$Res> implements $ExtensionSourceJsonObjectCopyWith<$Res> {
  factory _$$ExtensionSourceJsonObjectImplCopyWith(_$ExtensionSourceJsonObjectImpl value, $Res Function(_$ExtensionSourceJsonObjectImpl) then) = __$$ExtensionSourceJsonObjectImplCopyWithImpl<$Res>;
@override @useResult
$Res call({
 int id, String lang, String name, String baseUrl
});



}

/// @nodoc
class __$$ExtensionSourceJsonObjectImplCopyWithImpl<$Res> extends _$ExtensionSourceJsonObjectCopyWithImpl<$Res, _$ExtensionSourceJsonObjectImpl> implements _$$ExtensionSourceJsonObjectImplCopyWith<$Res> {
  __$$ExtensionSourceJsonObjectImplCopyWithImpl(_$ExtensionSourceJsonObjectImpl _value, $Res Function(_$ExtensionSourceJsonObjectImpl) _then)
      : super(_value, _then);


@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? lang = null,Object? name = null,Object? baseUrl = null,}) {
  return _then(_$ExtensionSourceJsonObjectImpl(
id: null == id ? _value.id : id // ignore: cast_nullable_to_non_nullable
as int,lang: null == lang ? _value.lang : lang // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _value.name : name // ignore: cast_nullable_to_non_nullable
as String,baseUrl: null == baseUrl ? _value.baseUrl : baseUrl // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
@JsonSerializable()

class _$ExtensionSourceJsonObjectImpl  implements _ExtensionSourceJsonObject {
  const _$ExtensionSourceJsonObjectImpl({required this.id, required this.lang, required this.name, required this.baseUrl});

  factory _$ExtensionSourceJsonObjectImpl.fromJson(Map<String, dynamic> json) => _$$ExtensionSourceJsonObjectImplFromJson(json);

@override final  int id;
@override final  String lang;
@override final  String name;
@override final  String baseUrl;

@override
String toString() {
  return 'ExtensionSourceJsonObject(id: $id, lang: $lang, name: $name, baseUrl: $baseUrl)';
}


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _$ExtensionSourceJsonObjectImpl&&(identical(other.id, id) || other.id == id)&&(identical(other.lang, lang) || other.lang == lang)&&(identical(other.name, name) || other.name == name)&&(identical(other.baseUrl, baseUrl) || other.baseUrl == baseUrl));
}

@JsonKey(ignore: true)
@override
int get hashCode => Object.hash(runtimeType,id,lang,name,baseUrl);

@JsonKey(ignore: true)
@override
@pragma('vm:prefer-inline')
_$$ExtensionSourceJsonObjectImplCopyWith<_$ExtensionSourceJsonObjectImpl> get copyWith => __$$ExtensionSourceJsonObjectImplCopyWithImpl<_$ExtensionSourceJsonObjectImpl>(this, _$identity);







@override
Map<String, dynamic> toJson() {
  return _$$ExtensionSourceJsonObjectImplToJson(this, );
}
}


abstract class _ExtensionSourceJsonObject implements ExtensionSourceJsonObject {
  const factory _ExtensionSourceJsonObject({required final  int id, required final  String lang, required final  String name, required final  String baseUrl}) = _$ExtensionSourceJsonObjectImpl;
  

  factory _ExtensionSourceJsonObject.fromJson(Map<String, dynamic> json) = _$ExtensionSourceJsonObjectImpl.fromJson;

@override  int get id;@override  String get lang;@override  String get name;@override  String get baseUrl;
@override @JsonKey(ignore: true)
_$$ExtensionSourceJsonObjectImplCopyWith<_$ExtensionSourceJsonObjectImpl> get copyWith => throw _privateConstructorUsedError;

}
