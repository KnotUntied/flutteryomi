import 'package:dartx/dartx.dart';
import 'package:flutteryomi/data/source/update_strategy.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'smanga.freezed.dart';
part 'smanga.g.dart';

@unfreezed
class SManga with _$SManga {
  const SManga._();
  const factory SManga({
    required String url,
    required String title,
    String? artist,
    String? author,
    String? description,
    String? genre,
    @Default(4) int status,
    String? thumbnailUrl,
    @Default(UpdateStrategy.alwaysUpdate) UpdateStrategy updateStrategy,
    @Default(false) bool initialized,
  }) = _SManga;

  List<String>? getGenres() => genre.isNullOrBlank
      ? null
      : genre
          ?.split(', ')
          .map((g) => g.trim())
          .whereNot((g) => g.isBlank)
          .distinct()
          .toList();

  SManga copy() => create()
      ..url = url
      ..title = title
      ..artist = artist
      ..author = author
      ..description = description
      ..genre = genre
      ..status = status
      ..thumbnailUrl = thumbnailUrl
      ..updateStrategy = updateStrategy
      ..initialized = initialized;

  factory SManga.fromJson(Map<String, Object?> json) => _$SMangaFromJson(json);

  static const int unknown = 0;
  static const int ongoing = 1;
  static const int completed = 2;
  static const int licensed = 3;
  static const int publishingFinished = 4;
  static const int cancelled = 5;
  static const int onHiatus = 6;

  static SManga create() => SManga(
    url: '',
    title: '',
    artist: null,
    author: null,
    description: null,
    genre: null,
    status: 0,
    thumbnailUrl: null,
    updateStrategy: UpdateStrategy.alwaysUpdate,
    initialized: false,
  );
}
