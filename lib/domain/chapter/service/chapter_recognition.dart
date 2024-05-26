import 'package:dartx/dartx.dart';

abstract class ChapterRecognition {
  static const _numberPattern = r'([0-9]+)(\.[0-9]+)?(\.?[a-z]+)?';

  /// All cases with Ch.xx
  /// Mokushiroku Alice Vol.1 Ch. 4: Misrepresentation -R> 4
  static final RegExp _basic = RegExp(r'(?<=ch\.) *' + _numberPattern);

  /// Example: Bleach 567: Down With Snowwhite -R> 567
  static final RegExp _number = RegExp(_numberPattern);

  /// Regex used to remove unwanted tags
  /// Example Prison School 12 v.1 vol004 version1243 volume64 -R> Prison School 12
  static final RegExp _unwanted =
      RegExp(r'\b(?:v|ver|vol|version|volume|season|s)[^a-z]?[0-9]+');

  /// Regex used to remove unwanted whitespace
  /// Example One Piece 12 special -R> One Piece 12special
  static final RegExp _unwantedWhiteSpace =
      RegExp(r'\s(?=extra|special|omake)');

  static double parseChapterNumber(String mangaTitle, String chapterName,
      [double? chapterNumber]) {
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
    final basicMatch = _basic.firstMatch(name);
    if (basicMatch != null) return _getChapterNumberFromMatch(basicMatch);

    /// Take the first number encountered.
    final numberMatch = _number.firstMatch(name);
    if (numberMatch != null) return _getChapterNumberFromMatch(numberMatch);

    return chapterNumber ?? -1.0;
  }

  /// Check if chapter number is found and return it
  /// @param match result of regex
  /// @return chapter number if found else null
  static double _getChapterNumberFromMatch(RegExpMatch match) {
    final initial = double.parse(match[1]!);
    final subChapterDecimal = match[2];
    final subChapterAlpha = match[3];
    final addition = _checkForDecimal(subChapterDecimal, subChapterAlpha);
    return initial + addition;
  }

  /// Check for decimal in received strings
  /// @param decimal decimal value of regex
  /// @param alpha alpha value of regex
  /// @return decimal/alpha float value
  static double _checkForDecimal(String? decimal, String? alpha) {
    if (!decimal.isNullOrEmpty) return double.parse(decimal!);

    if (!alpha.isNullOrEmpty) {
      if (alpha!.contains("extra")) return 0.99;
      if (alpha.contains("omake")) return 0.98;
      if (alpha.contains("special")) return 0.97;

      final trimmedAlpha = alpha.trimStart('.');
      if (trimmedAlpha.length == 1) return _parseAlphaPostFix(trimmedAlpha[0]);
    }

    return 0.0;
  }

  /// x.a -> x.1, x.b -> x.2, etc
  static double _parseAlphaPostFix(String alpha) {
    final number = alpha.codeUnitAt(0) - ('a'.codeUnitAt(0) - 1);
    if (number >= 10) return 0.0;
    return number / 10.0;
  }
}

extension TrimStart on String {
  String trimStart(String char) {
    for (int i = 0; i < length; i++) {
      if (char != this[i]) return substring(i);
    }
    return '';
  }
}
