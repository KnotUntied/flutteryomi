import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:flutteryomi/domain/source/model/stub_source.dart';

//part 'extension_manager.g.dart';

//TODO
///// Stub until I figure out how to do extensions in Flutter
/////
///// The manager of extensions installed as another apk which extend the available sources. It handles
///// the retrieval of remotely available extensions as well as installing, updating and removing them.
///// To avoid malicious distribution, every extension must be signed and it will only be loaded if its
///// signature is trusted, otherwise the user will be prompted with a warning to trust it before being
///// loaded.
//class ExtensionManager {
//  final _isInitialized = MutableStateFlow(false);
//  val isInitialized: StateFlow<bool> = _isInitialized.asStateFlow();

//  /// API where all the available extensions can be found.
//  private val api = ExtensionApi();

//  /// The installer which installs, updates and uninstalls the extensions.
//  private val installer by lazy { ExtensionInstaller(context) }

//  final _iconMap = mutableMapOf<String, Drawable>();

//  final _installedExtensionsStream = MutableStateFlow(emptyList<Extension.Installed>());
//  final installedExtensionsStream = _installedExtensionsStream.asStateFlow();

//  var _subLanguagesEnabledOnFirstRun = preferences.enabledLanguages().isSet();

//  Drawable? getAppIconForSource(int sourceId) {
//    final pkgName = _installedExtensionsStream.value.find { ext -> ext.sources.any { it.id == sourceId } }?.pkgName;
//    if (pkgName != null) {
//      return _iconMap[pkgName] ?? _iconMap.getOrPut(pkgName) {
//          ExtensionLoader.getExtensionPackageInfoFromPkgName(context, pkgName)!!.applicationInfo
//              .loadIcon(context.packageManager)
//      }
//    }
//    return null;
//  }

//  final _availableExtensionsStream = MutableStateFlow(emptyList<Extension.Available>());
//  final availableExtensionsStream = _availableExtensionsStream.asStateFlow();

//  Map<int, StubSource> _availableExtensionsSourcesData = emptyMap()

//  private fun setupAvailableExtensionsSourcesDataMap(extensions: List<Extension.Available>) {
//      if (extensions.isEmpty()) return
//      _availableExtensionsSourcesData = extensions
//          .flatMap { ext -> ext.sources.map { it.toStubSource() } }
//          .associateBy { it.id }
//  }

//  StubSource getSourceData(int id) => _availableExtensionsSourcesData[id];

//  private val _untrustedExtensionsFlow = MutableStateFlow(emptyList<Extension.Untrusted>())
//  val untrustedExtensionsFlow = _untrustedExtensionsFlow.asStateFlow()

//  init {
//      _initExtensions()
//      ExtensionInstallReceiver(InstallationListener()).register(context)
//  }

//  /// Loads and registers the installed extensions.
//  void _initExtensions() {
//    val extensions = ExtensionLoader.loadExtensions(context)

//    _installedExtensionsStream.value = extensions
//        .filterIsInstance<LoadResult.Success>()
//        .map { it.extension }

//    _untrustedExtensionsFlow.value = extensions
//        .filterIsInstance<LoadResult.Untrusted>()
//        .map { it.extension }

//    _isInitialized.value = true;
//  }

//  /// Finds the available extensions in the [api] and updates [availableExtensions].
//  suspend fun findAvailableExtensions() {
//    val extensions: List<Extension.Available> = try {
//        api.findExtensions()
//    } catch (e: Exception) {
//        logcat(LogPriority.ERROR, e)
//        withUIContext { context.toast(MR.strings.extension_api_error) }
//        emptyList()
//    }

//    _enableAdditionalSubLanguages(extensions);

//    _availableExtensionsStream.value = extensions;
//    _updatedInstalledExtensionsStatuses(extensions);
//    setupAvailableExtensionsSourcesDataMap(extensions);
//  }

//  /// Enables the additional sub-languages in the app first run. This addresses
//  /// the issue where users still need to enable some specific languages even when
//  /// the device language is inside that major group. As an example, if a user
//  /// has a zh device language, the app will also enable zh-Hans and zh-Hant.
//  ///
//  /// If the user have already changed the enabledLanguages preference value once,
//  /// the new languages will not be added to respect the user enabled choices.
//  void _enableAdditionalSubLanguages(List<Extension.Available> extensions) {
//    if (_subLanguagesEnabledOnFirstRun || extensions.isEmpty) return;

