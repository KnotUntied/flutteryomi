// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'load_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;


final _privateConstructorUsedError = UnsupportedError('It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$LoadResult {


@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( ExtensionInstalled extension)  success,required TResult Function( ExtensionUntrusted extension)  untrusted,required TResult Function()  error,}) => throw _privateConstructorUsedError;
@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( ExtensionInstalled extension)?  success,TResult? Function( ExtensionUntrusted extension)?  untrusted,TResult? Function()?  error,}) => throw _privateConstructorUsedError;
@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( ExtensionInstalled extension)?  success,TResult Function( ExtensionUntrusted extension)?  untrusted,TResult Function()?  error,required TResult orElse(),}) => throw _privateConstructorUsedError;
@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( LoadResultSuccess value)  success,required TResult Function( LoadResultUntrusted value)  untrusted,required TResult Function( LoadResultError value)  error,}) => throw _privateConstructorUsedError;
@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( LoadResultSuccess value)?  success,TResult? Function( LoadResultUntrusted value)?  untrusted,TResult? Function( LoadResultError value)?  error,}) => throw _privateConstructorUsedError;
@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( LoadResultSuccess value)?  success,TResult Function( LoadResultUntrusted value)?  untrusted,TResult Function( LoadResultError value)?  error,required TResult orElse(),}) => throw _privateConstructorUsedError;


}

/// @nodoc
abstract class $LoadResultCopyWith<$Res>  {
  factory $LoadResultCopyWith(LoadResult value, $Res Function(LoadResult) then) = _$LoadResultCopyWithImpl<$Res, LoadResult>;



}

/// @nodoc
class _$LoadResultCopyWithImpl<$Res,$Val extends LoadResult> implements $LoadResultCopyWith<$Res> {
  _$LoadResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;



}


/// @nodoc
abstract class _$$LoadResultSuccessImplCopyWith<$Res>  {
  factory _$$LoadResultSuccessImplCopyWith(_$LoadResultSuccessImpl value, $Res Function(_$LoadResultSuccessImpl) then) = __$$LoadResultSuccessImplCopyWithImpl<$Res>;
@useResult
$Res call({
 ExtensionInstalled extension
});



}

/// @nodoc
class __$$LoadResultSuccessImplCopyWithImpl<$Res> extends _$LoadResultCopyWithImpl<$Res, _$LoadResultSuccessImpl> implements _$$LoadResultSuccessImplCopyWith<$Res> {
  __$$LoadResultSuccessImplCopyWithImpl(_$LoadResultSuccessImpl _value, $Res Function(_$LoadResultSuccessImpl) _then)
      : super(_value, _then);


@pragma('vm:prefer-inline') @override $Res call({Object? extension = freezed,}) {
  return _then(_$LoadResultSuccessImpl(
extension: freezed == extension ? _value.extension : extension // ignore: cast_nullable_to_non_nullable
as ExtensionInstalled,
  ));
}


}

/// @nodoc


class _$LoadResultSuccessImpl  implements LoadResultSuccess {
  const _$LoadResultSuccessImpl({required this.extension});

  

@override final  ExtensionInstalled extension;

@override
String toString() {
  return 'LoadResult.success(extension: $extension)';
}


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _$LoadResultSuccessImpl&&const DeepCollectionEquality().equals(other.extension, extension));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(extension));

@JsonKey(ignore: true)
@override
@pragma('vm:prefer-inline')
_$$LoadResultSuccessImplCopyWith<_$LoadResultSuccessImpl> get copyWith => __$$LoadResultSuccessImplCopyWithImpl<_$LoadResultSuccessImpl>(this, _$identity);

@override
@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( ExtensionInstalled extension)  success,required TResult Function( ExtensionUntrusted extension)  untrusted,required TResult Function()  error,}) {
  return success(extension);
}
@override
@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( ExtensionInstalled extension)?  success,TResult? Function( ExtensionUntrusted extension)?  untrusted,TResult? Function()?  error,}) {
  return success?.call(extension);
}
@override
@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( ExtensionInstalled extension)?  success,TResult Function( ExtensionUntrusted extension)?  untrusted,TResult Function()?  error,required TResult orElse(),}) {
  if (success != null) {
    return success(extension);
  }
  return orElse();
}
@override
@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( LoadResultSuccess value)  success,required TResult Function( LoadResultUntrusted value)  untrusted,required TResult Function( LoadResultError value)  error,}) {
  return success(this);
}
@override
@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( LoadResultSuccess value)?  success,TResult? Function( LoadResultUntrusted value)?  untrusted,TResult? Function( LoadResultError value)?  error,}) {
  return success?.call(this);
}
@override
@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( LoadResultSuccess value)?  success,TResult Function( LoadResultUntrusted value)?  untrusted,TResult Function( LoadResultError value)?  error,required TResult orElse(),}) {
  if (success != null) {
    return success(this);
  }
  return orElse();
}

}


abstract class LoadResultSuccess implements LoadResult {
  const factory LoadResultSuccess({required final  ExtensionInstalled extension}) = _$LoadResultSuccessImpl;
  

  

 ExtensionInstalled get extension;
@JsonKey(ignore: true)
_$$LoadResultSuccessImplCopyWith<_$LoadResultSuccessImpl> get copyWith => throw _privateConstructorUsedError;

}

/// @nodoc
abstract class _$$LoadResultUntrustedImplCopyWith<$Res>  {
  factory _$$LoadResultUntrustedImplCopyWith(_$LoadResultUntrustedImpl value, $Res Function(_$LoadResultUntrustedImpl) then) = __$$LoadResultUntrustedImplCopyWithImpl<$Res>;
@useResult
$Res call({
 ExtensionUntrusted extension
});



}

