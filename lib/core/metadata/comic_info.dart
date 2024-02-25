import 'package:collection/collection.dart';
import 'package:dartx/dartx.dart' hide IterableWhereNotNull;
import 'package:equatable/equatable.dart';
import 'package:xml/xml.dart';
// Too verbose >:(
import 'package:xml_annotation/xml_annotation.dart' as annotation;

import 'package:flutteryomi/domain/source/model/smanga.dart';

part 'comic_info.g.dart';

const comicInfoFile = "ComicInfo.xml";

extension SMangaComicInfo on SManga {
  ComicInfo getComicInfo() => ComicInfo(
        series: ComicInfoSeries(title),
        summary: description != null ? ComicInfoSummary(description!) : null,
        writer: author != null ? ComicInfoWriter(author!) : null,
        penciller: artist != null ? ComicInfoPenciller(artist!) : null,
        genre: genre != null ? ComicInfoGenre(genre!) : null,
        publishingStatus: PublishingStatusTachiyomi(
          ComicInfoPublishingStatus.toComicInfoValue(status),
        ),
        title: null,
        number: null,
        web: null,
        translator: null,
        inker: null,
        colorist: null,
        letterer: null,
        coverArtist: null,
        tags: null,
        categories: null,
      );

  void copyFromComicInfo(ComicInfo comicInfo) {
    if (comicInfo.series != null) title = comicInfo.series!.value;
    if (comicInfo.writer != null) author = comicInfo.writer!.value;
    if (comicInfo.summary != null) description = comicInfo.summary!.value;

    final newGenre = [
      comicInfo.genre?.value,
      comicInfo.tags?.value,
      comicInfo.categories?.value,
    ] //
        .whereNotNull()
        .distinct()
        .map((it) => it.trim())
        .join(", ");
    if (newGenre.isNotNullOrEmpty) genre = newGenre;

    final newArtist = [
      comicInfo.penciller?.value,
      comicInfo.inker?.value,
      comicInfo.colorist?.value,
      comicInfo.letterer?.value,
      comicInfo.coverArtist?.value,
    ]
        .whereNotNull()
        .flatMap((it) => it.split(", "))
        .distinct()
        .map((it) => it.trim())
        .join(", ");
    if (newArtist.isNotNullOrEmpty) artist = newArtist;

    status = ComicInfoPublishingStatus.toSMangaValue(
      comicInfo.publishingStatus?.value,
    );
  }
}

// https://anansi-project.github.io/docs/comicinfo/schemas/v2.0
@annotation.XmlRootElement(name: 'ComicInfo')
@annotation.XmlSerializable()
class ComicInfo extends Equatable {
  const ComicInfo({
    this.title,
    this.series,
    this.number,
    this.summary,
    this.writer,
    this.penciller,
    this.inker,
    this.colorist,
    this.letterer,
    this.coverArtist,
    this.translator,
    this.genre,
    this.tags,
    this.web,
    this.publishingStatus,
    this.categories,
  });

  @annotation.XmlElement(name: 'Title')
  final ComicInfoTitle? title;

  @annotation.XmlElement(name: 'Series')
  final ComicInfoSeries? series;
  
  @annotation.XmlElement(name: 'Number')
  final ComicInfoNumber? number;
  
  @annotation.XmlElement(name: 'Summary')
  final ComicInfoSummary? summary;
  
  @annotation.XmlElement(name: 'Writer')
  final ComicInfoWriter? writer;
  
  @annotation.XmlElement(name: 'Penciller')
  final ComicInfoPenciller? penciller;
  
  @annotation.XmlElement(name: 'Inker')
  final ComicInfoInker? inker;
  
  @annotation.XmlElement(name: 'Colorist')
  final ComicInfoColorist? colorist;
  
  @annotation.XmlElement(name: 'Letterer')
  final ComicInfoLetterer? letterer;
  
  @annotation.XmlElement(name: 'CoverArtist')
  final ComicInfoCoverArtist? coverArtist;
  
  @annotation.XmlElement(name: 'Translator')
  final ComicInfoTranslator? translator;
  
  @annotation.XmlElement(name: 'Genre')
  final ComicInfoGenre? genre;
  
  @annotation.XmlElement(name: 'Tags')
  final ComicInfoTags? tags;
  
  @annotation.XmlElement(name: 'Web')
  final ComicInfoWeb? web;
  
