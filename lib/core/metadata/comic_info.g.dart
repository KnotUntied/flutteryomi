// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comic_info.dart';

// **************************************************************************
// XmlSerializableGenerator
// **************************************************************************

void _$ComicInfoBuildXmlChildren(ComicInfo instance, XmlBuilder builder,
    {Map<String, String> namespaces = const {}}) {
  final title = instance.title;
  final titleSerialized = title;
  builder.element('Title', nest: () {
    if (titleSerialized != null) {
      titleSerialized.buildXmlChildren(builder, namespaces: namespaces);
    }
  });
  final series = instance.series;
  final seriesSerialized = series;
  builder.element('Series', nest: () {
    if (seriesSerialized != null) {
      seriesSerialized.buildXmlChildren(builder, namespaces: namespaces);
    }
  });
  final number = instance.number;
  final numberSerialized = number;
  builder.element('Number', nest: () {
    if (numberSerialized != null) {
      numberSerialized.buildXmlChildren(builder, namespaces: namespaces);
    }
  });
  final summary = instance.summary;
  final summarySerialized = summary;
  builder.element('Summary', nest: () {
    if (summarySerialized != null) {
      summarySerialized.buildXmlChildren(builder, namespaces: namespaces);
    }
  });
  final writer = instance.writer;
  final writerSerialized = writer;
  builder.element('Writer', nest: () {
    if (writerSerialized != null) {
      writerSerialized.buildXmlChildren(builder, namespaces: namespaces);
    }
  });
  final penciller = instance.penciller;
  final pencillerSerialized = penciller;
  builder.element('Penciller', nest: () {
    if (pencillerSerialized != null) {
      pencillerSerialized.buildXmlChildren(builder, namespaces: namespaces);
    }
  });
  final inker = instance.inker;
  final inkerSerialized = inker;
  builder.element('Inker', nest: () {
    if (inkerSerialized != null) {
      inkerSerialized.buildXmlChildren(builder, namespaces: namespaces);
    }
  });
  final colorist = instance.colorist;
  final coloristSerialized = colorist;
  builder.element('Colorist', nest: () {
    if (coloristSerialized != null) {
      coloristSerialized.buildXmlChildren(builder, namespaces: namespaces);
    }
  });
  final letterer = instance.letterer;
  final lettererSerialized = letterer;
  builder.element('Letterer', nest: () {
    if (lettererSerialized != null) {
      lettererSerialized.buildXmlChildren(builder, namespaces: namespaces);
    }
  });
  final coverArtist = instance.coverArtist;
  final coverArtistSerialized = coverArtist;
  builder.element('CoverArtist', nest: () {
    if (coverArtistSerialized != null) {
      coverArtistSerialized.buildXmlChildren(builder, namespaces: namespaces);
    }
  });
  final translator = instance.translator;
  final translatorSerialized = translator;
  builder.element('Translator', nest: () {
    if (translatorSerialized != null) {
      translatorSerialized.buildXmlChildren(builder, namespaces: namespaces);
    }
  });
  final genre = instance.genre;
  final genreSerialized = genre;
  builder.element('Genre', nest: () {
    if (genreSerialized != null) {
      genreSerialized.buildXmlChildren(builder, namespaces: namespaces);
    }
  });
  final tags = instance.tags;
  final tagsSerialized = tags;
  builder.element('Tags', nest: () {
    if (tagsSerialized != null) {
      tagsSerialized.buildXmlChildren(builder, namespaces: namespaces);
    }
  });
  final web = instance.web;
  final webSerialized = web;
  builder.element('Web', nest: () {
    if (webSerialized != null) {
      webSerialized.buildXmlChildren(builder, namespaces: namespaces);
    }
  });
  final publishingStatus = instance.publishingStatus;
  final publishingStatusSerialized = publishingStatus;
  builder.element('PublishingStatusTachiyomi', nest: () {
    if (publishingStatusSerialized != null) {
      publishingStatusSerialized.buildXmlChildren(builder,
          namespaces: namespaces);
    }
  });
  final categories = instance.categories;
  final categoriesSerialized = categories;
  builder.element('CategoriesTachiyomi', nest: () {
    if (categoriesSerialized != null) {
      categoriesSerialized.buildXmlChildren(builder, namespaces: namespaces);
    }
  });
}

void _$ComicInfoBuildXmlElement(ComicInfo instance, XmlBuilder builder,
    {Map<String, String> namespaces = const {}}) {
  builder.element('ComicInfo', namespaces: namespaces, nest: () {
    instance.buildXmlChildren(builder, namespaces: namespaces);
  });
}

