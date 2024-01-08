import 'package:dartx/dartx.dart';

// trim can only do whitespace :(
// https://stackoverflow.com/a/57007532
extension ChapterSanitizer on String {
  String sanitize(String title) => trim()
      .removePrefix(title)
      ._removeLeading(_chapterTrimChars)
      ._removeTrailing(_chapterTrimChars);
  static final _chapterTrimChars = RegExp(r'(\s|\-|\_|\,|\:)+');

  String _removeLeading(Pattern pattern) {
    var i = 0;
    while (startsWith(pattern, i)) {
      i += 1;
    }
    return substring(i);
  }

  String _removeTrailing(Pattern pattern) {
    var i = length;
    while (startsWith(pattern, i - 1)) {
      i -= 1;
    }
    return substring(0, i);
  }
}