  @annotation.XmlElement(name: 'PublishingStatusTachiyomi')
  final PublishingStatusTachiyomi? publishingStatus;
  
  @annotation.XmlElement(name: 'CategoriesTachiyomi')
  final CategoriesTachiyomi? categories;

  @override
  List<Object?> get props => [
    title,
    series,
    number,
    summary,
    writer,
    penciller,
    inker,
    colorist,
    letterer,
    coverArtist,
    translator,
    genre,
    tags,
    web,
    publishingStatus,
    categories,
  ];

  factory ComicInfo.fromXmlElement(XmlElement element) =>
      _$ComicInfoFromXmlElement(element);

  void buildXmlChildren(
    XmlBuilder builder, {
    Map<String, String> namespaces = const {},
  }) =>
      _$ComicInfoBuildXmlChildren(
        this,
        builder,
        namespaces: namespaces,
      );

  void buildXmlElement(
    XmlBuilder builder, {
    Map<String, String> namespaces = const {},
  }) =>
      _$ComicInfoBuildXmlElement(
        this,
        builder,
        namespaces: namespaces,
      );

  List<XmlAttribute> toXmlAttributes({
    Map<String, String?> namespaces = const {},
  }) =>
      _$ComicInfoToXmlAttributes(this, namespaces: namespaces);

  List<XmlNode> toXmlChildren({
    Map<String, String?> namespaces = const {},
  }) =>
      _$ComicInfoToXmlChildren(this, namespaces: namespaces);

  XmlElement toXmlElement({
    Map<String, String?> namespaces = const {},
  }) =>
      _$ComicInfoToXmlElement(this, namespaces: namespaces);
}

@annotation.XmlRootElement(name: 'Title')
@annotation.XmlSerializable()
class ComicInfoTitle extends Equatable {
  const ComicInfoTitle(this.value);

  @annotation.XmlText()
  final String value;

  @override
  List<Object> get props => [value];

  factory ComicInfoTitle.fromXmlElement(XmlElement element) =>
      _$ComicInfoTitleFromXmlElement(element);

  void buildXmlChildren(
    XmlBuilder builder, {
    Map<String, String> namespaces = const {},
  }) =>
      _$ComicInfoTitleBuildXmlChildren(
        this,
        builder,
        namespaces: namespaces,
      );

  void buildXmlElement(
    XmlBuilder builder, {
    Map<String, String> namespaces = const {},
  }) =>
      _$ComicInfoTitleBuildXmlElement(
        this,
        builder,
        namespaces: namespaces,
      );

  List<XmlAttribute> toXmlAttributes({
    Map<String, String?> namespaces = const {},
  }) =>
      _$ComicInfoTitleToXmlAttributes(this, namespaces: namespaces);

  List<XmlNode> toXmlChildren({
    Map<String, String?> namespaces = const {},
  }) =>
      _$ComicInfoTitleToXmlChildren(this, namespaces: namespaces);

  XmlElement toXmlElement({
    Map<String, String?> namespaces = const {},
  }) =>
      _$ComicInfoTitleToXmlElement(this, namespaces: namespaces);
}

@annotation.XmlRootElement(name: 'Series')
@annotation.XmlSerializable()
class ComicInfoSeries extends Equatable {
  const ComicInfoSeries(this.value);

  @annotation.XmlText()
  final String value;

  @override
  List<Object> get props => [value];

  factory ComicInfoSeries.fromXmlElement(XmlElement element) =>
      _$ComicInfoSeriesFromXmlElement(element);

  void buildXmlChildren(
    XmlBuilder builder, {
    Map<String, String> namespaces = const {},
  }) =>
      _$ComicInfoSeriesBuildXmlChildren(
        this,
        builder,
        namespaces: namespaces,
      );

  void buildXmlElement(
    XmlBuilder builder, {
    Map<String, String> namespaces = const {},
  }) =>
      _$ComicInfoSeriesBuildXmlElement(
        this,
        builder,
        namespaces: namespaces,
      );

  List<XmlAttribute> toXmlAttributes({
    Map<String, String?> namespaces = const {},
  }) =>
      _$ComicInfoSeriesToXmlAttributes(this, namespaces: namespaces);

  List<XmlNode> toXmlChildren({
    Map<String, String?> namespaces = const {},
  }) =>
      _$ComicInfoSeriesToXmlChildren(this, namespaces: namespaces);

