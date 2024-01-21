import 'package:flutteryomi/domain/chapter/model/chapter.dart';
import 'package:flutteryomi/domain/chapter/service/missing_chapters.dart';
import 'package:test/test.dart';

Chapter _chapter(double number) =>
    ChapterUtils.create().copyWith(chapterNumber: number);

void main() {
  test('missingChaptersCount returns 0 when empty list', () {
    expect(List<double>.empty().missingChaptersCount(), 0);
  });

  test('missingChaptersCount returns 0 when all unknown chapter numbers', () {
    expect([-1.0, -1.0, -1.0].missingChaptersCount(), 0);
  });

  test('missingChaptersCount handles repeated base chapter numbers', () {
    expect([1.0, 1.0, 1.1, 1.5, 1.6, 1.99].missingChaptersCount(), 0);
  });

  test('missingChaptersCount returns number of missing chapters', () {
    expect(
        [-1.0, 1.0, 2.0, 2.2, 4.0, 6.0, 10.0, 11.0].missingChaptersCount(), 5);
  });

  test('calculateChapterGap returns difference', () {
    expect(calculateChapterGapUsingChapter(_chapter(10.0), _chapter(9.0)), 0.0);
    expect(calculateChapterGapUsingChapter(_chapter(10.0), _chapter(8.0)), 1.0);
    expect(calculateChapterGapUsingChapter(_chapter(10.0), _chapter(8.5)), 1.0);
    expect(calculateChapterGapUsingChapter(_chapter(10.0), _chapter(1.1)), 8.0);

    expect(calculateChapterGap(10.0, 9.0), 0.0);
    expect(calculateChapterGap(10.0, 8.0), 1.0);
    expect(calculateChapterGap(10.0, 8.5), 1.0);
    expect(calculateChapterGap(10.0, 1.1), 8.0);
  });

  test('calculateChapterGap returns 0 if either are not valid chapter numbers',
      () {
    expect(calculateChapterGapUsingChapter(_chapter(-1.0), _chapter(10.0)), 0);
    expect(calculateChapterGapUsingChapter(_chapter(99.0), _chapter(-1.0)), 0);

    expect(calculateChapterGap(-1.0, 10.0), 0);
    expect(calculateChapterGap(99.0, -1.0), 0);
  });
}
