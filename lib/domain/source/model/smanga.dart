import 'package:dartx/dartx.dart';
import 'package:flutteryomi/data/source/update_strategy.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'smanga.freezed.dart';

@freezed
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
          .filterNot((g) => g.isBlank)
          .distinct()
          .toList();

  static const int unknown = 0;
  static const int ongoing = 1;
  static const int completed = 2;
  static const int licensed = 3;
  static const int publishingFinished = 4;
  static const int cancelled = 5;
  static const int onHiatus = 6;
}
