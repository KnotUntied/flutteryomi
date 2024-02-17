import 'package:dartx/dartx.dart';
import 'package:flutteryomi/domain/chapter/model/chapter.dart';

extension MissingChaptersIterableUtils on Iterable<double> {
  int missingChaptersCount() {
    if (isEmpty) return 0;

    // Ignore unknown chapter numbers
    final chapters = where((chapter) => chapter != -1.0)
        // Convert to integers, as we cannot check if 16.5 is missing
        .map((chapter) => chapter.toInt())
        // Only keep unique chapters so that -1 or 16 are not counted multiple times
        .toSet()
        .toList()
        .sorted();

    if (chapters.isEmpty) return 0;

    int missingChaptersCount = 0;
    int previousChapter = 0; // The actual chapter number, not the array index

    // We go from 0 to lastChapter - Make sure to use the current index instead of the value
    for (final i in chapters.indices) {
      final currentChapter = chapters[i];
      if (currentChapter > previousChapter + 1) {
        // Add the amount of missing chapters
        missingChaptersCount += currentChapter - previousChapter - 1;
      }
      previousChapter = currentChapter;
    }

    return missingChaptersCount;
  }
}

extension MissingChaptersUtils on List<double> {
  int missingChaptersCount() {
    if (isEmpty) return 0;

    // Ignore unknown chapter numbers
    final chapters = where((chapter) => chapter != -1.0)
        // Convert to integers, as we cannot check if 16.5 is missing
        .map((chapter) => chapter.toInt())
        // Only keep unique chapters so that -1 or 16 are not counted multiple times
        .toSet()
        .toList()
        .sorted();

    if (chapters.isEmpty) return 0;

    int missingChaptersCount = 0;
    int previousChapter = 0; // The actual chapter number, not the array index

    // We go from 0 to lastChapter - Make sure to use the current index instead of the value
    for (final i in chapters.indices) {
      final currentChapter = chapters[i];
      if (currentChapter > previousChapter + 1) {
        // Add the amount of missing chapters
        missingChaptersCount += currentChapter - previousChapter - 1;
      }
      previousChapter = currentChapter;
    }

    return missingChaptersCount;
  }
}

int calculateChapterGapUsingChapter(
    Chapter? higherChapter, Chapter? lowerChapter) {
  if (higherChapter == null || lowerChapter == null) return 0;
  if (!higherChapter.isRecognizedNumber || !lowerChapter.isRecognizedNumber) {
    return 0;
  }
  return calculateChapterGap(
      higherChapter.chapterNumber, lowerChapter.chapterNumber);
}

int calculateChapterGap(double higherChapterNumber, double lowerChapterNumber) {
  if (higherChapterNumber < 0.0 || lowerChapterNumber < 0.0) return 0;
  return higherChapterNumber.floor() - lowerChapterNumber.floor() - 1;
}