ComicInfo _$ComicInfoFromXmlElement(XmlElement element) {
  final title = element.getElement('Title');
  final series = element.getElement('Series');
  final number = element.getElement('Number');
  final summary = element.getElement('Summary');
  final writer = element.getElement('Writer');
  final penciller = element.getElement('Penciller');
  final inker = element.getElement('Inker');
  final colorist = element.getElement('Colorist');
  final letterer = element.getElement('Letterer');
  final coverArtist = element.getElement('CoverArtist');
  final translator = element.getElement('Translator');
  final genre = element.getElement('Genre');
  final tags = element.getElement('Tags');
  final web = element.getElement('Web');
  final publishingStatus = element.getElement('PublishingStatusTachiyomi');
  final categories = element.getElement('CategoriesTachiyomi');
  return ComicInfo(
      title: title != null ? ComicInfoTitle.fromXmlElement(title) : null,
      series: series != null ? ComicInfoSeries.fromXmlElement(series) : null,
      number: number != null ? ComicInfoNumber.fromXmlElement(number) : null,
      summary:
          summary != null ? ComicInfoSummary.fromXmlElement(summary) : null,
      writer: writer != null ? ComicInfoWriter.fromXmlElement(writer) : null,
      penciller: penciller != null
          ? ComicInfoPenciller.fromXmlElement(penciller)
          : null,
      inker: inker != null ? ComicInfoInker.fromXmlElement(inker) : null,
      colorist:
          colorist != null ? ComicInfoColorist.fromXmlElement(colorist) : null,
      letterer:
          letterer != null ? ComicInfoLetterer.fromXmlElement(letterer) : null,
      coverArtist: coverArtist != null
          ? ComicInfoCoverArtist.fromXmlElement(coverArtist)
          : null,
      translator: translator != null
          ? ComicInfoTranslator.fromXmlElement(translator)
          : null,
      genre: genre != null ? ComicInfoGenre.fromXmlElement(genre) : null,
      tags: tags != null ? ComicInfoTags.fromXmlElement(tags) : null,
      web: web != null ? ComicInfoWeb.fromXmlElement(web) : null,
      publishingStatus: publishingStatus != null
          ? PublishingStatusTachiyomi.fromXmlElement(publishingStatus)
          : null,
      categories: categories != null
          ? CategoriesTachiyomi.fromXmlElement(categories)
          : null);
}

List<XmlAttribute> _$ComicInfoToXmlAttributes(ComicInfo instance,
    {Map<String, String?> namespaces = const {}}) {
  final attributes = <XmlAttribute>[];
  return attributes;
}

List<XmlNode> _$ComicInfoToXmlChildren(ComicInfo instance,
    {Map<String, String?> namespaces = const {}}) {
  final children = <XmlNode>[];
  final title = instance.title;
  final titleSerialized = title;
  final titleConstructed = XmlElement(
      XmlName('Title'),
      titleSerialized?.toXmlAttributes(namespaces: namespaces) ?? [],
      titleSerialized?.toXmlChildren(namespaces: namespaces) ?? []);
  children.add(titleConstructed);
  final series = instance.series;
  final seriesSerialized = series;
  final seriesConstructed = XmlElement(
      XmlName('Series'),
      seriesSerialized?.toXmlAttributes(namespaces: namespaces) ?? [],
      seriesSerialized?.toXmlChildren(namespaces: namespaces) ?? []);
  children.add(seriesConstructed);
  final number = instance.number;
  final numberSerialized = number;
  final numberConstructed = XmlElement(
      XmlName('Number'),
      numberSerialized?.toXmlAttributes(namespaces: namespaces) ?? [],
      numberSerialized?.toXmlChildren(namespaces: namespaces) ?? []);
  children.add(numberConstructed);
  final summary = instance.summary;
  final summarySerialized = summary;
  final summaryConstructed = XmlElement(
      XmlName('Summary'),
      summarySerialized?.toXmlAttributes(namespaces: namespaces) ?? [],
      summarySerialized?.toXmlChildren(namespaces: namespaces) ?? []);
  children.add(summaryConstructed);
  final writer = instance.writer;
  final writerSerialized = writer;
  final writerConstructed = XmlElement(
      XmlName('Writer'),
      writerSerialized?.toXmlAttributes(namespaces: namespaces) ?? [],
      writerSerialized?.toXmlChildren(namespaces: namespaces) ?? []);
  children.add(writerConstructed);
  final penciller = instance.penciller;
  final pencillerSerialized = penciller;
  final pencillerConstructed = XmlElement(
      XmlName('Penciller'),
      pencillerSerialized?.toXmlAttributes(namespaces: namespaces) ?? [],
      pencillerSerialized?.toXmlChildren(namespaces: namespaces) ?? []);
  children.add(pencillerConstructed);
  final inker = instance.inker;
  final inkerSerialized = inker;
  final inkerConstructed = XmlElement(
      XmlName('Inker'),
      inkerSerialized?.toXmlAttributes(namespaces: namespaces) ?? [],
      inkerSerialized?.toXmlChildren(namespaces: namespaces) ?? []);
  children.add(inkerConstructed);
  final colorist = instance.colorist;
  final coloristSerialized = colorist;
  final coloristConstructed = XmlElement(
      XmlName('Colorist'),
      coloristSerialized?.toXmlAttributes(namespaces: namespaces) ?? [],
      coloristSerialized?.toXmlChildren(namespaces: namespaces) ?? []);
  children.add(coloristConstructed);
  final letterer = instance.letterer;
  final lettererSerialized = letterer;
  final lettererConstructed = XmlElement(
      XmlName('Letterer'),
      lettererSerialized?.toXmlAttributes(namespaces: namespaces) ?? [],
      lettererSerialized?.toXmlChildren(namespaces: namespaces) ?? []);
  children.add(lettererConstructed);
  final coverArtist = instance.coverArtist;
  final coverArtistSerialized = coverArtist;
  final coverArtistConstructed = XmlElement(
      XmlName('CoverArtist'),
      coverArtistSerialized?.toXmlAttributes(namespaces: namespaces) ?? [],
      coverArtistSerialized?.toXmlChildren(namespaces: namespaces) ?? []);
  children.add(coverArtistConstructed);
  final translator = instance.translator;
  final translatorSerialized = translator;
  final translatorConstructed = XmlElement(
      XmlName('Translator'),
      translatorSerialized?.toXmlAttributes(namespaces: namespaces) ?? [],
      translatorSerialized?.toXmlChildren(namespaces: namespaces) ?? []);
  children.add(translatorConstructed);
  final genre = instance.genre;
  final genreSerialized = genre;
  final genreConstructed = XmlElement(
      XmlName('Genre'),
      genreSerialized?.toXmlAttributes(namespaces: namespaces) ?? [],
      genreSerialized?.toXmlChildren(namespaces: namespaces) ?? []);
  children.add(genreConstructed);
  final tags = instance.tags;
  final tagsSerialized = tags;
  final tagsConstructed = XmlElement(
      XmlName('Tags'),
      tagsSerialized?.toXmlAttributes(namespaces: namespaces) ?? [],
      tagsSerialized?.toXmlChildren(namespaces: namespaces) ?? []);
  children.add(tagsConstructed);
  final web = instance.web;
  final webSerialized = web;
  final webConstructed = XmlElement(
      XmlName('Web'),
      webSerialized?.toXmlAttributes(namespaces: namespaces) ?? [],
      webSerialized?.toXmlChildren(namespaces: namespaces) ?? []);
  children.add(webConstructed);
  final publishingStatus = instance.publishingStatus;
  final publishingStatusSerialized = publishingStatus;
  final publishingStatusConstructed = XmlElement(
      XmlName('PublishingStatusTachiyomi'),
      publishingStatusSerialized?.toXmlAttributes(namespaces: namespaces) ?? [],
      publishingStatusSerialized?.toXmlChildren(namespaces: namespaces) ?? []);
  children.add(publishingStatusConstructed);
  final categories = instance.categories;
  final categoriesSerialized = categories;
  final categoriesConstructed = XmlElement(
      XmlName('CategoriesTachiyomi'),
      categoriesSerialized?.toXmlAttributes(namespaces: namespaces) ?? [],
      categoriesSerialized?.toXmlChildren(namespaces: namespaces) ?? []);
  children.add(categoriesConstructed);
  return children;
}

