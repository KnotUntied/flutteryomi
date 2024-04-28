import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:flutteryomi/core/preference/preference.dart';
import 'package:flutteryomi/domain/extension/model/extension.dart';

part 'extension_api.freezed.dart';
part 'extension_api.g.dart';

//TODO, original repo seems to be Android only
class ExtensionApi {
  //Preference<int> lastExtCheck:  by lazy {
  //    preferenceStore.getInt(Preference.appStateKey("last_ext_check"), 0);
  //}

  Future<List<ExtensionAvailable>> findExtensions() async => [];
  //Future<List<ExtensionAvailable>> findExtensions() async {
  //getExtensionRepo.getAll()
  //    .map { async { _getExtensions(it) } }
  //    .awaitAll()
  //    .flatten();
  //}

  //Future<List<ExtensionAvailable>> _getExtensions(ExtensionRepo extRepo) async {
  //  final repoBaseUrl = extRepo.baseUrl;
  //  try {
  //    final response = networkService.client
  //        .newCall(GET("$repoBaseUrl/index.min.json"))
  //        .awaitSuccess();

  //    return with(json) {
  //        response
  //            .parseAs<List<ExtensionJsonObject>>()
  //            .toExtensions(repoBaseUrl)
  //    }
  //  } catch (e) {
  //    logger.e(e, "Failed to get extensions from $repoBaseUrl");
  //    return const [];
  //  }
  //}

  Future<List<ExtensionInstalled>?> checkForUpdates(
      //Context context,
      [
    bool fromAvailableExtensionList = false,
  ]) async {
    // Limit checks to once a day at most
    //if (!fromAvailableExtensionList &&
    //  DateTime.now().millisecondsSinceEpoch < lastExtCheck.get() + 1.days.inWholeMilliseconds;
    //) {
    //  return null;
    //}

    //// Update extension repo details
    //updateExtensionRepo.awaitAll();

    //final extensions = if (fromAvailableExtensionList) {
    //  extensionManager.availableExtensionsStream.value;
    //} else {
    //  await findExtensions().also { lastExtCheck.set(Instant.now().toEpochMilli()) };
    //}

    //final installedExtensions = ExtensionLoader.loadExtensions(context)
    //    .filterIsInstance<LoadResultSuccess>()
    //    .map((it) => it.extension)

    final extensionsWithUpdate = <ExtensionInstalled>[];
    //for (final installedExt in installedExtensions) {
    //  final pkgName = installedExt.pkgName;
    //  final availableExt = extensions.firstWhereOrNull((it) => it.pkgName == pkgName);
    //  if (availableExt == null) continue;
    //  final hasUpdatedVer = availableExt.versionCode > installedExt.versionCode;
    //  final hasUpdatedLib = availableExt.libVersion > installedExt.libVersion;
    //  final hasUpdate = hasUpdatedVer || hasUpdatedLib;
    //  if (hasUpdate) extensionsWithUpdate.add(installedExt);
    //}

    //if (extensionsWithUpdate.isNotEmpty) {
    //  ExtensionUpdateNotifier(context).promptUpdates(extensionsWithUpdate.map((it) => it.name));
    //}

    return extensionsWithUpdate;
  }

  String getApkUrl(ExtensionAvailable extension) =>
      "${extension.repoUrl}/apk/${extension.apkName}";
}

@freezed
class ExtensionJsonObject with _$ExtensionJsonObject {
  const ExtensionJsonObject._();
  const factory ExtensionJsonObject({
    required String name,
    required String pkg,
    required String apk,
    required String lang,
    required int code,
    required String version,
    required int nsfw,
    List<ExtensionSourceJsonObject>? sources,
  }) = _ExtensionJsonObject;

  double extractLibVersion() {
    final lastIndex = version.lastIndexOf('.');
    return double.parse(
      lastIndex == -1 ? version : version.substring(0, lastIndex),
    );
  }

  factory ExtensionJsonObject.fromJson(Map<String, Object?> json) =>
      _$ExtensionJsonObjectFromJson(json);
}

@freezed
class ExtensionSourceJsonObject with _$ExtensionSourceJsonObject {
  const factory ExtensionSourceJsonObject({
    required int id,
    required String lang,
    required String name,
    required String baseUrl,
  }) = _ExtensionSourceJsonObject;

  factory ExtensionSourceJsonObject.fromJson(Map<String, Object?> json) =>
      _$ExtensionSourceJsonObjectFromJson(json);
}

extension _ListExtensionJsonObjectToExtensions on List<ExtensionJsonObject> {
  List<ExtensionAvailable> toExtensions(String repoUrl) =>
      //where((it) {
      //  final libVersion = it.extractLibVersion();
      //  return libVersion >= ExtensionLoader.libVersionMin && libVersion <= ExtensionLoader.libVersionMax;
      //})
      //.map((it) => ExtensionAvailable(
      //  name: it.name.substringAfter("Tachiyomi: "),
      //  pkgName: it.pkg,
      //  versionName: it.version,
      //  versionCode: it.code,
      //  libVersion: it.extractLibVersion(),
      //  lang: it.lang,
      //  isNsfw: it.nsfw == 1,
      //  sources: it.sources?.map(_extensionSourceMapper).toList() ?? [],
      //  apkName: it.apk,
      //  iconUrl: "$repoUrl/icon/${it.pkg}.png",
      //  repoUrl: repoUrl,
      //))
      //.toList();
      const [];

  ExtensionAvailableSource _extensionSourceMapper(
          ExtensionSourceJsonObject it) =>
      ExtensionAvailableSource(
        id: it.id,
        lang: it.lang,
        name: it.name,
        baseUrl: it.baseUrl,
      );
}
