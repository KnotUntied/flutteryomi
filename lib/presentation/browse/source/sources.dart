import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:flutteryomi/domain/source/model/domain_source.dart';

part 'sources.freezed.dart';

//TODO
class SourcesScreen extends StatelessWidget {
  const SourcesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

@freezed
sealed class SourceUiModel with _$SourceUiModel {
  factory SourceUiModel.item(Source source) = SourceUiModelItem;
  factory SourceUiModel.header(String language) = SourceUiModelHeader;
}
