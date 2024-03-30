import 'package:async/async.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:rxdart/rxdart.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:flutteryomi/core/constants.dart';
import 'package:flutteryomi/domain/base/base_preferences.dart';
import 'package:flutteryomi/domain/download/download_manager.dart';
import 'package:flutteryomi/domain/download/model/download.dart';
import 'package:flutteryomi/presentation/category/category.dart';
import 'package:flutteryomi/presentation/download/download_queue.dart';
import 'package:flutteryomi/presentation/icons/custom_icons.dart';
import 'package:flutteryomi/presentation/more/logo_header.dart';
import 'package:flutteryomi/presentation/more/settings/screen/about/about.dart';
import 'package:flutteryomi/presentation/more/settings/widget/switch_preference_widget.dart';
import 'package:flutteryomi/presentation/more/settings/widget/text_preference_widget.dart';
import 'package:flutteryomi/presentation/more/stats/stats.dart';
import 'package:flutteryomi/presentation/screens/loading_screen.dart';

part 'more.freezed.dart';
part 'more.g.dart';

class MoreTab extends ConsumerWidget {
  const MoreTab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final lang = AppLocalizations.of(context);
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
          final downloadQueueState = data.downloadQueueState;
          return ListView(
            children: [
              const LogoHeader(),
              SwitchPreferenceWidget(
                title: lang.label_downloaded_only,
                subtitle: lang.downloaded_only_summary,
                icon: Icons.cloud_off_outlined,
                checked: data.downloadedOnly,
                onCheckedChanged: (it) => preferences.downloadedOnly().set(it),
              ),
              SwitchPreferenceWidget(
                title: lang.pref_incognito_mode,
                subtitle: lang.pref_incognito_mode_summary,
                //CustomIcon.glasses has some artifacts for some reason
                //icon: CustomIcons.glasses,
                icon: CupertinoIcons.eyeglasses,
                checked: data.incognitoMode,
                onCheckedChanged: (it) => preferences.incognitoMode().set(it),
              ),
              const Divider(),
              TextPreferenceWidget(
                title: lang.label_download_queue,
                subtitle: switch (downloadQueueState) {
                  Stopped() => null,
                  Paused() => downloadQueueState.pending == 0
                      ? lang.paused
                      : "${lang.paused} • "
                        "${lang.download_queue_summary(downloadQueueState.pending)}",
                  Downloading() => lang.download_queue_summary(downloadQueueState.pending),
                },
                icon: Icons.get_app_outlined,
                onPreferenceClick: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const DownloadQueueScreen(),
                    ),
                  );
                },
              ),
              TextPreferenceWidget(
                title: lang.categories,
                icon: Icons.label_outlined,
                onPreferenceClick: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CategoryScreen(),
                    ),
                  );
                },
              ),
              TextPreferenceWidget(
                title: lang.label_stats,
                icon: Icons.query_stats_outlined,
                onPreferenceClick: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const StatsScreen(),
                    ),
                  );
                },
              ),
              TextPreferenceWidget(
                title: lang.label_data_storage,
                icon: Icons.storage_outlined,
                onPreferenceClick: () {
                  //Navigator.push(
                  //  context,
                  //  MaterialPageRoute(
                  //    builder: (context) => const SettingsScreen(SettingsScreen.Destination.DataAndStorage),
                  //  ),
                  //);
                },
              ),
              const Divider(),
              TextPreferenceWidget(
                title: lang.label_settings,
                icon: Icons.settings_outlined,
                onPreferenceClick: () {
                  //Navigator.push(
                  //  context,
                  //  MaterialPageRoute(
                  //    builder: (context) => const SettingsScreen(),
                  //  ),
                  //);
                },
              ),
              TextPreferenceWidget(
                title: lang.pref_category_about,
                icon: Icons.info_outlined,
                onPreferenceClick: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AboutScreen(),
                    ),
                  );
                },
              ),
              TextPreferenceWidget(
                title: lang.label_help,
                icon: Icons.help_outline,
                onPreferenceClick: _launchHelpUrl,
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
    return Rx.combineLatest2(
      downloadManager.isDownloaderRunning,
      downloadManager.queueState,
      (isDownloading, downloadQueue) {
        final pendingDownloadExists = downloadQueue.isNotEmpty;
        final DownloadQueueState downloadQueueState;
        if (!pendingDownloadExists) {
          downloadQueueState = const Stopped();
        } else if (!isDownloading) {
          downloadQueueState = Paused(downloadQueue.length);
        } else {
          downloadQueueState = Downloading(downloadQueue.length);
        }
        return MoreScreenState(
          downloadQueueState: downloadQueueState,
          downloadedOnly: downloadedOnly,
          incognitoMode: incognitoMode,
        );
      }
    );
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
