import 'package:collection/collection.dart';
import 'package:dartx/dartx_io.dart';
import 'package:flutteryomi/core/util/system/logger.dart';
import 'package:logger/logger.dart';
import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:rxdart/rxdart.dart';

import 'package:flutteryomi/domain/extension/api/extension_api.dart';
import 'package:flutteryomi/domain/extension/model/extension.dart';
import 'package:flutteryomi/domain/extension/model/install_step.dart';
import 'package:flutteryomi/domain/extension/model/load_result.dart';
import 'package:flutteryomi/domain/source/model/stub_source.dart';
import 'package:flutteryomi/domain/source/service/source_preferences.dart';

part 'extension_manager.g.dart';

//TODO
/// Stub until I figure out how to do extensions in Flutter.
///
/// The manager of extensions installed as another apk which extend the available sources. It handles
/// the retrieval of remotely available extensions as well as installing, updating and removing them.
/// To avoid malicious distribution, every extension must be signed and it will only be loaded if its
/// signature is trusted, otherwise the user will be prompted with a warning to trust it before being
/// loaded.
class ExtensionManager {
  ExtensionManager({
    required this.ref,
    required this.preferences,
    //required this.trustExtension,
    required this.logger,
  }) {
    _initExtensions();
    //ExtensionInstallReceiver(InstallationListener()).register(context);
  }

  final Ref ref;
  final SourcePreferences preferences;
  //final TrustExtension trustExtension;
  final Logger logger;

  final _isInitialized = BehaviorSubject.seeded(false);
  ValueStream<bool> get isInitialized => _isInitialized.stream;
  set isInitialized(value) => _isInitialized.add(value);

  // Why is this a circular dependency?
  /// API where all the available extensions can be found.
  final _api = ExtensionApi();

  /// The installer which installs, updates and uninstalls the extensions.
  //final _installer by lazy { ExtensionInstaller(context) };

  //final _iconMap = <String, Drawable>{};

  final _installedExtensionsStream =
      BehaviorSubject.seeded(<ExtensionInstalled>[]);
  ValueStream<List<ExtensionInstalled>> get installedExtensionsStream =>
      _installedExtensionsStream.stream;
  set installedExtensionsStream(value) => _installedExtensionsStream.add(value);

  //var _subLanguagesEnabledOnFirstRun = preferences.enabledLanguages().isSet();

  //Drawable? getAppIconForSource(int sourceId) {
  //  final pkgName = _installedExtensionsStream.value.firstWhereOrNull((ext) => ext.sources.any((it) => it.id == sourceId))?.pkgName;
  //  if (pkgName != null) {
  //    return _iconMap[pkgName] ?? _iconMap.getOrPut(pkgName) {
  //      ExtensionLoader.getExtensionPackageInfoFromPkgName(context, pkgName)!.applicationInfo.loadIcon(context.packageManager);
  //    }
  //  }
  //  return null;
  //}

  final _availableExtensionsStream =
      BehaviorSubject.seeded(<ExtensionAvailable>[]);
  ValueStream<List<ExtensionAvailable>> get availableExtensionsStream =>
      _availableExtensionsStream.stream;
  set availableExtensionsStream(value) => _availableExtensionsStream.add(value);

  Map<int, StubSource> _availableExtensionsSourcesData = {};

  void _setupAvailableExtensionsSourcesDataMap(
      List<ExtensionAvailable> extensions) {
    if (extensions.isEmpty) return;
    _availableExtensionsSourcesData = extensions
        .flatMap((ext) => ext.sources.map((it) => it.toStubSource()))
        .associateBy((it) => it.id);
  }

  StubSource? getSourceData(int id) => _availableExtensionsSourcesData[id];

  final _untrustedExtensionsStream =
      BehaviorSubject.seeded(<ExtensionUntrusted>[]);
  ValueStream<List<ExtensionUntrusted>> get untrustedExtensionsStream =>
      _untrustedExtensionsStream.stream;
  set untrustedExtensionsStream(value) => _untrustedExtensionsStream.add(value);

  /// Loads and registers the installed extensions.
  void _initExtensions() {
    //final extensions = ExtensionLoader.loadExtensions(context);

    //_installedExtensionsStream.value = extensions
    //    .whereType<LoadResultSuccess>()
    //    .map((it) => it.extension);

    //_untrustedExtensionsStream.value = extensions
    //    .whereType<LoadResultUntrusted>()
    //    .map((it) => it.extension);

    _isInitialized.value = true;
  }

