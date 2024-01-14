import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:flutteryomi/domain/download/model/download.dart';
import 'package:flutteryomi/presentation/components/material/constants.dart';
import 'package:flutteryomi/presentation/components/material/icon_button_tokens.dart';
import 'package:flutteryomi/presentation/icons/custom_icons.dart';

enum ChapterDownloadAction {
  start,
  startNow,
  cancel,
  delete,
}

class ChapterDownloadIndicator extends StatelessWidget {
  const ChapterDownloadIndicator({
    super.key,
    required this.enabled,
    required this.downloadStateProvider,
    required this.downloadProgressProvider,
    required this.onClick,
  });

  final bool enabled;
  final DownloadState Function() downloadStateProvider;
  final int Function() downloadProgressProvider;
  final ValueChanged<ChapterDownloadAction> onClick;

  @override
  Widget build(BuildContext context) {
    final downloadState = downloadStateProvider();
    return switch (downloadState) {
      DownloadState.notDownloaded => _NotDownloadedIndicator(
        enabled: enabled,
        onClick: onClick,
      ),
      DownloadState.queue || DownloadState.downloading => _DownloadingIndicator(
        enabled: enabled,
        downloadState: downloadState,
        downloadProgressProvider: downloadProgressProvider,
        onClick: onClick,
      ),
      DownloadState.downloaded => _DownloadedIndicator(
        enabled: enabled,
        onClick: onClick,
      ),
      DownloadState.error => _ErrorIndicator(
        enabled: enabled,
        onClick: onClick,
      ),
    };
  }
}

class _NotDownloadedIndicator extends StatelessWidget {
  const _NotDownloadedIndicator({
    super.key,
    required this.enabled,
    required this.onClick,
  });

  final bool enabled;
  final ValueChanged<ChapterDownloadAction> onClick;

  @override
  Widget build(BuildContext context) {
    final lang = AppLocalizations.of(context);
    return InkWell(
      onTap: enabled ? () => onClick(ChapterDownloadAction.start) : null,
      onLongPress:
          enabled ? () => onClick(ChapterDownloadAction.startNow) : null,
      child: SizedBox.square(
        dimension: IconButtonTokens.stateLayerSize,
        child: Stack(
          alignment: AlignmentDirectional.center,
          children: [
            Icon(
              //Icons.download_for_offline_outlined,
              CustomIcons.downloadChapter,
              semanticLabel: lang.manga_download,
              size: _indicatorSize,
              color: Theme.of(context)
                  .colorScheme
                  .onSurfaceVariant
                  .withOpacity(secondaryItemAlpha),
            ),
          ],
        ),
      ),
    );
  }
}

class _DownloadingIndicator extends StatelessWidget {
  const _DownloadingIndicator({
    super.key,
    required this.enabled,
    required this.downloadState,
    required this.downloadProgressProvider,
    required this.onClick,
  });

  final bool enabled;
  final DownloadState downloadState;
  final int Function() downloadProgressProvider;
  final ValueChanged<ChapterDownloadAction> onClick;