XmlElement _$ComicInfoToXmlElement(ComicInfo instance,
    {Map<String, String?> namespaces = const {}}) {
  return XmlElement(
      XmlName('ComicInfo'),
      [
        ...namespaces.toXmlAttributes(),
        ...instance.toXmlAttributes(namespaces: namespaces)
      ],
      instance.toXmlChildren(namespaces: namespaces));
}

void _$ComicInfoTitleBuildXmlChildren(
    ComicInfoTitle instance, XmlBuilder builder,
    {Map<String, String> namespaces = const {}}) {
  final value = instance.value;
  final valueSerialized = value;
  builder.text(valueSerialized);
}

void _$ComicInfoTitleBuildXmlElement(
    ComicInfoTitle instance, XmlBuilder builder,
    {Map<String, String> namespaces = const {}}) {
  builder.element('Title', namespaces: namespaces, nest: () {
    instance.buildXmlChildren(builder, namespaces: namespaces);
  });
}

ComicInfoTitle _$ComicInfoTitleFromXmlElement(XmlElement element) {
  final value = element.getText()!;
  return ComicInfoTitle(value: value);
}

List<XmlAttribute> _$ComicInfoTitleToXmlAttributes(ComicInfoTitle instance,
    {Map<String, String?> namespaces = const {}}) {
  final attributes = <XmlAttribute>[];
  return attributes;
}

List<XmlNode> _$ComicInfoTitleToXmlChildren(ComicInfoTitle instance,
    {Map<String, String?> namespaces = const {}}) {
  final children = <XmlNode>[];
  final value = instance.value;
  final valueSerialized = value;
  final valueConstructed = XmlText(valueSerialized);
  children.add(valueConstructed);
  return children;
}

XmlElement _$ComicInfoTitleToXmlElement(ComicInfoTitle instance,
    {Map<String, String?> namespaces = const {}}) {
  return XmlElement(
      XmlName('Title'),
      [
        ...namespaces.toXmlAttributes(),
        ...instance.toXmlAttributes(namespaces: namespaces)
      ],
      instance.toXmlChildren(namespaces: namespaces));
}

void _$ComicInfoSeriesBuildXmlChildren(
    ComicInfoSeries instance, XmlBuilder builder,
    {Map<String, String> namespaces = const {}}) {
  final value = instance.value;
  final valueSerialized = value;
  builder.text(valueSerialized);
}

void _$ComicInfoSeriesBuildXmlElement(
    ComicInfoSeries instance, XmlBuilder builder,
    {Map<String, String> namespaces = const {}}) {
  builder.element('Series', namespaces: namespaces, nest: () {
    instance.buildXmlChildren(builder, namespaces: namespaces);
  });
}