  XmlElement toXmlElement({
    Map<String, String?> namespaces = const {},
  }) =>
      _$ComicInfoSeriesToXmlElement(this, namespaces: namespaces);
}

@annotation.XmlRootElement(name: 'Number')
@annotation.XmlSerializable()
class ComicInfoNumber extends Equatable {
  const ComicInfoNumber(this.value);

  @annotation.XmlText()
  final String value;

  @override
  List<Object> get props => [value];

  factory ComicInfoNumber.fromXmlElement(XmlElement element) =>
      _$ComicInfoNumberFromXmlElement(element);

  void buildXmlChildren(
    XmlBuilder builder, {
    Map<String, String> namespaces = const {},
  }) =>
      _$ComicInfoNumberBuildXmlChildren(
        this,
        builder,
        namespaces: namespaces,
      );

  void buildXmlElement(
    XmlBuilder builder, {
    Map<String, String> namespaces = const {},
  }) =>
      _$ComicInfoNumberBuildXmlElement(
        this,
        builder,
        namespaces: namespaces,
      );

  List<XmlAttribute> toXmlAttributes({
    Map<String, String?> namespaces = const {},
  }) =>
      _$ComicInfoNumberToXmlAttributes(this, namespaces: namespaces);

  List<XmlNode> toXmlChildren({
    Map<String, String?> namespaces = const {},
  }) =>
      _$ComicInfoNumberToXmlChildren(this, namespaces: namespaces);

  XmlElement toXmlElement({
    Map<String, String?> namespaces = const {},
  }) =>
      _$ComicInfoNumberToXmlElement(this, namespaces: namespaces);
}

@annotation.XmlRootElement(name: 'Summary')
@annotation.XmlSerializable()
class ComicInfoSummary extends Equatable {
  const ComicInfoSummary(this.value);

  @annotation.XmlText()
  final String value;

  @override
  List<Object> get props => [value];

  factory ComicInfoSummary.fromXmlElement(XmlElement element) =>
      _$ComicInfoSummaryFromXmlElement(element);

  void buildXmlChildren(
    XmlBuilder builder, {
    Map<String, String> namespaces = const {},
  }) =>
      _$ComicInfoSummaryBuildXmlChildren(
        this,
        builder,
        namespaces: namespaces,
      );

  void buildXmlElement(
    XmlBuilder builder, {
    Map<String, String> namespaces = const {},
  }) =>
      _$ComicInfoSummaryBuildXmlElement(
        this,
        builder,
        namespaces: namespaces,
      );

  List<XmlAttribute> toXmlAttributes({
    Map<String, String?> namespaces = const {},
  }) =>
      _$ComicInfoSummaryToXmlAttributes(this, namespaces: namespaces);

  List<XmlNode> toXmlChildren({
    Map<String, String?> namespaces = const {},
  }) =>
      _$ComicInfoSummaryToXmlChildren(this, namespaces: namespaces);

  XmlElement toXmlElement({
    Map<String, String?> namespaces = const {},
  }) =>
      _$ComicInfoSummaryToXmlElement(this, namespaces: namespaces);
}

@annotation.XmlRootElement(name: 'Writer')
@annotation.XmlSerializable()
class ComicInfoWriter extends Equatable {
  const ComicInfoWriter(this.value);

  @annotation.XmlText()
  final String value;

  @override
  List<Object> get props => [value];

  factory ComicInfoWriter.fromXmlElement(XmlElement element) =>
      _$ComicInfoWriterFromXmlElement(element);

  void buildXmlChildren(
    XmlBuilder builder, {
    Map<String, String> namespaces = const {},
  }) =>
      _$ComicInfoWriterBuildXmlChildren(
        this,
        builder,
        namespaces: namespaces,
      );

  void buildXmlElement(
    XmlBuilder builder, {
    Map<String, String> namespaces = const {},
  }) =>
      _$ComicInfoWriterBuildXmlElement(
        this,
        builder,
        namespaces: namespaces,
      );

  List<XmlAttribute> toXmlAttributes({
    Map<String, String?> namespaces = const {},
  }) =>
      _$ComicInfoWriterToXmlAttributes(this, namespaces: namespaces);

  List<XmlNode> toXmlChildren({
    Map<String, String?> namespaces = const {},
  }) =>
      _$ComicInfoWriterToXmlChildren(this, namespaces: namespaces);

