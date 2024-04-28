// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'extension.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;


final _privateConstructorUsedError = UnsupportedError('It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ExtensionAvailableSource {

 int get id => throw _privateConstructorUsedError; String get lang => throw _privateConstructorUsedError; String get name => throw _privateConstructorUsedError; String get baseUrl => throw _privateConstructorUsedError;







@JsonKey(ignore: true)
$ExtensionAvailableSourceCopyWith<ExtensionAvailableSource> get copyWith => throw _privateConstructorUsedError;

}

/// @nodoc
abstract class $ExtensionAvailableSourceCopyWith<$Res>  {
  factory $ExtensionAvailableSourceCopyWith(ExtensionAvailableSource value, $Res Function(ExtensionAvailableSource) then) = _$ExtensionAvailableSourceCopyWithImpl<$Res, ExtensionAvailableSource>;
@useResult
$Res call({
 int id, String lang, String name, String baseUrl
});



}

/// @nodoc
class _$ExtensionAvailableSourceCopyWithImpl<$Res,$Val extends ExtensionAvailableSource> implements $ExtensionAvailableSourceCopyWith<$Res> {
  _$ExtensionAvailableSourceCopyWithImpl(this._value, this._then);

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
abstract class _$$ExtensionAvailableSourceImplCopyWith<$Res> implements $ExtensionAvailableSourceCopyWith<$Res> {
  factory _$$ExtensionAvailableSourceImplCopyWith(_$ExtensionAvailableSourceImpl value, $Res Function(_$ExtensionAvailableSourceImpl) then) = __$$ExtensionAvailableSourceImplCopyWithImpl<$Res>;
@override @useResult
$Res call({
 int id, String lang, String name, String baseUrl
});



}

/// @nodoc
class __$$ExtensionAvailableSourceImplCopyWithImpl<$Res> extends _$ExtensionAvailableSourceCopyWithImpl<$Res, _$ExtensionAvailableSourceImpl> implements _$$ExtensionAvailableSourceImplCopyWith<$Res> {
  __$$ExtensionAvailableSourceImplCopyWithImpl(_$ExtensionAvailableSourceImpl _value, $Res Function(_$ExtensionAvailableSourceImpl) _then)
      : super(_value, _then);


@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? lang = null,Object? name = null,Object? baseUrl = null,}) {
  return _then(_$ExtensionAvailableSourceImpl(
id: null == id ? _value.id : id // ignore: cast_nullable_to_non_nullable
as int,lang: null == lang ? _value.lang : lang // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _value.name : name // ignore: cast_nullable_to_non_nullable
as String,baseUrl: null == baseUrl ? _value.baseUrl : baseUrl // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _$ExtensionAvailableSourceImpl extends _ExtensionAvailableSource  {
  const _$ExtensionAvailableSourceImpl({required this.id, required this.lang, required this.name, required this.baseUrl}): super._();

  

@override final  int id;
@override final  String lang;
@override final  String name;
@override final  String baseUrl;

@override
String toString() {
  return 'ExtensionAvailableSource(id: $id, lang: $lang, name: $name, baseUrl: $baseUrl)';
}


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _$ExtensionAvailableSourceImpl&&(identical(other.id, id) || other.id == id)&&(identical(other.lang, lang) || other.lang == lang)&&(identical(other.name, name) || other.name == name)&&(identical(other.baseUrl, baseUrl) || other.baseUrl == baseUrl));
}


@override
int get hashCode => Object.hash(runtimeType,id,lang,name,baseUrl);

@JsonKey(ignore: true)
@override
@pragma('vm:prefer-inline')
_$$ExtensionAvailableSourceImplCopyWith<_$ExtensionAvailableSourceImpl> get copyWith => __$$ExtensionAvailableSourceImplCopyWithImpl<_$ExtensionAvailableSourceImpl>(this, _$identity);








}


abstract class _ExtensionAvailableSource extends ExtensionAvailableSource {
  const factory _ExtensionAvailableSource({required final  int id, required final  String lang, required final  String name, required final  String baseUrl}) = _$ExtensionAvailableSourceImpl;
  const _ExtensionAvailableSource._(): super._();

  

@override  int get id;@override  String get lang;@override  String get name;@override  String get baseUrl;
@override @JsonKey(ignore: true)
_$$ExtensionAvailableSourceImplCopyWith<_$ExtensionAvailableSourceImpl> get copyWith => throw _privateConstructorUsedError;

}