ComicInfoSeries _$ComicInfoSeriesFromXmlElement(XmlElement element) {
  final value = element.getText()!;
  return ComicInfoSeries(value: value);
}

List<XmlAttribute> _$ComicInfoSeriesToXmlAttributes(ComicInfoSeries instance,
    {Map<String, String?> namespaces = const {}}) {
  final attributes = <XmlAttribute>[];
  return attributes;
}

List<XmlNode> _$ComicInfoSeriesToXmlChildren(ComicInfoSeries instance,
    {Map<String, String?> namespaces = const {}}) {
  final children = <XmlNode>[];
  final value = instance.value;
  final valueSerialized = value;
  final valueConstructed = XmlText(valueSerialized);
  children.add(valueConstructed);
  return children;
}

XmlElement _$ComicInfoSeriesToXmlElement(ComicInfoSeries instance,
    {Map<String, String?> namespaces = const {}}) {
  return XmlElement(
      XmlName('Series'),
      [
        ...namespaces.toXmlAttributes(),
        ...instance.toXmlAttributes(namespaces: namespaces)
      ],
      instance.toXmlChildren(namespaces: namespaces));
}

void _$ComicInfoNumberBuildXmlChildren(
    ComicInfoNumber instance, XmlBuilder builder,
    {Map<String, String> namespaces = const {}}) {
  final value = instance.value;
  final valueSerialized = value;
  builder.text(valueSerialized);
}

void _$ComicInfoNumberBuildXmlElement(
    ComicInfoNumber instance, XmlBuilder builder,
    {Map<String, String> namespaces = const {}}) {
  builder.element('Number', namespaces: namespaces, nest: () {
    instance.buildXmlChildren(builder, namespaces: namespaces);
  });
}

ComicInfoNumber _$ComicInfoNumberFromXmlElement(XmlElement element) {
  final value = element.getText()!;
  return ComicInfoNumber(value: value);
}

List<XmlAttribute> _$ComicInfoNumberToXmlAttributes(ComicInfoNumber instance,
    {Map<String, String?> namespaces = const {}}) {
  final attributes = <XmlAttribute>[];
  return attributes;
}

List<XmlNode> _$ComicInfoNumberToXmlChildren(ComicInfoNumber instance,
    {Map<String, String?> namespaces = const {}}) {
  final children = <XmlNode>[];
  final value = instance.value;
  final valueSerialized = value;
  final valueConstructed = XmlText(valueSerialized);
  children.add(valueConstructed);
  return children;
}

XmlElement _$ComicInfoNumberToXmlElement(ComicInfoNumber instance,
    {Map<String, String?> namespaces = const {}}) {
  return XmlElement(
      XmlName('Number'),
      [
        ...namespaces.toXmlAttributes(),
        ...instance.toXmlAttributes(namespaces: namespaces)
      ],
      instance.toXmlChildren(namespaces: namespaces));
}

void _$ComicInfoSummaryBuildXmlChildren(
    ComicInfoSummary instance, XmlBuilder builder,
    {Map<String, String> namespaces = const {}}) {
  final value = instance.value;
  final valueSerialized = value;
  builder.text(valueSerialized);
}

void _$ComicInfoSummaryBuildXmlElement(
    ComicInfoSummary instance, XmlBuilder builder,
    {Map<String, String> namespaces = const {}}) {
  builder.element('Summary', namespaces: namespaces, nest: () {
    instance.buildXmlChildren(builder, namespaces: namespaces);
  });
}

ComicInfoSummary _$ComicInfoSummaryFromXmlElement(XmlElement element) {
  final value = element.getText()!;
  return ComicInfoSummary(value: value);
}

List<XmlAttribute> _$ComicInfoSummaryToXmlAttributes(ComicInfoSummary instance,
    {Map<String, String?> namespaces = const {}}) {
  final attributes = <XmlAttribute>[];
  return attributes;
}

List<XmlNode> _$ComicInfoSummaryToXmlChildren(ComicInfoSummary instance,
    {Map<String, String?> namespaces = const {}}) {
  final children = <XmlNode>[];
  final value = instance.value;
  final valueSerialized = value;
  final valueConstructed = XmlText(valueSerialized);
  children.add(valueConstructed);
  return children;
}

XmlElement _$ComicInfoSummaryToXmlElement(ComicInfoSummary instance,
    {Map<String, String?> namespaces = const {}}) {
  return XmlElement(
      XmlName('Summary'),
      [
        ...namespaces.toXmlAttributes(),
        ...instance.toXmlAttributes(namespaces: namespaces)
      ],
      instance.toXmlChildren(namespaces: namespaces));
}

void _$ComicInfoWriterBuildXmlChildren(
    ComicInfoWriter instance, XmlBuilder builder,
    {Map<String, String> namespaces = const {}}) {
  final value = instance.value;
  final valueSerialized = value;
  builder.text(valueSerialized);
}

void _$ComicInfoWriterBuildXmlElement(
    ComicInfoWriter instance, XmlBuilder builder,
    {Map<String, String> namespaces = const {}}) {
  builder.element('Writer', namespaces: namespaces, nest: () {
    instance.buildXmlChildren(builder, namespaces: namespaces);
  });
}

