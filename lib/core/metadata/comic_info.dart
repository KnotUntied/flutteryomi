import 'package:collection/collection.dart';
import 'package:dartx/dartx.dart' hide IterableWhereNotNull;
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:xml/xml.dart';
// Too verbose >:(
import 'package:xml_annotation/xml_annotation.dart' as annotation;

import 'package:flutteryomi/domain/source/model/smanga.dart';

part 'comic_info.freezed.dart';
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
    ]
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

    status = ComicInfoPublishingStatus.toSMangaValue(comicInfo.publishingStatus?.value);
  }
}

@annotation.XmlRootElement(name: 'ComicInfo')
@annotation.XmlSerializable()
@freezed
class ComicInfo with _$ComicInfo {
  const factory ComicInfo({
    @annotation.XmlElement(name: 'Title') ComicInfoTitle? title,
    @annotation.XmlElement(name: 'Series') ComicInfoSeries? series,
    @annotation.XmlElement(name: 'Number') ComicInfoNumber? number,
    @annotation.XmlElement(name: 'Summary') ComicInfoSummary? summary,
    @annotation.XmlElement(name: 'Writer') ComicInfoWriter? writer,
    @annotation.XmlElement(name: 'Penciller') ComicInfoPenciller? penciller,
    @annotation.XmlElement(name: 'Inker') ComicInfoInker? inker,
    @annotation.XmlElement(name: 'Colorist') ComicInfoColorist? colorist,
    @annotation.XmlElement(name: 'Letterer') ComicInfoLetterer? letterer,
    @annotation.XmlElement(name: 'CoverArtist') ComicInfoCoverArtist? coverArtist,
    @annotation.XmlElement(name: 'Translator') ComicInfoTranslator? translator,
    @annotation.XmlElement(name: 'Genre') ComicInfoGenre? genre,
    @annotation.XmlElement(name: 'Tags') ComicInfoTags? tags,
    @annotation.XmlElement(name: 'Web') ComicInfoWeb? web,
    @annotation.XmlElement(name: 'PublishingStatusTachiyomi') PublishingStatusTachiyomi? publishingStatus,
    @annotation.XmlElement(name: 'CategoriesTachiyomi') CategoriesTachiyomi? categories,
  }) = _ComicInfo;

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
  }) => _$ComicInfoToXmlAttributes(this, namespaces: namespaces);

  List<XmlNode> toXmlChildren({
    Map<String, String?> namespaces = const {},
  }) => _$ComicInfoToXmlChildren(this, namespaces: namespaces);

  XmlElement toXmlElement({
    Map<String, String?> namespaces = const {},
  }) => _$ComicInfoToXmlElement(this, namespaces: namespaces);
}

@annotation.XmlRootElement(name: 'Title')
@annotation.XmlSerializable()
@freezed
class ComicInfoTitle with _$ComicInfoTitle {
  const factory ComicInfoTitle(
    @annotation.XmlText() String value,
  ) = _ComicInfoTitle;

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
  }) => _$ComicInfoTitleToXmlAttributes(this, namespaces: namespaces);

  List<XmlNode> toXmlChildren({
    Map<String, String?> namespaces = const {},
  }) => _$ComicInfoTitleToXmlChildren(this, namespaces: namespaces);

  XmlElement toXmlElement({
    Map<String, String?> namespaces = const {},
  }) => _$ComicInfoTitleToXmlElement(this, namespaces: namespaces);
}

@annotation.XmlRootElement(name: 'Series')
@annotation.XmlSerializable()
@freezed
class ComicInfoSeries with _$ComicInfoSeries {
  const factory ComicInfoSeries(
    @annotation.XmlText() String value,
  ) = _ComicInfoSeries;

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
  }) => _$ComicInfoSeriesToXmlAttributes(this, namespaces: namespaces);

  List<XmlNode> toXmlChildren({
    Map<String, String?> namespaces = const {},
  }) => _$ComicInfoSeriesToXmlChildren(this, namespaces: namespaces);

  XmlElement toXmlElement({
    Map<String, String?> namespaces = const {},
  }) => _$ComicInfoSeriesToXmlElement(this, namespaces: namespaces);
}

@annotation.XmlRootElement(name: 'Number')
@annotation.XmlSerializable()
@freezed
class ComicInfoNumber with _$ComicInfoNumber {
  const factory ComicInfoNumber(
    @annotation.XmlText() String value,
  ) = _ComicInfoNumber;

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
  }) => _$ComicInfoNumberToXmlAttributes(this, namespaces: namespaces);

  List<XmlNode> toXmlChildren({
    Map<String, String?> namespaces = const {},
  }) => _$ComicInfoNumberToXmlChildren(this, namespaces: namespaces);

  XmlElement toXmlElement({
    Map<String, String?> namespaces = const {},
  }) => _$ComicInfoNumberToXmlElement(this, namespaces: namespaces);
}