/// @nodoc
mixin _$Extension {

 String get name => throw _privateConstructorUsedError; String get pkgName => throw _privateConstructorUsedError; String get versionName => throw _privateConstructorUsedError; int get versionCode => throw _privateConstructorUsedError; double get libVersion => throw _privateConstructorUsedError; String? get lang => throw _privateConstructorUsedError; bool get isNsfw => throw _privateConstructorUsedError;
@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String name,  String pkgName,  String versionName,  int versionCode,  double libVersion,  String lang,  bool isNsfw,  String? pkgFactory,  List<Source> sources,  Image? icon,  bool hasUpdate,  bool isObsolete,  bool isShared,  String? repoUrl)  installed,required TResult Function( String name,  String pkgName,  String versionName,  int versionCode,  double libVersion,  String lang,  bool isNsfw,  List<ExtensionAvailableSource> sources,  String apkName,  String iconUrl,  String repoUrl)  available,required TResult Function( String name,  String pkgName,  String versionName,  int versionCode,  double libVersion,  String signatureHash,  String? lang,  bool isNsfw)  untrusted,}) => throw _privateConstructorUsedError;
@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String name,  String pkgName,  String versionName,  int versionCode,  double libVersion,  String lang,  bool isNsfw,  String? pkgFactory,  List<Source> sources,  Image? icon,  bool hasUpdate,  bool isObsolete,  bool isShared,  String? repoUrl)?  installed,TResult? Function( String name,  String pkgName,  String versionName,  int versionCode,  double libVersion,  String lang,  bool isNsfw,  List<ExtensionAvailableSource> sources,  String apkName,  String iconUrl,  String repoUrl)?  available,TResult? Function( String name,  String pkgName,  String versionName,  int versionCode,  double libVersion,  String signatureHash,  String? lang,  bool isNsfw)?  untrusted,}) => throw _privateConstructorUsedError;
@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String name,  String pkgName,  String versionName,  int versionCode,  double libVersion,  String lang,  bool isNsfw,  String? pkgFactory,  List<Source> sources,  Image? icon,  bool hasUpdate,  bool isObsolete,  bool isShared,  String? repoUrl)?  installed,TResult Function( String name,  String pkgName,  String versionName,  int versionCode,  double libVersion,  String lang,  bool isNsfw,  List<ExtensionAvailableSource> sources,  String apkName,  String iconUrl,  String repoUrl)?  available,TResult Function( String name,  String pkgName,  String versionName,  int versionCode,  double libVersion,  String signatureHash,  String? lang,  bool isNsfw)?  untrusted,required TResult orElse(),}) => throw _privateConstructorUsedError;
@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ExtensionInstalled value)  installed,required TResult Function( ExtensionAvailable value)  available,required TResult Function( ExtensionUntrusted value)  untrusted,}) => throw _privateConstructorUsedError;
@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ExtensionInstalled value)?  installed,TResult? Function( ExtensionAvailable value)?  available,TResult? Function( ExtensionUntrusted value)?  untrusted,}) => throw _privateConstructorUsedError;
@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ExtensionInstalled value)?  installed,TResult Function( ExtensionAvailable value)?  available,TResult Function( ExtensionUntrusted value)?  untrusted,required TResult orElse(),}) => throw _privateConstructorUsedError;

@JsonKey(ignore: true)
$ExtensionCopyWith<Extension> get copyWith => throw _privateConstructorUsedError;

}

/// @nodoc
abstract class $ExtensionCopyWith<$Res>  {
  factory $ExtensionCopyWith(Extension value, $Res Function(Extension) then) = _$ExtensionCopyWithImpl<$Res, Extension>;
@useResult
$Res call({
 String name, String pkgName, String versionName, int versionCode, double libVersion, String lang, bool isNsfw
});



}

/// @nodoc
class _$ExtensionCopyWithImpl<$Res,$Val extends Extension> implements $ExtensionCopyWith<$Res> {
  _$ExtensionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? pkgName = null,Object? versionName = null,Object? versionCode = null,Object? libVersion = null,Object? lang = null,Object? isNsfw = null,}) {
  return _then(_value.copyWith(
name: null == name ? _value.name : name // ignore: cast_nullable_to_non_nullable
as String,pkgName: null == pkgName ? _value.pkgName : pkgName // ignore: cast_nullable_to_non_nullable
as String,versionName: null == versionName ? _value.versionName : versionName // ignore: cast_nullable_to_non_nullable
as String,versionCode: null == versionCode ? _value.versionCode : versionCode // ignore: cast_nullable_to_non_nullable
as int,libVersion: null == libVersion ? _value.libVersion : libVersion // ignore: cast_nullable_to_non_nullable
as double,lang: null == lang ? _value.lang! : lang // ignore: cast_nullable_to_non_nullable
as String,isNsfw: null == isNsfw ? _value.isNsfw : isNsfw // ignore: cast_nullable_to_non_nullable
as bool,
  )as $Val);
}

}


