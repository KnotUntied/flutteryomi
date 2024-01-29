import 'package:freezed_annotation/freezed_annotation.dart';

part 'manga_details.freezed.dart';
part 'manga_details.g.dart';

@freezed
class MangaDetails with _$MangaDetails {
  const factory MangaDetails({
    String? title,
    String? author,
    String? artist,
    String? description,
    List<String>? genre,
    int? status,
  }) = _MangaDetails;

  factory MangaDetails.fromJson(Map<String, Object?> json)
      => _$MangaDetailsFromJson(json);
}