@annotation.XmlRootElement(name: 'Summary')
@annotation.XmlSerializable()
@freezed
class ComicInfoSummary with _$ComicInfoSummary {
  const factory ComicInfoSummary(
    @annotation.XmlText() String value,
  ) = _ComicInfoSummary;

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
  }) => _$ComicInfoSummaryToXmlAttributes(this, namespaces: namespaces);

  List<XmlNode> toXmlChildren({
    Map<String, String?> namespaces = const {},
  }) => _$ComicInfoSummaryToXmlChildren(this, namespaces: namespaces);

  XmlElement toXmlElement({
    Map<String, String?> namespaces = const {},
  }) => _$ComicInfoSummaryToXmlElement(this, namespaces: namespaces);
}

@annotation.XmlRootElement(name: 'Writer')
@annotation.XmlSerializable()
@freezed
class ComicInfoWriter with _$ComicInfoWriter {
  const factory ComicInfoWriter(
    @annotation.XmlText() String value,
  ) = _ComicInfoWriter;

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
  }) => _$ComicInfoWriterToXmlAttributes(this, namespaces: namespaces);

  List<XmlNode> toXmlChildren({
    Map<String, String?> namespaces = const {},
  }) => _$ComicInfoWriterToXmlChildren(this, namespaces: namespaces);

  XmlElement toXmlElement({
    Map<String, String?> namespaces = const {},
  }) => _$ComicInfoWriterToXmlElement(this, namespaces: namespaces);
}

@annotation.XmlRootElement(name: 'Penciller')
@annotation.XmlSerializable()
@freezed
class ComicInfoPenciller with _$ComicInfoPenciller {
  const factory ComicInfoPenciller(
    @annotation.XmlText() String value,
  ) = _ComicInfoPenciller;

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
  }) => _$ComicInfoPencillerToXmlAttributes(this, namespaces: namespaces);

  List<XmlNode> toXmlChildren({
    Map<String, String?> namespaces = const {},
  }) => _$ComicInfoPencillerToXmlChildren(this, namespaces: namespaces);

  XmlElement toXmlElement({
    Map<String, String?> namespaces = const {},
  }) => _$ComicInfoPencillerToXmlElement(this, namespaces: namespaces);
}

@annotation.XmlRootElement(name: 'Inker')
@annotation.XmlSerializable()
@freezed
class ComicInfoInker with _$ComicInfoInker {
  const factory ComicInfoInker(
    @annotation.XmlText() String value,
  ) = _ComicInfoInker;

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
  }) => _$ComicInfoInkerToXmlAttributes(this, namespaces: namespaces);

  List<XmlNode> toXmlChildren({
    Map<String, String?> namespaces = const {},
  }) => _$ComicInfoInkerToXmlChildren(this, namespaces: namespaces);

  XmlElement toXmlElement({
    Map<String, String?> namespaces = const {},
  }) => _$ComicInfoInkerToXmlElement(this, namespaces: namespaces);
}

@annotation.XmlRootElement(name: 'Colorist')
@annotation.XmlSerializable()
@freezed
class ComicInfoColorist with _$ComicInfoColorist {
  const factory ComicInfoColorist(
    @annotation.XmlText() String value,
  ) = _ComicInfoColorist;

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
  }) => _$ComicInfoColoristToXmlAttributes(this, namespaces: namespaces);

  List<XmlNode> toXmlChildren({
    Map<String, String?> namespaces = const {},
  }) => _$ComicInfoColoristToXmlChildren(this, namespaces: namespaces);

  XmlElement toXmlElement({
    Map<String, String?> namespaces = const {},
  }) => _$ComicInfoColoristToXmlElement(this, namespaces: namespaces);
}

@annotation.XmlRootElement(name: 'Letterer')
@annotation.XmlSerializable()
@freezed
class ComicInfoLetterer with _$ComicInfoLetterer {
  const factory ComicInfoLetterer(
    @annotation.XmlText() String value,
  ) = _ComicInfoLetterer;

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
  }) => _$ComicInfoLettererToXmlAttributes(this, namespaces: namespaces);

  List<XmlNode> toXmlChildren({
    Map<String, String?> namespaces = const {},
  }) => _$ComicInfoLettererToXmlChildren(this, namespaces: namespaces);

  XmlElement toXmlElement({
    Map<String, String?> namespaces = const {},
  }) => _$ComicInfoLettererToXmlElement(this, namespaces: namespaces);
}

@annotation.XmlRootElement(name: 'CoverArtist')
@annotation.XmlSerializable()
@freezed
class ComicInfoCoverArtist with _$ComicInfoCoverArtist {
  const factory ComicInfoCoverArtist(
    @annotation.XmlText() String value,
  ) = _ComicInfoCoverArtist;

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
  }) => _$ComicInfoCoverArtistToXmlAttributes(this, namespaces: namespaces);

  List<XmlNode> toXmlChildren({
    Map<String, String?> namespaces = const {},
  }) => _$ComicInfoCoverArtistToXmlChildren(this, namespaces: namespaces);

  XmlElement toXmlElement({
    Map<String, String?> namespaces = const {},
  }) => _$ComicInfoCoverArtistToXmlElement(this, namespaces: namespaces);
}

