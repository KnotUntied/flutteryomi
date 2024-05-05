import 'package:dartx/dartx_io.dart' hide IterableWhereNot;
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:flutteryomi/data/track/tracker.dart';
import 'package:flutteryomi/data/track/tracker_manager.dart';
import 'package:flutteryomi/domain/source/service/source_manager.dart';
import 'package:flutteryomi/domain/track/service/track_preferences.dart';
import 'package:flutteryomi/presentation/components/material/constants.dart';
import 'package:flutteryomi/presentation/more/settings/preference.dart';
import 'package:flutteryomi/presentation/more/settings/screen/searchable_settings.dart';

//TODO
class ISettingsTrackingScreen extends ISearchableSettings {
  const ISettingsTrackingScreen();
  @override
  String getTitle(BuildContext context) =>
      AppLocalizations.of(context).pref_category_tracking;

  @override
  Widget getWidget() => const SettingsTrackingScreen();

  @override
  List<Preference> getPreferences(BuildContext context, WidgetRef ref) {
    final lang = AppLocalizations.of(context);

    final trackPreferences = ref.watch(trackPreferencesProvider);
    final trackerManager = ref.watch(trackerManagerProvider);
    final sourceManager = ref.watch(sourceManagerProvider);

    //final enhancedTrackers = trackerManager.trackers
    //    .whereType<EnhancedTracker>()
    //    .partition((service) {
    //      final acceptedSources = service.getAcceptedSources();
    //      return sourceManager.getCatalogueSources().any((it) => acceptedSources.contains(it.qualifiedName));
    //    })
    String enhancedTrackerInfo = lang.enhanced_tracking_info;
    //if (enhancedTrackers.second.isNotEmpty) {
    //  final missingSourcesInfo = lang.enhanced_services_not_installed(
    //    enhancedTrackers.second.joinToString((it) => it.name),
    //  );
    //  enhancedTrackerInfo += "\n\n$missingSourcesInfo";
    //}

    return [
      SwitchPreference(
        pref: trackPreferences.autoUpdateTrack(),
        title: lang.pref_auto_update_manga_sync,
      ),
      PreferenceGroup(
        title: lang.services,
        preferenceItems: [
          //TrackerPreference(
          //  title: trackerManager.myAnimeList.name,
          //  tracker: trackerManager.myAnimeList,
          //  login: () async {
          //    final Uri url = Uri.parse(MyAnimeListApi.authUrl());
          //    if (!await launchUrl(url)) {
          //      throw Exception('Could not open $url');
          //    }
          //  },
          //  logout: () => showAdaptiveDialog(
          //    context: context,
          //    builder: (context) => _TrackingLogoutDialog(
          //      tracker: trackerManager.myAnimeList,
          //    ),
          //  ),
          //),
          //TrackerPreference(
          //  title: trackerManager.aniList.name,
          //  tracker: trackerManager.aniList,
          //  login: () async {
          //    final Uri url = Uri.parse(AnilistApi.authUrl());
          //    if (!await launchUrl(url)) {
          //      throw Exception('Could not open $url');
          //    }
          //  },
          //  logout: () => showAdaptiveDialog(
          //    context: context,
          //    builder: (context) => _TrackingLogoutDialog(
          //      tracker: trackerManager.aniList,
          //    ),
          //  ),
          //),
          //TrackerPreference(
          //  title: trackerManager.kitsu.name,
          //  tracker: trackerManager.kitsu,
          //  login: () => showAdaptiveDialog(
          //    context: context,
          //    builder: (context) => _TrackingLoginDialog(
          //      tracker: trackerManager.kitsu,
          //      uNameString: lang.email,
          //    ),
          //  ),
          //  logout: () => showAdaptiveDialog(
          //    context: context,
          //    builder: (context) => _TrackingLogoutDialog(
          //      tracker: trackerManager.kitsu,
          //    ),
          //  ),
          //),
          //TrackerPreference(
          //  title: trackerManager.mangaUpdates.name,
          //  tracker: trackerManager.mangaUpdates,
          //  login: () => showAdaptiveDialog(
          //    context: context,
          //    builder: (context) => _TrackingLoginDialog(
          //      tracker: trackerManager.mangaUpdates,
          //      uNameString: lang.username,
          //    ),
          //  ),
          //  logout: () => showAdaptiveDialog(
          //    context: context,
          //    builder: (context) => _TrackingLogoutDialog(
          //      tracker: trackerManager.mangaUpdates,
          //    ),
          //  ),
          //),
          //TrackerPreference(
          //  title: trackerManager.shikimori.name,
          //  tracker: trackerManager.shikimori,
          //  login: () async {
          //    final Uri url = Uri.parse(ShikimoriApi.authUrl());
          //    if (!await launchUrl(url)) {
          //      throw Exception('Could not open $url');
          //    }
          //  },
          //  logout: () => showAdaptiveDialog(
          //    context: context,
          //    builder: (context) => _TrackingLogoutDialog(
          //      tracker: trackerManager.shikimori,
          //    ),
          //  ),
          //),
          //TrackerPreference(
          //  title: trackerManager.bangumi.name,
          //  tracker: trackerManager.bangumi,
          //  login: () async {
          //    final Uri url = Uri.parse(BangumiApi.authUrl());
          //    if (!await launchUrl(url)) {
          //      throw Exception('Could not open $url');
          //    }
          //  },
          //  logout: () => showAdaptiveDialog(
          //    context: context,
          //    builder: (context) => _TrackingLogoutDialog(
          //      tracker: trackerManager.bangumi,
          //    ),
          //  ),
          //),
          InfoPreference(title: lang.tracking_info),
        ],
      ),
      PreferenceGroup(
        title: lang.enhanced_services,
        preferenceItems: [
          //...enhancedTrackers
          //    .first
          //    .map((service) => TrackerPreference(
          //      title: service.name,
          //      tracker: service,
          //      login: () => (service as EnhancedTracker).loginNoop(),
          //      logout: () => service.logout(),
          //    )),
          InfoPreference(title: enhancedTrackerInfo),
        ],
      ),
    ];
  }
}

