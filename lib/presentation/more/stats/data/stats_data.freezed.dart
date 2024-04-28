// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'stats_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;


final _privateConstructorUsedError = UnsupportedError('It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$StatsData {


@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( int libraryMangaCount,  int completedMangaCount,  int totalReadDuration)  overview,required TResult Function( int globalUpdateItemCount,  int startedMangaCount,  int localMangaCount)  titles,required TResult Function( int totalChapterCount,  int readChapterCount,  int downloadCount)  chapters,required TResult Function( int trackedTitleCount,  double meanScore,  int trackerCount)  trackers,}) => throw _privateConstructorUsedError;
@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( int libraryMangaCount,  int completedMangaCount,  int totalReadDuration)?  overview,TResult? Function( int globalUpdateItemCount,  int startedMangaCount,  int localMangaCount)?  titles,TResult? Function( int totalChapterCount,  int readChapterCount,  int downloadCount)?  chapters,TResult? Function( int trackedTitleCount,  double meanScore,  int trackerCount)?  trackers,}) => throw _privateConstructorUsedError;
@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( int libraryMangaCount,  int completedMangaCount,  int totalReadDuration)?  overview,TResult Function( int globalUpdateItemCount,  int startedMangaCount,  int localMangaCount)?  titles,TResult Function( int totalChapterCount,  int readChapterCount,  int downloadCount)?  chapters,TResult Function( int trackedTitleCount,  double meanScore,  int trackerCount)?  trackers,required TResult orElse(),}) => throw _privateConstructorUsedError;
@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( Overview value)  overview,required TResult Function( Titles value)  titles,required TResult Function( Chapters value)  chapters,required TResult Function( Trackers value)  trackers,}) => throw _privateConstructorUsedError;
@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( Overview value)?  overview,TResult? Function( Titles value)?  titles,TResult? Function( Chapters value)?  chapters,TResult? Function( Trackers value)?  trackers,}) => throw _privateConstructorUsedError;
@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( Overview value)?  overview,TResult Function( Titles value)?  titles,TResult Function( Chapters value)?  chapters,TResult Function( Trackers value)?  trackers,required TResult orElse(),}) => throw _privateConstructorUsedError;


}

/// @nodoc
abstract class $StatsDataCopyWith<$Res>  {
  factory $StatsDataCopyWith(StatsData value, $Res Function(StatsData) then) = _$StatsDataCopyWithImpl<$Res, StatsData>;



}

/// @nodoc
class _$StatsDataCopyWithImpl<$Res,$Val extends StatsData> implements $StatsDataCopyWith<$Res> {
  _$StatsDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;



}


/// @nodoc
abstract class _$$OverviewImplCopyWith<$Res>  {
  factory _$$OverviewImplCopyWith(_$OverviewImpl value, $Res Function(_$OverviewImpl) then) = __$$OverviewImplCopyWithImpl<$Res>;
@useResult
$Res call({
 int libraryMangaCount, int completedMangaCount, int totalReadDuration
});



}

