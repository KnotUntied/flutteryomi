import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutteryomi/domain/source/service/source_preferences.dart';
import 'package:flutteryomi/presentation/more/settings/preference.dart';
import 'package:flutteryomi/presentation/more/settings/screen/searchable_settings.dart';

//TODO
class SettingsBrowseScreen extends ConsumerWidget {
  const SettingsBrowseScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final lang = AppLocalizations.of(context);
    final sourcePreferences = ref.watch(sourcePreferencesProvider);
    //final getExtensionRepoCount = ref.watch(getExtensionRepoCountProvider);
    //final reposCount = getExtensionRepoCount.subscribe().get(0);
    return SearchableSettings(
      title: lang.browse,
      getPreferences: () => [
        PreferenceGroup(
          title: lang.label_sources,
          preferenceItems: [
            SwitchPreference(
              pref: sourcePreferences.hideInLibraryItems(),
              title: lang.pref_hide_in_library_items,
            ),
            //TextPreference(
            //  title: lang.label_extension_repos,
            //  subtitle: lang.num_repos(reposCount, reposCount),
            //  onClick: () => Navigator.push(
            //    context,
            //    MaterialPageRoute(
            //      builder: (context) => ExtensionReposScreen(),
            //    ),
            //  ),
            //),
          ],
        ),
        //PreferenceGroup(
        //  title: lang.pref_category_nsfw_content,
        //  preferenceItems: [
        //    //SwitchPreference(
        //    //  pref: sourcePreferences.showNsfwSource(),
        //    //  title: lang.pref_show_nsfw_source,
        //    //  subtitle: lang.requires_app_restart,
        //    //  onValueChanged: (_) async {
        //    //    (context as FragmentActivity).authenticate(
        //    //      title: context.lang.pref_category_nsfw_content,
        //    //    );
        //    //  },
        //    //),
        //    //InfoPreference(title: lang.parental_controls_info),
        //  ],
        //),
      ],
    );
  }
}