ComicInfoWriter _$ComicInfoWriterFromXmlElement(XmlElement element) {
  final value = element.getText()!;
  return ComicInfoWriter(value: value);
}

List<XmlAttribute> _$ComicInfoWriterToXmlAttributes(ComicInfoWriter instance,
    {Map<String, String?> namespaces = const {}}) {
  final attributes = <XmlAttribute>[];
  return attributes;
}

List<XmlNode> _$ComicInfoWriterToXmlChildren(ComicInfoWriter instance,
    {Map<String, String?> namespaces = const {}}) {
  final children = <XmlNode>[];
  final value = instance.value;
  final valueSerialized = value;
  final valueConstructed = XmlText(valueSerialized);
  children.add(valueConstructed);
  return children;
}

XmlElement _$ComicInfoWriterToXmlElement(ComicInfoWriter instance,
    {Map<String, String?> namespaces = const {}}) {
  return XmlElement(
      XmlName('Writer'),
      [
        ...namespaces.toXmlAttributes(),
        ...instance.toXmlAttributes(namespaces: namespaces)
      ],
      instance.toXmlChildren(namespaces: namespaces));
}

void _$ComicInfoPencillerBuildXmlChildren(
    ComicInfoPenciller instance, XmlBuilder builder,
    {Map<String, String> namespaces = const {}}) {
  final value = instance.value;
  final valueSerialized = value;
  builder.text(valueSerialized);
}

void _$ComicInfoPencillerBuildXmlElement(
    ComicInfoPenciller instance, XmlBuilder builder,
    {Map<String, String> namespaces = const {}}) {
  builder.element('Penciller', namespaces: namespaces, nest: () {
    instance.buildXmlChildren(builder, namespaces: namespaces);
  });
}

ComicInfoPenciller _$ComicInfoPencillerFromXmlElement(XmlElement element) {
  final value = element.getText()!;
  return ComicInfoPenciller(value: value);
}

List<XmlAttribute> _$ComicInfoPencillerToXmlAttributes(
    ComicInfoPenciller instance,
    {Map<String, String?> namespaces = const {}}) {
  final attributes = <XmlAttribute>[];
  return attributes;
}

List<XmlNode> _$ComicInfoPencillerToXmlChildren(ComicInfoPenciller instance,
    {Map<String, String?> namespaces = const {}}) {
  final children = <XmlNode>[];
  final value = instance.value;
  final valueSerialized = value;
  final valueConstructed = XmlText(valueSerialized);
  children.add(valueConstructed);
  return children;
}

XmlElement _$ComicInfoPencillerToXmlElement(ComicInfoPenciller instance,
    {Map<String, String?> namespaces = const {}}) {
  return XmlElement(
      XmlName('Penciller'),
      [
        ...namespaces.toXmlAttributes(),
        ...instance.toXmlAttributes(namespaces: namespaces)
      ],
      instance.toXmlChildren(namespaces: namespaces));
}

void _$ComicInfoInkerBuildXmlChildren(
    ComicInfoInker instance, XmlBuilder builder,
    {Map<String, String> namespaces = const {}}) {
  final value = instance.value;
  final valueSerialized = value;
  builder.text(valueSerialized);
}

void _$ComicInfoInkerBuildXmlElement(
    ComicInfoInker instance, XmlBuilder builder,
    {Map<String, String> namespaces = const {}}) {
  builder.element('Inker', namespaces: namespaces, nest: () {
    instance.buildXmlChildren(builder, namespaces: namespaces);
  });
}

ComicInfoInker _$ComicInfoInkerFromXmlElement(XmlElement element) {
  final value = element.getText()!;
  return ComicInfoInker(value: value);
}

List<XmlAttribute> _$ComicInfoInkerToXmlAttributes(ComicInfoInker instance,
    {Map<String, String?> namespaces = const {}}) {
  final attributes = <XmlAttribute>[];
  return attributes;
}

List<XmlNode> _$ComicInfoInkerToXmlChildren(ComicInfoInker instance,
    {Map<String, String?> namespaces = const {}}) {
  final children = <XmlNode>[];
  final value = instance.value;
  final valueSerialized = value;
  final valueConstructed = XmlText(valueSerialized);
  children.add(valueConstructed);
  return children;
}

XmlElement _$ComicInfoInkerToXmlElement(ComicInfoInker instance,
    {Map<String, String?> namespaces = const {}}) {
  return XmlElement(
      XmlName('Inker'),
      [
        ...namespaces.toXmlAttributes(),
        ...instance.toXmlAttributes(namespaces: namespaces)
      ],
      instance.toXmlChildren(namespaces: namespaces));
}

void _$ComicInfoColoristBuildXmlChildren(
    ComicInfoColorist instance, XmlBuilder builder,
    {Map<String, String> namespaces = const {}}) {
  final value = instance.value;
  final valueSerialized = value;
  builder.text(valueSerialized);
}

void _$ComicInfoColoristBuildXmlElement(
    ComicInfoColorist instance, XmlBuilder builder,
    {Map<String, String> namespaces = const {}}) {
  builder.element('Colorist', namespaces: namespaces, nest: () {
    instance.buildXmlChildren(builder, namespaces: namespaces);
  });
}

