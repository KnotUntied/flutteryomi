import 'package:freezed_annotation/freezed_annotation.dart';

part 'schapter.freezed.dart';

@freezed
class SChapter with _$SChapter {
  const factory SChapter.def({
    required String url,
    required String name,
    DateTime? dateUpload,
    @Default(-1.0) required double chapterNumber,
    String? scanlator,
  }) = _SChapter;
  factory SChapter({
    required String url,
    required String name,
    DateTime? dateUpload,
    required double chapterNumber,
    String? scanlator,
  }) {
    return _SChapter(
      url: url,
      name: name,
      dateUpload: dateUpload ?? DateTime.fromMillisecondsSinceEpoch(0, isUtc: true),
      chapterNumber: chapterNumber,
      scanlator: scanlator,
    );
  }
}
