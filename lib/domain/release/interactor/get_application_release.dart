import 'package:collection/collection.dart';
import 'package:equatable/equatable.dart';

import 'package:flutteryomi/core/preference/preference.dart';
import 'package:flutteryomi/core/preference/preference_store.dart';
import 'package:flutteryomi/domain/release/model/release.dart';
import 'package:flutteryomi/domain/release/service/release_service.dart';

class GetApplicationRelease {
  final ReleaseService service;
  final PreferenceStore preferenceStore;
  GetApplicationRelease(this.service, this.preferenceStore);

  late Preference<int> lastChecked = preferenceStore.getInt(
    Preference.appStateKey("last_app_check"),
    defaultValue: 0,
  );

  Future<Result> await_(Arguments arguments) async {
    DateTime now = DateTime.now();

    // Limit checks to once every 3 days at most
    if (
      !arguments.forceCheck
      && now.isBefore(
        DateTime.fromMillisecondsSinceEpoch(lastChecked.get()).add(const Duration(days: 3)),
      )
    ) {
      return NoNewUpdate();
    }

    Release release = await service.latest(arguments.repository);

    lastChecked.set(now.millisecondsSinceEpoch);

    // Check if latest version is different from current version
    bool isNewVersion = _isNewVersion(
      arguments.isPreview,
      arguments.commitCount,
      arguments.versionName,
      release.version,
    );
    if (isNewVersion && arguments.isThirdParty) {
      return ThirdPartyInstallation();
    } else if (isNewVersion) {
      return NewUpdate(release);
    } else {
      return NoNewUpdate();
    }
  }

  bool _isNewVersion(
    bool isPreview,
    int commitCount,
    String versionName,
    String versionTag,
  ) {
    // Removes prefixes like "r" or "v"
    String newVersion = versionTag.replaceAll(RegExp(r"[^\d.]"), "");
    if (isPreview) {
      // Preview builds: based on releases in "tachiyomiorg/tachiyomi-preview" repo
      // tagged as something like "r1234"
      return int.parse(newVersion) > commitCount;
    } else {
      // Release builds: based on releases in "tachiyomiorg/tachiyomi" repo
      // tagged as something like "v0.1.2"
      String oldVersion = versionName.replaceAll(RegExp(r"[^\d.]"), "");
      List<int> newSemVer = newVersion.split(".").map((it) => int.parse(it)).toList();
      List<int> oldSemVer = oldVersion.split(".").map((it) => int.parse(it)).toList();

      for (final (index, i) in oldSemVer.indexed) {
        if (newSemVer[index] > i) {
          return true;
        }
      };
      return false;
    }
  }
}

class Arguments {
  final bool isPreview;
  final bool isThirdParty;
  final int commitCount;
  final String versionName;
  final String repository;
  final bool forceCheck;

  Arguments({
    required this.isPreview,
    required this.isThirdParty,
    required this.commitCount,
    required this.versionName,
    required this.repository,
    this.forceCheck = false,
  });
}

sealed class Result extends Equatable {}

class NewUpdate extends Result {
  final Release release;

  NewUpdate(this.release);

  @override
  List<Object> get props => [release];
}

class NoNewUpdate extends Result {
  @override
  List<Object> get props => [];
}

class OsTooOld extends Result {
  @override
  List<Object> get props => [];
}

class ThirdPartyInstallation extends Result {
  @override
  List<Object> get props => [];
}
