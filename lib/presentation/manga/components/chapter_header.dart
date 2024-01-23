import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:flutteryomi/presentation/components/material/constants.dart';

class ChapterHeader extends StatelessWidget {
  const ChapterHeader({
    super.key,
    required this.enabled,
    this.chapterCount,
    required this.missingChapterCount,
    required this.onClick,
  });

  final bool enabled;
  final int? chapterCount;
  final int missingChapterCount;
  final VoidCallback onClick;

  @override
  Widget build(BuildContext context) {
    final lang = AppLocalizations.of(context);
    return InkWell(
      onTap: enabled ? onClick : null,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
        child: Column(
          children: [
            Text(
              chapterCount == null
                  ? lang.chapters
                  : lang.manga_num_chapters(chapterCount!),
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            if (missingChapterCount > 0) ...[
              const SizedBox(height: MaterialPadding.extraSmall),
              _MissingChaptersWarning(missingChapterCount),
            ],
          ],
        ),
      ),
    );
  }
}

class _MissingChaptersWarning extends StatelessWidget {
  const _MissingChaptersWarning(this.count, {super.key});

  final int count;

  @override
  Widget build(BuildContext context) {
    final lang = AppLocalizations.of(context);
    if (count == 0) return const SizedBox.shrink();
    return Text(
      lang.missing_chapters(count),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }
}
