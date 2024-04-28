// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'download_pending_deleter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;


final _privateConstructorUsedError = UnsupportedError('It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

_Entry _$EntryFromJson(Map<String, dynamic> json) {
return __Entry.fromJson(json);
}

/// @nodoc
mixin _$Entry {

 List<_ChapterEntry> get chapters => throw _privateConstructorUsedError; _MangaEntry get manga => throw _privateConstructorUsedError;






Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
@JsonKey(ignore: true)
_$EntryCopyWith<_Entry> get copyWith => throw _privateConstructorUsedError;

}

/// @nodoc
abstract class _$EntryCopyWith<$Res>  {
  factory _$EntryCopyWith(_Entry value, $Res Function(_Entry) then) = __$EntryCopyWithImpl<$Res, _Entry>;
@useResult
$Res call({
 List<_ChapterEntry> chapters, _MangaEntry manga
});


_$MangaEntryCopyWith<$Res> get manga;
}

/// @nodoc
class __$EntryCopyWithImpl<$Res,$Val extends _Entry> implements _$EntryCopyWith<$Res> {
  __$EntryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

@pragma('vm:prefer-inline') @override $Res call({Object? chapters = null,Object? manga = null,}) {
  return _then(_value.copyWith(
chapters: null == chapters ? _value.chapters : chapters // ignore: cast_nullable_to_non_nullable
as List<_ChapterEntry>,manga: null == manga ? _value.manga : manga // ignore: cast_nullable_to_non_nullable
as _MangaEntry,
  )as $Val);
}
@override
@pragma('vm:prefer-inline')
_$MangaEntryCopyWith<$Res> get manga {
  
  return _$MangaEntryCopyWith<$Res>(_value.manga, (value) {
    return _then(_value.copyWith(manga: value) as $Val);
  });
}
}


/// @nodoc
abstract class _$$_EntryImplCopyWith<$Res> implements _$EntryCopyWith<$Res> {
  factory _$$_EntryImplCopyWith(_$_EntryImpl value, $Res Function(_$_EntryImpl) then) = __$$_EntryImplCopyWithImpl<$Res>;
@override @useResult
$Res call({
 List<_ChapterEntry> chapters, _MangaEntry manga
});


@override _$MangaEntryCopyWith<$Res> get manga;
}

/// @nodoc
class __$$_EntryImplCopyWithImpl<$Res> extends __$EntryCopyWithImpl<$Res, _$_EntryImpl> implements _$$_EntryImplCopyWith<$Res> {
  __$$_EntryImplCopyWithImpl(_$_EntryImpl _value, $Res Function(_$_EntryImpl) _then)
      : super(_value, _then);


@pragma('vm:prefer-inline') @override $Res call({Object? chapters = null,Object? manga = null,}) {
  return _then(_$_EntryImpl(
chapters: null == chapters ? _value._chapters : chapters // ignore: cast_nullable_to_non_nullable
as List<_ChapterEntry>,manga: null == manga ? _value.manga : manga // ignore: cast_nullable_to_non_nullable
as _MangaEntry,
  ));
}


}

/// @nodoc
@JsonSerializable()

class _$_EntryImpl extends __Entry  {
  const _$_EntryImpl({required final  List<_ChapterEntry> chapters, required this.manga}): _chapters = chapters,super._();

  factory _$_EntryImpl.fromJson(Map<String, dynamic> json) => _$$_EntryImplFromJson(json);

 final  List<_ChapterEntry> _chapters;
@override List<_ChapterEntry> get chapters {
  if (_chapters is EqualUnmodifiableListView) return _chapters;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_chapters);
}

@override final  _MangaEntry manga;

@override
String toString() {
  return '_Entry(chapters: $chapters, manga: $manga)';
}


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _$_EntryImpl&&const DeepCollectionEquality().equals(other._chapters, _chapters)&&(identical(other.manga, manga) || other.manga == manga));
}

@JsonKey(ignore: true)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_chapters),manga);

@JsonKey(ignore: true)
@override
@pragma('vm:prefer-inline')
_$$_EntryImplCopyWith<_$_EntryImpl> get copyWith => __$$_EntryImplCopyWithImpl<_$_EntryImpl>(this, _$identity);







@override
Map<String, dynamic> toJson() {
  return _$$_EntryImplToJson(this, );
}
}


abstract class __Entry extends _Entry {
  const factory __Entry({required final  List<_ChapterEntry> chapters, required final  _MangaEntry manga}) = _$_EntryImpl;
  const __Entry._(): super._();

  factory __Entry.fromJson(Map<String, dynamic> json) = _$_EntryImpl.fromJson;

@override  List<_ChapterEntry> get chapters;@override  _MangaEntry get manga;
@override @JsonKey(ignore: true)
_$$_EntryImplCopyWith<_$_EntryImpl> get copyWith => throw _privateConstructorUsedError;

}