  XmlElement toXmlElement({
    Map<String, String?> namespaces = const {},
  }) =>
      _$ComicInfoWriterToXmlElement(this, namespaces: namespaces);
}

@annotation.XmlRootElement(name: 'Penciller')
@annotation.XmlSerializable()
class ComicInfoPenciller extends Equatable {
  const ComicInfoPenciller(this.value);

  @annotation.XmlText()
  final String value;

  @override
  List<Object> get props => [value];

  factory ComicInfoPenciller.fromXmlElement(XmlElement element) =>
      _$ComicInfoPencillerFromXmlElement(element);

  void buildXmlChildren(
    XmlBuilder builder, {
    Map<String, String> namespaces = const {},
  }) =>
      _$ComicInfoPencillerBuildXmlChildren(
        this,
        builder,
        namespaces: namespaces,
      );

  void buildXmlElement(
    XmlBuilder builder, {
    Map<String, String> namespaces = const {},
  }) =>
      _$ComicInfoPencillerBuildXmlElement(
        this,
        builder,
        namespaces: namespaces,
      );

  List<XmlAttribute> toXmlAttributes({
    Map<String, String?> namespaces = const {},
  }) =>
      _$ComicInfoPencillerToXmlAttributes(this, namespaces: namespaces);

  List<XmlNode> toXmlChildren({
    Map<String, String?> namespaces = const {},
  }) =>
      _$ComicInfoPencillerToXmlChildren(this, namespaces: namespaces);

  XmlElement toXmlElement({
    Map<String, String?> namespaces = const {},
  }) =>
      _$ComicInfoPencillerToXmlElement(this, namespaces: namespaces);
}

@annotation.XmlRootElement(name: 'Inker')
@annotation.XmlSerializable()
class ComicInfoInker extends Equatable {
  const ComicInfoInker(this.value);

  @annotation.XmlText()
  final String value;

  @override
  List<Object> get props => [value];

  factory ComicInfoInker.fromXmlElement(XmlElement element) =>
      _$ComicInfoInkerFromXmlElement(element);

  void buildXmlChildren(
    XmlBuilder builder, {
    Map<String, String> namespaces = const {},
  }) =>
      _$ComicInfoInkerBuildXmlChildren(
        this,
        builder,
        namespaces: namespaces,
      );

  void buildXmlElement(
    XmlBuilder builder, {
    Map<String, String> namespaces = const {},
  }) =>
      _$ComicInfoInkerBuildXmlElement(
        this,
        builder,
        namespaces: namespaces,
      );

  List<XmlAttribute> toXmlAttributes({
    Map<String, String?> namespaces = const {},
  }) =>
      _$ComicInfoInkerToXmlAttributes(this, namespaces: namespaces);

  List<XmlNode> toXmlChildren({
    Map<String, String?> namespaces = const {},
  }) =>
      _$ComicInfoInkerToXmlChildren(this, namespaces: namespaces);

  XmlElement toXmlElement({
    Map<String, String?> namespaces = const {},
  }) =>
      _$ComicInfoInkerToXmlElement(this, namespaces: namespaces);
}

@annotation.XmlRootElement(name: 'Colorist')
@annotation.XmlSerializable()
class ComicInfoColorist extends Equatable {
  const ComicInfoColorist(this.value);

  @annotation.XmlText()
  final String value;

  @override
  List<Object> get props => [value];

  factory ComicInfoColorist.fromXmlElement(XmlElement element) =>
      _$ComicInfoColoristFromXmlElement(element);

  void buildXmlChildren(
    XmlBuilder builder, {
    Map<String, String> namespaces = const {},
  }) =>
      _$ComicInfoColoristBuildXmlChildren(
        this,
        builder,
        namespaces: namespaces,
      );

  void buildXmlElement(
    XmlBuilder builder, {
    Map<String, String> namespaces = const {},
  }) =>
      _$ComicInfoColoristBuildXmlElement(
        this,
        builder,
        namespaces: namespaces,
      );

  List<XmlAttribute> toXmlAttributes({
    Map<String, String?> namespaces = const {},
  }) =>
      _$ComicInfoColoristToXmlAttributes(this, namespaces: namespaces);

  List<XmlNode> toXmlChildren({
    Map<String, String?> namespaces = const {},
  }) =>
      _$ComicInfoColoristToXmlChildren(this, namespaces: namespaces);

