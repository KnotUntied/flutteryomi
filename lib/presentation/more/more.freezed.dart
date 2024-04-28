// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'more.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;


final _privateConstructorUsedError = UnsupportedError('It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$DownloadQueueState {


@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  stopped,required TResult Function( int pending)  paused,required TResult Function( int pending)  downloading,}) => throw _privateConstructorUsedError;
@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  stopped,TResult? Function( int pending)?  paused,TResult? Function( int pending)?  downloading,}) => throw _privateConstructorUsedError;
@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  stopped,TResult Function( int pending)?  paused,TResult Function( int pending)?  downloading,required TResult orElse(),}) => throw _privateConstructorUsedError;
@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( Stopped value)  stopped,required TResult Function( Paused value)  paused,required TResult Function( Downloading value)  downloading,}) => throw _privateConstructorUsedError;
@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( Stopped value)?  stopped,TResult? Function( Paused value)?  paused,TResult? Function( Downloading value)?  downloading,}) => throw _privateConstructorUsedError;
@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( Stopped value)?  stopped,TResult Function( Paused value)?  paused,TResult Function( Downloading value)?  downloading,required TResult orElse(),}) => throw _privateConstructorUsedError;


}

/// @nodoc
abstract class $DownloadQueueStateCopyWith<$Res>  {
  factory $DownloadQueueStateCopyWith(DownloadQueueState value, $Res Function(DownloadQueueState) then) = _$DownloadQueueStateCopyWithImpl<$Res, DownloadQueueState>;



}

/// @nodoc
class _$DownloadQueueStateCopyWithImpl<$Res,$Val extends DownloadQueueState> implements $DownloadQueueStateCopyWith<$Res> {
  _$DownloadQueueStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;



}


/// @nodoc
abstract class _$$StoppedImplCopyWith<$Res>  {
  factory _$$StoppedImplCopyWith(_$StoppedImpl value, $Res Function(_$StoppedImpl) then) = __$$StoppedImplCopyWithImpl<$Res>;



}

/// @nodoc
class __$$StoppedImplCopyWithImpl<$Res> extends _$DownloadQueueStateCopyWithImpl<$Res, _$StoppedImpl> implements _$$StoppedImplCopyWith<$Res> {
  __$$StoppedImplCopyWithImpl(_$StoppedImpl _value, $Res Function(_$StoppedImpl) _then)
      : super(_value, _then);





}

/// @nodoc


class _$StoppedImpl  implements Stopped {
  const _$StoppedImpl();

  



@override
String toString() {
  return 'DownloadQueueState.stopped()';
}


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _$StoppedImpl);
}


@override
int get hashCode => runtimeType.hashCode;


@override
@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  stopped,required TResult Function( int pending)  paused,required TResult Function( int pending)  downloading,}) {
  return stopped();
}
@override
@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  stopped,TResult? Function( int pending)?  paused,TResult? Function( int pending)?  downloading,}) {
  return stopped?.call();
}
@override
@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  stopped,TResult Function( int pending)?  paused,TResult Function( int pending)?  downloading,required TResult orElse(),}) {
  if (stopped != null) {
    return stopped();
  }
  return orElse();
}
@override
@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( Stopped value)  stopped,required TResult Function( Paused value)  paused,required TResult Function( Downloading value)  downloading,}) {
  return stopped(this);
}
@override
@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( Stopped value)?  stopped,TResult? Function( Paused value)?  paused,TResult? Function( Downloading value)?  downloading,}) {
  return stopped?.call(this);
}
@override
@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( Stopped value)?  stopped,TResult Function( Paused value)?  paused,TResult Function( Downloading value)?  downloading,required TResult orElse(),}) {
  if (stopped != null) {
    return stopped(this);
  }
  return orElse();
}

}


abstract class Stopped implements DownloadQueueState {
  const factory Stopped() = _$StoppedImpl;
  

  



}

/// @nodoc
abstract class _$$PausedImplCopyWith<$Res>  {
  factory _$$PausedImplCopyWith(_$PausedImpl value, $Res Function(_$PausedImpl) then) = __$$PausedImplCopyWithImpl<$Res>;
@useResult
$Res call({
 int pending
});



}

