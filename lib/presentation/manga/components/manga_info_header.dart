import 'package:dartx/dartx.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:flutteryomi/domain/manga/model/manga.dart';
import 'package:flutteryomi/domain/source/model/smanga.dart';
import 'package:flutteryomi/presentation/components/material/constants.dart';
import 'package:flutteryomi/presentation/manga/components/dot_separator_text.dart';
import 'package:flutteryomi/presentation/manga/components/manga_cover.dart';

final _whitespaceLineRegex = RegExp(r'[\r\n]{2,}', multiLine: true);

class MangaInfoBox extends StatelessWidget {
  const MangaInfoBox({
    super.key,
    required this.isTabletUi,
    required this.appBarPadding,
    required this.title,
    this.author,
    this.artist,
    required this.sourceName,
    required this.isStubSource,
    required this.coverDataProvider,
    required this.status,
    required this.onCoverClick,
    required this.doSearch,
  });

  final bool isTabletUi;
  final double appBarPadding;
  final String title;
  final String? author;
  final String? artist;
  final String sourceName;
  final bool isStubSource;
  final Manga Function() coverDataProvider;
  final int status;
  final VoidCallback onCoverClick;
  final void Function(String query, bool global) doSearch;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        //TODO: Background
        !isTabletUi
            ? _MangaAndSourceTitlesSmall(
                appBarPadding: appBarPadding,
                coverDataProvider: coverDataProvider,
                onCoverClick: onCoverClick,
                title: title,
                doSearch: doSearch,
                author: author,
                artist: artist,
                status: status,
                sourceName: sourceName,
                isStubSource: isStubSource,
              )
            : _MangaAndSourceTitlesLarge(
                appBarPadding: appBarPadding,
                coverDataProvider: coverDataProvider,
                onCoverClick: onCoverClick,
                title: title,
                doSearch: doSearch,
                author: author,
                artist: artist,
                status: status,
                sourceName: sourceName,
                isStubSource: isStubSource,
              ),
      ],
    );
  }
}

class MangaActionRow extends StatelessWidget {
  const MangaActionRow({
    super.key,
    required this.favorite,
    required this.trackingCount,
    this.nextUpdate,
    required this.isUserIntervalMode,
    required this.onAddToLibraryClicked,
    this.onWebViewClicked,
    this.onWebViewLongClicked,
    required this.onTrackingClicked,
    this.onEditIntervalClicked,
    this.onEditCategory,
  });

  final bool favorite;
  final int trackingCount;
  final DateTime? nextUpdate;
  final bool isUserIntervalMode;
  final VoidCallback onAddToLibraryClicked;
  final VoidCallback? onWebViewClicked;
  final VoidCallback? onWebViewLongClicked;
  final VoidCallback onTrackingClicked;
  final VoidCallback? onEditIntervalClicked;
  final VoidCallback? onEditCategory;

  @override
  Widget build(BuildContext context) {
    final lang = AppLocalizations.of(context);
    final defaultActionButtonColor =
        Theme.of(context).colorScheme.onSurface.withOpacity(0.38);
    final nextUpdateDaysRaw = nextUpdate != null
        ? DateTime.now().difference(nextUpdate!).inDays
        : null;
    final nextUpdateDays = nextUpdateDaysRaw?.clamp(0, nextUpdateDaysRaw);
    return Padding(
      padding: const EdgeInsetsDirectional.only(
        start: 16.0,
        top: 8.0,
        end: 16.0,
      ),
      child: Row(
        children: [
          _MangaActionButton(
            title: favorite ? lang.in_library : lang.add_to_library,
            icon: favorite ? Icons.favorite : Icons.favorite_border_outlined,
            color: favorite
                ? Theme.of(context).colorScheme.primary
                : defaultActionButtonColor,
            onClick: onAddToLibraryClicked,
            onLongClick: onEditCategory,
          ),
          _MangaActionButton(
            title: switch (nextUpdateDays) {
              null => lang.not_applicable,
              0 => lang.manga_interval_expected_update_soon,
              _ => lang.day(nextUpdateDays),
            },
            icon: Icons.hourglass_empty,
            color: isUserIntervalMode
                ? Theme.of(context).colorScheme.primary
                : defaultActionButtonColor,
            onClick: onEditIntervalClicked,
          ),
          _MangaActionButton(
            title: trackingCount == 0
                ? lang.manga_tracking_tab
                : lang.num_trackers(trackingCount),
            icon: trackingCount == 0 //
                ? Icons.sync_outlined
                : Icons.done_outlined,
            color: trackingCount == 0
                ? defaultActionButtonColor
                : Theme.of(context).colorScheme.primary,
            onClick: onTrackingClicked,
          ),
          if (onWebViewClicked != null)
            _MangaActionButton(
              title: lang.action_web_view,
              icon: Icons.public_outlined,
              color: defaultActionButtonColor,
              onClick: onWebViewClicked,
              onLongClick: onWebViewLongClicked,
            ),
        ],
      ),
    );
  }
}