/// @nodoc
abstract class _$$ExtensionInstalledImplCopyWith<$Res> implements $ExtensionCopyWith<$Res> {
  factory _$$ExtensionInstalledImplCopyWith(_$ExtensionInstalledImpl value, $Res Function(_$ExtensionInstalledImpl) then) = __$$ExtensionInstalledImplCopyWithImpl<$Res>;
@override @useResult
$Res call({
 String name, String pkgName, String versionName, int versionCode, double libVersion, String lang, bool isNsfw, String? pkgFactory, List<Source> sources, Image? icon, bool hasUpdate, bool isObsolete, bool isShared, String? repoUrl
});



}

/// @nodoc
class __$$ExtensionInstalledImplCopyWithImpl<$Res> extends _$ExtensionCopyWithImpl<$Res, _$ExtensionInstalledImpl> implements _$$ExtensionInstalledImplCopyWith<$Res> {
  __$$ExtensionInstalledImplCopyWithImpl(_$ExtensionInstalledImpl _value, $Res Function(_$ExtensionInstalledImpl) _then)
      : super(_value, _then);


@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? pkgName = null,Object? versionName = null,Object? versionCode = null,Object? libVersion = null,Object? lang = null,Object? isNsfw = null,Object? pkgFactory = freezed,Object? sources = null,Object? icon = freezed,Object? hasUpdate = null,Object? isObsolete = null,Object? isShared = null,Object? repoUrl = freezed,}) {
  return _then(_$ExtensionInstalledImpl(
name: null == name ? _value.name : name // ignore: cast_nullable_to_non_nullable
as String,pkgName: null == pkgName ? _value.pkgName : pkgName // ignore: cast_nullable_to_non_nullable
as String,versionName: null == versionName ? _value.versionName : versionName // ignore: cast_nullable_to_non_nullable
as String,versionCode: null == versionCode ? _value.versionCode : versionCode // ignore: cast_nullable_to_non_nullable
as int,libVersion: null == libVersion ? _value.libVersion : libVersion // ignore: cast_nullable_to_non_nullable
as double,lang: null == lang ? _value.lang : lang // ignore: cast_nullable_to_non_nullable
as String,isNsfw: null == isNsfw ? _value.isNsfw : isNsfw // ignore: cast_nullable_to_non_nullable
as bool,pkgFactory: freezed == pkgFactory ? _value.pkgFactory : pkgFactory // ignore: cast_nullable_to_non_nullable
as String?,sources: null == sources ? _value._sources : sources // ignore: cast_nullable_to_non_nullable
as List<Source>,icon: freezed == icon ? _value.icon : icon // ignore: cast_nullable_to_non_nullable
as Image?,hasUpdate: null == hasUpdate ? _value.hasUpdate : hasUpdate // ignore: cast_nullable_to_non_nullable
as bool,isObsolete: null == isObsolete ? _value.isObsolete : isObsolete // ignore: cast_nullable_to_non_nullable
as bool,isShared: null == isShared ? _value.isShared : isShared // ignore: cast_nullable_to_non_nullable
as bool,repoUrl: freezed == repoUrl ? _value.repoUrl : repoUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class _$ExtensionInstalledImpl  implements ExtensionInstalled {
  const _$ExtensionInstalledImpl({required this.name, required this.pkgName, required this.versionName, required this.versionCode, required this.libVersion, required this.lang, required this.isNsfw, this.pkgFactory, required final  List<Source> sources, this.icon, this.hasUpdate = false, this.isObsolete = false, required this.isShared, this.repoUrl}): _sources = sources;

  

@override final  String name;
@override final  String pkgName;
@override final  String versionName;
@override final  int versionCode;
@override final  double libVersion;
@override final  String lang;
@override final  bool isNsfw;
@override final  String? pkgFactory;
 final  List<Source> _sources;
@override List<Source> get sources {
  if (_sources is EqualUnmodifiableListView) return _sources;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_sources);
}

// Supposed to be an Android drawable but I'm not sure yet
@override final  Image? icon;
@override@JsonKey() final  bool hasUpdate;
@override@JsonKey() final  bool isObsolete;
@override final  bool isShared;
@override final  String? repoUrl;

@override
String toString() {
  return 'Extension.installed(name: $name, pkgName: $pkgName, versionName: $versionName, versionCode: $versionCode, libVersion: $libVersion, lang: $lang, isNsfw: $isNsfw, pkgFactory: $pkgFactory, sources: $sources, icon: $icon, hasUpdate: $hasUpdate, isObsolete: $isObsolete, isShared: $isShared, repoUrl: $repoUrl)';
}


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _$ExtensionInstalledImpl&&(identical(other.name, name) || other.name == name)&&(identical(other.pkgName, pkgName) || other.pkgName == pkgName)&&(identical(other.versionName, versionName) || other.versionName == versionName)&&(identical(other.versionCode, versionCode) || other.versionCode == versionCode)&&(identical(other.libVersion, libVersion) || other.libVersion == libVersion)&&(identical(other.lang, lang) || other.lang == lang)&&(identical(other.isNsfw, isNsfw) || other.isNsfw == isNsfw)&&(identical(other.pkgFactory, pkgFactory) || other.pkgFactory == pkgFactory)&&const DeepCollectionEquality().equals(other._sources, _sources)&&(identical(other.icon, icon) || other.icon == icon)&&(identical(other.hasUpdate, hasUpdate) || other.hasUpdate == hasUpdate)&&(identical(other.isObsolete, isObsolete) || other.isObsolete == isObsolete)&&(identical(other.isShared, isShared) || other.isShared == isShared)&&(identical(other.repoUrl, repoUrl) || other.repoUrl == repoUrl));
}


@override
int get hashCode => Object.hash(runtimeType,name,pkgName,versionName,versionCode,libVersion,lang,isNsfw,pkgFactory,const DeepCollectionEquality().hash(_sources),icon,hasUpdate,isObsolete,isShared,repoUrl);

@JsonKey(ignore: true)
@override
@pragma('vm:prefer-inline')
_$$ExtensionInstalledImplCopyWith<_$ExtensionInstalledImpl> get copyWith => __$$ExtensionInstalledImplCopyWithImpl<_$ExtensionInstalledImpl>(this, _$identity);

@override
@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String name,  String pkgName,  String versionName,  int versionCode,  double libVersion,  String lang,  bool isNsfw,  String? pkgFactory,  List<Source> sources,  Image? icon,  bool hasUpdate,  bool isObsolete,  bool isShared,  String? repoUrl)  installed,required TResult Function( String name,  String pkgName,  String versionName,  int versionCode,  double libVersion,  String lang,  bool isNsfw,  List<ExtensionAvailableSource> sources,  String apkName,  String iconUrl,  String repoUrl)  available,required TResult Function( String name,  String pkgName,  String versionName,  int versionCode,  double libVersion,  String signatureHash,  String? lang,  bool isNsfw)  untrusted,}) {
  return installed(name,pkgName,versionName,versionCode,libVersion,lang,isNsfw,pkgFactory,sources,icon,hasUpdate,isObsolete,isShared,repoUrl);
}
@override
@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String name,  String pkgName,  String versionName,  int versionCode,  double libVersion,  String lang,  bool isNsfw,  String? pkgFactory,  List<Source> sources,  Image? icon,  bool hasUpdate,  bool isObsolete,  bool isShared,  String? repoUrl)?  installed,TResult? Function( String name,  String pkgName,  String versionName,  int versionCode,  double libVersion,  String lang,  bool isNsfw,  List<ExtensionAvailableSource> sources,  String apkName,  String iconUrl,  String repoUrl)?  available,TResult? Function( String name,  String pkgName,  String versionName,  int versionCode,  double libVersion,  String signatureHash,  String? lang,  bool isNsfw)?  untrusted,}) {
  return installed?.call(name,pkgName,versionName,versionCode,libVersion,lang,isNsfw,pkgFactory,sources,icon,hasUpdate,isObsolete,isShared,repoUrl);
}
@override
@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String name,  String pkgName,  String versionName,  int versionCode,  double libVersion,  String lang,  bool isNsfw,  String? pkgFactory,  List<Source> sources,  Image? icon,  bool hasUpdate,  bool isObsolete,  bool isShared,  String? repoUrl)?  installed,TResult Function( String name,  String pkgName,  String versionName,  int versionCode,  double libVersion,  String lang,  bool isNsfw,  List<ExtensionAvailableSource> sources,  String apkName,  String iconUrl,  String repoUrl)?  available,TResult Function( String name,  String pkgName,  String versionName,  int versionCode,  double libVersion,  String signatureHash,  String? lang,  bool isNsfw)?  untrusted,required TResult orElse(),}) {
  if (installed != null) {
    return installed(name,pkgName,versionName,versionCode,libVersion,lang,isNsfw,pkgFactory,sources,icon,hasUpdate,isObsolete,isShared,repoUrl);
  }
  return orElse();
}
@override
@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ExtensionInstalled value)  installed,required TResult Function( ExtensionAvailable value)  available,required TResult Function( ExtensionUntrusted value)  untrusted,}) {
  return installed(this);
}
@override
@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ExtensionInstalled value)?  installed,TResult? Function( ExtensionAvailable value)?  available,TResult? Function( ExtensionUntrusted value)?  untrusted,}) {
  return installed?.call(this);
}
@override
@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ExtensionInstalled value)?  installed,TResult Function( ExtensionAvailable value)?  available,TResult Function( ExtensionUntrusted value)?  untrusted,required TResult orElse(),}) {
  if (installed != null) {
    return installed(this);
  }
  return orElse();
}

}