//    // Use the source lang as some aren't present on the extension level.
//    final availableLanguages = extensions
//        .flatMap(Extension.Available::sources)
//        .distinctBy(Extension.Available.Source::lang)
//        .map(Extension.Available.Source::lang)

//    final deviceLanguage = Locale.getDefault().language
//    final defaultLanguages = preferences.enabledLanguages().defaultValue()
//    final languagesToEnable = availableLanguages.filter {
//        it != deviceLanguage && it.startsWith(deviceLanguage)
//    }

//    preferences.enabledLanguages().set(defaultLanguages + languagesToEnable);
//    _subLanguagesEnabledOnFirstRun = true;
//  }

//  /// Sets the update field of the installed extensions with the given [availableExtensions].
//  ///
//  /// @param availableExtensions The list of extensions given by the [api].
//  void _updatedInstalledExtensionsStatuses(List<Extension.Available> availableExtensions) {
//    if (availableExtensions.isEmpty) {
//      preferences.extensionUpdatesCount().set(0);
//      return;
//    }

//    val mutInstalledExtensions = _installedExtensionsStream.value.toMutableList()
//    var changed = false

//    for ((index, installedExt) in mutInstalledExtensions.withIndex()) {
//        val pkgName = installedExt.pkgName
//        val availableExt = availableExtensions.find { it.pkgName == pkgName }

//        if (availableExt == null && !installedExt.isObsolete) {
//            mutInstalledExtensions[index] = installedExt.copy(isObsolete = true)
//            changed = true
//        } else if (availableExt != null) {
//            val hasUpdate = installedExt.updateExists(availableExt)

//            if (installedExt.hasUpdate != hasUpdate) {
//                mutInstalledExtensions[index] = installedExt.copy(
//                    hasUpdate = hasUpdate,
//                    repoUrl = availableExt.repoUrl,
//                )
//                changed = true
//            } else {
//                mutInstalledExtensions[index] = installedExt.copy(
//                    repoUrl = availableExt.repoUrl,
//                )
//                changed = true
//            }
//        }
//    }
//    if (changed) {
//      _installedExtensionsStream.value = mutInstalledExtensions;
//    }
//    _updatePendingUpdatesCount();
//  }

//  /// Returns a stream of the installation process for the given extension. It will complete
//  /// once the extension is installed or throws an error. The process will be canceled if
//  /// unsubscribed before its completion.
//  Stream<InstallStep> installExtension(Extension.Available extension) =>
//      installer.downloadAndInstall(api.getApkUrl(extension), extension)

//  /// Returns a stream of the installation process for the given extension. It will complete
//  /// once the extension is updated or throws an error. The process will be canceled if
//  /// unsubscribed before its completion.
//  Stream<InstallStep> updateExtension(Extension.Installed extension) {
//    final availableExt = _availableExtensionsStream.value.find { it.pkgName == extension.pkgName }
//        ?? return const Stream.empty();
//    return installExtension(availableExt);
//  }

//  void cancelInstallUpdateExtension(Extension extension) {
//    installer.cancelInstall(extension.pkgName);
//  }

//  /// Sets to "installing" status of an extension installation.
//  ///
//  /// @param downloadId The id of the download.
//  void setInstalling(int downloadId) {
//    installer.updateInstallStep(downloadId, InstallStep.Installing);
//  }

//  void updateInstallStep(int downloadId, InstallStep step) {
//    installer.updateInstallStep(downloadId, step);
//  }

//  /// Uninstalls the extension that matches the given package name.
//  void uninstallExtension(Extension extension) {
//    installer.uninstallApk(extension.pkgName);
//  }

//  /// Adds the given extension to the list of trusted extensions. It also loads in background the
//  /// now trusted extensions.
//  void trust(Extension.Untrusted extension) {
//    final untrustedPkgNames = _untrustedExtensionsFlow.value.map((it) => it.pkgName).toSet();
//    if (extension.pkgName !in untrustedPkgNames) return;

//    trustExtension.trust(extension.pkgName, extension.versionCode, extension.signatureHash);