/// @nodoc
class __$$LoadResultUntrustedImplCopyWithImpl<$Res> extends _$LoadResultCopyWithImpl<$Res, _$LoadResultUntrustedImpl> implements _$$LoadResultUntrustedImplCopyWith<$Res> {
  __$$LoadResultUntrustedImplCopyWithImpl(_$LoadResultUntrustedImpl _value, $Res Function(_$LoadResultUntrustedImpl) _then)
      : super(_value, _then);


@pragma('vm:prefer-inline') @override $Res call({Object? extension = freezed,}) {
  return _then(_$LoadResultUntrustedImpl(
extension: freezed == extension ? _value.extension : extension // ignore: cast_nullable_to_non_nullable
as ExtensionUntrusted,
  ));
}


}

/// @nodoc


class _$LoadResultUntrustedImpl  implements LoadResultUntrusted {
  const _$LoadResultUntrustedImpl({required this.extension});

  

@override final  ExtensionUntrusted extension;

@override
String toString() {
  return 'LoadResult.untrusted(extension: $extension)';
}


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _$LoadResultUntrustedImpl&&const DeepCollectionEquality().equals(other.extension, extension));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(extension));

@JsonKey(ignore: true)
@override
@pragma('vm:prefer-inline')
_$$LoadResultUntrustedImplCopyWith<_$LoadResultUntrustedImpl> get copyWith => __$$LoadResultUntrustedImplCopyWithImpl<_$LoadResultUntrustedImpl>(this, _$identity);

@override
@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( ExtensionInstalled extension)  success,required TResult Function( ExtensionUntrusted extension)  untrusted,required TResult Function()  error,}) {
  return untrusted(extension);
}
@override
@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( ExtensionInstalled extension)?  success,TResult? Function( ExtensionUntrusted extension)?  untrusted,TResult? Function()?  error,}) {
  return untrusted?.call(extension);
}
@override
@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( ExtensionInstalled extension)?  success,TResult Function( ExtensionUntrusted extension)?  untrusted,TResult Function()?  error,required TResult orElse(),}) {
  if (untrusted != null) {
    return untrusted(extension);
  }
  return orElse();
}
@override
@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( LoadResultSuccess value)  success,required TResult Function( LoadResultUntrusted value)  untrusted,required TResult Function( LoadResultError value)  error,}) {
  return untrusted(this);
}
@override
@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( LoadResultSuccess value)?  success,TResult? Function( LoadResultUntrusted value)?  untrusted,TResult? Function( LoadResultError value)?  error,}) {
  return untrusted?.call(this);
}
@override
@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( LoadResultSuccess value)?  success,TResult Function( LoadResultUntrusted value)?  untrusted,TResult Function( LoadResultError value)?  error,required TResult orElse(),}) {
  if (untrusted != null) {
    return untrusted(this);
  }
  return orElse();
}

}


abstract class LoadResultUntrusted implements LoadResult {
  const factory LoadResultUntrusted({required final  ExtensionUntrusted extension}) = _$LoadResultUntrustedImpl;
  

  

 ExtensionUntrusted get extension;
@JsonKey(ignore: true)
_$$LoadResultUntrustedImplCopyWith<_$LoadResultUntrustedImpl> get copyWith => throw _privateConstructorUsedError;

}

/// @nodoc
abstract class _$$LoadResultErrorImplCopyWith<$Res>  {
  factory _$$LoadResultErrorImplCopyWith(_$LoadResultErrorImpl value, $Res Function(_$LoadResultErrorImpl) then) = __$$LoadResultErrorImplCopyWithImpl<$Res>;



}

/// @nodoc
class __$$LoadResultErrorImplCopyWithImpl<$Res> extends _$LoadResultCopyWithImpl<$Res, _$LoadResultErrorImpl> implements _$$LoadResultErrorImplCopyWith<$Res> {
  __$$LoadResultErrorImplCopyWithImpl(_$LoadResultErrorImpl _value, $Res Function(_$LoadResultErrorImpl) _then)
      : super(_value, _then);





}

/// @nodoc


class _$LoadResultErrorImpl  implements LoadResultError {
  const _$LoadResultErrorImpl();

  



@override
String toString() {
  return 'LoadResult.error()';
}


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _$LoadResultErrorImpl);
}


@override
int get hashCode => runtimeType.hashCode;


@override
@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( ExtensionInstalled extension)  success,required TResult Function( ExtensionUntrusted extension)  untrusted,required TResult Function()  error,}) {
  return error();
}
@override
@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( ExtensionInstalled extension)?  success,TResult? Function( ExtensionUntrusted extension)?  untrusted,TResult? Function()?  error,}) {
  return error?.call();
}
@override
@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( ExtensionInstalled extension)?  success,TResult Function( ExtensionUntrusted extension)?  untrusted,TResult Function()?  error,required TResult orElse(),}) {
  if (error != null) {
    return error();
  }
  return orElse();
}
@override
@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( LoadResultSuccess value)  success,required TResult Function( LoadResultUntrusted value)  untrusted,required TResult Function( LoadResultError value)  error,}) {
  return error(this);
}
@override
@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( LoadResultSuccess value)?  success,TResult? Function( LoadResultUntrusted value)?  untrusted,TResult? Function( LoadResultError value)?  error,}) {
  return error?.call(this);
}
@override
@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( LoadResultSuccess value)?  success,TResult Function( LoadResultUntrusted value)?  untrusted,TResult Function( LoadResultError value)?  error,required TResult orElse(),}) {
  if (error != null) {
    return error(this);
  }
  return orElse();
}

}


abstract class LoadResultError implements LoadResult {
  const factory LoadResultError() = _$LoadResultErrorImpl;
  

  



}
