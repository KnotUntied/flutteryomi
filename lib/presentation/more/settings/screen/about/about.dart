import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:flutteryomi/presentation/components/link_icon.dart';
import 'package:flutteryomi/presentation/icons/custom_icons.dart';
import 'package:flutteryomi/presentation/more/logo_header.dart';
import 'package:flutteryomi/presentation/more/settings/widget/text_preference_widget.dart';
//import 'package:flutteryomi/utils/crash_log.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final lang = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(lang.pref_category_about),
      ),
      body: ListView(
        children: [
          const LogoHeader(),
          TextPreferenceWidget(
            title: lang.version,
            subtitle: getVersionName(withBuildDate: true),
            onPreferenceClick: () {
              // Copy app and device info to clipboard
            },
          ),
          TextPreferenceWidget(
            title: lang.check_for_updates,
            onPreferenceClick: () {
              // TODO
            },
          ),
          TextPreferenceWidget(
            title: lang.whats_new,
            onPreferenceClick: () {
              // TODO
            },
          ),
          TextPreferenceWidget(
            title: lang.licenses,
            onPreferenceClick: () => showLicensePage(
              context: context,
              //TODO
              //applicationIcon: ,
              //applicationVersion: ,
            ),
          ),
          TextPreferenceWidget(
            title: lang.privacy_policy,
            onPreferenceClick: () {
              // TODO
            },
          ),
          const ListTile(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <LinkIcon>[
                //LinkIcon(
                //  label: lang.website,
                //  icon: Icons.public_outlined,
                //  url: "https://github.com/knotuntied/flutteryomi",
                //),
                //LinkIcon(
                //  label: "Discord",
                //  icon: CustomIcons.discord,
                //  url: "https://github.com/knotuntied/flutteryomi",
                //),
                //LinkIcon(
                //  label: "X",
                //  icon: CustomIcons.twitter,
                //  url: "https://github.com/knotuntied/flutteryomi",
                //),
                //LinkIcon(
                //  label: "Facebook",
                //  icon: CustomIcons.facebook,
                //  url: "https://github.com/knotuntied/flutteryomi",
                //),
                //LinkIcon(
                //  label: "Reddit",
                //  icon: CustomIcons.reddit,
                //  url: "https://github.com/knotuntied/flutteryomi",
                //),
                LinkIcon(
                  label: "GitHub",
                  icon: CustomIcons.github,
                  url: "https://github.com/knotuntied/flutteryomi",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // TODO
  /// Checks version and shows a user prompt if an update is available.
  Future<void> _checkVersion() async {}

  //TODO: package_info_plus
  static String getVersionName({required bool withBuildDate}) {
    return '';
  }

  static String getFormattedBuildTime() {
    return '';
  }
}