class ExpandableMangaDescription extends StatefulWidget {
  const ExpandableMangaDescription({
    super.key,
    required this.defaultExpandState,
    this.description,
    this.tagsProvider,
    required this.onTagSearch,
    required this.onCopyTagToClipboard,
  });

  final bool defaultExpandState;
  final String? description;
  final List<String> Function()? tagsProvider;
  final ValueChanged<String> onTagSearch;
  final void Function(String tag) onCopyTagToClipboard;

  @override
  State<ExpandableMangaDescription> createState() =>
      _ExpandableMangaDescriptionState();
}

class _ExpandableMangaDescriptionState
    extends State<ExpandableMangaDescription> {
  final controller = MenuController();
  bool expanded = false;
  String tagSelected = '';

  @override
  Widget build(BuildContext context) {
    final lang = AppLocalizations.of(context);
    final desc = widget.description.isNotNullOrBlank
        ? widget.description!
        : lang.description_placeholder;
    final trimmedDescription =
        desc.replaceFirst(_whitespaceLineRegex, "\n").trimRight();
    final tags = widget.tagsProvider != null ? widget.tagsProvider!() : null;
    return Column(
      children: [
        GestureDetector(
          onTap: () => setState(() => expanded = !expanded),
          child: Padding(
            padding: const EdgeInsets.only(top: 8.0, left: 16.0, right: 16.0),
            child: _MangaSummary(
              expandedDescription: desc,
              shrunkDescription: trimmedDescription,
              expanded: expanded,
            ),
          ),
        ),
        if (tags != null && tags.isNotEmpty)
          AnimatedSize(
            duration: const Duration(milliseconds: 300),
            child: Padding(
              padding: const EdgeInsets.only(top: 20.0, bottom: 12.0),
              child: Stack(
                children: [
                  MenuAnchor(
                    builder: (context, controller, child) {
                      return IconButton(
                        onPressed: () => controller.isOpen
                            ? controller.close()
                            : controller.open(),
                        icon: Icon(Icons.adaptive.more_outlined),
                      );
                    },
                    controller: controller,
                    menuChildren: [
                      MenuItemButton(
                        onPressed: () => widget.onTagSearch(tagSelected),
                        child: Text(lang.action_search),
                      ),
                      MenuItemButton(
                        onPressed: () =>
                            widget.onCopyTagToClipboard(tagSelected),
                        child: Text(lang.action_copy_to_clipboard),
                      ),
                    ],
                  ),
                  expanded
                      ? Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Wrap(
                            runSpacing: MaterialPadding.extraSmall,
                            spacing: MaterialPadding.extraSmall,
                            children: tags.map((it) {
                              return _TagsChip(
                                text: it,
                                onClick: () => setState(() => tagSelected = it),
                              );
                            }).toList(),
                          ),
                        )
                      : ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemCount: tags.length,
                          itemBuilder: (context, index) {
                            final tag = tags[index];
                            return _TagsChip(
                              text: tag,
                              onClick: () {
                                setState(() => tagSelected = tag);
                                controller.open();
                              },
                            );
                          },
                          separatorBuilder: (_, __) => const SizedBox(
                            width: MaterialPadding.extraSmall,
                          ),
                        ),
                ],
              ),
            ),
          ),
      ],
    );
  }
}

class _MangaAndSourceTitlesLarge extends StatelessWidget {
  const _MangaAndSourceTitlesLarge({
    super.key,
    required this.appBarPadding,
    required this.coverDataProvider,
    required this.onCoverClick,
    required this.title,
    required this.doSearch,
    this.author,
    this.artist,
    required this.status,
    required this.sourceName,
    required this.isStubSource,
  });

  final double appBarPadding;
  final Manga Function() coverDataProvider;
  final VoidCallback onCoverClick;
  final String title;
  final void Function(String query, bool global) doSearch;
  final String? author;
  final String? artist;
  final int status;
  final String sourceName;
  final bool isStubSource;