abstract class ExtensionInstalled implements Extension {
  const factory ExtensionInstalled({required final  String name, required final  String pkgName, required final  String versionName, required final  int versionCode, required final  double libVersion, required final  String lang, required final  bool isNsfw, final  String? pkgFactory, required final  List<Source> sources, final  Image? icon, final  bool hasUpdate, final  bool isObsolete, required final  bool isShared, final  String? repoUrl}) = _$ExtensionInstalledImpl;
  

  

@override  String get name;@override  String get pkgName;@override  String get versionName;@override  int get versionCode;@override  double get libVersion;@override  String get lang;@override  bool get isNsfw; String? get pkgFactory; List<Source> get sources;// Supposed to be an Android drawable but I'm not sure yet
 Image? get icon; bool get hasUpdate; bool get isObsolete; bool get isShared; String? get repoUrl;
@override @JsonKey(ignore: true)
_$$ExtensionInstalledImplCopyWith<_$ExtensionInstalledImpl> get copyWith => throw _privateConstructorUsedError;

}

/// @nodoc
abstract class _$$ExtensionAvailableImplCopyWith<$Res> implements $ExtensionCopyWith<$Res> {
  factory _$$ExtensionAvailableImplCopyWith(_$ExtensionAvailableImpl value, $Res Function(_$ExtensionAvailableImpl) then) = __$$ExtensionAvailableImplCopyWithImpl<$Res>;
@override @useResult
$Res call({
 String name, String pkgName, String versionName, int versionCode, double libVersion, String lang, bool isNsfw, List<ExtensionAvailableSource> sources, String apkName, String iconUrl, String repoUrl
});



}

