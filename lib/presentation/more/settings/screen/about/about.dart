import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:flutteryomi/presentation/components/link_icon.dart';
import 'package:flutteryomi/presentation/icons/custom_icons.dart';
import 'package:flutteryomi/presentation/more/logo_header.dart';
//import 'package:flutteryomi/utils/crash_log.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final lang = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(title: Text(lang.pref_category_about)),
      body: ListView(
        children: [
          const LogoHeader(),
          ListTile(
            title: Text(lang.version),
            // TODO
            subtitle: const Text('placeholder version'),
            onTap: () {
              // Copy app and device info to clipboard
            },
          ),
          ListTile(
            title: Text(lang.check_for_updates),
            onTap: () {
              // TODO
            },
          ),
          ListTile(
            title: Text(lang.whats_new),
            onTap: () {
              // TODO
            },
          ),
          ListTile(
            title: Text(lang.licenses),
            onTap: () => showLicensePage(
              context: context,
              //TODO
              //applicationIcon: ,
              //applicationVersion: ,
            ),
          ),
          ListTile(
            title: Text(lang.privacy_policy),
            onTap: () {
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
  Future<void> _checkVersion() async {}

  String getVersionName() {
    return '';
  }

  String getFormattedBuildTime() {
    return '';
  }
}