class SettingsTrackingScreen extends ConsumerWidget {
  const SettingsTrackingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const i = ISettingsTrackingScreen();
    final lang = AppLocalizations.of(context);
    return SearchableSettings(
      title: i.getTitle(context),
      preferences: () => i.getPreferences(context, ref),
      actions: [
        IconButton(
          icon: const Icon(Icons.help_outline_outlined),
          tooltip: lang.tracking_guide,
          onPressed: () async {
            //Point to Mihon for now
            final Uri url = Uri.parse("https://mihon.app/docs/guides/tracking");
            if (!await launchUrl(url)) {
              throw Exception('Could not open $url');
            }
          },
        ),
      ],
    );
  }
}

class _TrackingLoginDialog extends StatefulWidget {
  const _TrackingLoginDialog({
    super.key,
    required this.tracker,
    required this.uNameString,
  });

  final Tracker tracker;
  final String uNameString;

  @override
  State<_TrackingLoginDialog> createState() => _TrackingLoginDialogState();
}

class _TrackingLoginDialogState extends State<_TrackingLoginDialog> {
  late final usernameController = TextEditingController(
    text: widget.tracker.getUsername(),
  );
  late final passwordController = TextEditingController(
    text: widget.tracker.getPassword(),
  );
  bool processing = false;
  bool inputError = false;
  bool hidePassword = true;

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final lang = AppLocalizations.of(context);
    return AlertDialog.adaptive(
      title: Row(
        children: [
          Expanded(
            child: Text(lang.login_title(widget.tracker.name)),
          ),
          IconButton(
            icon: const Icon(Icons.close_outlined),
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
      content: Column(
        children: [
          TextField(
            controller: usernameController,
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              errorText: (inputError && !processing) ? '' : null,
              helperText: lang.information_required_plain,
              labelText: widget.uNameString,
            ),
            textInputAction: TextInputAction.next,
          ),
          const SizedBox(height: 12.0),
          TextField(
            controller: passwordController,
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              errorText: (inputError && !processing) ? '' : null,
              helperText: lang.information_required_plain,
              labelText: lang.password,
              suffixIcon: IconButton(
                icon: Icon(
                  hidePassword ? Icons.visibility : Icons.visibility_off,
                ),
                onPressed: () => setState(() => hidePassword = !hidePassword),
              ),
            ),
            obscureText: !hidePassword,
          ),
        ],
      ),
      actions: [
        FilledButton(
          onPressed: (!processing && usernameController.text.isNotBlank && passwordController.text.isNotBlank)
              ? () async {
                  setState(() => processing = true);
                  final result = await _checkLogin(
                    context,
                    tracker: widget.tracker,
                    username: usernameController.text,
                    password: passwordController.text,
                  );
                  setState(() => inputError = !result);
                  if (result && context.mounted) Navigator.pop(context);
                  setState(() => processing = false);
                }
              : null,
          child: Text(processing ? lang.loading : lang.login),
        ),
      ],
    );
  }
}

Future<bool> _checkLogin(
  BuildContext context, {
  required Tracker tracker,
  required String username,
  required String password,
}) async {
  final lang = AppLocalizations.of(context);
  try {
    await tracker.login(username, password);
    if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(lang.login_success),
        ),
      );
    }
    return true;
  } catch (e) {
    tracker.logout();
    if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.toString()),
        ),
      );
    }
    return false;
  }
}

class _TrackingLogoutDialog extends StatelessWidget {
  const _TrackingLogoutDialog({super.key, required this.tracker});

  final Tracker tracker;

  @override
  Widget build(BuildContext context) {
    final lang = AppLocalizations.of(context);
    return AlertDialog.adaptive(
      title: Text(
        lang.logout_title(tracker.name),
        textAlign: TextAlign.center,
      ),
      actions: [
        OutlinedButton(
          child: Text(lang.action_cancel),
          onPressed: () => Navigator.pop(context),
        ),
        const SizedBox(width: MaterialPadding.extraSmall),
        FilledButton(
          onPressed: () {
            Navigator.pop(context);
            tracker.logout();
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(lang.logout_success),
              ),
            );
          },
          style: FilledButton.styleFrom(
            backgroundColor: Theme.of(context).colorScheme.error,
            foregroundColor: Theme.of(context).colorScheme.onError,
          ),
          child: Text(lang.action_ok),
        ),
      ],
    );
  }
}