/// @nodoc
class __$$OverviewImplCopyWithImpl<$Res> extends _$StatsDataCopyWithImpl<$Res, _$OverviewImpl> implements _$$OverviewImplCopyWith<$Res> {
  __$$OverviewImplCopyWithImpl(_$OverviewImpl _value, $Res Function(_$OverviewImpl) _then)
      : super(_value, _then);


@pragma('vm:prefer-inline') @override $Res call({Object? libraryMangaCount = null,Object? completedMangaCount = null,Object? totalReadDuration = null,}) {
  return _then(_$OverviewImpl(
libraryMangaCount: null == libraryMangaCount ? _value.libraryMangaCount : libraryMangaCount // ignore: cast_nullable_to_non_nullable
as int,completedMangaCount: null == completedMangaCount ? _value.completedMangaCount : completedMangaCount // ignore: cast_nullable_to_non_nullable
as int,totalReadDuration: null == totalReadDuration ? _value.totalReadDuration : totalReadDuration // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class _$OverviewImpl  implements Overview {
  const _$OverviewImpl({required this.libraryMangaCount, required this.completedMangaCount, required this.totalReadDuration});

  

@override final  int libraryMangaCount;
@override final  int completedMangaCount;
@override final  int totalReadDuration;

@override
String toString() {
  return 'StatsData.overview(libraryMangaCount: $libraryMangaCount, completedMangaCount: $completedMangaCount, totalReadDuration: $totalReadDuration)';
}


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _$OverviewImpl&&(identical(other.libraryMangaCount, libraryMangaCount) || other.libraryMangaCount == libraryMangaCount)&&(identical(other.completedMangaCount, completedMangaCount) || other.completedMangaCount == completedMangaCount)&&(identical(other.totalReadDuration, totalReadDuration) || other.totalReadDuration == totalReadDuration));
}


@override
int get hashCode => Object.hash(runtimeType,libraryMangaCount,completedMangaCount,totalReadDuration);

@JsonKey(ignore: true)
@override
@pragma('vm:prefer-inline')
_$$OverviewImplCopyWith<_$OverviewImpl> get copyWith => __$$OverviewImplCopyWithImpl<_$OverviewImpl>(this, _$identity);

@override
@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( int libraryMangaCount,  int completedMangaCount,  int totalReadDuration)  overview,required TResult Function( int globalUpdateItemCount,  int startedMangaCount,  int localMangaCount)  titles,required TResult Function( int totalChapterCount,  int readChapterCount,  int downloadCount)  chapters,required TResult Function( int trackedTitleCount,  double meanScore,  int trackerCount)  trackers,}) {
  return overview(libraryMangaCount,completedMangaCount,totalReadDuration);
}
@override
@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( int libraryMangaCount,  int completedMangaCount,  int totalReadDuration)?  overview,TResult? Function( int globalUpdateItemCount,  int startedMangaCount,  int localMangaCount)?  titles,TResult? Function( int totalChapterCount,  int readChapterCount,  int downloadCount)?  chapters,TResult? Function( int trackedTitleCount,  double meanScore,  int trackerCount)?  trackers,}) {
  return overview?.call(libraryMangaCount,completedMangaCount,totalReadDuration);
}
@override
@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( int libraryMangaCount,  int completedMangaCount,  int totalReadDuration)?  overview,TResult Function( int globalUpdateItemCount,  int startedMangaCount,  int localMangaCount)?  titles,TResult Function( int totalChapterCount,  int readChapterCount,  int downloadCount)?  chapters,TResult Function( int trackedTitleCount,  double meanScore,  int trackerCount)?  trackers,required TResult orElse(),}) {
  if (overview != null) {
    return overview(libraryMangaCount,completedMangaCount,totalReadDuration);
  }
  return orElse();
}
@override
@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( Overview value)  overview,required TResult Function( Titles value)  titles,required TResult Function( Chapters value)  chapters,required TResult Function( Trackers value)  trackers,}) {
  return overview(this);
}
@override
@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( Overview value)?  overview,TResult? Function( Titles value)?  titles,TResult? Function( Chapters value)?  chapters,TResult? Function( Trackers value)?  trackers,}) {
  return overview?.call(this);
}
@override
@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( Overview value)?  overview,TResult Function( Titles value)?  titles,TResult Function( Chapters value)?  chapters,TResult Function( Trackers value)?  trackers,required TResult orElse(),}) {
  if (overview != null) {
    return overview(this);
  }
  return orElse();
}

}


abstract class Overview implements StatsData {
  const factory Overview({required final  int libraryMangaCount, required final  int completedMangaCount, required final  int totalReadDuration}) = _$OverviewImpl;
  

  

 int get libraryMangaCount; int get completedMangaCount; int get totalReadDuration;
@JsonKey(ignore: true)
_$$OverviewImplCopyWith<_$OverviewImpl> get copyWith => throw _privateConstructorUsedError;

}