/// @nodoc
class __$$ExtensionAvailableImplCopyWithImpl<$Res> extends _$ExtensionCopyWithImpl<$Res, _$ExtensionAvailableImpl> implements _$$ExtensionAvailableImplCopyWith<$Res> {
  __$$ExtensionAvailableImplCopyWithImpl(_$ExtensionAvailableImpl _value, $Res Function(_$ExtensionAvailableImpl) _then)
      : super(_value, _then);


@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? pkgName = null,Object? versionName = null,Object? versionCode = null,Object? libVersion = null,Object? lang = null,Object? isNsfw = null,Object? sources = null,Object? apkName = null,Object? iconUrl = null,Object? repoUrl = null,}) {
  return _then(_$ExtensionAvailableImpl(
name: null == name ? _value.name : name // ignore: cast_nullable_to_non_nullable
as String,pkgName: null == pkgName ? _value.pkgName : pkgName // ignore: cast_nullable_to_non_nullable
as String,versionName: null == versionName ? _value.versionName : versionName // ignore: cast_nullable_to_non_nullable
as String,versionCode: null == versionCode ? _value.versionCode : versionCode // ignore: cast_nullable_to_non_nullable
as int,libVersion: null == libVersion ? _value.libVersion : libVersion // ignore: cast_nullable_to_non_nullable
as double,lang: null == lang ? _value.lang : lang // ignore: cast_nullable_to_non_nullable
as String,isNsfw: null == isNsfw ? _value.isNsfw : isNsfw // ignore: cast_nullable_to_non_nullable
as bool,sources: null == sources ? _value._sources : sources // ignore: cast_nullable_to_non_nullable
as List<ExtensionAvailableSource>,apkName: null == apkName ? _value.apkName : apkName // ignore: cast_nullable_to_non_nullable
as String,iconUrl: null == iconUrl ? _value.iconUrl : iconUrl // ignore: cast_nullable_to_non_nullable
as String,repoUrl: null == repoUrl ? _value.repoUrl : repoUrl // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _$ExtensionAvailableImpl  implements ExtensionAvailable {
  const _$ExtensionAvailableImpl({required this.name, required this.pkgName, required this.versionName, required this.versionCode, required this.libVersion, required this.lang, required this.isNsfw, required final  List<ExtensionAvailableSource> sources, required this.apkName, required this.iconUrl, required this.repoUrl}): _sources = sources;

  

@override final  String name;
@override final  String pkgName;
@override final  String versionName;
@override final  int versionCode;
@override final  double libVersion;
@override final  String lang;
@override final  bool isNsfw;
 final  List<ExtensionAvailableSource> _sources;
@override List<ExtensionAvailableSource> get sources {
  if (_sources is EqualUnmodifiableListView) return _sources;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_sources);
}

@override final  String apkName;
@override final  String iconUrl;
@override final  String repoUrl;

@override
String toString() {
  return 'Extension.available(name: $name, pkgName: $pkgName, versionName: $versionName, versionCode: $versionCode, libVersion: $libVersion, lang: $lang, isNsfw: $isNsfw, sources: $sources, apkName: $apkName, iconUrl: $iconUrl, repoUrl: $repoUrl)';
}


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _$ExtensionAvailableImpl&&(identical(other.name, name) || other.name == name)&&(identical(other.pkgName, pkgName) || other.pkgName == pkgName)&&(identical(other.versionName, versionName) || other.versionName == versionName)&&(identical(other.versionCode, versionCode) || other.versionCode == versionCode)&&(identical(other.libVersion, libVersion) || other.libVersion == libVersion)&&(identical(other.lang, lang) || other.lang == lang)&&(identical(other.isNsfw, isNsfw) || other.isNsfw == isNsfw)&&const DeepCollectionEquality().equals(other._sources, _sources)&&(identical(other.apkName, apkName) || other.apkName == apkName)&&(identical(other.iconUrl, iconUrl) || other.iconUrl == iconUrl)&&(identical(other.repoUrl, repoUrl) || other.repoUrl == repoUrl));
}