@annotation.XmlRootElement(name: 'Translator')
@annotation.XmlSerializable()
@freezed
class ComicInfoTranslator with _$ComicInfoTranslator {
  const factory ComicInfoTranslator(
    @annotation.XmlText() String value,
  ) = _ComicInfoTranslator;

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
  }) => _$ComicInfoTranslatorToXmlAttributes(this, namespaces: namespaces);

  List<XmlNode> toXmlChildren({
    Map<String, String?> namespaces = const {},
  }) => _$ComicInfoTranslatorToXmlChildren(this, namespaces: namespaces);

  XmlElement toXmlElement({
    Map<String, String?> namespaces = const {},
  }) => _$ComicInfoTranslatorToXmlElement(this, namespaces: namespaces);
}

@annotation.XmlRootElement(name: 'Genre')
@annotation.XmlSerializable()
@freezed
class ComicInfoGenre with _$ComicInfoGenre {
  const factory ComicInfoGenre(
    @annotation.XmlText() String value,
  ) = _ComicInfoGenre;

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
  }) => _$ComicInfoGenreToXmlAttributes(this, namespaces: namespaces);

  List<XmlNode> toXmlChildren({
    Map<String, String?> namespaces = const {},
  }) => _$ComicInfoGenreToXmlChildren(this, namespaces: namespaces);

  XmlElement toXmlElement({
    Map<String, String?> namespaces = const {},
  }) => _$ComicInfoGenreToXmlElement(this, namespaces: namespaces);
}

@annotation.XmlRootElement(name: 'Tags')
@annotation.XmlSerializable()
@freezed
class ComicInfoTags with _$ComicInfoTags {
  const factory ComicInfoTags(
    @annotation.XmlText() String value,
  ) = _ComicInfoTags;

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
  }) => _$ComicInfoTagsToXmlAttributes(this, namespaces: namespaces);

  List<XmlNode> toXmlChildren({
    Map<String, String?> namespaces = const {},
  }) => _$ComicInfoTagsToXmlChildren(this, namespaces: namespaces);

  XmlElement toXmlElement({
    Map<String, String?> namespaces = const {},
  }) => _$ComicInfoTagsToXmlElement(this, namespaces: namespaces);
}

@annotation.XmlRootElement(name: 'Web')
@annotation.XmlSerializable()
@freezed
class ComicInfoWeb with _$ComicInfoWeb {
  const factory ComicInfoWeb(
    @annotation.XmlText() String value,
  ) = _ComicInfoWeb;

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
  }) => _$ComicInfoWebToXmlAttributes(this, namespaces: namespaces);

  List<XmlNode> toXmlChildren({
    Map<String, String?> namespaces = const {},
  }) => _$ComicInfoWebToXmlChildren(this, namespaces: namespaces);

  XmlElement toXmlElement({
    Map<String, String?> namespaces = const {},
  }) => _$ComicInfoWebToXmlElement(this, namespaces: namespaces);
}

@annotation.XmlRootElement(name: 'PublishingStatusTachiyomi')
@annotation.XmlSerializable()
@freezed
class PublishingStatusTachiyomi with _$PublishingStatusTachiyomi {
  const factory PublishingStatusTachiyomi(
    @annotation.XmlText() String value,
  ) = _PublishingStatusTachiyomi;

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
  }) => _$PublishingStatusTachiyomiToXmlAttributes(this, namespaces: namespaces);

  List<XmlNode> toXmlChildren({
    Map<String, String?> namespaces = const {},
  }) => _$PublishingStatusTachiyomiToXmlChildren(this, namespaces: namespaces);

  XmlElement toXmlElement({
    Map<String, String?> namespaces = const {},
  }) => _$PublishingStatusTachiyomiToXmlElement(this, namespaces: namespaces);
}

@annotation.XmlRootElement(name: 'CategoriesTachiyomi')
@annotation.XmlSerializable()
@freezed
class CategoriesTachiyomi with _$CategoriesTachiyomi {
  const factory CategoriesTachiyomi(
    @annotation.XmlText() String value,
  ) = _CategoriesTachiyomi;

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
  }) => _$CategoriesTachiyomiToXmlAttributes(this, namespaces: namespaces);

  List<XmlNode> toXmlChildren({
    Map<String, String?> namespaces = const {},
  }) => _$CategoriesTachiyomiToXmlChildren(this, namespaces: namespaces);

  XmlElement toXmlElement({
    Map<String, String?> namespaces = const {},
  }) => _$CategoriesTachiyomiToXmlElement(this, namespaces: namespaces);
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
      ComicInfoPublishingStatus
          .values
          .firstWhereOrNull((it) => it.sMangaModelValue == value)
          ?.comicInfoValue
          ?? unknown.comicInfoValue;

  static int toSMangaValue(String? value) =>
      ComicInfoPublishingStatus
          .values
          .firstWhereOrNull((it) => it.comicInfoValue == value)
          ?.sMangaModelValue
          ?? unknown.sMangaModelValue;
}
