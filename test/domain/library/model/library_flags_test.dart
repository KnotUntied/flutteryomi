import 'package:flutteryomi/domain/library/model/flag.dart';
import 'package:flutteryomi/domain/library/model/library_display_mode.dart';
import 'package:flutteryomi/domain/library/model/library_sort_mode.dart';
import 'package:test/test.dart';

void main() {
  test('Check the amount of flags', () {
    expect(LibraryDisplayMode.values.length, 4);
    expect(LibrarySort.types.length, 9);
    expect(LibrarySort.directions.length, 2);
  });

  test('Test Flag plus operator (LibrarySort)', () {
    const current = LibrarySort(Type.lastRead, Direction.ascending);
    const new_ = LibrarySort(Type.dateAdded, Direction.ascending);
    final flag = current + new_;
    expect(flag, 0x5C);
  });

  test('Test Flag plus operator', () {
    const sort = LibrarySort(Type.dateAdded, Direction.ascending);
    expect(sort.flag, 0x5C);
  });

  test('Test Flag plus operator with old flag as base', () {
    const currentSort = LibrarySort(
      Type.unreadCount,
      Direction.descending,
    );
    expect(currentSort.flag, 0xC);

    const sort = LibrarySort(Type.dateAdded, Direction.ascending);
    final flag = currentSort.flag.addFlag(sort);

    expect(flag, 0x5C);
    expect(flag, isNot(currentSort.flag));
  });

  test('Test default flags', () {
    const sort = LibrarySort.default_;
    final flag = sort.type + sort.direction;
    expect(flag, 0x40);
  });
}