_ChapterEntry _$ChapterEntryFromJson(Map<String, dynamic> json) {
return __ChapterEntry.fromJson(json);
}

/// @nodoc
mixin _$ChapterEntry {

 int get id => throw _privateConstructorUsedError; String get url => throw _privateConstructorUsedError; String get name => throw _privateConstructorUsedError; String? get scanlator => throw _privateConstructorUsedError;






Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
@JsonKey(ignore: true)
_$ChapterEntryCopyWith<_ChapterEntry> get copyWith => throw _privateConstructorUsedError;

}

/// @nodoc
abstract class _$ChapterEntryCopyWith<$Res>  {
  factory _$ChapterEntryCopyWith(_ChapterEntry value, $Res Function(_ChapterEntry) then) = __$ChapterEntryCopyWithImpl<$Res, _ChapterEntry>;
@useResult
$Res call({
 int id, String url, String name, String? scanlator
});



}

/// @nodoc
class __$ChapterEntryCopyWithImpl<$Res,$Val extends _ChapterEntry> implements _$ChapterEntryCopyWith<$Res> {
  __$ChapterEntryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? url = null,Object? name = null,Object? scanlator = freezed,}) {
  return _then(_value.copyWith(
id: null == id ? _value.id : id // ignore: cast_nullable_to_non_nullable
as int,url: null == url ? _value.url : url // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _value.name : name // ignore: cast_nullable_to_non_nullable
as String,scanlator: freezed == scanlator ? _value.scanlator : scanlator // ignore: cast_nullable_to_non_nullable
as String?,
  )as $Val);
}

}


/// @nodoc
abstract class _$$_ChapterEntryImplCopyWith<$Res> implements _$ChapterEntryCopyWith<$Res> {
  factory _$$_ChapterEntryImplCopyWith(_$_ChapterEntryImpl value, $Res Function(_$_ChapterEntryImpl) then) = __$$_ChapterEntryImplCopyWithImpl<$Res>;
@override @useResult
$Res call({
 int id, String url, String name, String? scanlator
});



}

/// @nodoc
class __$$_ChapterEntryImplCopyWithImpl<$Res> extends __$ChapterEntryCopyWithImpl<$Res, _$_ChapterEntryImpl> implements _$$_ChapterEntryImplCopyWith<$Res> {
  __$$_ChapterEntryImplCopyWithImpl(_$_ChapterEntryImpl _value, $Res Function(_$_ChapterEntryImpl) _then)
      : super(_value, _then);


@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? url = null,Object? name = null,Object? scanlator = freezed,}) {
  return _then(_$_ChapterEntryImpl(
id: null == id ? _value.id : id // ignore: cast_nullable_to_non_nullable
as int,url: null == url ? _value.url : url // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _value.name : name // ignore: cast_nullable_to_non_nullable
as String,scanlator: freezed == scanlator ? _value.scanlator : scanlator // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc
@JsonSerializable()

class _$_ChapterEntryImpl extends __ChapterEntry  {
  const _$_ChapterEntryImpl({required this.id, required this.url, required this.name, this.scanlator}): super._();

  factory _$_ChapterEntryImpl.fromJson(Map<String, dynamic> json) => _$$_ChapterEntryImplFromJson(json);

@override final  int id;
@override final  String url;
@override final  String name;
@override final  String? scanlator;

@override
String toString() {
  return '_ChapterEntry(id: $id, url: $url, name: $name, scanlator: $scanlator)';
}


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _$_ChapterEntryImpl&&(identical(other.id, id) || other.id == id)&&(identical(other.url, url) || other.url == url)&&(identical(other.name, name) || other.name == name)&&(identical(other.scanlator, scanlator) || other.scanlator == scanlator));
}

@JsonKey(ignore: true)
@override
int get hashCode => Object.hash(runtimeType,id,url,name,scanlator);

@JsonKey(ignore: true)
@override
@pragma('vm:prefer-inline')
_$$_ChapterEntryImplCopyWith<_$_ChapterEntryImpl> get copyWith => __$$_ChapterEntryImplCopyWithImpl<_$_ChapterEntryImpl>(this, _$identity);







@override
Map<String, dynamic> toJson() {
  return _$$_ChapterEntryImplToJson(this, );
}
}


abstract class __ChapterEntry extends _ChapterEntry {
  const factory __ChapterEntry({required final  int id, required final  String url, required final  String name, final  String? scanlator}) = _$_ChapterEntryImpl;
  const __ChapterEntry._(): super._();

  factory __ChapterEntry.fromJson(Map<String, dynamic> json) = _$_ChapterEntryImpl.fromJson;

@override  int get id;@override  String get url;@override  String get name;@override  String? get scanlator;
@override @JsonKey(ignore: true)
_$$_ChapterEntryImplCopyWith<_$_ChapterEntryImpl> get copyWith => throw _privateConstructorUsedError;

}

_MangaEntry _$MangaEntryFromJson(Map<String, dynamic> json) {
return __MangaEntry.fromJson(json);
}

/// @nodoc
mixin _$MangaEntry {

 int get id => throw _privateConstructorUsedError; String get url => throw _privateConstructorUsedError; String get title => throw _privateConstructorUsedError; int get source => throw _privateConstructorUsedError;






Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
@JsonKey(ignore: true)
_$MangaEntryCopyWith<_MangaEntry> get copyWith => throw _privateConstructorUsedError;

}

/// @nodoc
abstract class _$MangaEntryCopyWith<$Res>  {
  factory _$MangaEntryCopyWith(_MangaEntry value, $Res Function(_MangaEntry) then) = __$MangaEntryCopyWithImpl<$Res, _MangaEntry>;
@useResult
$Res call({
 int id, String url, String title, int source
});



}

/// @nodoc
class __$MangaEntryCopyWithImpl<$Res,$Val extends _MangaEntry> implements _$MangaEntryCopyWith<$Res> {
  __$MangaEntryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? url = null,Object? title = null,Object? source = null,}) {
  return _then(_value.copyWith(
id: null == id ? _value.id : id // ignore: cast_nullable_to_non_nullable
as int,url: null == url ? _value.url : url // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _value.title : title // ignore: cast_nullable_to_non_nullable
as String,source: null == source ? _value.source : source // ignore: cast_nullable_to_non_nullable
as int,
  )as $Val);
}

}