@override
int get hashCode => Object.hash(runtimeType,name,pkgName,versionName,versionCode,libVersion,lang,isNsfw,const DeepCollectionEquality().hash(_sources),apkName,iconUrl,repoUrl);

@JsonKey(ignore: true)
@override
@pragma('vm:prefer-inline')
_$$ExtensionAvailableImplCopyWith<_$ExtensionAvailableImpl> get copyWith => __$$ExtensionAvailableImplCopyWithImpl<_$ExtensionAvailableImpl>(this, _$identity);

@override
@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String name,  String pkgName,  String versionName,  int versionCode,  double libVersion,  String lang,  bool isNsfw,  String? pkgFactory,  List<Source> sources,  Image? icon,  bool hasUpdate,  bool isObsolete,  bool isShared,  String? repoUrl)  installed,required TResult Function( String name,  String pkgName,  String versionName,  int versionCode,  double libVersion,  String lang,  bool isNsfw,  List<ExtensionAvailableSource> sources,  String apkName,  String iconUrl,  String repoUrl)  available,required TResult Function( String name,  String pkgName,  String versionName,  int versionCode,  double libVersion,  String signatureHash,  String? lang,  bool isNsfw)  untrusted,}) {
  return available(name,pkgName,versionName,versionCode,libVersion,lang,isNsfw,sources,apkName,iconUrl,repoUrl);
}
@override
@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String name,  String pkgName,  String versionName,  int versionCode,  double libVersion,  String lang,  bool isNsfw,  String? pkgFactory,  List<Source> sources,  Image? icon,  bool hasUpdate,  bool isObsolete,  bool isShared,  String? repoUrl)?  installed,TResult? Function( String name,  String pkgName,  String versionName,  int versionCode,  double libVersion,  String lang,  bool isNsfw,  List<ExtensionAvailableSource> sources,  String apkName,  String iconUrl,  String repoUrl)?  available,TResult? Function( String name,  String pkgName,  String versionName,  int versionCode,  double libVersion,  String signatureHash,  String? lang,  bool isNsfw)?  untrusted,}) {
  return available?.call(name,pkgName,versionName,versionCode,libVersion,lang,isNsfw,sources,apkName,iconUrl,repoUrl);
}
@override
@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String name,  String pkgName,  String versionName,  int versionCode,  double libVersion,  String lang,  bool isNsfw,  String? pkgFactory,  List<Source> sources,  Image? icon,  bool hasUpdate,  bool isObsolete,  bool isShared,  String? repoUrl)?  installed,TResult Function( String name,  String pkgName,  String versionName,  int versionCode,  double libVersion,  String lang,  bool isNsfw,  List<ExtensionAvailableSource> sources,  String apkName,  String iconUrl,  String repoUrl)?  available,TResult Function( String name,  String pkgName,  String versionName,  int versionCode,  double libVersion,  String signatureHash,  String? lang,  bool isNsfw)?  untrusted,required TResult orElse(),}) {
  if (available != null) {
    return available(name,pkgName,versionName,versionCode,libVersion,lang,isNsfw,sources,apkName,iconUrl,repoUrl);
  }
  return orElse();
}
@override
@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ExtensionInstalled value)  installed,required TResult Function( ExtensionAvailable value)  available,required TResult Function( ExtensionUntrusted value)  untrusted,}) {
  return available(this);
}
@override
@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ExtensionInstalled value)?  installed,TResult? Function( ExtensionAvailable value)?  available,TResult? Function( ExtensionUntrusted value)?  untrusted,}) {
  return available?.call(this);
}
@override
@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ExtensionInstalled value)?  installed,TResult Function( ExtensionAvailable value)?  available,TResult Function( ExtensionUntrusted value)?  untrusted,required TResult orElse(),}) {
  if (available != null) {
    return available(this);
  }
  return orElse();
}

}