/// @nodoc
class __$$PausedImplCopyWithImpl<$Res> extends _$DownloadQueueStateCopyWithImpl<$Res, _$PausedImpl> implements _$$PausedImplCopyWith<$Res> {
  __$$PausedImplCopyWithImpl(_$PausedImpl _value, $Res Function(_$PausedImpl) _then)
      : super(_value, _then);


@pragma('vm:prefer-inline') @override $Res call({Object? pending = null,}) {
  return _then(_$PausedImpl(
null == pending ? _value.pending : pending // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class _$PausedImpl  implements Paused {
  const _$PausedImpl(this.pending);

  

@override final  int pending;

@override
String toString() {
  return 'DownloadQueueState.paused(pending: $pending)';
}


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _$PausedImpl&&(identical(other.pending, pending) || other.pending == pending));
}


@override
int get hashCode => Object.hash(runtimeType,pending);

@JsonKey(ignore: true)
@override
@pragma('vm:prefer-inline')
_$$PausedImplCopyWith<_$PausedImpl> get copyWith => __$$PausedImplCopyWithImpl<_$PausedImpl>(this, _$identity);

@override
@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  stopped,required TResult Function( int pending)  paused,required TResult Function( int pending)  downloading,}) {
  return paused(pending);
}
@override
@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  stopped,TResult? Function( int pending)?  paused,TResult? Function( int pending)?  downloading,}) {
  return paused?.call(pending);
}
@override
@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  stopped,TResult Function( int pending)?  paused,TResult Function( int pending)?  downloading,required TResult orElse(),}) {
  if (paused != null) {
    return paused(pending);
  }
  return orElse();
}
@override
@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( Stopped value)  stopped,required TResult Function( Paused value)  paused,required TResult Function( Downloading value)  downloading,}) {
  return paused(this);
}
@override
@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( Stopped value)?  stopped,TResult? Function( Paused value)?  paused,TResult? Function( Downloading value)?  downloading,}) {
  return paused?.call(this);
}
@override
@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( Stopped value)?  stopped,TResult Function( Paused value)?  paused,TResult Function( Downloading value)?  downloading,required TResult orElse(),}) {
  if (paused != null) {
    return paused(this);
  }
  return orElse();
}

}


abstract class Paused implements DownloadQueueState {
  const factory Paused(final  int pending) = _$PausedImpl;
  

  

 int get pending;
@JsonKey(ignore: true)
_$$PausedImplCopyWith<_$PausedImpl> get copyWith => throw _privateConstructorUsedError;

}

/// @nodoc
abstract class _$$DownloadingImplCopyWith<$Res>  {
  factory _$$DownloadingImplCopyWith(_$DownloadingImpl value, $Res Function(_$DownloadingImpl) then) = __$$DownloadingImplCopyWithImpl<$Res>;
@useResult
$Res call({
 int pending
});



}

/// @nodoc
class __$$DownloadingImplCopyWithImpl<$Res> extends _$DownloadQueueStateCopyWithImpl<$Res, _$DownloadingImpl> implements _$$DownloadingImplCopyWith<$Res> {
  __$$DownloadingImplCopyWithImpl(_$DownloadingImpl _value, $Res Function(_$DownloadingImpl) _then)
      : super(_value, _then);


@pragma('vm:prefer-inline') @override $Res call({Object? pending = null,}) {
  return _then(_$DownloadingImpl(
null == pending ? _value.pending : pending // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class _$DownloadingImpl  implements Downloading {
  const _$DownloadingImpl(this.pending);

  

@override final  int pending;

@override
String toString() {
  return 'DownloadQueueState.downloading(pending: $pending)';
}


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _$DownloadingImpl&&(identical(other.pending, pending) || other.pending == pending));
}


@override
int get hashCode => Object.hash(runtimeType,pending);

@JsonKey(ignore: true)
@override
@pragma('vm:prefer-inline')
_$$DownloadingImplCopyWith<_$DownloadingImpl> get copyWith => __$$DownloadingImplCopyWithImpl<_$DownloadingImpl>(this, _$identity);

@override
@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  stopped,required TResult Function( int pending)  paused,required TResult Function( int pending)  downloading,}) {
  return downloading(pending);
}
@override
@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  stopped,TResult? Function( int pending)?  paused,TResult? Function( int pending)?  downloading,}) {
  return downloading?.call(pending);
}
@override
@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  stopped,TResult Function( int pending)?  paused,TResult Function( int pending)?  downloading,required TResult orElse(),}) {
  if (downloading != null) {
    return downloading(pending);
  }
  return orElse();
}
@override
@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( Stopped value)  stopped,required TResult Function( Paused value)  paused,required TResult Function( Downloading value)  downloading,}) {
  return downloading(this);
}
@override
@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( Stopped value)?  stopped,TResult? Function( Paused value)?  paused,TResult? Function( Downloading value)?  downloading,}) {
  return downloading?.call(this);
}
@override
@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( Stopped value)?  stopped,TResult Function( Paused value)?  paused,TResult Function( Downloading value)?  downloading,required TResult orElse(),}) {
  if (downloading != null) {
    return downloading(this);
  }
  return orElse();
}

}


abstract class Downloading implements DownloadQueueState {
  const factory Downloading(final  int pending) = _$DownloadingImpl;
  

  

 int get pending;
@JsonKey(ignore: true)
_$$DownloadingImplCopyWith<_$DownloadingImpl> get copyWith => throw _privateConstructorUsedError;

}

/// @nodoc
mixin _$MoreScreenState {

 DownloadQueueState get downloadQueueState => throw _privateConstructorUsedError; bool get downloadedOnly => throw _privateConstructorUsedError; bool get incognitoMode => throw _privateConstructorUsedError;







@JsonKey(ignore: true)
$MoreScreenStateCopyWith<MoreScreenState> get copyWith => throw _privateConstructorUsedError;

}

