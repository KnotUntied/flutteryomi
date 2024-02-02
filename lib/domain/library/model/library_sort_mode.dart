import 'package:equatable/equatable.dart';
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
  bool get isAscending => direction is _Ascending;

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
      Alphabetical() => "ALPHABETICAL",
      LastRead() => "LAST_READ",
      LastUpdate() => "LAST_MANGA_UPDATE",
      UnreadCount() => "UNREAD_COUNT",
      TotalChapters() => "TOTAL_CHAPTERS",
      LatestChapter() => "LATEST_CHAPTER",
      ChapterFetchDate() => "CHAPTER_FETCH_DATE",
      DateAdded() => "DATE_ADDED",
      TrackerMean() => "TRACKER_MEAN",
    };
    String serializedDirection =
        (direction == Direction.ascending) ? "ASCENDING" : "DESCENDING";
    return "$serializedType,$serializedDirection";
  }
}

sealed class Type extends Equatable implements FlagWithMask {
  @override
  final int flag;
  @override
  final int mask;

  const Type(this.flag) : mask = 0x3C;

  static const Type alphabetical = Alphabetical();
  static const Type lastRead = LastRead();
  static const Type lastUpdate = LastUpdate();
  static const Type unreadCount = UnreadCount();
  static const Type totalChapters = TotalChapters();
  static const Type latestChapter = LatestChapter();
  static const Type chapterFetchDate = ChapterFetchDate();
  static const Type dateAdded = DateAdded();
  static const Type trackerMean = TrackerMean();

  static Type valueOf(int flag) {
    return LibrarySort.types.firstWhere(
        (type) => type.flag == (flag & type.mask),
        orElse: () => defaultType);
  }

  @override
  List<Object?> get props => const [];
}

class Alphabetical extends Type {
  const Alphabetical() : super(0x00);
}

class LastRead extends Type {
  const LastRead() : super(0x04);
}

class LastUpdate extends Type {
  const LastUpdate() : super(0x08);
}

class UnreadCount extends Type {
  const UnreadCount() : super(0x0C);
}

class TotalChapters extends Type {
  const TotalChapters() : super(0x10);
}

class LatestChapter extends Type {
  const LatestChapter() : super(0x14);
}

class ChapterFetchDate extends Type {
  const ChapterFetchDate() : super(0x18);
}

class DateAdded extends Type {
  const DateAdded() : super(0x1C);
}

class TrackerMean extends Type {
  const TrackerMean() : super(0x20);
}

const defaultType = Type.alphabetical;

sealed class Direction extends Equatable implements FlagWithMask {
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

  @override
  List<Object?> get props => const [];
}

class _Ascending extends Direction {
  const _Ascending() : super(0x40);
}

class _Descending extends Direction {
  const _Descending() : super(0x00);
}

const defaultDirection = Direction.descending;

extension CategorySort on Category {
  LibrarySort get librarySort => LibrarySort.valueOf(flags);
}