ComicInfoColorist _$ComicInfoColoristFromXmlElement(XmlElement element) {
  final value = element.getText()!;
  return ComicInfoColorist(value: value);
}

List<XmlAttribute> _$ComicInfoColoristToXmlAttributes(
    ComicInfoColorist instance,
    {Map<String, String?> namespaces = const {}}) {
  final attributes = <XmlAttribute>[];
  return attributes;
}

List<XmlNode> _$ComicInfoColoristToXmlChildren(ComicInfoColorist instance,
    {Map<String, String?> namespaces = const {}}) {
  final children = <XmlNode>[];
  final value = instance.value;
  final valueSerialized = value;
  final valueConstructed = XmlText(valueSerialized);
  children.add(valueConstructed);
  return children;
}

XmlElement _$ComicInfoColoristToXmlElement(ComicInfoColorist instance,
    {Map<String, String?> namespaces = const {}}) {
  return XmlElement(
      XmlName('Colorist'),
      [
        ...namespaces.toXmlAttributes(),
        ...instance.toXmlAttributes(namespaces: namespaces)
      ],
      instance.toXmlChildren(namespaces: namespaces));
}

void _$ComicInfoLettererBuildXmlChildren(
    ComicInfoLetterer instance, XmlBuilder builder,
    {Map<String, String> namespaces = const {}}) {
  final value = instance.value;
  final valueSerialized = value;
  builder.text(valueSerialized);
}

void _$ComicInfoLettererBuildXmlElement(
    ComicInfoLetterer instance, XmlBuilder builder,
    {Map<String, String> namespaces = const {}}) {
  builder.element('Letterer', namespaces: namespaces, nest: () {
    instance.buildXmlChildren(builder, namespaces: namespaces);
  });
}

ComicInfoLetterer _$ComicInfoLettererFromXmlElement(XmlElement element) {
  final value = element.getText()!;
  return ComicInfoLetterer(value: value);
}

List<XmlAttribute> _$ComicInfoLettererToXmlAttributes(
    ComicInfoLetterer instance,
    {Map<String, String?> namespaces = const {}}) {
  final attributes = <XmlAttribute>[];
  return attributes;
}

List<XmlNode> _$ComicInfoLettererToXmlChildren(ComicInfoLetterer instance,
    {Map<String, String?> namespaces = const {}}) {
  final children = <XmlNode>[];
  final value = instance.value;
  final valueSerialized = value;
  final valueConstructed = XmlText(valueSerialized);
  children.add(valueConstructed);
  return children;
}

XmlElement _$ComicInfoLettererToXmlElement(ComicInfoLetterer instance,
    {Map<String, String?> namespaces = const {}}) {
  return XmlElement(
      XmlName('Letterer'),
      [
        ...namespaces.toXmlAttributes(),
        ...instance.toXmlAttributes(namespaces: namespaces)
      ],
      instance.toXmlChildren(namespaces: namespaces));
}

void _$ComicInfoCoverArtistBuildXmlChildren(
    ComicInfoCoverArtist instance, XmlBuilder builder,
    {Map<String, String> namespaces = const {}}) {
  final value = instance.value;
  final valueSerialized = value;
  builder.text(valueSerialized);
}

void _$ComicInfoCoverArtistBuildXmlElement(
    ComicInfoCoverArtist instance, XmlBuilder builder,
    {Map<String, String> namespaces = const {}}) {
  builder.element('CoverArtist', namespaces: namespaces, nest: () {
    instance.buildXmlChildren(builder, namespaces: namespaces);
  });
}

ComicInfoCoverArtist _$ComicInfoCoverArtistFromXmlElement(XmlElement element) {
  final value = element.getText()!;
  return ComicInfoCoverArtist(value: value);
}

List<XmlAttribute> _$ComicInfoCoverArtistToXmlAttributes(
    ComicInfoCoverArtist instance,
    {Map<String, String?> namespaces = const {}}) {
  final attributes = <XmlAttribute>[];
  return attributes;
}

List<XmlNode> _$ComicInfoCoverArtistToXmlChildren(ComicInfoCoverArtist instance,
    {Map<String, String?> namespaces = const {}}) {
  final children = <XmlNode>[];
  final value = instance.value;
  final valueSerialized = value;
  final valueConstructed = XmlText(valueSerialized);
  children.add(valueConstructed);
  return children;
}

XmlElement _$ComicInfoCoverArtistToXmlElement(ComicInfoCoverArtist instance,
    {Map<String, String?> namespaces = const {}}) {
  return XmlElement(
      XmlName('CoverArtist'),
      [
        ...namespaces.toXmlAttributes(),
        ...instance.toXmlAttributes(namespaces: namespaces)
      ],
      instance.toXmlChildren(namespaces: namespaces));
}

void _$ComicInfoTranslatorBuildXmlChildren(
    ComicInfoTranslator instance, XmlBuilder builder,
    {Map<String, String> namespaces = const {}}) {
  final value = instance.value;
  final valueSerialized = value;
  builder.text(valueSerialized);
}