//    final nowTrustedExtensions = _untrustedExtensionsFlow.value
//        .where((it) => it.pkgName == extension.pkgName && it.versionCode == extension.versionCode);
//    _untrustedExtensionsFlow.value -= nowTrustedExtensions

//    launchNow {
//      nowTrustedExtensions
//          .map { extension ->
//              async { ExtensionLoader.loadExtensionFromPkgName(context, extension.pkgName) }.await()
//          }
//          .filterIsInstance<LoadResult.Success>()
//          .forEach((it) => _registerNewExtension(it.extension));
//    }
//  }

//  /// Registers the given extension in this and the source managers.
//  void _registerNewExtension(Extension.Installed extension) {
//    _installedExtensionsStream.value += extension;
//  }

//  /// Registers the given updated extension in this and the source managers previously removing
//  /// the outdated ones.
//  ///
//  /// @param extension The extension to be registered.
//  void _registerUpdatedExtension(Extension.Installed extension) {
//    final mutInstalledExtensions = _installedExtensionsStream.value.toMutableList();
//    final oldExtension = mutInstalledExtensions.find((it) => it.pkgName == extension.pkgName);
//    if (oldExtension != null) {
//      mutInstalledExtensions -= oldExtension;
//    }
//    mutInstalledExtensions += extension;
//    _installedExtensionsStream.value = mutInstalledExtensions;
//  }

//  /// Unregisters the extension in this and the source managers given its package name. Note this
//  /// method is called for every uninstalled application in the system.
//  void _unregisterExtension(String pkgName) {
//    final installedExtension = _installedExtensionsStream.value.find((it) => it.pkgName == pkgName);
//    if (installedExtension != null) {
//      _installedExtensionsStream.value -= installedExtension;
//    }
//    final untrustedExtension = _untrustedExtensionsFlow.value.find((it) => it.pkgName == pkgName);
//    if (untrustedExtension != null) {
//      _untrustedExtensionsFlow.value -= untrustedExtension;
//    }
//  }

//  ///// Listener which receives events of the extensions being installed, updated or removed.
//  //private inner class InstallationListener : ExtensionInstallReceiver.Listener {

//  //    override fun onExtensionInstalled(extension: Extension.Installed) {
//  //        _registerNewExtension(extension.withUpdateCheck())
//  //        _updatePendingUpdatesCount()
//  //    }

//  //    override fun onExtensionUpdated(extension: Extension.Installed) {
//  //        _registerUpdatedExtension(extension.withUpdateCheck())
//  //        _updatePendingUpdatesCount()
//  //    }

//  //    override fun onExtensionUntrusted(extension: Extension.Untrusted) {
//  //        val installedExtension = _installedExtensionsStream.value
//  //            .find { it.pkgName == extension.pkgName }

//  //        if (installedExtension != null) {
//  //            _installedExtensionsStream.value -= installedExtension
//  //        } else {
//  //            _untrustedExtensionsFlow.value += extension
//  //        }
//  //    }

//  //    override fun onPackageUninstalled(pkgName: String) {
//  //        ExtensionLoader.uninstallPrivateExtension(context, pkgName)
//  //        _unregisterExtension(pkgName);
//  //        _updatePendingUpdatesCount();
//  //    }
//  //}

//  ///// Extension method to set the update field of an installed extension.
//  //private fun Extension.Installed.withUpdateCheck(): Extension.Installed {
//  //    return if (updateExists()) {
//  //        copy(hasUpdate = true)
//  //    } else {
//  //        this
//  //    }
//  //}

//  //private fun Extension.Installed.updateExists(availableExtension: Extension.Available? = null): Boolean {
//  //    val availableExt = availableExtension ?: _availableExtensionsStream.value.find { it.pkgName == pkgName }
//  //        ?: return false

//  //    return (availableExt.versionCode > versionCode || availableExt.libVersion > libVersion)
//  //}

//  void _updatePendingUpdatesCount() {
//    //final pendingUpdateCount = _installedExtensionsStream.value.count((it) => it.hasUpdate);
//    //preferences.extensionUpdatesCount().set(pendingUpdateCount)
//    //if (pendingUpdateCount == 0) ExtensionUpdateNotifier(context).dismiss();
//  }
//}

//// Override this in the main method
//@riverpod
//ExtensionManager extensionManager(ExtensionManagerRef ref) =>
//    throw UnimplementedError();