abstract class ExtensionAvailable implements Extension {
  const factory ExtensionAvailable({required final  String name, required final  String pkgName, required final  String versionName, required final  int versionCode, required final  double libVersion, required final  String lang, required final  bool isNsfw, required final  List<ExtensionAvailableSource> sources, required final  String apkName, required final  String iconUrl, required final  String repoUrl}) = _$ExtensionAvailableImpl;
  

  

@override  String get name;@override  String get pkgName;@override  String get versionName;@override  int get versionCode;@override  double get libVersion;@override  String get lang;@override  bool get isNsfw; List<ExtensionAvailableSource> get sources; String get apkName; String get iconUrl; String get repoUrl;
@override @JsonKey(ignore: true)
_$$ExtensionAvailableImplCopyWith<_$ExtensionAvailableImpl> get copyWith => throw _privateConstructorUsedError;

}

/// @nodoc
abstract class _$$ExtensionUntrustedImplCopyWith<$Res> implements $ExtensionCopyWith<$Res> {
  factory _$$ExtensionUntrustedImplCopyWith(_$ExtensionUntrustedImpl value, $Res Function(_$ExtensionUntrustedImpl) then) = __$$ExtensionUntrustedImplCopyWithImpl<$Res>;
@override @useResult
$Res call({
 String name, String pkgName, String versionName, int versionCode, double libVersion, String signatureHash, String? lang, bool isNsfw
});



}

