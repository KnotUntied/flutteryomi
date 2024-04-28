// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'smanga.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;


final _privateConstructorUsedError = UnsupportedError('It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SManga _$SMangaFromJson(Map<String, dynamic> json) {
return _SManga.fromJson(json);
}

/// @nodoc
mixin _$SManga {

 String get url => throw _privateConstructorUsedError; set url(String value) => throw _privateConstructorUsedError; String get title => throw _privateConstructorUsedError; set title(String value) => throw _privateConstructorUsedError; String? get artist => throw _privateConstructorUsedError; set artist(String? value) => throw _privateConstructorUsedError; String? get author => throw _privateConstructorUsedError; set author(String? value) => throw _privateConstructorUsedError; String? get description => throw _privateConstructorUsedError; set description(String? value) => throw _privateConstructorUsedError; String? get genre => throw _privateConstructorUsedError; set genre(String? value) => throw _privateConstructorUsedError; int get status => throw _privateConstructorUsedError; set status(int value) => throw _privateConstructorUsedError; String? get thumbnailUrl => throw _privateConstructorUsedError; set thumbnailUrl(String? value) => throw _privateConstructorUsedError; UpdateStrategy get updateStrategy => throw _privateConstructorUsedError; set updateStrategy(UpdateStrategy value) => throw _privateConstructorUsedError; bool get initialized => throw _privateConstructorUsedError; set initialized(bool value) => throw _privateConstructorUsedError;






Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
@JsonKey(ignore: true)
$SMangaCopyWith<SManga> get copyWith => throw _privateConstructorUsedError;

}

/// @nodoc
abstract class $SMangaCopyWith<$Res>  {
  factory $SMangaCopyWith(SManga value, $Res Function(SManga) then) = _$SMangaCopyWithImpl<$Res, SManga>;
@useResult
$Res call({
 String url, String title, String? artist, String? author, String? description, String? genre, int status, String? thumbnailUrl, UpdateStrategy updateStrategy, bool initialized
});



}

/// @nodoc
class _$SMangaCopyWithImpl<$Res,$Val extends SManga> implements $SMangaCopyWith<$Res> {
  _$SMangaCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

@pragma('vm:prefer-inline') @override $Res call({Object? url = null,Object? title = null,Object? artist = freezed,Object? author = freezed,Object? description = freezed,Object? genre = freezed,Object? status = null,Object? thumbnailUrl = freezed,Object? updateStrategy = null,Object? initialized = null,}) {
  return _then(_value.copyWith(
url: null == url ? _value.url : url // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _value.title : title // ignore: cast_nullable_to_non_nullable
as String,artist: freezed == artist ? _value.artist : artist // ignore: cast_nullable_to_non_nullable
as String?,author: freezed == author ? _value.author : author // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _value.description : description // ignore: cast_nullable_to_non_nullable
as String?,genre: freezed == genre ? _value.genre : genre // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _value.status : status // ignore: cast_nullable_to_non_nullable
as int,thumbnailUrl: freezed == thumbnailUrl ? _value.thumbnailUrl : thumbnailUrl // ignore: cast_nullable_to_non_nullable
as String?,updateStrategy: null == updateStrategy ? _value.updateStrategy : updateStrategy // ignore: cast_nullable_to_non_nullable
as UpdateStrategy,initialized: null == initialized ? _value.initialized : initialized // ignore: cast_nullable_to_non_nullable
as bool,
  )as $Val);
}

}


/// @nodoc
abstract class _$$SMangaImplCopyWith<$Res> implements $SMangaCopyWith<$Res> {
  factory _$$SMangaImplCopyWith(_$SMangaImpl value, $Res Function(_$SMangaImpl) then) = __$$SMangaImplCopyWithImpl<$Res>;
@override @useResult
$Res call({
 String url, String title, String? artist, String? author, String? description, String? genre, int status, String? thumbnailUrl, UpdateStrategy updateStrategy, bool initialized
});



}

