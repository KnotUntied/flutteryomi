import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class GlobalSearchItem extends StatelessWidget {
  const GlobalSearchItem({
    super.key,
    required this.searchQuery,
    required this.onClick,
  });

  final String searchQuery;
  final VoidCallback onClick;

  @override
  Widget build(BuildContext context) {
    final lang = AppLocalizations.of(context);
    return TextButton(
      onPressed: onClick,
      child: Text(lang.action_global_search_query(searchQuery)),
    );
  }
}
