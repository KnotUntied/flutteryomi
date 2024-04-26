import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:flutteryomi/core/util/system/locale_helper.dart';
import 'package:flutteryomi/domain/source/model/domain_source.dart';
import 'package:flutteryomi/domain/source/model/pin.dart';
import 'package:flutteryomi/presentation/browse/source/browse_sources_screen_model.dart';
import 'package:flutteryomi/presentation/browse/source/sources_screen_model.dart';
import 'package:flutteryomi/presentation/components/material/constants.dart';
import 'package:flutteryomi/presentation/screens/empty_screen.dart';
import 'package:flutteryomi/presentation/screens/loading_screen.dart';
import 'package:flutteryomi/presentation/theme/typography.dart';
import 'package:flutteryomi/presentation/browse/components/base_source_item.dart';
import 'package:flutteryomi/source/local/local_source.dart';

part 'sources.freezed.dart';

class SourcesScreen extends ConsumerWidget {
  const SourcesScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final lang = AppLocalizations.of(context);
    final screenModel = ref.watch(sourcesScreenModelProvider.notifier);
    final state = ref.watch(sourcesScreenModelProvider);
    return state.when(
      loading: () => const LoadingScreen(),
      // TODO: Error handling
      error: (Object error, StackTrace stackTrace) {
        debugPrintStack(
          label: error.toString(),
          stackTrace: stackTrace,
        );
        return const LoadingScreen();
      },
      data: (data) {
        if (data.isEmpty) {
          return EmptyScreen(
            message: lang.source_empty_screen,
          );
        } else {
          return ListView.builder(
            itemCount: data.items.length,
            itemBuilder: (context, index) {
              final item = data.items[index];
              return switch (item) {
                SourceUiModelHeader() => _SourceHeader(language: item.language),
                SourceUiModelItem() => _SourceItem(
                  source: item.source,
                  //TODO
                  onClickItem: (source, listing) {
                    //Navigator.push(
                    //  context,
                    //  MaterialPageRoute(
                    //    builder: (context) => BrowseSourceScreen(source.id, listing.query),
                    //  ),
                    //);
                  },
                  onLongClickItem: screenModel.togglePin,
                  onClickPin: (source) => showAdaptiveDialog(
                    context: context,
                    builder: (context) => SourceOptionsDialog(
                      source: source,
                      onClickPin: () {
                        Navigator.pop(context);
                        screenModel.togglePin(source);
                      },
                      onClickDisable: () {
                        Navigator.pop(context);
                        screenModel.toggleSource(source);
                      },
                    ),
                  ),
                ),
              };
            },
          );
        }
      },
    );
  }
}

class _SourceHeader extends StatelessWidget {
  const _SourceHeader({super.key, required this.language});

  final String language;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: MaterialPadding.medium,
        vertical: MaterialPadding.small,
      ),
      child: Text(
        LocaleHelper.getSourceDisplayNameUsingContext(language, context),
        style: header(context),
      ),
    );
  }
}

class _SourceItem extends StatelessWidget {
  const _SourceItem({
    super.key,
    required this.source,
    required this.onClickItem,
    required this.onLongClickItem,
    required this.onClickPin,
  });

  final Source source;
  final void Function(Source, Listing) onClickItem;
  final ValueChanged<Source> onLongClickItem;
  final ValueChanged<Source> onClickPin;

  @override
  Widget build(BuildContext context) {
    final lang = AppLocalizations.of(context);
    return BaseSourceItem(
      source: source,
      onClickItem: () => onClickItem(source, const ListingPopular()),
      onLongClickItem: () => onLongClickItem(source),
      action: Row(
        children: [
          if (source.supportsLatest)
            TextButton(
              onPressed: () => onClickItem(source, const ListingLatest()),
              child: Text(
                lang.latest,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                ),
              )
            ),
          _SourcePinButton(
            isPinned: source.pin.contains(Pin.pinned),
            onClick: () => onClickPin(source),
          ),
        ],
      ),
    );
  }
}

class _SourcePinButton extends StatelessWidget {
  const _SourcePinButton({
    super.key,
    required this.isPinned,
    required this.onClick,
  });

  final bool isPinned;
  final VoidCallback onClick;

  @override
  Widget build(BuildContext context) {
    final lang = AppLocalizations.of(context);
    return IconButton(
      icon: Icon(isPinned ? Icons.push_pin : Icons.push_pin_outlined),
      color: isPinned
          ? Theme.of(context).colorScheme.primary
          : Theme.of(context).colorScheme.onBackground.withOpacity(secondaryItemAlpha),
      tooltip: isPinned ? lang.action_unpin : lang.action_pin,
      onPressed: onClick,
    );
  }
}

class SourceOptionsDialog extends StatelessWidget {
  const SourceOptionsDialog({
    super.key,
    required this.source,
    required this.onClickPin,
    required this.onClickDisable,
  });

  final Source source;
  final VoidCallback onClickPin;
  final VoidCallback onClickDisable;

  @override
  Widget build(BuildContext context) {
    final lang = AppLocalizations.of(context);
    return AlertDialog.adaptive(
      title: Text(source.visualName),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          InkWell(
            onTap: onClickPin,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Text(
                source.pin.contains(Pin.pinned) ? lang.action_unpin : lang.action_pin,
              ),
            ),
          ),
          if (!source.isLocal())
            InkWell(
              onTap: onClickDisable,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Text(lang.action_disable),
              ),
            ),
        ],
      ),
    );
  }
}

@freezed
sealed class SourceUiModel with _$SourceUiModel {
  factory SourceUiModel.item(Source source) = SourceUiModelItem;
  factory SourceUiModel.header(String language) = SourceUiModelHeader;
}