  XmlElement toXmlElement({
    Map<String, String?> namespaces = const {},
  }) =>
      _$ComicInfoColoristToXmlElement(this, namespaces: namespaces);
}

@annotation.XmlRootElement(name: 'Letterer')
@annotation.XmlSerializable()
class ComicInfoLetterer extends Equatable {
  const ComicInfoLetterer(this.value);

  @annotation.XmlText()
  final String value;

  @override
  List<Object> get props => [value];

  factory ComicInfoLetterer.fromXmlElement(XmlElement element) =>
      _$ComicInfoLettererFromXmlElement(element);

  void buildXmlChildren(
    XmlBuilder builder, {
    Map<String, String> namespaces = const {},
  }) =>
      _$ComicInfoLettererBuildXmlChildren(
        this,
        builder,
        namespaces: namespaces,
      );

  void buildXmlElement(
    XmlBuilder builder, {
    Map<String, String> namespaces = const {},
  }) =>
      _$ComicInfoLettererBuildXmlElement(
        this,
        builder,
        namespaces: namespaces,
      );

  List<XmlAttribute> toXmlAttributes({
    Map<String, String?> namespaces = const {},
  }) =>
      _$ComicInfoLettererToXmlAttributes(this, namespaces: namespaces);

  List<XmlNode> toXmlChildren({
    Map<String, String?> namespaces = const {},
  }) =>
      _$ComicInfoLettererToXmlChildren(this, namespaces: namespaces);

  XmlElement toXmlElement({
    Map<String, String?> namespaces = const {},
  }) =>
      _$ComicInfoLettererToXmlElement(this, namespaces: namespaces);
}

@annotation.XmlRootElement(name: 'CoverArtist')
@annotation.XmlSerializable()
class ComicInfoCoverArtist extends Equatable {
  const ComicInfoCoverArtist(this.value);

  @annotation.XmlText()
  final String value;

  @override
  List<Object> get props => [value];

  factory ComicInfoCoverArtist.fromXmlElement(XmlElement element) =>
      _$ComicInfoCoverArtistFromXmlElement(element);

  void buildXmlChildren(
    XmlBuilder builder, {
    Map<String, String> namespaces = const {},
  }) =>
      _$ComicInfoCoverArtistBuildXmlChildren(
        this,
        builder,
        namespaces: namespaces,
      );

  void buildXmlElement(
    XmlBuilder builder, {
    Map<String, String> namespaces = const {},
  }) =>
      _$ComicInfoCoverArtistBuildXmlElement(
        this,
        builder,
        namespaces: namespaces,
      );

  List<XmlAttribute> toXmlAttributes({
    Map<String, String?> namespaces = const {},
  }) =>
      _$ComicInfoCoverArtistToXmlAttributes(this, namespaces: namespaces);

  List<XmlNode> toXmlChildren({
    Map<String, String?> namespaces = const {},
  }) =>
      _$ComicInfoCoverArtistToXmlChildren(this, namespaces: namespaces);

  XmlElement toXmlElement({
    Map<String, String?> namespaces = const {},
  }) =>
      _$ComicInfoCoverArtistToXmlElement(this, namespaces: namespaces);
}

@annotation.XmlRootElement(name: 'Translator')
@annotation.XmlSerializable()
class ComicInfoTranslator extends Equatable {
  const ComicInfoTranslator(this.value);

  @annotation.XmlText()
  final String value;

  @override
  List<Object> get props => [value];

  factory ComicInfoTranslator.fromXmlElement(XmlElement element) =>
      _$ComicInfoTranslatorFromXmlElement(element);

  void buildXmlChildren(
    XmlBuilder builder, {
    Map<String, String> namespaces = const {},
  }) =>
      _$ComicInfoTranslatorBuildXmlChildren(
        this,
        builder,
        namespaces: namespaces,
      );

  void buildXmlElement(
    XmlBuilder builder, {
    Map<String, String> namespaces = const {},
  }) =>
      _$ComicInfoTranslatorBuildXmlElement(
        this,
        builder,
        namespaces: namespaces,
      );

  List<XmlAttribute> toXmlAttributes({
    Map<String, String?> namespaces = const {},
  }) =>
      _$ComicInfoTranslatorToXmlAttributes(this, namespaces: namespaces);

