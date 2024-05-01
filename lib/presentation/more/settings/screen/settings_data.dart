import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:flutteryomi/domain/backup/service/backup_preferences.dart';
import 'package:flutteryomi/domain/storage/service/storage_preferences.dart';
import 'package:flutteryomi/presentation/more/settings/preference.dart';
import 'package:flutteryomi/presentation/more/settings/screen/searchable_settings.dart';
import 'package:flutteryomi/presentation/more/settings/widget/base_preference_widget.dart';
import 'package:flutteryomi/presentation/util/time_utils.dart';

//TODO
class SettingsDataScreen extends ConsumerWidget {
  const SettingsDataScreen({super.key});

  // Temporarily point to Mihon
  static const helpUrl = "https://mihon.app/docs/faq/storage";

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final lang = AppLocalizations.of(context);
    return SearchableSettings(
      title: lang.label_data_storage,
      getPreferences: () {
        final backupPreferences = ref.read(backupPreferencesProvider);
        final storagePreferences = ref.read(storagePreferencesProvider);

        return [
          _getStorageLocationPref(context, storagePreferences),
          InfoPreference(title: lang.pref_storage_location_info),
          _getBackupAndRestoreGroup(context, backupPreferences),
          _getDataGroup(context),
        ];
      },
      actions: [
        IconButton(
          icon: const Icon(Icons.help_outline_outlined),
          tooltip: lang.tracking_guide,
          onPressed: () async {
            final Uri url = Uri.parse(helpUrl);
            if (!await launchUrl(url)) {
              throw Exception('Could not open $url');
            }
          },
        ),
      ],
    );
  }

  TextPreference _getStorageLocationPref(
    BuildContext context,
    StoragePreferences storagePreferences,
  ) {
    final lang = AppLocalizations.of(context);
    //final pickStorageLocation = storageLocationPicker(storagePreferences.baseStorageDirectory());

    return TextPreference(
      title: lang.pref_storage_location,
      //subtitle: storageLocationText(storagePreferences.baseStorageDirectory()),
      onClick: () {
        try {
          //pickStorageLocation.launch(null);
        } catch (e) {
          //context.toast(lang.file_picker_error);
        }
      },
    );
  }

  PreferenceGroup _getBackupAndRestoreGroup(
    BuildContext context,
    BackupPreferences backupPreferences,
  ) {
    final lang = AppLocalizations.of(context);
    final lastAutoBackup = backupPreferences.lastAutoBackupTimestamp().get();

    //final chooseBackup = rememberLauncherForActivityResult(
    //    object : ActivityResultContracts.GetContent() {
    //        override fun createIntent(context: Context, input: String): Intent {
    //            val intent = super.createIntent(context, input)
    //            return Intent.createChooser(intent, context.stringResource(lang.file_select_backup))
    //        }
    //    },
    //) {
    //  if (it == null) {
    //      context.toast(lang.file_null_uri_error)
    //      return@rememberLauncherForActivityResult
    //  }

    //  Navigator.push(context, RestoreBackupScreen(it.toString()));
    //}

    return PreferenceGroup(
      title: lang.label_backup,
      preferenceItems: [
        // Manual actions
        CustomPreference(
          title: 'restorePreferenceKeyString',
          //title: restorePreferenceKeyString,
          content: BasePreferenceWidget(
            subcomponent: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: prefsHorizontalPadding,
              ),
              child: SegmentedButton(
                segments: [
                  ButtonSegment(
                    value: null,
                    label: Text(lang.pref_create_backup),
                  ),
                  ButtonSegment(
                    value: null,
                    label: Text(lang.pref_restore_backup),
                  ),
                ],
                selected: const {},
              ),
            ),
            //subcomponent: MultiChoiceSegmentedButtonRow(
            //    modifier = Modifier
            //        .fillMaxWidth()
            //        .height(intrinsicSize = IntrinsicSize.Min)
            //        .padding(horizontal = PrefsHorizontalPadding),
            //) {
            //    SegmentedButton(
            //        modifier = Modifier.fillMaxHeight(),
            //        checked = false,
            //        onCheckedChange = () => Navigator.push(context, CreateBackupScreen()),
            //    )
            //    SegmentedButton(
            //        modifier = Modifier.fillMaxHeight(),
            //        checked = false,
            //        onCheckedChange = {
            //            if (!BackupRestoreJob.isRunning(context)) {
            //                if (DeviceUtil.isMiui && DeviceUtil.isMiuiOptimizationDisabled()) {
            //                    context.toast(lang.restore_miui_warning)
            //                }

            //                // no need to catch because it's wrapped with a chooser
            //                chooseBackup.launch("*/*")
            //            } else {
            //                context.toast(lang.restore_in_progress)
            //            }
            //        },
            //    )
            //},
          ),
        ),

        // Automatic backups
        ListPreference(
          pref: backupPreferences.backupInterval(),
          title: lang.pref_backup_interval,
          entries: {
            0: lang.off,
            6: lang.update_6hour,
            12: lang.update_12hour,
            24: lang.update_24hour,
            48: lang.update_48hour,
            168: lang.update_weekly,
          },
          onValueChanged: (it) async {
            //BackupCreateJob.setupTask(context, it);
            return true;
          },
        ),
        //InfoPreference(
        //  title: "${lang.backup_info}\n\n"
        //      "${lang.last_auto_backup_info(relativeTimeSpanString(context, lastAutoBackup))}",
        //),
      ],
    );
  }

  PreferenceGroup _getDataGroup(BuildContext context) {
    final lang = AppLocalizations.of(context);
    //val scope = rememberCoroutineScope()
    //val libraryPreferences = remember { Injekt.get<LibraryPreferences>() }

    //val chapterCache = remember { Injekt.get<ChapterCache>() }
    //var cacheReadableSizeSema by remember { mutableIntStateOf(0) }
    //val cacheReadableSize = remember(cacheReadableSizeSema) { chapterCache.readableSize }

    return PreferenceGroup(
      title: lang.pref_storage_usage,
      preferenceItems: [
        //CustomPreference(
        //  title: lang.pref_storage_usage,
        //  content: BasePreferenceWidget(
        //    subcomponent: Padding(
        //      padding: const EdgeInsets.symmetric(
        //        horizontal: prefsHorizontalPadding,
        //      ),
        //      child: StorageInfo(),
        //    ),
        //  ),
        //),
        TextPreference(
          title: lang.pref_clear_chapter_cache,
          //subtitle: lang.used_cache(cacheReadableSize),
          onClick: () {
            try {
              //final deletedFiles = chapterCache.clear();
              //context.toast(lang.cache_deleted(deletedFiles));
              //cacheReadableSizeSema++;
            } catch (e) {
              //logger.e(e);
              //context.toast(lang.cache_delete_error);
            }
          },
        ),
        //SwitchPreference(
        //  pref: libraryPreferences.autoClearChapterCache(),
        //  title: lang.pref_auto_clear_chapter_cache,
        //),
      ],
    );
  }
}
