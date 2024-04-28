import 'package:flutter/widgets.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:flutteryomi/domain/source/model/stub_source.dart';
import 'package:flutteryomi/source/api/source.dart';

part 'extension.freezed.dart';

@freezed
class ExtensionAvailableSource with _$ExtensionAvailableSource {
  const ExtensionAvailableSource._();
  const factory ExtensionAvailableSource({
    required int id,
    required String lang,
    required String name,
    required String baseUrl,
  }) = _ExtensionAvailableSource;

  StubSource toStubSource() => StubSource(
        id: id,
        lang: lang,
        name: name,
      );
}

@freezed
sealed class Extension with _$Extension {
  const factory Extension.installed({
    required String name,
    required String pkgName,
    required String versionName,
    required int versionCode,
    required double libVersion,
    required String lang,
    required bool isNsfw,
    String? pkgFactory,
    required List<Source> sources,
    // Supposed to be an Android drawable but I'm not sure yet
    Image? icon,
    @Default(false) bool hasUpdate,
    @Default(false) bool isObsolete,
    required bool isShared,
    String? repoUrl,
  }) = ExtensionInstalled;

  const factory Extension.available({
    required String name,
    required String pkgName,
    required String versionName,
    required int versionCode,
    required double libVersion,
    required String lang,
    required bool isNsfw,
    required List<ExtensionAvailableSource> sources,
    required String apkName,
    required String iconUrl,
    required String repoUrl,
  }) = ExtensionAvailable;

  const factory Extension.untrusted({
    required String name,
    required String pkgName,
    required String versionName,
    required int versionCode,
    required double libVersion,
    required String signatureHash,
    String? lang,
    @Default(false) bool isNsfw,
  }) = ExtensionUntrusted;
}
