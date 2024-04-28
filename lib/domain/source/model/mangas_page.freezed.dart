// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'mangas_page.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;


final _privateConstructorUsedError = UnsupportedError('It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$MangasPage {

 List<SManga> get mangas => throw _privateConstructorUsedError; bool get hasNextPage => throw _privateConstructorUsedError;







@JsonKey(ignore: true)
$MangasPageCopyWith<MangasPage> get copyWith => throw _privateConstructorUsedError;

}

/// @nodoc
abstract class $MangasPageCopyWith<$Res>  {
  factory $MangasPageCopyWith(MangasPage value, $Res Function(MangasPage) then) = _$MangasPageCopyWithImpl<$Res, MangasPage>;
@useResult
$Res call({
 List<SManga> mangas, bool hasNextPage
});



}

/// @nodoc
class _$MangasPageCopyWithImpl<$Res,$Val extends MangasPage> implements $MangasPageCopyWith<$Res> {
  _$MangasPageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

@pragma('vm:prefer-inline') @override $Res call({Object? mangas = null,Object? hasNextPage = null,}) {
  return _then(_value.copyWith(
mangas: null == mangas ? _value.mangas : mangas // ignore: cast_nullable_to_non_nullable
as List<SManga>,hasNextPage: null == hasNextPage ? _value.hasNextPage : hasNextPage // ignore: cast_nullable_to_non_nullable
as bool,
  )as $Val);
}

}


/// @nodoc
abstract class _$$MangasPageImplCopyWith<$Res> implements $MangasPageCopyWith<$Res> {
  factory _$$MangasPageImplCopyWith(_$MangasPageImpl value, $Res Function(_$MangasPageImpl) then) = __$$MangasPageImplCopyWithImpl<$Res>;
@override @useResult
$Res call({
 List<SManga> mangas, bool hasNextPage
});



}

/// @nodoc
class __$$MangasPageImplCopyWithImpl<$Res> extends _$MangasPageCopyWithImpl<$Res, _$MangasPageImpl> implements _$$MangasPageImplCopyWith<$Res> {
  __$$MangasPageImplCopyWithImpl(_$MangasPageImpl _value, $Res Function(_$MangasPageImpl) _then)
      : super(_value, _then);


@pragma('vm:prefer-inline') @override $Res call({Object? mangas = null,Object? hasNextPage = null,}) {
  return _then(_$MangasPageImpl(
mangas: null == mangas ? _value._mangas : mangas // ignore: cast_nullable_to_non_nullable
as List<SManga>,hasNextPage: null == hasNextPage ? _value.hasNextPage : hasNextPage // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc


class _$MangasPageImpl  implements _MangasPage {
  const _$MangasPageImpl({required final  List<SManga> mangas, required this.hasNextPage}): _mangas = mangas;

  

 final  List<SManga> _mangas;
@override List<SManga> get mangas {
  if (_mangas is EqualUnmodifiableListView) return _mangas;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_mangas);
}

@override final  bool hasNextPage;

@override
String toString() {
  return 'MangasPage(mangas: $mangas, hasNextPage: $hasNextPage)';
}


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _$MangasPageImpl&&const DeepCollectionEquality().equals(other._mangas, _mangas)&&(identical(other.hasNextPage, hasNextPage) || other.hasNextPage == hasNextPage));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_mangas),hasNextPage);

@JsonKey(ignore: true)
@override
@pragma('vm:prefer-inline')
_$$MangasPageImplCopyWith<_$MangasPageImpl> get copyWith => __$$MangasPageImplCopyWithImpl<_$MangasPageImpl>(this, _$identity);








}


abstract class _MangasPage implements MangasPage {
  const factory _MangasPage({required final  List<SManga> mangas, required final  bool hasNextPage}) = _$MangasPageImpl;
  

  

@override  List<SManga> get mangas;@override  bool get hasNextPage;
@override @JsonKey(ignore: true)
_$$MangasPageImplCopyWith<_$MangasPageImpl> get copyWith => throw _privateConstructorUsedError;

}