  List<XmlNode> toXmlChildren({
    Map<String, String?> namespaces = const {},
  }) =>
      _$ComicInfoTranslatorToXmlChildren(this, namespaces: namespaces);

  XmlElement toXmlElement({
    Map<String, String?> namespaces = const {},
  }) =>
      _$ComicInfoTranslatorToXmlElement(this, namespaces: namespaces);
}

@annotation.XmlRootElement(name: 'Genre')
@annotation.XmlSerializable()
class ComicInfoGenre extends Equatable {
  const ComicInfoGenre(this.value);

  @annotation.XmlText()
  final String value;

  @override
  List<Object> get props => [value];

  factory ComicInfoGenre.fromXmlElement(XmlElement element) =>
      _$ComicInfoGenreFromXmlElement(element);

  void buildXmlChildren(
    XmlBuilder builder, {
    Map<String, String> namespaces = const {},
  }) =>
      _$ComicInfoGenreBuildXmlChildren(
        this,
        builder,
        namespaces: namespaces,
      );

  void buildXmlElement(
    XmlBuilder builder, {
    Map<String, String> namespaces = const {},
  }) =>
      _$ComicInfoGenreBuildXmlElement(
        this,
        builder,
        namespaces: namespaces,
      );

  List<XmlAttribute> toXmlAttributes({
    Map<String, String?> namespaces = const {},
  }) =>
      _$ComicInfoGenreToXmlAttributes(this, namespaces: namespaces);

  List<XmlNode> toXmlChildren({
    Map<String, String?> namespaces = const {},
  }) =>
      _$ComicInfoGenreToXmlChildren(this, namespaces: namespaces);

  XmlElement toXmlElement({
    Map<String, String?> namespaces = const {},
  }) =>
      _$ComicInfoGenreToXmlElement(this, namespaces: namespaces);
}

@annotation.XmlRootElement(name: 'Tags')
@annotation.XmlSerializable()
class ComicInfoTags extends Equatable {
  const ComicInfoTags(this.value);

  @annotation.XmlText()
  final String value;

  @override
  List<Object> get props => [value];

  factory ComicInfoTags.fromXmlElement(XmlElement element) =>
      _$ComicInfoTagsFromXmlElement(element);

  void buildXmlChildren(
    XmlBuilder builder, {
    Map<String, String> namespaces = const {},
  }) =>
      _$ComicInfoTagsBuildXmlChildren(
        this,
        builder,
        namespaces: namespaces,
      );

  void buildXmlElement(
    XmlBuilder builder, {
    Map<String, String> namespaces = const {},
  }) =>
      _$ComicInfoTagsBuildXmlElement(
        this,
        builder,
        namespaces: namespaces,
      );

  List<XmlAttribute> toXmlAttributes({
    Map<String, String?> namespaces = const {},
  }) =>
      _$ComicInfoTagsToXmlAttributes(this, namespaces: namespaces);

  List<XmlNode> toXmlChildren({
    Map<String, String?> namespaces = const {},
  }) =>
      _$ComicInfoTagsToXmlChildren(this, namespaces: namespaces);

  XmlElement toXmlElement({
    Map<String, String?> namespaces = const {},
  }) =>
      _$ComicInfoTagsToXmlElement(this, namespaces: namespaces);
}

@annotation.XmlRootElement(name: 'Web')
@annotation.XmlSerializable()
class ComicInfoWeb extends Equatable {
  const ComicInfoWeb(this.value);

  @annotation.XmlText()
  final String value;

  @override
  List<Object> get props => [value];

  factory ComicInfoWeb.fromXmlElement(XmlElement element) =>
      _$ComicInfoWebFromXmlElement(element);

  void buildXmlChildren(
    XmlBuilder builder, {
    Map<String, String> namespaces = const {},
  }) =>
      _$ComicInfoWebBuildXmlChildren(
        this,
        builder,
        namespaces: namespaces,
      );

  void buildXmlElement(
    XmlBuilder builder, {
    Map<String, String> namespaces = const {},
  }) =>
      _$ComicInfoWebBuildXmlElement(
        this,
        builder,
        namespaces: namespaces,
      );

  List<XmlAttribute> toXmlAttributes({
    Map<String, String?> namespaces = const {},
  }) =>
      _$ComicInfoWebToXmlAttributes(this, namespaces: namespaces);

  List<XmlNode> toXmlChildren({
    Map<String, String?> namespaces = const {},
  }) =>
      _$ComicInfoWebToXmlChildren(this, namespaces: namespaces);

