extension StringExtensions on String {
  String trimChars(Pattern pattern) => 
      _removeLeading(pattern)
      ._removeTrailing(pattern);

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
