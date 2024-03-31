import 'package:flutter/material.dart';

import 'package:flutteryomi/core/util/system/locale_helper.dart';
import 'package:flutteryomi/domain/source/model/domain_source.dart';
import 'package:flutteryomi/presentation/browse/components/base_browse_item.dart';
import 'package:flutteryomi/presentation/browse/components/browse_icons.dart';
import 'package:flutteryomi/presentation/components/material/constants.dart';

class BaseSourceItem extends StatelessWidget {
  const BaseSourceItem({
    super.key,
    required this.source,
    this.showLanguageInContent = true,
    required this.onClickItem,
    required this.onLongClickItem,
    this.icon,
    required this.action,
    this.content,
    this.subtitle,
  });

  final Source source;
  final bool showLanguageInContent;
  final VoidCallback onClickItem;
  final VoidCallback onLongClickItem;
  final Widget? icon;
  final Widget action;
  final Widget? content;
  final Widget? subtitle;

  @override
  Widget build(BuildContext context) {
    final sourceLangString = showLanguageInContent
        ? LocaleHelper.getSourceDisplayNameUsingContext(source.lang, context)
        : null;
    return BaseBrowseItem(
      onClickItem: onClickItem,
      onLongClickItem: onLongClickItem,
      icon: icon ?? SourceIcon(source: source),
      action: action,
      content: content ??
          Text(
            source.name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
      subtitle: subtitle ??
          (sourceLangString != null
              ? Opacity(
                  opacity: secondaryItemAlpha,
                  child: Text(
                    sourceLangString,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                )
              : null),
    );
  }
}