/// @nodoc
abstract class $MoreScreenStateCopyWith<$Res>  {
  factory $MoreScreenStateCopyWith(MoreScreenState value, $Res Function(MoreScreenState) then) = _$MoreScreenStateCopyWithImpl<$Res, MoreScreenState>;
@useResult
$Res call({
 DownloadQueueState downloadQueueState, bool downloadedOnly, bool incognitoMode
});


$DownloadQueueStateCopyWith<$Res> get downloadQueueState;
}

/// @nodoc
class _$MoreScreenStateCopyWithImpl<$Res,$Val extends MoreScreenState> implements $MoreScreenStateCopyWith<$Res> {
  _$MoreScreenStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

@pragma('vm:prefer-inline') @override $Res call({Object? downloadQueueState = null,Object? downloadedOnly = null,Object? incognitoMode = null,}) {
  return _then(_value.copyWith(
downloadQueueState: null == downloadQueueState ? _value.downloadQueueState : downloadQueueState // ignore: cast_nullable_to_non_nullable
as DownloadQueueState,downloadedOnly: null == downloadedOnly ? _value.downloadedOnly : downloadedOnly // ignore: cast_nullable_to_non_nullable
as bool,incognitoMode: null == incognitoMode ? _value.incognitoMode : incognitoMode // ignore: cast_nullable_to_non_nullable
as bool,
  )as $Val);
}
@override
@pragma('vm:prefer-inline')
$DownloadQueueStateCopyWith<$Res> get downloadQueueState {
  
  return $DownloadQueueStateCopyWith<$Res>(_value.downloadQueueState, (value) {
    return _then(_value.copyWith(downloadQueueState: value) as $Val);
  });
}
}


/// @nodoc
abstract class _$$MoreScreenStateImplCopyWith<$Res> implements $MoreScreenStateCopyWith<$Res> {
  factory _$$MoreScreenStateImplCopyWith(_$MoreScreenStateImpl value, $Res Function(_$MoreScreenStateImpl) then) = __$$MoreScreenStateImplCopyWithImpl<$Res>;
@override @useResult
$Res call({
 DownloadQueueState downloadQueueState, bool downloadedOnly, bool incognitoMode
});


@override $DownloadQueueStateCopyWith<$Res> get downloadQueueState;
}

/// @nodoc
class __$$MoreScreenStateImplCopyWithImpl<$Res> extends _$MoreScreenStateCopyWithImpl<$Res, _$MoreScreenStateImpl> implements _$$MoreScreenStateImplCopyWith<$Res> {
  __$$MoreScreenStateImplCopyWithImpl(_$MoreScreenStateImpl _value, $Res Function(_$MoreScreenStateImpl) _then)
      : super(_value, _then);


@pragma('vm:prefer-inline') @override $Res call({Object? downloadQueueState = null,Object? downloadedOnly = null,Object? incognitoMode = null,}) {
  return _then(_$MoreScreenStateImpl(
downloadQueueState: null == downloadQueueState ? _value.downloadQueueState : downloadQueueState // ignore: cast_nullable_to_non_nullable
as DownloadQueueState,downloadedOnly: null == downloadedOnly ? _value.downloadedOnly : downloadedOnly // ignore: cast_nullable_to_non_nullable
as bool,incognitoMode: null == incognitoMode ? _value.incognitoMode : incognitoMode // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc


class _$MoreScreenStateImpl  implements _MoreScreenState {
  const _$MoreScreenStateImpl({this.downloadQueueState = const Stopped(), required this.downloadedOnly, required this.incognitoMode});

  

@override@JsonKey() final  DownloadQueueState downloadQueueState;
@override final  bool downloadedOnly;
@override final  bool incognitoMode;

@override
String toString() {
  return 'MoreScreenState(downloadQueueState: $downloadQueueState, downloadedOnly: $downloadedOnly, incognitoMode: $incognitoMode)';
}


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _$MoreScreenStateImpl&&(identical(other.downloadQueueState, downloadQueueState) || other.downloadQueueState == downloadQueueState)&&(identical(other.downloadedOnly, downloadedOnly) || other.downloadedOnly == downloadedOnly)&&(identical(other.incognitoMode, incognitoMode) || other.incognitoMode == incognitoMode));
}


@override
int get hashCode => Object.hash(runtimeType,downloadQueueState,downloadedOnly,incognitoMode);

@JsonKey(ignore: true)
@override
@pragma('vm:prefer-inline')
_$$MoreScreenStateImplCopyWith<_$MoreScreenStateImpl> get copyWith => __$$MoreScreenStateImplCopyWithImpl<_$MoreScreenStateImpl>(this, _$identity);








}


abstract class _MoreScreenState implements MoreScreenState {
  const factory _MoreScreenState({final  DownloadQueueState downloadQueueState, required final  bool downloadedOnly, required final  bool incognitoMode}) = _$MoreScreenStateImpl;
  

  

@override  DownloadQueueState get downloadQueueState;@override  bool get downloadedOnly;@override  bool get incognitoMode;
@override @JsonKey(ignore: true)
_$$MoreScreenStateImplCopyWith<_$MoreScreenStateImpl> get copyWith => throw _privateConstructorUsedError;

}