  XmlElement toXmlElement({
    Map<String, String?> namespaces = const {},
  }) =>
      _$ComicInfoWebToXmlElement(this, namespaces: namespaces);
}

@annotation.XmlRootElement(name: 'PublishingStatusTachiyomi')
@annotation.XmlSerializable()
class PublishingStatusTachiyomi extends Equatable {
  const PublishingStatusTachiyomi(this.value);

  @annotation.XmlText()
  final String value;

  @override
  List<Object> get props => [value];

  factory PublishingStatusTachiyomi.fromXmlElement(XmlElement element) =>
      _$PublishingStatusTachiyomiFromXmlElement(element);

  void buildXmlChildren(
    XmlBuilder builder, {
    Map<String, String> namespaces = const {},
  }) =>
      _$PublishingStatusTachiyomiBuildXmlChildren(
        this,
        builder,
        namespaces: namespaces,
      );

  void buildXmlElement(
    XmlBuilder builder, {
    Map<String, String> namespaces = const {},
  }) =>
      _$PublishingStatusTachiyomiBuildXmlElement(
        this,
        builder,
        namespaces: namespaces,
      );

  List<XmlAttribute> toXmlAttributes({
    Map<String, String?> namespaces = const {},
  }) =>
      _$PublishingStatusTachiyomiToXmlAttributes(this, namespaces: namespaces);

  List<XmlNode> toXmlChildren({
    Map<String, String?> namespaces = const {},
  }) =>
      _$PublishingStatusTachiyomiToXmlChildren(this, namespaces: namespaces);

  XmlElement toXmlElement({
    Map<String, String?> namespaces = const {},
  }) =>
      _$PublishingStatusTachiyomiToXmlElement(this, namespaces: namespaces);
}

@annotation.XmlRootElement(name: 'CategoriesTachiyomi')
@annotation.XmlSerializable()
class CategoriesTachiyomi extends Equatable {
  const CategoriesTachiyomi(this.value);

  @annotation.XmlText()
  final String value;

  @override
  List<Object> get props => [value];

  factory CategoriesTachiyomi.fromXmlElement(XmlElement element) =>
      _$CategoriesTachiyomiFromXmlElement(element);

  void buildXmlChildren(
    XmlBuilder builder, {
    Map<String, String> namespaces = const {},
  }) =>
      _$CategoriesTachiyomiBuildXmlChildren(
        this,
        builder,
        namespaces: namespaces,
      );

  void buildXmlElement(
    XmlBuilder builder, {
    Map<String, String> namespaces = const {},
  }) =>
      _$CategoriesTachiyomiBuildXmlElement(
        this,
        builder,
        namespaces: namespaces,
      );

  List<XmlAttribute> toXmlAttributes({
    Map<String, String?> namespaces = const {},
  }) =>
      _$CategoriesTachiyomiToXmlAttributes(this, namespaces: namespaces);

  List<XmlNode> toXmlChildren({
    Map<String, String?> namespaces = const {},
  }) =>
      _$CategoriesTachiyomiToXmlChildren(this, namespaces: namespaces);

  XmlElement toXmlElement({
    Map<String, String?> namespaces = const {},
  }) =>
      _$CategoriesTachiyomiToXmlElement(this, namespaces: namespaces);
}

enum ComicInfoPublishingStatus {
  ongoing("Ongoing", SManga.ongoing),
  completed("Completed", SManga.completed),
  licensed("Licensed", SManga.licensed),
  publishingFinished("Publishing finished", SManga.publishingFinished),
  cancelled("Cancelled", SManga.cancelled),
  onHiatus("On hiatus", SManga.onHiatus),
  unknown("Unknown", SManga.unknown);

  final String comicInfoValue;
  final int sMangaModelValue;
  const ComicInfoPublishingStatus(this.comicInfoValue, this.sMangaModelValue);

  static String toComicInfoValue(int value) =>
      ComicInfoPublishingStatus.values
          .firstWhereOrNull((it) => it.sMangaModelValue == value)
          ?.comicInfoValue ??
      unknown.comicInfoValue;

  static int toSMangaValue(String? value) =>
      ComicInfoPublishingStatus.values
          .firstWhereOrNull((it) => it.comicInfoValue == value)
          ?.sMangaModelValue ??
      unknown.sMangaModelValue;
}
