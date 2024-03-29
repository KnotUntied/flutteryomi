import 'package:flutteryomi/domain/source/model/pin.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'domain_source.freezed.dart';

@freezed
class Source with _$Source {
  const Source._();
  const factory Source({
    required int id,
    required String lang,
    required String name,
    required bool supportsLatest,
    required bool isStub,
    @Default(Pins.unpinned) Pins pin,
    @Default(false) bool isUsedLast,
  }) = _Source;

  String get visualName => lang.isEmpty ? name : '$name (${lang.toUpperCase()})';
  String key() => isUsedLast ? name : '$name (${lang.toUpperCase()})';
}
