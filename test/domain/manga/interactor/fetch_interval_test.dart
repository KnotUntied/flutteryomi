import 'package:dartx/dartx.dart';
import 'package:flutteryomi/data/drift/data/chapters.drift.dart';
import 'package:flutteryomi/domain/chapter/interactor/get_chapters_by_manga_id.dart';
import 'package:flutteryomi/domain/chapter/model/chapter.dart';
import 'package:flutteryomi/domain/manga/interactor/fetch_interval.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

class MockGetChaptersByMangaId extends Mock implements GetChaptersByMangaId {}

//var _testTime = ZonedDateTime.parse("2020-01-01T00:00:00Z");
var _testTime = DateTime.parse("2020-01-01T00:00:00Z");
var _chapter = ChapterUtils.create().copyWith(
  dateFetch: _testTime,
  dateUpload: _testTime,
);

var _fetchInterval = FetchInterval(MockGetChaptersByMangaId());

Chapter _chapterWithTime(Chapter chapter, Duration duration) {
  var newTime = _testTime + duration;
  return chapter.copyWith(dateFetch: newTime, dateUpload: newTime);
}

extension LastUploadDate on Iterable<Chapter> {
  Duration lastUploadDate() =>
      Duration(milliseconds: last.dateUpload.millisecondsSinceEpoch);
}

void main() {
  test('returns default interval of 7 days when not enough distinct days', () {
    var chaptersWithUploadDate = IntRange(1, 50).map(
      (i) => _chapterWithTime(_chapter, 1.days),
    );
    expect(
      _fetchInterval.calculateInterval(chaptersWithUploadDate.toList()),
      7,
    );

    var chaptersWithoutUploadDate = chaptersWithUploadDate.map(
      (i) => i.copyWith(
          dateUpload: DateTime.fromMillisecondsSinceEpoch(0, isUtc: true)),
    );
    expect(
      _fetchInterval.calculateInterval(chaptersWithoutUploadDate.toList()),
      7,
    );
  });

  test('returns interval based on more recent chapters', () {
    var oldChapters = IntRange(1, 5).map(
      (i) => _chapterWithTime(
        _chapter,
        (7 * i).days,
      ), // Would have interval of 7 days
    );
    var newChapters = IntRange(1, 10).map(
      (i) => _chapterWithTime(_chapter, oldChapters.lastUploadDate() + i.days),
    );

    var chapters = oldChapters + newChapters;

    expect(_fetchInterval.calculateInterval(chapters.toList()), 1);
  });

  test('returns interval of 7 days when multiple chapters in 1 day', () {
    var chapters = IntRange(1, 10).map(
      (i) => _chapterWithTime(_chapter, 10.hours),
    );
    expect(_fetchInterval.calculateInterval(chapters.toList()), 7);
  });

  test('returns interval of 7 days when multiple chapters in 2 days', () {
    var chapters = IntRange(1, 2).map(
          (i) => _chapterWithTime(_chapter, 1.days),
        ) +
        IntRange(1, 5).map(
          (i) => _chapterWithTime(_chapter, 2.days),
        );
    expect(_fetchInterval.calculateInterval(chapters.toList()), 7);
  });

  test('returns interval of 1 day when chapters are released every 1 day', () {
    var chapters = IntRange(1, 20).map(
      (i) => _chapterWithTime(_chapter, i.days),
    );
    expect(_fetchInterval.calculateInterval(chapters.toList()), 1);
  });

  test('returns interval of 1 day when delta is less than 1 day', () {
    var chapters = IntRange(1, 20).map(
      (i) => _chapterWithTime(_chapter, (15 * i).hours),
    );
    expect(_fetchInterval.calculateInterval(chapters.toList()), 1);
  });

  test('returns interval of 2 days when chapters are released every 2 days',
      () {
    var chapters = IntRange(1, 20).map(
      (i) => _chapterWithTime(_chapter, (2 * i).days),
    );
    expect(_fetchInterval.calculateInterval(chapters.toList()), 2);
  });

  test('returns interval with floored value when interval is decimal', () {
    var chaptersWithUploadDate = IntRange(1, 5).map(
      (i) => _chapterWithTime(_chapter, (25 * i).hours),
    );
    expect(
      _fetchInterval.calculateInterval(chaptersWithUploadDate.toList()),
      1,
    );

    var chaptersWithoutUploadDate = chaptersWithUploadDate.map(
      (i) => i.copyWith(
        dateUpload: DateTime.fromMillisecondsSinceEpoch(0, isUtc: true),
      ),
    );
    expect(
      _fetchInterval.calculateInterval(chaptersWithoutUploadDate.toList()),
      1,
    );
  });

  test(
    'returns interval of 1 day when chapters are released just below every 2 days',
    () {
      var chapters = IntRange(1, 20).map(
        (i) => _chapterWithTime(_chapter, (43 * i).hours),
      );
      expect(_fetchInterval.calculateInterval(chapters.toList()), 1);
    },
  );
}
