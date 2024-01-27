import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:flutteryomi/presentation/components/material/constants.dart';

class MissingChapterCountListItem extends StatelessWidget {
  const MissingChapterCountListItem({super.key, required this.count});

  final int count;

  @override
  Widget build(BuildContext context) {
    final lang = AppLocalizations.of(context);
    return Row(
      children: [
        const Expanded(child: Divider()),
        const SizedBox(width: MaterialPadding.medium),
        Text(
          lang.missing_chapters(count),
          style: Theme.of(context).textTheme.labelMedium,
        ),
        const SizedBox(width: MaterialPadding.medium),
        const Expanded(child: Divider()),
      ],
    );
  }
}
