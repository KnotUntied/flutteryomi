import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:flutteryomi/domain/category/model/category.dart';
import 'package:flutteryomi/domain/library/model/flag.dart';

part 'library_sort_mode.freezed.dart';

@freezed
class LibrarySort with _$LibrarySort implements FlagWithMask {
  @override
  int get flag => type + direction;
  @override
  int get mask => type.mask | direction.mask;
  bool get isAscending => direction == Direction.ascending;

  const LibrarySort._();
  const factory LibrarySort(Type type, Direction direction) = _LibrarySort;

  static const default_ = LibrarySort(
    Type.alphabetical,
    Direction.ascending,
  );

  static final types = {
    Type.alphabetical,
    Type.lastRead,
    Type.lastUpdate,
    Type.unreadCount,
    Type.totalChapters,
    Type.latestChapter,
    Type.chapterFetchDate,
    Type.dateAdded,
    Type.trackerMean,
  };

  static final directions = {Direction.ascending, Direction.descending};

  static LibrarySort valueOf(int? flag) => flag == null
      ? default_
      : LibrarySort(Type.valueOf(flag), Direction.valueOf(flag));

  static String serializer(LibrarySort value) => value.serialize();

  static LibrarySort deserialize(String serialized) {
    if (serialized.isEmpty) return default_;
    try {
      List<String> values = serialized.split(",");
      Type type = switch (values[0]) {
        "ALPHABETICAL" => Type.alphabetical,
        "LAST_READ" => Type.lastRead,
        "LAST_MANGA_UPDATE" => Type.lastUpdate,
        "UNREAD_COUNT" => Type.unreadCount,
        "TOTAL_CHAPTERS" => Type.totalChapters,
        "LATEST_CHAPTER" => Type.latestChapter,
        "CHAPTER_FETCH_DATE" => Type.chapterFetchDate,
        "DATE_ADDED" => Type.dateAdded,
        "TRACKER_MEAN" => Type.trackerMean,
        _ => Type.alphabetical,
      };
      Direction ascending = (values[1] == "ASCENDING")
          ? Direction.ascending
          : Direction.descending;
      return LibrarySort(type, ascending);
    } catch (e) {
      return default_;
    }
  }

  String serialize() {
    String serializedType = switch (type) {
      _Alphabetical() => "ALPHABETICAL",
      _LastRead() => "LAST_READ",
      _LastUpdate() => "LAST_MANGA_UPDATE",
      _UnreadCount() => "UNREAD_COUNT",
      _TotalChapters() => "TOTAL_CHAPTERS",
      _LatestChapter() => "LATEST_CHAPTER",
      _ChapterFetchDate() => "CHAPTER_FETCH_DATE",
      _DateAdded() => "DATE_ADDED",
      _TrackerMean() => "TRACKER_MEAN",
      //_ => "ALPHABETICAL",
    };
    String serializedDirection =
        (direction == Direction.ascending) ? "ASCENDING" : "DESCENDING";
    return "$serializedType,$serializedDirection";
  }
}

sealed class Type implements FlagWithMask {
  @override
  final int flag;
  @override
  final int mask;

  const Type(this.flag) : mask = 0x3C;

  static const Type alphabetical = _Alphabetical();
  static const Type lastRead = _LastRead();
  static const Type lastUpdate = _LastUpdate();
  static const Type unreadCount = _UnreadCount();
  static const Type totalChapters = _TotalChapters();
  static const Type latestChapter = _LatestChapter();
  static const Type chapterFetchDate = _ChapterFetchDate();
  static const Type dateAdded = _DateAdded();
  static const Type trackerMean = _TrackerMean();

  static Type valueOf(int flag) {
    return LibrarySort.types.firstWhere(
        (type) => type.flag == (flag & type.mask),
        orElse: () => defaultType);
  }
}

class _Alphabetical extends Type {
  const _Alphabetical() : super(0x00);
}

class _LastRead extends Type {
  const _LastRead() : super(0x04);
}

class _LastUpdate extends Type {
  const _LastUpdate() : super(0x08);
}

class _UnreadCount extends Type {
  const _UnreadCount() : super(0x0C);
}

class _TotalChapters extends Type {
  const _TotalChapters() : super(0x10);
}

class _LatestChapter extends Type {
  const _LatestChapter() : super(0x14);
}

class _ChapterFetchDate extends Type {
  const _ChapterFetchDate() : super(0x18);
}

class _DateAdded extends Type {
  const _DateAdded() : super(0x1C);
}

class _TrackerMean extends Type {
  const _TrackerMean() : super(0x20);
}

const defaultType = Type.alphabetical;

sealed class Direction implements FlagWithMask {
  @override
  final int flag;
  @override
  final int mask;

  const Direction(this.flag) : mask = 0x40;

  static const Direction ascending = _Ascending();
  static const Direction descending = _Descending();

  static Direction valueOf(int flag) {
    return LibrarySort.directions.firstWhere(
        (direction) => direction.flag == (flag & direction.mask),
        orElse: () => defaultDirection);
  }
}

class _Ascending extends Direction {
  const _Ascending() : super(0x40);
}

class _Descending extends Direction {
  const _Descending() : super(0x00);
}

const defaultDirection = Direction.descending;

extension CategorySort on Category {
  LibrarySort get sort => LibrarySort.valueOf(flags);
}
