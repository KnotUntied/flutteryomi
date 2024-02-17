import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:flutteryomi/domain/manga/model/manga.dart';
import 'package:flutteryomi/domain/source/model/filter_list.dart';
import 'package:flutteryomi/domain/source/model/page.dart' as page;
import 'package:flutteryomi/domain/source/model/schapter.dart';
import 'package:flutteryomi/domain/source/model/smanga.dart';
import 'package:flutteryomi/domain/source/model/source.dart' as domain_source;
import 'package:flutteryomi/source/api/catalogue_source.dart';
import 'package:flutteryomi/source/api/source.dart';
import 'package:flutteryomi/source/api/unmetered_source.dart';

class LocalSource implements CatalogueSource, UnmeteredSource {
  LocalSource({required this.context});

  // Terrible but necessary for localization
  final BuildContext context;

  static const localSourceId = 0;
  // Point to Mihon for now
  static const helpUrl = "https://mihon.app/docs/guides/local-source/";

  static const _latestThreshold = Duration(days: 7);

  @override
  int get id => localSourceId;

  @override
  String get lang => 'other';

  @override
  String get name {
    final localizations = AppLocalizations.of(context);
    return localizations.local_source;
  }

  @override
  String toString() => name;

  @override
  bool get supportsLatest => true;

  @override
  FilterList getFilterList() {
    // TODO: implement getFilterList
    throw UnimplementedError();
  }

  // Chapters
  @override
  Future<List<SChapter>> getChapterList(SManga manga) {
    // TODO: implement getChapterList
    throw UnimplementedError();
  }

  @override
  Future<SManga> getMangaDetails(SManga manga) {
    // TODO: implement getMangaDetails
    throw UnimplementedError();
  }

  // Unused stuff
  @override
  Future<List<page.Page>> getPageList(SChapter chapter) => throw UnsupportedError('Unused');
}

extension MangaIsLocal on Manga {
  bool isLocal() => source == LocalSource.localSourceId;
}

extension SourceIsLocal on Source {
  bool isLocal() => id == LocalSource.localSourceId;
}

extension DomainSourceIsLocal on domain_source.Source {
  bool isLocal() => id == LocalSource.localSourceId;
}