void _$ComicInfoTranslatorBuildXmlElement(
    ComicInfoTranslator instance, XmlBuilder builder,
    {Map<String, String> namespaces = const {}}) {
  builder.element('Translator', namespaces: namespaces, nest: () {
    instance.buildXmlChildren(builder, namespaces: namespaces);
  });
}

ComicInfoTranslator _$ComicInfoTranslatorFromXmlElement(XmlElement element) {
  final value = element.getText()!;
  return ComicInfoTranslator(value: value);
}

List<XmlAttribute> _$ComicInfoTranslatorToXmlAttributes(
    ComicInfoTranslator instance,
    {Map<String, String?> namespaces = const {}}) {
  final attributes = <XmlAttribute>[];
  return attributes;
}

List<XmlNode> _$ComicInfoTranslatorToXmlChildren(ComicInfoTranslator instance,
    {Map<String, String?> namespaces = const {}}) {
  final children = <XmlNode>[];
  final value = instance.value;
  final valueSerialized = value;
  final valueConstructed = XmlText(valueSerialized);
  children.add(valueConstructed);
  return children;
}

XmlElement _$ComicInfoTranslatorToXmlElement(ComicInfoTranslator instance,
    {Map<String, String?> namespaces = const {}}) {
  return XmlElement(
      XmlName('Translator'),
      [
        ...namespaces.toXmlAttributes(),
        ...instance.toXmlAttributes(namespaces: namespaces)
      ],
      instance.toXmlChildren(namespaces: namespaces));
}

void _$ComicInfoGenreBuildXmlChildren(
    ComicInfoGenre instance, XmlBuilder builder,
    {Map<String, String> namespaces = const {}}) {
  final value = instance.value;
  final valueSerialized = value;
  builder.text(valueSerialized);
}

void _$ComicInfoGenreBuildXmlElement(
    ComicInfoGenre instance, XmlBuilder builder,
    {Map<String, String> namespaces = const {}}) {
  builder.element('Genre', namespaces: namespaces, nest: () {
    instance.buildXmlChildren(builder, namespaces: namespaces);
  });
}

ComicInfoGenre _$ComicInfoGenreFromXmlElement(XmlElement element) {
  final value = element.getText()!;
  return ComicInfoGenre(value: value);
}

List<XmlAttribute> _$ComicInfoGenreToXmlAttributes(ComicInfoGenre instance,
    {Map<String, String?> namespaces = const {}}) {
  final attributes = <XmlAttribute>[];
  return attributes;
}

List<XmlNode> _$ComicInfoGenreToXmlChildren(ComicInfoGenre instance,
    {Map<String, String?> namespaces = const {}}) {
  final children = <XmlNode>[];
  final value = instance.value;
  final valueSerialized = value;
  final valueConstructed = XmlText(valueSerialized);
  children.add(valueConstructed);
  return children;
}

XmlElement _$ComicInfoGenreToXmlElement(ComicInfoGenre instance,
    {Map<String, String?> namespaces = const {}}) {
  return XmlElement(
      XmlName('Genre'),
      [
        ...namespaces.toXmlAttributes(),
        ...instance.toXmlAttributes(namespaces: namespaces)
      ],
      instance.toXmlChildren(namespaces: namespaces));
}

void _$ComicInfoTagsBuildXmlChildren(ComicInfoTags instance, XmlBuilder builder,
    {Map<String, String> namespaces = const {}}) {
  final value = instance.value;
  final valueSerialized = value;
  builder.text(valueSerialized);
}

void _$ComicInfoTagsBuildXmlElement(ComicInfoTags instance, XmlBuilder builder,
    {Map<String, String> namespaces = const {}}) {
  builder.element('Tags', namespaces: namespaces, nest: () {
    instance.buildXmlChildren(builder, namespaces: namespaces);
  });
}

ComicInfoTags _$ComicInfoTagsFromXmlElement(XmlElement element) {
  final value = element.getText()!;
  return ComicInfoTags(value: value);
}

List<XmlAttribute> _$ComicInfoTagsToXmlAttributes(ComicInfoTags instance,
    {Map<String, String?> namespaces = const {}}) {
  final attributes = <XmlAttribute>[];
  return attributes;
}

List<XmlNode> _$ComicInfoTagsToXmlChildren(ComicInfoTags instance,
    {Map<String, String?> namespaces = const {}}) {
  final children = <XmlNode>[];
  final value = instance.value;
  final valueSerialized = value;
  final valueConstructed = XmlText(valueSerialized);
  children.add(valueConstructed);
  return children;
}

XmlElement _$ComicInfoTagsToXmlElement(ComicInfoTags instance,
    {Map<String, String?> namespaces = const {}}) {
  return XmlElement(
      XmlName('Tags'),
      [
        ...namespaces.toXmlAttributes(),
        ...instance.toXmlAttributes(namespaces: namespaces)
      ],
      instance.toXmlChildren(namespaces: namespaces));
}

void _$ComicInfoWebBuildXmlChildren(ComicInfoWeb instance, XmlBuilder builder,
    {Map<String, String> namespaces = const {}}) {
  final value = instance.value;
  final valueSerialized = value;
  builder.text(valueSerialized);
}