/// @nodoc
abstract class _$$TitlesImplCopyWith<$Res>  {
  factory _$$TitlesImplCopyWith(_$TitlesImpl value, $Res Function(_$TitlesImpl) then) = __$$TitlesImplCopyWithImpl<$Res>;
@useResult
$Res call({
 int globalUpdateItemCount, int startedMangaCount, int localMangaCount
});



}

/// @nodoc
class __$$TitlesImplCopyWithImpl<$Res> extends _$StatsDataCopyWithImpl<$Res, _$TitlesImpl> implements _$$TitlesImplCopyWith<$Res> {
  __$$TitlesImplCopyWithImpl(_$TitlesImpl _value, $Res Function(_$TitlesImpl) _then)
      : super(_value, _then);


@pragma('vm:prefer-inline') @override $Res call({Object? globalUpdateItemCount = null,Object? startedMangaCount = null,Object? localMangaCount = null,}) {
  return _then(_$TitlesImpl(
globalUpdateItemCount: null == globalUpdateItemCount ? _value.globalUpdateItemCount : globalUpdateItemCount // ignore: cast_nullable_to_non_nullable
as int,startedMangaCount: null == startedMangaCount ? _value.startedMangaCount : startedMangaCount // ignore: cast_nullable_to_non_nullable
as int,localMangaCount: null == localMangaCount ? _value.localMangaCount : localMangaCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class _$TitlesImpl  implements Titles {
  const _$TitlesImpl({required this.globalUpdateItemCount, required this.startedMangaCount, required this.localMangaCount});

  

@override final  int globalUpdateItemCount;
@override final  int startedMangaCount;
@override final  int localMangaCount;

@override
String toString() {
  return 'StatsData.titles(globalUpdateItemCount: $globalUpdateItemCount, startedMangaCount: $startedMangaCount, localMangaCount: $localMangaCount)';
}


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _$TitlesImpl&&(identical(other.globalUpdateItemCount, globalUpdateItemCount) || other.globalUpdateItemCount == globalUpdateItemCount)&&(identical(other.startedMangaCount, startedMangaCount) || other.startedMangaCount == startedMangaCount)&&(identical(other.localMangaCount, localMangaCount) || other.localMangaCount == localMangaCount));
}


@override
int get hashCode => Object.hash(runtimeType,globalUpdateItemCount,startedMangaCount,localMangaCount);

@JsonKey(ignore: true)
@override
@pragma('vm:prefer-inline')
_$$TitlesImplCopyWith<_$TitlesImpl> get copyWith => __$$TitlesImplCopyWithImpl<_$TitlesImpl>(this, _$identity);

@override
@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( int libraryMangaCount,  int completedMangaCount,  int totalReadDuration)  overview,required TResult Function( int globalUpdateItemCount,  int startedMangaCount,  int localMangaCount)  titles,required TResult Function( int totalChapterCount,  int readChapterCount,  int downloadCount)  chapters,required TResult Function( int trackedTitleCount,  double meanScore,  int trackerCount)  trackers,}) {
  return titles(globalUpdateItemCount,startedMangaCount,localMangaCount);
}
@override
@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( int libraryMangaCount,  int completedMangaCount,  int totalReadDuration)?  overview,TResult? Function( int globalUpdateItemCount,  int startedMangaCount,  int localMangaCount)?  titles,TResult? Function( int totalChapterCount,  int readChapterCount,  int downloadCount)?  chapters,TResult? Function( int trackedTitleCount,  double meanScore,  int trackerCount)?  trackers,}) {
  return titles?.call(globalUpdateItemCount,startedMangaCount,localMangaCount);
}
@override
@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( int libraryMangaCount,  int completedMangaCount,  int totalReadDuration)?  overview,TResult Function( int globalUpdateItemCount,  int startedMangaCount,  int localMangaCount)?  titles,TResult Function( int totalChapterCount,  int readChapterCount,  int downloadCount)?  chapters,TResult Function( int trackedTitleCount,  double meanScore,  int trackerCount)?  trackers,required TResult orElse(),}) {
  if (titles != null) {
    return titles(globalUpdateItemCount,startedMangaCount,localMangaCount);
  }
  return orElse();
}
@override
@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( Overview value)  overview,required TResult Function( Titles value)  titles,required TResult Function( Chapters value)  chapters,required TResult Function( Trackers value)  trackers,}) {
  return titles(this);
}
@override
@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( Overview value)?  overview,TResult? Function( Titles value)?  titles,TResult? Function( Chapters value)?  chapters,TResult? Function( Trackers value)?  trackers,}) {
  return titles?.call(this);
}
@override
@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( Overview value)?  overview,TResult Function( Titles value)?  titles,TResult Function( Chapters value)?  chapters,TResult Function( Trackers value)?  trackers,required TResult orElse(),}) {
  if (titles != null) {
    return titles(this);
  }
  return orElse();
}

}