/// @nodoc
abstract class _$$_MangaEntryImplCopyWith<$Res> implements _$MangaEntryCopyWith<$Res> {
  factory _$$_MangaEntryImplCopyWith(_$_MangaEntryImpl value, $Res Function(_$_MangaEntryImpl) then) = __$$_MangaEntryImplCopyWithImpl<$Res>;
@override @useResult
$Res call({
 int id, String url, String title, int source
});



}

/// @nodoc
class __$$_MangaEntryImplCopyWithImpl<$Res> extends __$MangaEntryCopyWithImpl<$Res, _$_MangaEntryImpl> implements _$$_MangaEntryImplCopyWith<$Res> {
  __$$_MangaEntryImplCopyWithImpl(_$_MangaEntryImpl _value, $Res Function(_$_MangaEntryImpl) _then)
      : super(_value, _then);


@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? url = null,Object? title = null,Object? source = null,}) {
  return _then(_$_MangaEntryImpl(
id: null == id ? _value.id : id // ignore: cast_nullable_to_non_nullable
as int,url: null == url ? _value.url : url // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _value.title : title // ignore: cast_nullable_to_non_nullable
as String,source: null == source ? _value.source : source // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc
@JsonSerializable()

class _$_MangaEntryImpl extends __MangaEntry  {
  const _$_MangaEntryImpl({required this.id, required this.url, required this.title, required this.source}): super._();

  factory _$_MangaEntryImpl.fromJson(Map<String, dynamic> json) => _$$_MangaEntryImplFromJson(json);

@override final  int id;
@override final  String url;
@override final  String title;
@override final  int source;

@override
String toString() {
  return '_MangaEntry(id: $id, url: $url, title: $title, source: $source)';
}


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _$_MangaEntryImpl&&(identical(other.id, id) || other.id == id)&&(identical(other.url, url) || other.url == url)&&(identical(other.title, title) || other.title == title)&&(identical(other.source, source) || other.source == source));
}

@JsonKey(ignore: true)
@override
int get hashCode => Object.hash(runtimeType,id,url,title,source);

@JsonKey(ignore: true)
@override
@pragma('vm:prefer-inline')
_$$_MangaEntryImplCopyWith<_$_MangaEntryImpl> get copyWith => __$$_MangaEntryImplCopyWithImpl<_$_MangaEntryImpl>(this, _$identity);







@override
Map<String, dynamic> toJson() {
  return _$$_MangaEntryImplToJson(this, );
}
}


abstract class __MangaEntry extends _MangaEntry {
  const factory __MangaEntry({required final  int id, required final  String url, required final  String title, required final  int source}) = _$_MangaEntryImpl;
  const __MangaEntry._(): super._();

  factory __MangaEntry.fromJson(Map<String, dynamic> json) = _$_MangaEntryImpl.fromJson;

@override  int get id;@override  String get url;@override  String get title;@override  int get source;
@override @JsonKey(ignore: true)
_$$_MangaEntryImplCopyWith<_$_MangaEntryImpl> get copyWith => throw _privateConstructorUsedError;

}