/// @nodoc
class __$$SMangaImplCopyWithImpl<$Res> extends _$SMangaCopyWithImpl<$Res, _$SMangaImpl> implements _$$SMangaImplCopyWith<$Res> {
  __$$SMangaImplCopyWithImpl(_$SMangaImpl _value, $Res Function(_$SMangaImpl) _then)
      : super(_value, _then);


@pragma('vm:prefer-inline') @override $Res call({Object? url = null,Object? title = null,Object? artist = freezed,Object? author = freezed,Object? description = freezed,Object? genre = freezed,Object? status = null,Object? thumbnailUrl = freezed,Object? updateStrategy = null,Object? initialized = null,}) {
  return _then(_$SMangaImpl(
url: null == url ? _value.url : url // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _value.title : title // ignore: cast_nullable_to_non_nullable
as String,artist: freezed == artist ? _value.artist : artist // ignore: cast_nullable_to_non_nullable
as String?,author: freezed == author ? _value.author : author // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _value.description : description // ignore: cast_nullable_to_non_nullable
as String?,genre: freezed == genre ? _value.genre : genre // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _value.status : status // ignore: cast_nullable_to_non_nullable
as int,thumbnailUrl: freezed == thumbnailUrl ? _value.thumbnailUrl : thumbnailUrl // ignore: cast_nullable_to_non_nullable
as String?,updateStrategy: null == updateStrategy ? _value.updateStrategy : updateStrategy // ignore: cast_nullable_to_non_nullable
as UpdateStrategy,initialized: null == initialized ? _value.initialized : initialized // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc
@JsonSerializable()

class _$SMangaImpl extends _SManga  {
   _$SMangaImpl({this.url = '', this.title = '', this.artist, this.author, this.description, this.genre, this.status = SManga.publishingFinished, this.thumbnailUrl, this.updateStrategy = UpdateStrategy.alwaysUpdate, this.initialized = false}): super._();

  factory _$SMangaImpl.fromJson(Map<String, dynamic> json) => _$$SMangaImplFromJson(json);

@override@JsonKey()  String url;
@override@JsonKey()  String title;
@override  String? artist;
@override  String? author;
@override  String? description;
@override  String? genre;
@override@JsonKey()  int status;
@override  String? thumbnailUrl;
@override@JsonKey()  UpdateStrategy updateStrategy;
@override@JsonKey()  bool initialized;

@override
String toString() {
  return 'SManga(url: $url, title: $title, artist: $artist, author: $author, description: $description, genre: $genre, status: $status, thumbnailUrl: $thumbnailUrl, updateStrategy: $updateStrategy, initialized: $initialized)';
}




@JsonKey(ignore: true)
@override
@pragma('vm:prefer-inline')
_$$SMangaImplCopyWith<_$SMangaImpl> get copyWith => __$$SMangaImplCopyWithImpl<_$SMangaImpl>(this, _$identity);







@override
Map<String, dynamic> toJson() {
  return _$$SMangaImplToJson(this, );
}
}


abstract class _SManga extends SManga {
   factory _SManga({ String url,  String title,  String? artist,  String? author,  String? description,  String? genre,  int status,  String? thumbnailUrl,  UpdateStrategy updateStrategy,  bool initialized}) = _$SMangaImpl;
   _SManga._(): super._();

  factory _SManga.fromJson(Map<String, dynamic> json) = _$SMangaImpl.fromJson;

@override  String get url; set url(String value);@override  String get title; set title(String value);@override  String? get artist; set artist(String? value);@override  String? get author; set author(String? value);@override  String? get description; set description(String? value);@override  String? get genre; set genre(String? value);@override  int get status; set status(int value);@override  String? get thumbnailUrl; set thumbnailUrl(String? value);@override  UpdateStrategy get updateStrategy; set updateStrategy(UpdateStrategy value);@override  bool get initialized; set initialized(bool value);
@override @JsonKey(ignore: true)
_$$SMangaImplCopyWith<_$SMangaImpl> get copyWith => throw _privateConstructorUsedError;

}