  /// Finds the available extensions in the [api] and updates [availableExtensions].
  Future<void> findAvailableExtensions() async {
    List<ExtensionAvailable> extensions;
    try {
      extensions = await _api.findExtensions();
    } catch (e) {
      //logger.e(e);
      //withUIContext { context.toast(lang.extension_api_error) }
      extensions = const [];
    }

    _enableAdditionalSubLanguages(extensions);

    _availableExtensionsStream.value = extensions;
    _updatedInstalledExtensionsStatuses(extensions);
    _setupAvailableExtensionsSourcesDataMap(extensions);
  }

  /// Enables the additional sub-languages in the app first run. This addresses
  /// the issue where users still need to enable some specific languages even when
  /// the device language is inside that major group. As an example, if a user
  /// has a zh device language, the app will also enable zh-Hans and zh-Hant.
  ///
  /// If the user have already changed the enabledLanguages preference value once,
  /// the new languages will not be added to respect the user enabled choices.
  void _enableAdditionalSubLanguages(List<ExtensionAvailable> extensions) {
    //if (_subLanguagesEnabledOnFirstRun || extensions.isEmpty) return;

    // Use the source lang as some aren't present on the extension level.
    final availableLanguages = extensions
        .flatMap((it) => it.sources)
        .distinctBy((it) => it.lang)
        .map((it) => it.lang);

    //final deviceLanguage = Locale.getDefault().language;
    //final defaultLanguages = preferences.enabledLanguages().defaultValue();
    //final languagesToEnable = availableLanguages.where((it) => it != deviceLanguage && it.startsWith(deviceLanguage));

    //preferences.enabledLanguages().set(defaultLanguages + languagesToEnable);
    //_subLanguagesEnabledOnFirstRun = true;
  }

  /// Sets the update field of the installed extensions with the given [availableExtensions].
  void _updatedInstalledExtensionsStatuses(
      List<ExtensionAvailable> availableExtensions) {
    if (availableExtensions.isEmpty) {
      //preferences.extensionUpdatesCount().set(0);
      return;
    }

    final mutInstalledExtensions = _installedExtensionsStream.value;
    bool changed = false;

    mutInstalledExtensions.forEachIndexed((index, installedExt) {
      final pkgName = installedExt.pkgName;
      final availableExt =
          availableExtensions.firstWhereOrNull((it) => it.pkgName == pkgName);

      if (availableExt == null && !installedExt.isObsolete) {
        mutInstalledExtensions[index] = installedExt.copyWith(isObsolete: true);
        changed = true;
      } else if (availableExt != null) {
        final hasUpdate = installedExt.updateExists(
            _availableExtensionsStream.value, availableExt);

        if (installedExt.hasUpdate != hasUpdate) {
          mutInstalledExtensions[index] = installedExt.copyWith(
            hasUpdate: hasUpdate,
            repoUrl: availableExt.repoUrl,
          );
          changed = true;
        } else {
          mutInstalledExtensions[index] = installedExt.copyWith(
            repoUrl: availableExt.repoUrl,
          );
          changed = true;
        }
      }
    });
    if (changed) {
      _installedExtensionsStream.value = mutInstalledExtensions;
    }
    _updatePendingUpdatesCount();
  }

  //TODO
  /// Returns a stream of the installation process for the given extension. It will complete
  /// once the extension is installed or throws an error. The process will be canceled if
  /// unsubscribed before its completion.
  Stream<InstallStep> installExtension(ExtensionAvailable extension) =>
      Stream.value(InstallStep.idle);
  //    _installer.downloadAndInstall(_api.getApkUrl(extension), extension);

  /// Returns a stream of the installation process for the given extension. It will complete
  /// once the extension is updated or throws an error. The process will be canceled if
  /// unsubscribed before its completion.
  Stream<InstallStep> updateExtension(ExtensionInstalled extension) {
    final availableExt = _availableExtensionsStream.value
        .firstWhereOrNull((it) => it.pkgName == extension.pkgName);
    if (availableExt == null) return const Stream.empty();
    return installExtension(availableExt);
  }

  void cancelInstallUpdateExtension(Extension extension) {
    //_installer.cancelInstall(extension.pkgName);
  }

  /// Sets to "installing" status of an extension installation.
  void setInstalling(int downloadId) {
    //_installer.updateInstallStep(downloadId, InstallStep.installing);
  }

  void updateInstallStep(int downloadId, InstallStep step) {
    //_installer.updateInstallStep(downloadId, step);
  }

  /// Uninstalls the extension that matches the given package name.
  void uninstallExtension(Extension extension) {
    //_installer.uninstallApk(extension.pkgName);
  }

