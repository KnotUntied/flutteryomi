import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:flutteryomi/domain/base/base_preferences.dart';
import 'package:flutteryomi/domain/manga/interactor/reset_viewer_flags.dart';
import 'package:flutteryomi/presentation/more/onboarding/onboarding.dart';
import 'package:flutteryomi/presentation/more/settings/preference.dart';
import 'package:flutteryomi/presentation/more/settings/screen/advanced/clear_database.dart';
import 'package:flutteryomi/presentation/more/settings/screen/searchable_settings.dart';
import 'package:flutteryomi/presentation/util/time_utils.dart';

//TODO
class SettingsAdvancedScreen extends ConsumerWidget {
  const SettingsAdvancedScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final lang = AppLocalizations.of(context);
    final basePreferences = ref.watch(basePreferencesProvider);
    //final networkPreferences = ref.watch(networkPreferencesProvider);
    return SearchableSettings(
      title: lang.pref_category_advanced,
      getPreferences: () => [
        //TextPreference(
        //  title: lang.pref_dump_crash_logs,
        //  subtitle: lang.pref_dump_crash_logs_summary,
        //  onClick: () => CrashLogUtil(context).dumpLogs(),
        //),
        //SwitchPreference(
        //  pref: networkPreferences.verboseLogging(),
        //  title: lang.pref_verbose_logging,
        //  subtitle: lang.pref_verbose_logging_summary,
        //  onValueChanged: (_) async {
        //    //context.toast(lang.requires_app_restart);
        //    return true;
        //  },
        //),
        //TextPreference(
        //  title: lang.pref_debug_info,
        //  onClick: () => Navigator.push(
        //    context,
        //    MaterialPageRoute(
        //      builder: (context) => const DebugInfoScreen(),
        //    ),
        //  ),
        //),
        TextPreference(
          title: lang.pref_onboarding_guide,
          onClick: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const OnboardingScreen(),
            ),
          ),
        ),
        //TextPreference(
        //  title: lang.pref_manage_notifications,
        //  onClick: () {
            //final intent = Intent(Settings.ACTION_APP_NOTIFICATION_SETTINGS).apply {
            //  putExtra(Settings.EXTRA_APP_PACKAGE, context.packageName)
            //};
            //context.startActivity(intent);
        //  },
        //),
        //_getBackgroundActivityGroup(context),
        _getDataGroup(context, ref),
        //_getNetworkGroup(context, networkPreferences),
        _getLibraryGroup(context, ref),
        //_getReaderGroup(context, basePreferences),
        //_getExtensionsGroup(context, ref, basePreferences),
      ],
    );
  }

  PreferenceGroup _getBackgroundActivityGroup(BuildContext context) {
    final lang = AppLocalizations.of(context);
    return PreferenceGroup(
      title: lang.label_background_activity,
      preferenceItems: [
        TextPreference(
          title: lang.pref_disable_battery_optimization,
          subtitle: lang.pref_disable_battery_optimization_summary,
          onClick: () {
            //final packageName = context.packageName;
            //if (!context.powerManager.isIgnoringBatteryOptimizations(packageName)) {
            //  try {
            //    final intent = Intent().apply {
            //      action = Settings.ACTION_REQUEST_IGNORE_BATTERY_OPTIMIZATIONS
            //      data = "package:$packageName".toUri()
            //      addFlags(Intent.FLAG_ACTIVITY_NEW_TASK)
            //    }
            //    context.startActivity(intent);
            //  } catch (e) {
            //    context.toast(lang.battery_optimization_setting_activity_not_found);
            //  }
            //} else {
            //  context.toast(lang.battery_optimization_disabled);
            //}
          },
        ),
        TextPreference(
          title: "Don't kill my app!",
          subtitle: lang.about_dont_kill_my_app,
          onClick: () async {
            final Uri url = Uri.parse("https://dontkillmyapp.com/");
            if (!await launchUrl(url)) {
              throw Exception('Could not open $url');
            }
          },
        ),
      ],
    );
  }

  PreferenceGroup _getDataGroup(BuildContext context, WidgetRef ref) {
    final lang = AppLocalizations.of(context);
    //final downloadCache = ref.read(downloadCacheProvider);
    return PreferenceGroup(
      title: lang.label_data,
      preferenceItems: [
        //TextPreference(
        //  title: lang.pref_invalidate_download_cache,
        //  subtitle: lang.pref_invalidate_download_cache_summary,
        //  onClick: () {
        //    downloadCache.invalidateCache();
        //    context.toast(lang.download_cache_invalidated);
        //  },
        //),
        TextPreference(
          title: lang.pref_clear_database,
          subtitle: lang.pref_clear_database_summary,
          onClick: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const ClearDatabaseScreen(),
            ),
          ),
        ),
      ],
    );
  }

  //PreferenceGroup _getNetworkGroup(
  //  BuildContext context,
  //  NetworkPreferences networkPreferences,
  //) {
  //  final lang = AppLocalizations.of(context);

  //  return PreferenceGroup(
  //    title: lang.label_network,
  //    preferenceItems: [
  //      TextPreference(
  //        title: lang.pref_clear_cookies,
  //        onClick: () {
  //          networkHelper.cookieJar.removeAll();
  //          context.toast(lang.cookies_cleared);
  //        },
  //      ),
  //      TextPreference(
  //        title: lang.pref_clear_webview_data,
  //        onClick: () {
  //          try {
  //            WebView(context).run {
  //              setDefaultSettings()
  //              clearCache(true)
  //              clearFormData()
  //              clearHistory()
  //              clearSslPreferences()
  //            }
  //            WebStorage.getInstance().deleteAllData();
  //            context.applicationInfo?.dataDir?.let { File("$it/app_webview/").deleteRecursively() };
  //            context.toast(lang.webview_data_deleted);
  //          } catch (e) {
  //            logger.e(e);
  //            context.toast(lang.cache_delete_error);
  //          }
  //        },
  //      ),
  //      ListPreference(
  //        pref: networkPreferences.dohProvider(),
  //        title: lang.pref_dns_over_https,
  //        entries: {
  //          -1: lang.disabled,
  //          PREF_DOH_CLOUDFLARE: "Cloudflare",
  //          PREF_DOH_GOOGLE: "Google",
  //          PREF_DOH_ADGUARD: "AdGuard",
  //          PREF_DOH_QUAD9: "Quad9",
  //          PREF_DOH_ALIDNS: "AliDNS",
  //          PREF_DOH_DNSPOD: "DNSPod",
  //          PREF_DOH_360: "360",
  //          PREF_DOH_QUAD101: "Quad 101",
  //          PREF_DOH_MULLVAD: "Mullvad",
  //          PREF_DOH_CONTROLD: "Control D",
  //          PREF_DOH_NJALLA: "Njalla",
  //          PREF_DOH_SHECAN: "Shecan",
  //        },
  //        onValueChanged: (_) async {
  //          context.toast(lang.requires_app_restart);
  //          return true;
  //        },
  //      ),
  //      EditTextPreference(
  //        pref: userAgentPref,
  //        title: lang.pref_user_agent_string,
  //        onValueChanged: (it) async {
  //          try {
  //            // OkHttp checks for valid values internally
  //            Headers.Builder().add("User-Agent", it);
  //          } catch (_) {
  //            context.toast(lang.error_user_agent_string_invalid);
  //            return false;
  //          }
  //          return true;
  //        },
  //      ),
  //      TextPreference(
  //        title: lang.pref_reset_user_agent_string,
  //        enabled: remember(userAgent) { userAgent != userAgentPref.defaultValue() },
  //        onClick: () {
  //          userAgentPref.delete();
  //          context.toast(lang.requires_app_restart);
  //        },
  //      ),
  //    ],
  //  );
  //}

  PreferenceGroup _getLibraryGroup(BuildContext context, WidgetRef ref) {
    final lang = AppLocalizations.of(context);
    return PreferenceGroup(
      title: lang.label_library,
      preferenceItems: [
        //TextPreference(
        //  title: lang.pref_refresh_library_covers,
        //  onClick: () => MetadataUpdateJob.startNow(context),
        //),
        TextPreference(
          title: lang.pref_reset_viewer_flags,
          subtitle: lang.pref_reset_viewer_flags_summary,
          onClick: () async {
            final success = await ref.read(resetViewerFlagsProvider).await_();
            final message = success
                ? lang.pref_reset_viewer_flags_success
                : lang.pref_reset_viewer_flags_error;
            //context.toast(message);
          },
        ),
      ],
    );
  }

  PreferenceGroup _getReaderGroup(
    BuildContext context,
    BasePreferences basePreferences,
  ) {
    final lang = AppLocalizations.of(context);

    return PreferenceGroup(
      title: lang.pref_category_reader,
      preferenceItems: [
        //TextPreference(
        //  title: lang.pref_display_profile,
        //  subtitle: basePreferences.displayProfile().get(),
        //),
      ],
    );
  }

  PreferenceGroup _getExtensionsGroup(
    BuildContext context,
    WidgetRef ref,
    BasePreferences basePreferences,
  ) {
    final lang = AppLocalizations.of(context);
    //final extensionInstallerPref = basePreferences.extensionInstaller();
    //final trustExtension = ref.read(trustExtensionProvider);

    return PreferenceGroup(
      title: lang.label_extensions,
      preferenceItems: [
        //ListPreference(
        //  pref: extensionInstallerPref,
        //  title: lang.ext_installer_pref,
        //  entries: extensionInstallerPref.entries
        //      .where((it) {
        //        // TODO: allow private option in stable versions once URL handling is more fleshed out
        //        if (isPreviewBuildType || isDevFlavor) {
        //          return true;
        //        } else {
        //          return it != BasePreferences.ExtensionInstaller.PRIVATE;
        //        }
        //      })
        //      .associateWith((it) => it.title)
        //      .toMap(),
        //  // No idea how to even get started with Shizuku :/
        //  onValueChanged: (it) async => true,
        //),
        //TextPreference(
        //  title: lang.ext_revoke_trust,
        //  onClick: {
        //    trustExtension.revokeAll();
        //    context.toast(lang.requires_app_restart);
        //  },
        //),
      ],
    );
  }
}
