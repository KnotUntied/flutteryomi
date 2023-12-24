//import 'package:flutteryomi/data/drift/data/sources.drift.dart';

import 'package:flutteryomi/domain/source/model/pin.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

//import 'package:flutteryomi/domain/manga/model/manga_cover.dart';

part 'source.freezed.dart';

@freezed
class Source with _$Source {
  const factory Source({
    required int id,
    required String lang,
    required String name,
    required bool supportsLatest,
    required bool isStub,
    @Default(Pins.unpinned) required Pins pin,
    @Default(false) required bool isUsedLast,
  }) = _Source;
}


//extension SourceUtils on Source {
//  String get visualName => lang.isEmpty ? name : '$name (${lang.toUpperCase()})';
//  String key() => isUsedLast ? name : '$name (${lang.toUpperCase()})';
//}
