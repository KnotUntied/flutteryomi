import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';

/// Contains information about the latest release.
class Release {
  Release(
    this.version,
    this.info,
    this.releaseLink,
    this.assets,
  );

  final String version;
  final String info;
  final String releaseLink;
  final List<String> assets;

  final DeviceInfoPlugin _deviceInfo = DeviceInfoPlugin();

  /// Get download link of latest release from the assets.
  /// Returns the download link of latest release.
  Future<String> getDownloadLink() async {
    String apkVariant;
    if (Platform.isAndroid) {
      AndroidDeviceInfo androidInfo = await _deviceInfo.androidInfo;
      apkVariant = switch (androidInfo.supportedAbis[0]) {
        "arm64-v8a" => "-arm64-v8a",
        "armeabi-v7a" => "-armeabi-v7a",
        "x86" => "-x86",
        "x86_64" => "-x86_64",
        _ => ""
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

class ReleaseAssets {
  const ReleaseAssets({required this.downloadLink});
  final String downloadLink;
}
