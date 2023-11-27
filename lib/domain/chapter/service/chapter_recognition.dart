import 'package:dartx/dartx.dart';

class ChapterRecognition {
  static const _numberPattern = r'([0-9]+)(\.[0-9]+)?(\.?[a-z]+)?';

  /// All cases with Ch.xx
  /// Mokushiroku Alice Vol.1 Ch. 4: Misrepresentation -R> 4
  final RegExp _basic = RegExp(r'(?<=ch\.) *' + _numberPattern);

  /// Example: Bleach 567: Down With Snowwhite -R> 567
  final RegExp _number = RegExp(_numberPattern);

  /// Regex used to remove unwanted tags
  /// Example Prison School 12 v.1 vol004 version1243 volume64 -R> Prison School 12
  final RegExp _unwanted =
      RegExp(r'\b(?:v|ver|vol|version|volume|season|s)[^a-z]?[0-9]+');

  /// Regex used to remove unwanted whitespace
  /// Example One Piece 12 special -R> One Piece 12special
  final RegExp _unwantedWhiteSpace = RegExp(r'\s(?=extra|special|omake)');

  double parseChapter(
      String mangaTitle, String chapterName, double? chapterNumber) {
    /// If chapter number is known return.
    if (chapterNumber != null &&
        (chapterNumber == -2.0 || chapterNumber > -1.0)) {
      return chapterNumber;
    }

    /// Get chapter title with lower case
    var name = chapterName.toLowerCase();

    /// Remove manga title from chapter title.
    name = name.replaceAll(mangaTitle.toLowerCase(), "").trim();

    /// Remove comma's or hyphens.
    name = name.replaceAll(',', '.').replaceAll('-', '.');

    /// Remove unwanted white spaces.
    name = name.replaceAll(_unwantedWhiteSpace, "");

    /// Remove unwanted tags.
    name = name.replaceAll(_unwanted, "");

    /// Check base case ch.xx
    RegExpMatch? basicMatch = _basic.firstMatch(name);
    if (basicMatch != null) return _getChapterNumberFromMatch(basicMatch);

    /// Take the first number encountered.
    RegExpMatch? numberMatch = _number.firstMatch(name);
    if (numberMatch != null) return _getChapterNumberFromMatch(numberMatch);

    return chapterNumber ?? -1.0;
  }

  /// Check if chapter number is found and return it
  /// @param match result of regex
  /// @return chapter number if found else null
  double _getChapterNumberFromMatch(RegExpMatch match) {
    double initial = double.parse(match[1]!);
    String? subChapterDecimal = match[2];
    String? subChapterAlpha = match[3];
    double addition = _checkForDecimal(subChapterDecimal, subChapterAlpha);
    return initial + addition;
  }

  /// Check for decimal in received strings
  /// @param decimal decimal value of regex
  /// @param alpha alpha value of regex
  /// @return decimal/alpha float value
  double _checkForDecimal(String? decimal, String? alpha) {
    if (!decimal.isNullOrEmpty) return double.parse(decimal!);

    if (!alpha.isNullOrEmpty) {
      if (alpha!.contains("extra")) return 0.99;
      if (alpha.contains("omake")) return 0.98;
      if (alpha.contains("special")) return 0.97;

      String trimmedAlpha = alpha.substring(1);
      if (trimmedAlpha.length == 1) return _parseAlphaPostFix(trimmedAlpha[0]);
    }

    return 0.0;
  }

  /// x.a -> x.1, x.b -> x.2, etc
  double _parseAlphaPostFix(String alpha) {
    int number = alpha.codeUnitAt(0) - ('a'.codeUnitAt(0) - 1);
    if (number >= 10) return 0.0;
    return number / 10.0;
  }
}