  /// Adds the given extension to the list of trusted extensions. It also loads in background the
  /// now trusted extensions.
  void trust(ExtensionUntrusted extension) {
    final untrustedPkgNames =
        _untrustedExtensionsStream.value.map((it) => it.pkgName).toSet();
    if (!untrustedPkgNames.contains(extension.pkgName)) return;

    //trustExtension.trust(extension.pkgName, extension.versionCode, extension.signatureHash);

    final nowTrustedExtensions = _untrustedExtensionsStream.value.where((it) =>
        it.pkgName == extension.pkgName &&
        it.versionCode == extension.versionCode);
    _untrustedExtensionsStream.value -= nowTrustedExtensions;

    //nowTrustedExtensions
    //    .map((extension) async => await ExtensionLoader.loadExtensionFromPkgName(context, extension.pkgName))
    //    .whereType<LoadResultSuccess>()
    //    .forEach((it) => _registerNewExtension(it.extension));
  }

  /// Registers the given extension in this and the source managers.
  void _registerNewExtension(ExtensionInstalled extension) {
    _installedExtensionsStream.value += [extension];
  }

  /// Registers the given updated extension in this and the source managers previously removing
  /// the outdated ones.
  ///
  /// @param extension The extension to be registered.
  void _registerUpdatedExtension(ExtensionInstalled extension) {
    var mutInstalledExtensions = _installedExtensionsStream.value;
    final oldExtension = mutInstalledExtensions
        .firstWhereOrNull((it) => it.pkgName == extension.pkgName);
    if (oldExtension != null) {
      mutInstalledExtensions -= [oldExtension];
    }
    mutInstalledExtensions += [extension];
    _installedExtensionsStream.value = mutInstalledExtensions;
  }

  /// Unregisters the extension in this and the source managers given its package name. Note this
  /// method is called for every uninstalled application in the system.
  void _unregisterExtension(String pkgName) {
    final installedExtension = _installedExtensionsStream.value
        .firstWhereOrNull((it) => it.pkgName == pkgName);
    if (installedExtension != null) {
      _installedExtensionsStream.value -= [installedExtension];
    }
    final untrustedExtension = _untrustedExtensionsStream.value
        .firstWhereOrNull((it) => it.pkgName == pkgName);
    if (untrustedExtension != null) {
      _untrustedExtensionsStream.value -= [untrustedExtension];
    }
  }

  ///// Listener which receives events of the extensions being installed, updated or removed.
  //private inner class InstallationListener : ExtensionInstallReceiver.Listener {

  //    override fun onExtensionInstalled(extension: ExtensionInstalled) {
  //        _registerNewExtension(extension.withUpdateCheck(_availableExtensionsStream.value))
  //        _updatePendingUpdatesCount()
  //    }

  //    override fun onExtensionUpdated(extension: ExtensionInstalled) {
  //        _registerUpdatedExtension(extension.withUpdateCheck(_availableExtensionsStream.value))
  //        _updatePendingUpdatesCount()
  //    }

  //    override fun onExtensionUntrusted(extension: ExtensionUntrusted) {
  //        val installedExtension = _installedExtensionsStream.value
  //            .find { it.pkgName == extension.pkgName }

  //        if (installedExtension != null) {
  //            _installedExtensionsStream.value -= installedExtension
  //        } else {
  //            _untrustedExtensionsStream.value += extension
  //        }
  //    }

  //    override fun onPackageUninstalled(pkgName: String) {
  //        ExtensionLoader.uninstallPrivateExtension(context, pkgName)
  //        _unregisterExtension(pkgName);
  //        _updatePendingUpdatesCount();
  //    }
  //}

  void _updatePendingUpdatesCount() {
    final pendingUpdateCount =
        _installedExtensionsStream.value.count((it) => it.hasUpdate);
    //preferences.extensionUpdatesCount().set(pendingUpdateCount);
    //if (pendingUpdateCount == 0) ExtensionUpdateNotifier(context).dismiss();
  }
}

@riverpod
ExtensionManager extensionManager(ExtensionManagerRef ref) => ExtensionManager(
      ref: ref,
      preferences: ref.watch(sourcePreferencesProvider),
      //trustExtension: ref.watch(trustExtensionProvider),
      logger: ref.watch(loggerProvider),
    );

extension _ExtensionInstalledExtensions on ExtensionInstalled {
  /// Extension method to set the update field of an installed extension.
  ExtensionInstalled withUpdateCheck(
          List<ExtensionAvailable> availableExtensions) =>
      updateExists(availableExtensions) ? copyWith(hasUpdate: true) : this;

  bool updateExists(
    List<ExtensionAvailable> availableExtensions, [
    ExtensionAvailable? availableExtension,
  ]) {
    final availableExt = availableExtension ??
        availableExtensions.firstWhereOrNull((it) => it.pkgName == pkgName);
    if (availableExt == null) return false;

    return (availableExt.versionCode > versionCode ||
        availableExt.libVersion > libVersion);
  }
}