  @override
  Widget build(BuildContext context) {
    final lang = AppLocalizations.of(context);
    return Padding(
      padding: EdgeInsetsDirectional.only(
        start: 16.0,
        top: appBarPadding + 8.0,
        end: 16.0,
      ),
      child: Column(
        children: [
          FractionallySizedBox(
            widthFactor: 0.65,
            child: MangaCover.book(
              data: coverDataProvider(),
              contentDescription: lang.manga_cover,
              onClick: onCoverClick,
            ),
          ),
          const SizedBox(height: 16.0),
          _MangaContentInfo(
            title: title,
            doSearch: doSearch,
            author: author,
            artist: artist,
            status: status,
            sourceName: sourceName,
            isStubSource: isStubSource,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class _MangaAndSourceTitlesSmall extends StatelessWidget {
  const _MangaAndSourceTitlesSmall({
    super.key,
    required this.appBarPadding,
    required this.coverDataProvider,
    required this.onCoverClick,
    required this.title,
    required this.doSearch,
    this.author,
    this.artist,
    required this.status,
    required this.sourceName,
    required this.isStubSource,
  });

  final double appBarPadding;
  final Manga Function() coverDataProvider;
  final VoidCallback onCoverClick;
  final String title;
  final void Function(String query, bool global) doSearch;
  final String? author;
  final String? artist;
  final int status;
  final String sourceName;
  final bool isStubSource;

  @override
  Widget build(BuildContext context) {
    final lang = AppLocalizations.of(context);
    return Padding(
      padding: EdgeInsetsDirectional.only(
        start: 16.0,
        top: appBarPadding + 16.0,
        end: 16.0,
      ),
      child: Row(
        children: [
          SizedBox(
            width: 100,
            child: MangaCover.book(
              data: coverDataProvider(),
              contentDescription: lang.manga_cover,
              onClick: onCoverClick,
            ),
          ),
          const SizedBox(height: 16.0),
          _MangaContentInfo(
            title: title,
            doSearch: doSearch,
            author: author,
            artist: artist,
            status: status,
            sourceName: sourceName,
            isStubSource: isStubSource,
            textAlign: TextAlign.center,
            spacing: 2.0,
          ),
        ],
      ),
    );
  }
}

class _MangaContentInfo extends StatelessWidget {
  const _MangaContentInfo({
    super.key,
    required this.title,
    required this.doSearch,
    this.author,
    this.artist,
    required this.status,
    required this.sourceName,
    required this.isStubSource,
    this.textAlign,
    this.spacing = 0.0,
  });

  final String title;
  final void Function(String query, bool global) doSearch;
  final String? author;
  final String? artist;
  final int status;
  final String sourceName;
  final bool isStubSource;
  final TextAlign? textAlign;
  final double spacing;

  @override
  Widget build(BuildContext context) {
    final lang = AppLocalizations.of(context);
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            if (title.isNotBlank) doSearch(title, true);
          },
          onLongPress: () async {
            if (title.isNotBlank) {
              await Clipboard.setData(ClipboardData(text: title));
            }
          },
          child: Text(
            title.isBlank ? lang.unknown_title : title,
            style: Theme.of(context).textTheme.titleLarge,
            textAlign: textAlign,
          ),
        ),
        SizedBox(height: spacing + 2.0),
        Opacity(
          opacity: secondaryItemAlpha,
          child: Row(
            children: [
              const Icon(Icons.person_outline, size: 16.0),
              const SizedBox(width: MaterialPadding.extraSmall),
              GestureDetector(
                onLongPress: () async {
                  if (author.isNotNullOrBlank) {
                    await Clipboard.setData(ClipboardData(text: author!));
                  }
                },
                onTap: () {
                  if (author.isNotNullOrBlank) doSearch(author!, true);
                },
                child: Text(
                  author.isNullOrBlank ? lang.unknown_author : author!,
                  style: Theme.of(context).textTheme.titleSmall,
                  textAlign: textAlign,
                ),
              ),
            ],
          ),
        ),
        if (artist.isNotNullOrBlank && author != artist) ...[
          SizedBox(height: spacing),
          Opacity(
            opacity: secondaryItemAlpha,
            child: Row(
              children: [
                const Icon(Icons.brush, size: 16.0),
                const SizedBox(width: MaterialPadding.extraSmall),
                GestureDetector(
                  onLongPress: () async {
                    if (artist.isNotNullOrBlank) {
                      await Clipboard.setData(ClipboardData(text: artist!));
                    }
                  },
                  onTap: () {
                    if (artist.isNotNullOrBlank) doSearch(artist!, true);
                  },
                  child: Text(
                    artist!,
                    style: Theme.of(context).textTheme.titleSmall,
                    textAlign: textAlign,
                  ),
                ),
              ],
            ),
          ),
        ],
        SizedBox(height: spacing + 2.0),
        Opacity(
          opacity: secondaryItemAlpha,
          child: DefaultTextStyle(
            style: Theme.of(context).textTheme.bodyMedium!,
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.only(end: 4.0),
                  child: Icon(
                    switch (status) {
                      SManga.ongoing => Icons.schedule_outlined,
                      SManga.completed => Icons.done_all_outlined,
                      SManga.licensed => Icons.attach_money_outlined,
                      SManga.publishingFinished => Icons.done_outlined,
                      SManga.cancelled => Icons.close_outlined,
                      SManga.onHiatus => Icons.pause_outlined,
                      _ => Icons.block_outlined,
                    },
                    size: 16.0,
                  ),
                ),
                Text(
                  switch (status) {
                    SManga.ongoing => lang.ongoing,
                    SManga.completed => lang.completed,
                    SManga.licensed => lang.licensed,
                    SManga.publishingFinished => lang.publishing_finished,
                    SManga.cancelled => lang.cancelled,
                    SManga.onHiatus => lang.on_hiatus,
                    _ => lang.unknown,
                  },
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const DotSeparatorText(),
                if (isStubSource)
                  const Padding(
                    padding: EdgeInsetsDirectional.only(end: 4.0),
                    child: Icon(Icons.warning, size: 16.0),
                  ),
                GestureDetector(
                  onTap: () => doSearch(sourceName, false),
                  child: Text(
                    sourceName,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

enum _MangaSummaryElements { shrunk, expanded, actual, scrim }

class _MangaSummaryDelegate extends MultiChildLayoutDelegate {
  _MangaSummaryDelegate();

  @override
  void performLayout(Size size) {
    final shrunkSize = layoutChild(_MangaSummaryElements.shrunk, BoxConstraints.loose(size));
    final expandedSize = layoutChild(_MangaSummaryElements.expanded, BoxConstraints.loose(size));
    final heightDelta = expandedSize.height - shrunkSize.height;
    const scrimHeight = 24.0;

    final actualSize = layoutChild(_MangaSummaryElements.actual, BoxConstraints.loose(size));
    final scrimSize = layoutChild(
      _MangaSummaryElements.scrim,
      BoxConstraints.expand(width: size.width, height: size.height),
    );

    final currentHeight = shrunkSize.height + ((heightDelta + scrimHeight));
    positionChild(_MangaSummaryElements.actual, const Offset(0, 0));
    final scrimY = currentHeight - scrimSize.height;
    positionChild(_MangaSummaryElements.scrim, Offset(0, scrimY));
  }

  @override
  bool shouldRelayout(_MangaSummaryDelegate oldDelegate) => false;
}

class _MangaSummary extends StatelessWidget {
  const _MangaSummary({
    super.key,
    required this.expandedDescription,
    required this.shrunkDescription,
    required this.expanded,
  });

  final String expandedDescription;
  final String shrunkDescription;
  final bool expanded;

  @override
  Widget build(BuildContext context) {
    final lang = AppLocalizations.of(context);
    final colors = [
      Colors.transparent,
      Theme.of(context).colorScheme.background,
    ];
    return CustomMultiChildLayout(
      delegate: _MangaSummaryDelegate(),
      children: [
        LayoutId(
          id: _MangaSummaryElements.shrunk,
          child: Text('\n\n', style: Theme.of(context).textTheme.bodyMedium),
        ),
        LayoutId(
          id: _MangaSummaryElements.expanded,
          child: Text(
            expandedDescription,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
        LayoutId(
          id: _MangaSummaryElements.actual,
          child: SelectableText(
            expanded ? expandedDescription : shrunkDescription,
            maxLines: double.infinity as int,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Theme.of(context)
                      .colorScheme
                      .onSurface
                      .withOpacity(secondaryItemAlpha),
                ),
          ),
        ),
        LayoutId(
          id: _MangaSummaryElements.scrim,
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: colors,
              ),
            ),
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: RadialGradient(colors: colors.reversed.toList()),
              ),
              child: Icon(
                expanded ? Icons.expand_less : Icons.expand_more,
                semanticLabel: expanded //
                    ? lang.manga_info_collapse
                    : lang.manga_info_expand,
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _TagsChip extends StatelessWidget {
  const _TagsChip({
    super.key,
    required this.text,
    required this.onClick,
  });

  final String text;
  final VoidCallback onClick;

  @override
  Widget build(BuildContext context) {
    return ActionChip(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      onPressed: onClick,
      label: Text(text, style: Theme.of(context).textTheme.bodySmall),
    );
  }
}

class _MangaActionButton extends StatelessWidget {
  const _MangaActionButton({
    super.key,
    required this.title,
    required this.icon,
    required this.color,
    this.onClick,
    this.onLongClick,
  });

  final String title;
  final IconData icon;
  final Color color;
  final VoidCallback? onClick;
  final VoidCallback? onLongClick;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextButton(
        onPressed: onClick,
        onLongPress: onLongClick,
        child: Column(
          children: [
            Icon(icon, color: color, size: 20.0),
            const SizedBox(height: 4.0),
            Text(
              title,
              style: TextStyle(color: color, fontSize: 12.0),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