/// @nodoc
class __$$ExtensionUntrustedImplCopyWithImpl<$Res> extends _$ExtensionCopyWithImpl<$Res, _$ExtensionUntrustedImpl> implements _$$ExtensionUntrustedImplCopyWith<$Res> {
  __$$ExtensionUntrustedImplCopyWithImpl(_$ExtensionUntrustedImpl _value, $Res Function(_$ExtensionUntrustedImpl) _then)
      : super(_value, _then);


@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? pkgName = null,Object? versionName = null,Object? versionCode = null,Object? libVersion = null,Object? signatureHash = null,Object? lang = freezed,Object? isNsfw = null,}) {
  return _then(_$ExtensionUntrustedImpl(
name: null == name ? _value.name : name // ignore: cast_nullable_to_non_nullable
as String,pkgName: null == pkgName ? _value.pkgName : pkgName // ignore: cast_nullable_to_non_nullable
as String,versionName: null == versionName ? _value.versionName : versionName // ignore: cast_nullable_to_non_nullable
as String,versionCode: null == versionCode ? _value.versionCode : versionCode // ignore: cast_nullable_to_non_nullable
as int,libVersion: null == libVersion ? _value.libVersion : libVersion // ignore: cast_nullable_to_non_nullable
as double,signatureHash: null == signatureHash ? _value.signatureHash : signatureHash // ignore: cast_nullable_to_non_nullable
as String,lang: freezed == lang ? _value.lang : lang // ignore: cast_nullable_to_non_nullable
as String?,isNsfw: null == isNsfw ? _value.isNsfw : isNsfw // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc


class _$ExtensionUntrustedImpl  implements ExtensionUntrusted {
  const _$ExtensionUntrustedImpl({required this.name, required this.pkgName, required this.versionName, required this.versionCode, required this.libVersion, required this.signatureHash, this.lang, this.isNsfw = false});

  

@override final  String name;
@override final  String pkgName;
@override final  String versionName;
@override final  int versionCode;
@override final  double libVersion;
@override final  String signatureHash;
@override final  String? lang;
@override@JsonKey() final  bool isNsfw;

@override
String toString() {
  return 'Extension.untrusted(name: $name, pkgName: $pkgName, versionName: $versionName, versionCode: $versionCode, libVersion: $libVersion, signatureHash: $signatureHash, lang: $lang, isNsfw: $isNsfw)';
}


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _$ExtensionUntrustedImpl&&(identical(other.name, name) || other.name == name)&&(identical(other.pkgName, pkgName) || other.pkgName == pkgName)&&(identical(other.versionName, versionName) || other.versionName == versionName)&&(identical(other.versionCode, versionCode) || other.versionCode == versionCode)&&(identical(other.libVersion, libVersion) || other.libVersion == libVersion)&&(identical(other.signatureHash, signatureHash) || other.signatureHash == signatureHash)&&(identical(other.lang, lang) || other.lang == lang)&&(identical(other.isNsfw, isNsfw) || other.isNsfw == isNsfw));
}


@override
int get hashCode => Object.hash(runtimeType,name,pkgName,versionName,versionCode,libVersion,signatureHash,lang,isNsfw);

@JsonKey(ignore: true)
@override
@pragma('vm:prefer-inline')
_$$ExtensionUntrustedImplCopyWith<_$ExtensionUntrustedImpl> get copyWith => __$$ExtensionUntrustedImplCopyWithImpl<_$ExtensionUntrustedImpl>(this, _$identity);

@override
@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String name,  String pkgName,  String versionName,  int versionCode,  double libVersion,  String lang,  bool isNsfw,  String? pkgFactory,  List<Source> sources,  Image? icon,  bool hasUpdate,  bool isObsolete,  bool isShared,  String? repoUrl)  installed,required TResult Function( String name,  String pkgName,  String versionName,  int versionCode,  double libVersion,  String lang,  bool isNsfw,  List<ExtensionAvailableSource> sources,  String apkName,  String iconUrl,  String repoUrl)  available,required TResult Function( String name,  String pkgName,  String versionName,  int versionCode,  double libVersion,  String signatureHash,  String? lang,  bool isNsfw)  untrusted,}) {
  return untrusted(name,pkgName,versionName,versionCode,libVersion,signatureHash,lang,isNsfw);
}
@override
@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String name,  String pkgName,  String versionName,  int versionCode,  double libVersion,  String lang,  bool isNsfw,  String? pkgFactory,  List<Source> sources,  Image? icon,  bool hasUpdate,  bool isObsolete,  bool isShared,  String? repoUrl)?  installed,TResult? Function( String name,  String pkgName,  String versionName,  int versionCode,  double libVersion,  String lang,  bool isNsfw,  List<ExtensionAvailableSource> sources,  String apkName,  String iconUrl,  String repoUrl)?  available,TResult? Function( String name,  String pkgName,  String versionName,  int versionCode,  double libVersion,  String signatureHash,  String? lang,  bool isNsfw)?  untrusted,}) {
  return untrusted?.call(name,pkgName,versionName,versionCode,libVersion,signatureHash,lang,isNsfw);
}
@override
@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String name,  String pkgName,  String versionName,  int versionCode,  double libVersion,  String lang,  bool isNsfw,  String? pkgFactory,  List<Source> sources,  Image? icon,  bool hasUpdate,  bool isObsolete,  bool isShared,  String? repoUrl)?  installed,TResult Function( String name,  String pkgName,  String versionName,  int versionCode,  double libVersion,  String lang,  bool isNsfw,  List<ExtensionAvailableSource> sources,  String apkName,  String iconUrl,  String repoUrl)?  available,TResult Function( String name,  String pkgName,  String versionName,  int versionCode,  double libVersion,  String signatureHash,  String? lang,  bool isNsfw)?  untrusted,required TResult orElse(),}) {
  if (untrusted != null) {
    return untrusted(name,pkgName,versionName,versionCode,libVersion,signatureHash,lang,isNsfw);
  }
  return orElse();
}
@override
@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ExtensionInstalled value)  installed,required TResult Function( ExtensionAvailable value)  available,required TResult Function( ExtensionUntrusted value)  untrusted,}) {
  return untrusted(this);
}
@override
@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ExtensionInstalled value)?  installed,TResult? Function( ExtensionAvailable value)?  available,TResult? Function( ExtensionUntrusted value)?  untrusted,}) {
  return untrusted?.call(this);
}
@override
@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ExtensionInstalled value)?  installed,TResult Function( ExtensionAvailable value)?  available,TResult Function( ExtensionUntrusted value)?  untrusted,required TResult orElse(),}) {
  if (untrusted != null) {
    return untrusted(this);
  }
  return orElse();
}

}


abstract class ExtensionUntrusted implements Extension {
  const factory ExtensionUntrusted({required final  String name, required final  String pkgName, required final  String versionName, required final  int versionCode, required final  double libVersion, required final  String signatureHash, final  String? lang, final  bool isNsfw}) = _$ExtensionUntrustedImpl;
  

  

@override  String get name;@override  String get pkgName;@override  String get versionName;@override  int get versionCode;@override  double get libVersion; String get signatureHash;@override  String? get lang;@override  bool get isNsfw;
@override @JsonKey(ignore: true)
_$$ExtensionUntrustedImplCopyWith<_$ExtensionUntrustedImpl> get copyWith => throw _privateConstructorUsedError;

}
