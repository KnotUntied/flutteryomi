import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:flutteryomi/domain/extension/model/extension.dart';

part 'load_result.freezed.dart';

@freezed
sealed class LoadResult with _$LoadResult {
  const factory LoadResult.success({
    required ExtensionInstalled extension,
  }) = LoadResultSuccess;
  const factory LoadResult.untrusted({
    required ExtensionUntrusted extension,
  }) = LoadResultUntrusted;
  const factory LoadResult.error() = LoadResultError;
}
