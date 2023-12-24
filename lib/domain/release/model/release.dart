import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'release.freezed.dart';

/// Contains information about the latest release.
@freezed
class Release with _$Release {
  const Release._();
  const factory Release(
    String version,
    String info,
    String releaseInfo,
    List<String> assets,
  ) = _Release;

  /// Get download link of latest release from the assets.
  /// Returns the download link of latest release.
  Future<String> getDownloadLink() async {
    String apkVariant;
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    if (Platform.isAndroid) {
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      apkVariant = switch (androidInfo.supportedAbis[0]) {
        "arm64-v8a" => "-arm64-v8a",
        "armeabi-v7a" => "-armeabi-v7a",
        "x86" => "-x86",
        "x86_64" => "-x86_64",
        _ => "",
      };
    } else {
      apkVariant = "";
    }

    return assets.firstWhere(
      (it) => it.contains("flutteryomi$apkVariant-"),
      orElse: () => assets[0],
    );
  }
}

@freezed
class ReleaseAssets with _$ReleaseAssets {
  const factory ReleaseAssets({
    required String downloadLink,
  }) = _ReleaseAssets;
}