  @override
  Widget build(BuildContext context) {
    final lang = AppLocalizations.of(context);
    return MenuAnchor(
      builder: (context, controller, child) {
        final strokeColor = Theme.of(context).colorScheme.onSurfaceVariant;
        final downloadProgress = downloadProgressProvider();
        final indeterminate = downloadState == DownloadState.queue ||
            (downloadState == DownloadState.downloading &&
                downloadProgress == 0);
        Color arrowColor;
        if (indeterminate) {
          arrowColor = strokeColor;
        } else {
          // TODO: Springy animation based on ProgressAnimationSpec
          //final animatedProgress by animateFloatAsState(
          //  targetValue: downloadProgress / 100.0,
          //  animationSpec: ProgressIndicatorDefaults.ProgressAnimationSpec,
          //  label: "progress");
          arrowColor = downloadProgress < 0.5
              ? strokeColor
              : Theme.of(context).colorScheme.background;
        }
        return InkWell(
          onTap: enabled ? () => controller.open() : null,
          onLongPress: enabled //
              ? () => onClick(ChapterDownloadAction.startNow)
              : null,
          child: SizedBox.square(
            dimension: IconButtonTokens.stateLayerSize,
            child: Stack(
              alignment: AlignmentDirectional.center,
              children: [
                indeterminate
                    ? Padding(
                        padding: const EdgeInsets.all(_indicatorPadding),
                        child: SizedBox.square(
                          dimension: _indicatorSize,
                          child: CircularProgressIndicator.adaptive(
                            valueColor:
                                AlwaysStoppedAnimation<Color>(strokeColor),
                            strokeWidth: _indicatorStrokeWidth,
                          ),
                        ),
                      )
                    : Padding(
                        padding: const EdgeInsets.all(_indicatorPadding),
                        child: SizedBox.square(
                          dimension: _indicatorSize,
                          child: CircularProgressIndicator.adaptive(
                            value: downloadProgress.toDouble(),
                            valueColor:
                                AlwaysStoppedAnimation<Color>(strokeColor),
                            strokeWidth: _indicatorSize / 2,
                          ),
                        ),
                      ),
                Icon(
                  Icons.arrow_downward_outlined,
                  size: _indicatorSize - 7.0,
                  color: arrowColor,
                ),
              ],
            ),
          ),
        );
      },
      menuChildren: [
        MenuItemButton(
          onPressed: () => onClick(ChapterDownloadAction.startNow),
          child: Text(lang.action_start_downloading_now),
        ),
        MenuItemButton(
          onPressed: () => onClick(ChapterDownloadAction.cancel),
          child: Text(lang.action_cancel),
        ),
      ],
    );
  }
}

class _DownloadedIndicator extends StatelessWidget {
  const _DownloadedIndicator({
    super.key,
    required this.enabled,
    required this.onClick,
  });

  final bool enabled;
  final ValueChanged<ChapterDownloadAction> onClick;

  @override
  Widget build(BuildContext context) {
    final lang = AppLocalizations.of(context);
    return MenuAnchor(
      builder: (context, controller, child) {
        return InkWell(
          onTap: enabled ? () => controller.open() : null,
          onLongPress: enabled ? () => controller.open() : null,
          child: SizedBox.square(
            dimension: IconButtonTokens.stateLayerSize,
            child: Stack(
              alignment: AlignmentDirectional.center,
              children: [
                Icon(
                  Icons.check_circle,
                  size: _indicatorSize,
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
              ],
            ),
          ),
        );
      },
      menuChildren: [
        MenuItemButton(
          onPressed: () => onClick(ChapterDownloadAction.delete),
          child: Text(lang.action_delete),
        ),
      ],
    );
  }
}

class _ErrorIndicator extends StatelessWidget {
  const _ErrorIndicator({
    super.key,
    required this.enabled,
    required this.onClick,
  });

  final bool enabled;
  final ValueChanged<ChapterDownloadAction> onClick;

  @override
  Widget build(BuildContext context) {
    final lang = AppLocalizations.of(context);
    return InkWell(
      onTap: enabled ? () => onClick(ChapterDownloadAction.start) : null,
      onLongPress: enabled ? () => onClick(ChapterDownloadAction.start) : null,
      child: SizedBox.square(
        dimension: IconButtonTokens.stateLayerSize,
        child: Stack(
          alignment: AlignmentDirectional.center,
          children: [
            Icon(
              Icons.error_outline_outlined,
              semanticLabel: lang.chapter_error,
              size: _indicatorSize,
              color: Theme.of(context).colorScheme.error,
            ),
          ],
        ),
      ),
    );
  }
}

const _indicatorSize = 26.0;
const _indicatorPadding = 2.0;
const _indicatorStrokeWidth = _indicatorPadding;
