// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'updates.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;


final _privateConstructorUsedError = UnsupportedError('It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$UpdatesUiModel {


@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( DateTime date)  header,required TResult Function( UpdatesItem item)  item,}) => throw _privateConstructorUsedError;
@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( DateTime date)?  header,TResult? Function( UpdatesItem item)?  item,}) => throw _privateConstructorUsedError;
@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( DateTime date)?  header,TResult Function( UpdatesItem item)?  item,required TResult orElse(),}) => throw _privateConstructorUsedError;
@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( Header value)  header,required TResult Function( Item value)  item,}) => throw _privateConstructorUsedError;
@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( Header value)?  header,TResult? Function( Item value)?  item,}) => throw _privateConstructorUsedError;
@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( Header value)?  header,TResult Function( Item value)?  item,required TResult orElse(),}) => throw _privateConstructorUsedError;


}

/// @nodoc
abstract class $UpdatesUiModelCopyWith<$Res>  {
  factory $UpdatesUiModelCopyWith(UpdatesUiModel value, $Res Function(UpdatesUiModel) then) = _$UpdatesUiModelCopyWithImpl<$Res, UpdatesUiModel>;



}

/// @nodoc
class _$UpdatesUiModelCopyWithImpl<$Res,$Val extends UpdatesUiModel> implements $UpdatesUiModelCopyWith<$Res> {
  _$UpdatesUiModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;



}


/// @nodoc
abstract class _$$HeaderImplCopyWith<$Res>  {
  factory _$$HeaderImplCopyWith(_$HeaderImpl value, $Res Function(_$HeaderImpl) then) = __$$HeaderImplCopyWithImpl<$Res>;
@useResult
$Res call({
 DateTime date
});



}

/// @nodoc
class __$$HeaderImplCopyWithImpl<$Res> extends _$UpdatesUiModelCopyWithImpl<$Res, _$HeaderImpl> implements _$$HeaderImplCopyWith<$Res> {
  __$$HeaderImplCopyWithImpl(_$HeaderImpl _value, $Res Function(_$HeaderImpl) _then)
      : super(_value, _then);


@pragma('vm:prefer-inline') @override $Res call({Object? date = null,}) {
  return _then(_$HeaderImpl(
null == date ? _value.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

/// @nodoc


class _$HeaderImpl  implements Header {
  const _$HeaderImpl(this.date);

  

@override final  DateTime date;

@override
String toString() {
  return 'UpdatesUiModel.header(date: $date)';
}


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _$HeaderImpl&&(identical(other.date, date) || other.date == date));
}


@override
int get hashCode => Object.hash(runtimeType,date);

@JsonKey(ignore: true)
@override
@pragma('vm:prefer-inline')
_$$HeaderImplCopyWith<_$HeaderImpl> get copyWith => __$$HeaderImplCopyWithImpl<_$HeaderImpl>(this, _$identity);

@override
@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( DateTime date)  header,required TResult Function( UpdatesItem item)  item,}) {
  return header(date);
}
@override
@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( DateTime date)?  header,TResult? Function( UpdatesItem item)?  item,}) {
  return header?.call(date);
}
@override
@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( DateTime date)?  header,TResult Function( UpdatesItem item)?  item,required TResult orElse(),}) {
  if (header != null) {
    return header(date);
  }
  return orElse();
}
@override
@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( Header value)  header,required TResult Function( Item value)  item,}) {
  return header(this);
}
@override
@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( Header value)?  header,TResult? Function( Item value)?  item,}) {
  return header?.call(this);
}
@override
@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( Header value)?  header,TResult Function( Item value)?  item,required TResult orElse(),}) {
  if (header != null) {
    return header(this);
  }
  return orElse();
}

}


abstract class Header implements UpdatesUiModel {
  const factory Header(final  DateTime date) = _$HeaderImpl;
  

  

 DateTime get date;
@JsonKey(ignore: true)
_$$HeaderImplCopyWith<_$HeaderImpl> get copyWith => throw _privateConstructorUsedError;

}

/// @nodoc
abstract class _$$ItemImplCopyWith<$Res>  {
  factory _$$ItemImplCopyWith(_$ItemImpl value, $Res Function(_$ItemImpl) then) = __$$ItemImplCopyWithImpl<$Res>;
@useResult
$Res call({
 UpdatesItem item
});


$UpdatesItemCopyWith<$Res> get item;
}

/// @nodoc
class __$$ItemImplCopyWithImpl<$Res> extends _$UpdatesUiModelCopyWithImpl<$Res, _$ItemImpl> implements _$$ItemImplCopyWith<$Res> {
  __$$ItemImplCopyWithImpl(_$ItemImpl _value, $Res Function(_$ItemImpl) _then)
      : super(_value, _then);


@pragma('vm:prefer-inline') @override $Res call({Object? item = null,}) {
  return _then(_$ItemImpl(
null == item ? _value.item : item // ignore: cast_nullable_to_non_nullable
as UpdatesItem,
  ));
}

@override
@pragma('vm:prefer-inline')
$UpdatesItemCopyWith<$Res> get item {
  
  return $UpdatesItemCopyWith<$Res>(_value.item, (value) {
    return _then(_value.copyWith(item: value) );
  });
}
}

/// @nodoc


class _$ItemImpl  implements Item {
  const _$ItemImpl(this.item);

  

@override final  UpdatesItem item;

@override
String toString() {
  return 'UpdatesUiModel.item(item: $item)';
}


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _$ItemImpl&&(identical(other.item, item) || other.item == item));
}


@override
int get hashCode => Object.hash(runtimeType,item);

@JsonKey(ignore: true)
@override
@pragma('vm:prefer-inline')
_$$ItemImplCopyWith<_$ItemImpl> get copyWith => __$$ItemImplCopyWithImpl<_$ItemImpl>(this, _$identity);

@override
@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( DateTime date)  header,required TResult Function( UpdatesItem item)  item,}) {
  return item(this.item);
}
@override
@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( DateTime date)?  header,TResult? Function( UpdatesItem item)?  item,}) {
  return item?.call(this.item);
}
@override
@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( DateTime date)?  header,TResult Function( UpdatesItem item)?  item,required TResult orElse(),}) {
  if (item != null) {
    return item(this.item);
  }
  return orElse();
}
@override
@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( Header value)  header,required TResult Function( Item value)  item,}) {
  return item(this);
}
@override
@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( Header value)?  header,TResult? Function( Item value)?  item,}) {
  return item?.call(this);
}
@override
@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( Header value)?  header,TResult Function( Item value)?  item,required TResult orElse(),}) {
  if (item != null) {
    return item(this);
  }
  return orElse();
}

}


abstract class Item implements UpdatesUiModel {
  const factory Item(final  UpdatesItem item) = _$ItemImpl;
  

  

 UpdatesItem get item;
@JsonKey(ignore: true)
_$$ItemImplCopyWith<_$ItemImpl> get copyWith => throw _privateConstructorUsedError;

}
