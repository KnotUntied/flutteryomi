import 'package:async/async.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutteryomi/core/constants.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:flutteryomi/domain/base/base_preferences.dart';
import 'package:flutteryomi/domain/download/download_manager.dart';
import 'package:flutteryomi/domain/download/model/download.dart';
import 'package:flutteryomi/presentation/category/category.dart';
import 'package:flutteryomi/presentation/download/download_queue.dart';
import 'package:flutteryomi/presentation/icons/custom_icons.dart';
import 'package:flutteryomi/presentation/more/logo_header.dart';
import 'package:flutteryomi/presentation/more/settings/screen/about/about.dart';
import 'package:flutteryomi/presentation/more/stats/stats.dart';
import 'package:flutteryomi/presentation/screens/loading_screen.dart';

part 'more.freezed.dart';
part 'more.g.dart';

class MoreTab extends ConsumerWidget {
  const MoreTab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final lang = AppLocalizations.of(context);
    final screenModel = ref.watch(moreScreenModelProvider.notifier);
    final state = ref.watch(moreScreenModelProvider);
    final preferences = ref.watch(basePreferencesProvider);
    return Scaffold(
      body: state.when(
        loading: () => const LoadingScreen(),
        // TODO: Error handling
        error: (error, stackTrace) {
          debugPrintStack(
            label: error.toString(),
            stackTrace: stackTrace,
          );
          return const LoadingScreen();
        },
        data: (data) {
          return ListView(
            children: [
              const LogoHeader(),
              SwitchListTile.adaptive(
                title: Text(lang.label_downloaded_only),
                subtitle: Text(lang.downloaded_only_summary),
                secondary: const Icon(Icons.cloud_off_outlined),
                value: data.downloadedOnly,
                onChanged: (it) => preferences.downloadedOnly().set(it),
              ),
              SwitchListTile.adaptive(
                secondary: const Icon(CustomIcons.glasses),
                title: Text(lang.pref_incognito_mode),
                subtitle: Text(lang.pref_incognito_mode_summary),
                value: data.incognitoMode,
                onChanged: (it) => preferences.incognitoMode().set(it),
              ),
              const Divider(),
              //TODO
              ListTile(
                leading: const Icon(Icons.download_outlined),
                title: Text(lang.label_download_queue),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const DownloadQueueScreen(),
                    ),
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.label_outlined),
                title: Text(lang.categories),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CategoryScreen(),
                    ),
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.query_stats_outlined),
                title: Text(lang.label_stats),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const StatsScreen(),
                    ),
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.storage_outlined),
                title: Text(lang.label_data_storage),
                onTap: () {
                  //Navigator.push(
                  //  context,
                  //  MaterialPageRoute(
                  //    builder: (context) => const SettingsScreen(SettingsScreen.Destination.DataAndStorage),
                  //  ),
                  //);
                },
              ),
              const Divider(),
              ListTile(
                leading: const Icon(Icons.settings_outlined),
                title: Text(lang.label_settings),
                onTap: () {
                  //Navigator.push(
                  //  context,
                  //  MaterialPageRoute(
                  //    builder: (context) => const SettingsScreen(),
                  //  ),
                  //);
                },
              ),
              ListTile(
                leading: const Icon(Icons.info_outlined),
                title: Text(lang.pref_category_about),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AboutScreen(),
                    ),
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.help_outline),
                title: Text(lang.label_help),
                onTap: _launchHelpUrl,
              ),
            ],
          );
        },
      ),
    );
  }

  Future<void> _launchHelpUrl() async {
    final Uri url = Uri.parse(Constants.urlHelp);
    if (!await launchUrl(url)) {
      throw Exception('Could not open $url');
    }
  }
}



@riverpod
class MoreScreenModel extends _$MoreScreenModel {
  @override
  Stream<MoreScreenState> build() {
    final preferences = ref.watch(basePreferencesProvider);
    final downloadManager = ref.watch(downloadManagerProvider);
    final downloadedOnly = preferences.downloadedOnly().get();
    final incognitoMode = preferences.incognitoMode().get();
    return StreamZip([
      downloadManager.isDownloaderRunning,
      downloadManager.queueState,
    ]).map((e) {
      final isDownloading = e[0] as bool;
      final downloadQueueSize = (e[1] as List<Download>).length;
      final pendingDownloadExists = downloadQueueSize != 0;
      final DownloadQueueState downloadQueueState;
      if (!pendingDownloadExists) {
        downloadQueueState = const Stopped();
      } else if (!isDownloading) {
        downloadQueueState = Paused(downloadQueueSize);
      } else {
        downloadQueueState = Downloading(downloadQueueSize);
      }
      return MoreScreenState(
        downloadQueueState: downloadQueueState,
        downloadedOnly: downloadedOnly,
        incognitoMode: incognitoMode,
      );
    });
  }
}

@freezed
sealed class DownloadQueueState with _$DownloadQueueState {
  const factory DownloadQueueState.stopped() = Stopped;
  const factory DownloadQueueState.paused(int pending) = Paused;
  const factory DownloadQueueState.downloading(int pending) = Downloading;
}

@freezed
class MoreScreenState with _$MoreScreenState {
  const factory MoreScreenState({
    @Default(Stopped()) DownloadQueueState downloadQueueState,
    required bool downloadedOnly,
    required bool incognitoMode,
  }) = _MoreScreenState;
}
