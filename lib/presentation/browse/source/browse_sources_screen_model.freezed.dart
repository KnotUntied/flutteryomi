// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'browse_sources_screen_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;


final _privateConstructorUsedError = UnsupportedError('It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$BrowseSourcesScreenState {

 Listing get listing => throw _privateConstructorUsedError; List<Filter<dynamic>> get filters => throw _privateConstructorUsedError; String? get toolbarQuery => throw _privateConstructorUsedError;







@JsonKey(ignore: true)
$BrowseSourcesScreenStateCopyWith<BrowseSourcesScreenState> get copyWith => throw _privateConstructorUsedError;

}

/// @nodoc
abstract class $BrowseSourcesScreenStateCopyWith<$Res>  {
  factory $BrowseSourcesScreenStateCopyWith(BrowseSourcesScreenState value, $Res Function(BrowseSourcesScreenState) then) = _$BrowseSourcesScreenStateCopyWithImpl<$Res, BrowseSourcesScreenState>;
@useResult
$Res call({
 Listing listing, List<Filter<dynamic>> filters, String? toolbarQuery
});



}

/// @nodoc
class _$BrowseSourcesScreenStateCopyWithImpl<$Res,$Val extends BrowseSourcesScreenState> implements $BrowseSourcesScreenStateCopyWith<$Res> {
  _$BrowseSourcesScreenStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

@pragma('vm:prefer-inline') @override $Res call({Object? listing = null,Object? filters = null,Object? toolbarQuery = freezed,}) {
  return _then(_value.copyWith(
listing: null == listing ? _value.listing : listing // ignore: cast_nullable_to_non_nullable
as Listing,filters: null == filters ? _value.filters : filters // ignore: cast_nullable_to_non_nullable
as List<Filter<dynamic>>,toolbarQuery: freezed == toolbarQuery ? _value.toolbarQuery : toolbarQuery // ignore: cast_nullable_to_non_nullable
as String?,
  )as $Val);
}

}


/// @nodoc
abstract class _$$BrowseSourcesScreenStateImplCopyWith<$Res> implements $BrowseSourcesScreenStateCopyWith<$Res> {
  factory _$$BrowseSourcesScreenStateImplCopyWith(_$BrowseSourcesScreenStateImpl value, $Res Function(_$BrowseSourcesScreenStateImpl) then) = __$$BrowseSourcesScreenStateImplCopyWithImpl<$Res>;
@override @useResult
$Res call({
 Listing listing, List<Filter<dynamic>> filters, String? toolbarQuery
});



}

/// @nodoc
class __$$BrowseSourcesScreenStateImplCopyWithImpl<$Res> extends _$BrowseSourcesScreenStateCopyWithImpl<$Res, _$BrowseSourcesScreenStateImpl> implements _$$BrowseSourcesScreenStateImplCopyWith<$Res> {
  __$$BrowseSourcesScreenStateImplCopyWithImpl(_$BrowseSourcesScreenStateImpl _value, $Res Function(_$BrowseSourcesScreenStateImpl) _then)
      : super(_value, _then);


@pragma('vm:prefer-inline') @override $Res call({Object? listing = null,Object? filters = null,Object? toolbarQuery = freezed,}) {
  return _then(_$BrowseSourcesScreenStateImpl(
listing: null == listing ? _value.listing : listing // ignore: cast_nullable_to_non_nullable
as Listing,filters: null == filters ? _value._filters : filters // ignore: cast_nullable_to_non_nullable
as List<Filter<dynamic>>,toolbarQuery: freezed == toolbarQuery ? _value.toolbarQuery : toolbarQuery // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class _$BrowseSourcesScreenStateImpl extends _BrowseSourcesScreenState  {
  const _$BrowseSourcesScreenStateImpl({required this.listing, required final  List<Filter<dynamic>> filters, this.toolbarQuery}): _filters = filters,super._();

  

@override final  Listing listing;
 final  List<Filter<dynamic>> _filters;
@override List<Filter<dynamic>> get filters {
  if (_filters is EqualUnmodifiableListView) return _filters;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_filters);
}

@override final  String? toolbarQuery;

@override
String toString() {
  return 'BrowseSourcesScreenState(listing: $listing, filters: $filters, toolbarQuery: $toolbarQuery)';
}


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _$BrowseSourcesScreenStateImpl&&(identical(other.listing, listing) || other.listing == listing)&&const DeepCollectionEquality().equals(other._filters, _filters)&&(identical(other.toolbarQuery, toolbarQuery) || other.toolbarQuery == toolbarQuery));
}


@override
int get hashCode => Object.hash(runtimeType,listing,const DeepCollectionEquality().hash(_filters),toolbarQuery);

@JsonKey(ignore: true)
@override
@pragma('vm:prefer-inline')
_$$BrowseSourcesScreenStateImplCopyWith<_$BrowseSourcesScreenStateImpl> get copyWith => __$$BrowseSourcesScreenStateImplCopyWithImpl<_$BrowseSourcesScreenStateImpl>(this, _$identity);








}


abstract class _BrowseSourcesScreenState extends BrowseSourcesScreenState {
  const factory _BrowseSourcesScreenState({required final  Listing listing, required final  List<Filter<dynamic>> filters, final  String? toolbarQuery}) = _$BrowseSourcesScreenStateImpl;
  const _BrowseSourcesScreenState._(): super._();

  

@override  Listing get listing;@override  List<Filter<dynamic>> get filters;@override  String? get toolbarQuery;
@override @JsonKey(ignore: true)
_$$BrowseSourcesScreenStateImplCopyWith<_$BrowseSourcesScreenStateImpl> get copyWith => throw _privateConstructorUsedError;

}