void _$ComicInfoWebBuildXmlElement(ComicInfoWeb instance, XmlBuilder builder,
    {Map<String, String> namespaces = const {}}) {
  builder.element('Web', namespaces: namespaces, nest: () {
    instance.buildXmlChildren(builder, namespaces: namespaces);
  });
}

ComicInfoWeb _$ComicInfoWebFromXmlElement(XmlElement element) {
  final value = element.getText()!;
  return ComicInfoWeb(value: value);
}

List<XmlAttribute> _$ComicInfoWebToXmlAttributes(ComicInfoWeb instance,
    {Map<String, String?> namespaces = const {}}) {
  final attributes = <XmlAttribute>[];
  return attributes;
}

List<XmlNode> _$ComicInfoWebToXmlChildren(ComicInfoWeb instance,
    {Map<String, String?> namespaces = const {}}) {
  final children = <XmlNode>[];
  final value = instance.value;
  final valueSerialized = value;
  final valueConstructed = XmlText(valueSerialized);
  children.add(valueConstructed);
  return children;
}

XmlElement _$ComicInfoWebToXmlElement(ComicInfoWeb instance,
    {Map<String, String?> namespaces = const {}}) {
  return XmlElement(
      XmlName('Web'),
      [
        ...namespaces.toXmlAttributes(),
        ...instance.toXmlAttributes(namespaces: namespaces)
      ],
      instance.toXmlChildren(namespaces: namespaces));
}

void _$PublishingStatusTachiyomiBuildXmlChildren(
    PublishingStatusTachiyomi instance, XmlBuilder builder,
    {Map<String, String> namespaces = const {}}) {
  final value = instance.value;
  final valueSerialized = value;
  builder.text(valueSerialized);
}

void _$PublishingStatusTachiyomiBuildXmlElement(
    PublishingStatusTachiyomi instance, XmlBuilder builder,
    {Map<String, String> namespaces = const {}}) {
  builder.element('PublishingStatusTachiyomi', namespaces: namespaces,
      nest: () {
    instance.buildXmlChildren(builder, namespaces: namespaces);
  });
}

PublishingStatusTachiyomi _$PublishingStatusTachiyomiFromXmlElement(
    XmlElement element) {
  final value = element.getText()!;
  return PublishingStatusTachiyomi(value: value);
}

List<XmlAttribute> _$PublishingStatusTachiyomiToXmlAttributes(
    PublishingStatusTachiyomi instance,
    {Map<String, String?> namespaces = const {}}) {
  final attributes = <XmlAttribute>[];
  return attributes;
}

List<XmlNode> _$PublishingStatusTachiyomiToXmlChildren(
    PublishingStatusTachiyomi instance,
    {Map<String, String?> namespaces = const {}}) {
  final children = <XmlNode>[];
  final value = instance.value;
  final valueSerialized = value;
  final valueConstructed = XmlText(valueSerialized);
  children.add(valueConstructed);
  return children;
}

XmlElement _$PublishingStatusTachiyomiToXmlElement(
    PublishingStatusTachiyomi instance,
    {Map<String, String?> namespaces = const {}}) {
  return XmlElement(
      XmlName('PublishingStatusTachiyomi'),
      [
        ...namespaces.toXmlAttributes(),
        ...instance.toXmlAttributes(namespaces: namespaces)
      ],
      instance.toXmlChildren(namespaces: namespaces));
}

void _$CategoriesTachiyomiBuildXmlChildren(
    CategoriesTachiyomi instance, XmlBuilder builder,
    {Map<String, String> namespaces = const {}}) {
  final value = instance.value;
  final valueSerialized = value;
  builder.text(valueSerialized);
}

void _$CategoriesTachiyomiBuildXmlElement(
    CategoriesTachiyomi instance, XmlBuilder builder,
    {Map<String, String> namespaces = const {}}) {
  builder.element('CategoriesTachiyomi', namespaces: namespaces, nest: () {
    instance.buildXmlChildren(builder, namespaces: namespaces);
  });
}

CategoriesTachiyomi _$CategoriesTachiyomiFromXmlElement(XmlElement element) {
  final value = element.getText()!;
  return CategoriesTachiyomi(value: value);
}

List<XmlAttribute> _$CategoriesTachiyomiToXmlAttributes(
    CategoriesTachiyomi instance,
    {Map<String, String?> namespaces = const {}}) {
  final attributes = <XmlAttribute>[];
  return attributes;
}

List<XmlNode> _$CategoriesTachiyomiToXmlChildren(CategoriesTachiyomi instance,
    {Map<String, String?> namespaces = const {}}) {
  final children = <XmlNode>[];
  final value = instance.value;
  final valueSerialized = value;
  final valueConstructed = XmlText(valueSerialized);
  children.add(valueConstructed);
  return children;
}

XmlElement _$CategoriesTachiyomiToXmlElement(CategoriesTachiyomi instance,
    {Map<String, String?> namespaces = const {}}) {
  return XmlElement(
      XmlName('CategoriesTachiyomi'),
      [
        ...namespaces.toXmlAttributes(),
        ...instance.toXmlAttributes(namespaces: namespaces)
      ],
      instance.toXmlChildren(namespaces: namespaces));
}
