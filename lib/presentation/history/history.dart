import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:flutteryomi/presentation/components/app_bar.dart';

class HistoryTab extends StatelessWidget {
  const HistoryTab({super.key});

  @override
  Widget build(BuildContext context) {
    return HistoryScreen(
      onSearchQueryChange: (String? value) {},
      onClickCover: (int mangaId) {},
      onClickResume: (int mangaId, int chapterId) {},
    );
  }

  Future<void> _askDeleteHistory(BuildContext context) {
    final lang = AppLocalizations.of(context);
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog.adaptive(
          title: Text(lang.action_remove_everything),
          content: Text(lang.clear_history_confirmation),
          actions: <Widget>[
            TextButton(
              child: Text(lang.action_cancel),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text(lang.action_ok),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({
    super.key,
    //required this.state,
    required this.onSearchQueryChange,
    required this.onClickCover,
    required this.onClickResume,
    //required this.onDialogChange,
    //this.preferences = Injekt.get(),
  });

  //final HistoryScreenModel.State state;
  final ValueChanged<String?> onSearchQueryChange;
  final Function(int mangaId) onClickCover;
  final Function(int mangaId, int chapterId) onClickResume;
  //final ValueChanged<HistoryScreenModel.Dialog?> onDialogChange;
  //final UiPreferences preferences;

  @override
  Widget build(BuildContext context) {
    final lang = AppLocalizations.of(context);
    return DefaultTabController(
      length: 1,
      child: Scaffold(
        appBar: SearchToolbar(
          titleContent: Text(lang.history),
          //searchQuery: '',
          onChangeSearchQuery: onSearchQueryChange,
          actions: [
            AppBarAction(
              iconData: Icons.delete_sweep_outlined,
              //onClick: () {onDialogChange(HistoryScreenModel.Dialog.DeleteAll)},
              onClick: () {},
              title: lang.pref_clear_history,
            ),
          ],
        ),
        body: HistoryScreenContent(),
      ),
    );
  }
}

class HistoryScreenContent extends StatelessWidget {
  const HistoryScreenContent({
    super.key,
    //required this.history,
    //required this.onClickCover,
    //required this.onClickResume,
    //required this.onClickDelete,
    //required this.preferences,
  });

  //final List<HistoryUiModel> history;
  //final ValueChanged(HistoryWithRelations) onClickCover;
  //final ValueChanged(HistoryWithRelations) onClickResume;
  //final ValueChanged(HistoryWithRelations) onClickDelete;
  //final UiPreferences preferences;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [],
    );
  }
}