abstract class Titles implements StatsData {
  const factory Titles({required final  int globalUpdateItemCount, required final  int startedMangaCount, required final  int localMangaCount}) = _$TitlesImpl;
  

  

 int get globalUpdateItemCount; int get startedMangaCount; int get localMangaCount;
@JsonKey(ignore: true)
_$$TitlesImplCopyWith<_$TitlesImpl> get copyWith => throw _privateConstructorUsedError;

}

/// @nodoc
abstract class _$$ChaptersImplCopyWith<$Res>  {
  factory _$$ChaptersImplCopyWith(_$ChaptersImpl value, $Res Function(_$ChaptersImpl) then) = __$$ChaptersImplCopyWithImpl<$Res>;
@useResult
$Res call({
 int totalChapterCount, int readChapterCount, int downloadCount
});



}

/// @nodoc
class __$$ChaptersImplCopyWithImpl<$Res> extends _$StatsDataCopyWithImpl<$Res, _$ChaptersImpl> implements _$$ChaptersImplCopyWith<$Res> {
  __$$ChaptersImplCopyWithImpl(_$ChaptersImpl _value, $Res Function(_$ChaptersImpl) _then)
      : super(_value, _then);


@pragma('vm:prefer-inline') @override $Res call({Object? totalChapterCount = null,Object? readChapterCount = null,Object? downloadCount = null,}) {
  return _then(_$ChaptersImpl(
totalChapterCount: null == totalChapterCount ? _value.totalChapterCount : totalChapterCount // ignore: cast_nullable_to_non_nullable
as int,readChapterCount: null == readChapterCount ? _value.readChapterCount : readChapterCount // ignore: cast_nullable_to_non_nullable
as int,downloadCount: null == downloadCount ? _value.downloadCount : downloadCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class _$ChaptersImpl  implements Chapters {
  const _$ChaptersImpl({required this.totalChapterCount, required this.readChapterCount, required this.downloadCount});

  

@override final  int totalChapterCount;
@override final  int readChapterCount;
@override final  int downloadCount;

@override
String toString() {
  return 'StatsData.chapters(totalChapterCount: $totalChapterCount, readChapterCount: $readChapterCount, downloadCount: $downloadCount)';
}


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _$ChaptersImpl&&(identical(other.totalChapterCount, totalChapterCount) || other.totalChapterCount == totalChapterCount)&&(identical(other.readChapterCount, readChapterCount) || other.readChapterCount == readChapterCount)&&(identical(other.downloadCount, downloadCount) || other.downloadCount == downloadCount));
}


@override
int get hashCode => Object.hash(runtimeType,totalChapterCount,readChapterCount,downloadCount);

@JsonKey(ignore: true)
@override
@pragma('vm:prefer-inline')
_$$ChaptersImplCopyWith<_$ChaptersImpl> get copyWith => __$$ChaptersImplCopyWithImpl<_$ChaptersImpl>(this, _$identity);

@override
@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( int libraryMangaCount,  int completedMangaCount,  int totalReadDuration)  overview,required TResult Function( int globalUpdateItemCount,  int startedMangaCount,  int localMangaCount)  titles,required TResult Function( int totalChapterCount,  int readChapterCount,  int downloadCount)  chapters,required TResult Function( int trackedTitleCount,  double meanScore,  int trackerCount)  trackers,}) {
  return chapters(totalChapterCount,readChapterCount,downloadCount);
}
@override
@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( int libraryMangaCount,  int completedMangaCount,  int totalReadDuration)?  overview,TResult? Function( int globalUpdateItemCount,  int startedMangaCount,  int localMangaCount)?  titles,TResult? Function( int totalChapterCount,  int readChapterCount,  int downloadCount)?  chapters,TResult? Function( int trackedTitleCount,  double meanScore,  int trackerCount)?  trackers,}) {
  return chapters?.call(totalChapterCount,readChapterCount,downloadCount);
}
@override
@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( int libraryMangaCount,  int completedMangaCount,  int totalReadDuration)?  overview,TResult Function( int globalUpdateItemCount,  int startedMangaCount,  int localMangaCount)?  titles,TResult Function( int totalChapterCount,  int readChapterCount,  int downloadCount)?  chapters,TResult Function( int trackedTitleCount,  double meanScore,  int trackerCount)?  trackers,required TResult orElse(),}) {
  if (chapters != null) {
    return chapters(totalChapterCount,readChapterCount,downloadCount);
  }
  return orElse();
}
@override
@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( Overview value)  overview,required TResult Function( Titles value)  titles,required TResult Function( Chapters value)  chapters,required TResult Function( Trackers value)  trackers,}) {
  return chapters(this);
}
@override
@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( Overview value)?  overview,TResult? Function( Titles value)?  titles,TResult? Function( Chapters value)?  chapters,TResult? Function( Trackers value)?  trackers,}) {
  return chapters?.call(this);
}
@override
@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( Overview value)?  overview,TResult Function( Titles value)?  titles,TResult Function( Chapters value)?  chapters,TResult Function( Trackers value)?  trackers,required TResult orElse(),}) {
  if (chapters != null) {
    return chapters(this);
  }
  return orElse();
}

}


