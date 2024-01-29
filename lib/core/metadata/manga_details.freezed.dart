// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'manga_details.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MangaDetails _$MangaDetailsFromJson(Map<String, dynamic> json) {
  return _MangaDetails.fromJson(json);
}

/// @nodoc
mixin _$MangaDetails {
  String? get title => throw _privateConstructorUsedError;
  String? get author => throw _privateConstructorUsedError;
  String? get artist => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  List<String>? get genre => throw _privateConstructorUsedError;
  int? get status => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MangaDetailsCopyWith<MangaDetails> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MangaDetailsCopyWith<$Res> {
  factory $MangaDetailsCopyWith(
          MangaDetails value, $Res Function(MangaDetails) then) =
      _$MangaDetailsCopyWithImpl<$Res, MangaDetails>;
  @useResult
  $Res call(
      {String? title,
      String? author,
      String? artist,
      String? description,
      List<String>? genre,
      int? status});
}

/// @nodoc
class _$MangaDetailsCopyWithImpl<$Res, $Val extends MangaDetails>
    implements $MangaDetailsCopyWith<$Res> {
  _$MangaDetailsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = freezed,
    Object? author = freezed,
    Object? artist = freezed,
    Object? description = freezed,
    Object? genre = freezed,
    Object? status = freezed,
  }) {
    return _then(_value.copyWith(
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      author: freezed == author
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as String?,
      artist: freezed == artist
          ? _value.artist
          : artist // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      genre: freezed == genre
          ? _value.genre
          : genre // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MangaDetailsImplCopyWith<$Res>
    implements $MangaDetailsCopyWith<$Res> {
  factory _$$MangaDetailsImplCopyWith(
          _$MangaDetailsImpl value, $Res Function(_$MangaDetailsImpl) then) =
      __$$MangaDetailsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? title,
      String? author,
      String? artist,
      String? description,
      List<String>? genre,
      int? status});
}

/// @nodoc
class __$$MangaDetailsImplCopyWithImpl<$Res>
    extends _$MangaDetailsCopyWithImpl<$Res, _$MangaDetailsImpl>
    implements _$$MangaDetailsImplCopyWith<$Res> {
  __$$MangaDetailsImplCopyWithImpl(
      _$MangaDetailsImpl _value, $Res Function(_$MangaDetailsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = freezed,
    Object? author = freezed,
    Object? artist = freezed,
    Object? description = freezed,
    Object? genre = freezed,
    Object? status = freezed,
  }) {
    return _then(_$MangaDetailsImpl(
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      author: freezed == author
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as String?,
      artist: freezed == artist
          ? _value.artist
          : artist // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      genre: freezed == genre
          ? _value._genre
          : genre // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MangaDetailsImpl implements _MangaDetails {
  const _$MangaDetailsImpl(
      {this.title,
      this.author,
      this.artist,
      this.description,
      final List<String>? genre,
      this.status})
      : _genre = genre;

  factory _$MangaDetailsImpl.fromJson(Map<String, dynamic> json) =>
      _$$MangaDetailsImplFromJson(json);

  @override
  final String? title;
  @override
  final String? author;
  @override
  final String? artist;
  @override
  final String? description;
  final List<String>? _genre;
  @override
  List<String>? get genre {
    final value = _genre;
    if (value == null) return null;
    if (_genre is EqualUnmodifiableListView) return _genre;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final int? status;

  @override
  String toString() {
    return 'MangaDetails(title: $title, author: $author, artist: $artist, description: $description, genre: $genre, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MangaDetailsImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.author, author) || other.author == author) &&
            (identical(other.artist, artist) || other.artist == artist) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality().equals(other._genre, _genre) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, title, author, artist,
      description, const DeepCollectionEquality().hash(_genre), status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MangaDetailsImplCopyWith<_$MangaDetailsImpl> get copyWith =>
      __$$MangaDetailsImplCopyWithImpl<_$MangaDetailsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MangaDetailsImplToJson(
      this,
    );
  }
}

abstract class _MangaDetails implements MangaDetails {
  const factory _MangaDetails(
      {final String? title,
      final String? author,
      final String? artist,
      final String? description,
      final List<String>? genre,
      final int? status}) = _$MangaDetailsImpl;

  factory _MangaDetails.fromJson(Map<String, dynamic> json) =
      _$MangaDetailsImpl.fromJson;

  @override
  String? get title;
  @override
  String? get author;
  @override
  String? get artist;
  @override
  String? get description;
  @override
  List<String>? get genre;
  @override
  int? get status;
  @override
  @JsonKey(ignore: true)
  _$$MangaDetailsImplCopyWith<_$MangaDetailsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
