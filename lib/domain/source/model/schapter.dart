interface class SChapter {
  SChapter({
    required this.url,
    required this.name,
    required this.dateUpload,
    required this.chapterNumber,
    this.scanlator,
  });

  String url;
  String name;
  DateTime dateUpload;
  double chapterNumber;
  String? scanlator;

  void copyFrom(SChapter other) {
    name = other.name;
    url = other.url;
    dateUpload = other.dateUpload;
    chapterNumber = other.chapterNumber;
    scanlator = other.scanlator;
  }

  factory SChapter.create() => SChapter(
    name: '',
    url: '',
    dateUpload: DateTime.fromMillisecondsSinceEpoch(0, isUtc: true),
    chapterNumber: -1.0,
    scanlator: null,
  );
}
