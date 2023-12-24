import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:flutteryomi/domain/source/model/source.dart';

part 'source_with_count.freezed.dart';

@freezed
class SourceWithCount with _$SourceWithCount {
  const SourceWithCount._();
  const factory SourceWithCount({
    required Source source,
    required int count,
  }) = _SourceWithCount;

  int get id => source.id;
  String get name => source.name;
}