abstract class Chapters implements StatsData {
  const factory Chapters({required final  int totalChapterCount, required final  int readChapterCount, required final  int downloadCount}) = _$ChaptersImpl;
  

  

 int get totalChapterCount; int get readChapterCount; int get downloadCount;
@JsonKey(ignore: true)
_$$ChaptersImplCopyWith<_$ChaptersImpl> get copyWith => throw _privateConstructorUsedError;

}

/// @nodoc
abstract class _$$TrackersImplCopyWith<$Res>  {
  factory _$$TrackersImplCopyWith(_$TrackersImpl value, $Res Function(_$TrackersImpl) then) = __$$TrackersImplCopyWithImpl<$Res>;
@useResult
$Res call({
 int trackedTitleCount, double meanScore, int trackerCount
});



}

/// @nodoc
class __$$TrackersImplCopyWithImpl<$Res> extends _$StatsDataCopyWithImpl<$Res, _$TrackersImpl> implements _$$TrackersImplCopyWith<$Res> {
  __$$TrackersImplCopyWithImpl(_$TrackersImpl _value, $Res Function(_$TrackersImpl) _then)
      : super(_value, _then);


@pragma('vm:prefer-inline') @override $Res call({Object? trackedTitleCount = null,Object? meanScore = null,Object? trackerCount = null,}) {
  return _then(_$TrackersImpl(
trackedTitleCount: null == trackedTitleCount ? _value.trackedTitleCount : trackedTitleCount // ignore: cast_nullable_to_non_nullable
as int,meanScore: null == meanScore ? _value.meanScore : meanScore // ignore: cast_nullable_to_non_nullable
as double,trackerCount: null == trackerCount ? _value.trackerCount : trackerCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class _$TrackersImpl  implements Trackers {
  const _$TrackersImpl({required this.trackedTitleCount, required this.meanScore, required this.trackerCount});

  

@override final  int trackedTitleCount;
@override final  double meanScore;
@override final  int trackerCount;

@override
String toString() {
  return 'StatsData.trackers(trackedTitleCount: $trackedTitleCount, meanScore: $meanScore, trackerCount: $trackerCount)';
}


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _$TrackersImpl&&(identical(other.trackedTitleCount, trackedTitleCount) || other.trackedTitleCount == trackedTitleCount)&&(identical(other.meanScore, meanScore) || other.meanScore == meanScore)&&(identical(other.trackerCount, trackerCount) || other.trackerCount == trackerCount));
}


@override
int get hashCode => Object.hash(runtimeType,trackedTitleCount,meanScore,trackerCount);

@JsonKey(ignore: true)
@override
@pragma('vm:prefer-inline')
_$$TrackersImplCopyWith<_$TrackersImpl> get copyWith => __$$TrackersImplCopyWithImpl<_$TrackersImpl>(this, _$identity);

@override
@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( int libraryMangaCount,  int completedMangaCount,  int totalReadDuration)  overview,required TResult Function( int globalUpdateItemCount,  int startedMangaCount,  int localMangaCount)  titles,required TResult Function( int totalChapterCount,  int readChapterCount,  int downloadCount)  chapters,required TResult Function( int trackedTitleCount,  double meanScore,  int trackerCount)  trackers,}) {
  return trackers(trackedTitleCount,meanScore,trackerCount);
}
@override
@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( int libraryMangaCount,  int completedMangaCount,  int totalReadDuration)?  overview,TResult? Function( int globalUpdateItemCount,  int startedMangaCount,  int localMangaCount)?  titles,TResult? Function( int totalChapterCount,  int readChapterCount,  int downloadCount)?  chapters,TResult? Function( int trackedTitleCount,  double meanScore,  int trackerCount)?  trackers,}) {
  return trackers?.call(trackedTitleCount,meanScore,trackerCount);
}
@override
@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( int libraryMangaCount,  int completedMangaCount,  int totalReadDuration)?  overview,TResult Function( int globalUpdateItemCount,  int startedMangaCount,  int localMangaCount)?  titles,TResult Function( int totalChapterCount,  int readChapterCount,  int downloadCount)?  chapters,TResult Function( int trackedTitleCount,  double meanScore,  int trackerCount)?  trackers,required TResult orElse(),}) {
  if (trackers != null) {
    return trackers(trackedTitleCount,meanScore,trackerCount);
  }
  return orElse();
}
@override
@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( Overview value)  overview,required TResult Function( Titles value)  titles,required TResult Function( Chapters value)  chapters,required TResult Function( Trackers value)  trackers,}) {
  return trackers(this);
}
@override
@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( Overview value)?  overview,TResult? Function( Titles value)?  titles,TResult? Function( Chapters value)?  chapters,TResult? Function( Trackers value)?  trackers,}) {
  return trackers?.call(this);
}
@override
@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( Overview value)?  overview,TResult Function( Titles value)?  titles,TResult Function( Chapters value)?  chapters,TResult Function( Trackers value)?  trackers,required TResult orElse(),}) {
  if (trackers != null) {
    return trackers(this);
  }
  return orElse();
}

}


abstract class Trackers implements StatsData {
  const factory Trackers({required final  int trackedTitleCount, required final  double meanScore, required final  int trackerCount}) = _$TrackersImpl;
  

  

 int get trackedTitleCount; double get meanScore; int get trackerCount;
@JsonKey(ignore: true)
_$$TrackersImplCopyWith<_$TrackersImpl> get copyWith => throw _privateConstructorUsedError;

}
