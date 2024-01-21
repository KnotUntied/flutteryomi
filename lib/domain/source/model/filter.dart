import 'package:freezed_annotation/freezed_annotation.dart';

part 'filter.freezed.dart';

sealed class Filter<T> {
  final String name;
  T state;

  Filter(this.name, this.state);

  @override
  bool operator ==(Object other) {
    if (this == other) return true;
    if (other is! Filter) return false;

    return name == other.name && state == other.state;
  }

  @override
  int get hashCode {
    int result = name.hashCode;
    result = 31 * result + (state?.hashCode ?? 0);
    return result;
  }
}

class FilterHeader extends Filter<int> {
  FilterHeader(String name) : super(name, 0);
}

class FilterSeparator extends Filter<int> {
  FilterSeparator([String name = '']) : super(name, 0);
}

abstract class FilterSelect<V> extends Filter<int> {
  final List<V> values;

  FilterSelect(String name, this.values, [int state = 0]) : super(name, state);
}

abstract class FilterText extends Filter<String> {
  FilterText(super.name, [super.state = '']);
}

abstract class FilterCheckBox extends Filter<bool> {
  FilterCheckBox(super.name, [super.state = false]);
}

abstract class FilterTriState extends Filter<int> {
  static const int stateIgnore = 0;
  static const int stateInclude = 1;
  static const int stateExclude = 2;

  FilterTriState(super.name, [super.state = stateIgnore]);

  bool isIgnored() => state == stateIgnore;
  bool isIncluded() => state == stateInclude;
  bool isExcluded() => state == stateExclude;
}

abstract class FilterGroup<V> extends Filter<List<V>> {
  FilterGroup(super.name, super.state);
}

abstract class FilterSort extends Filter<FilterSortSelection?> {
  final List<String> values;

  FilterSort(String name, this.values, [FilterSortSelection? state]) : super(name, state);
}

@freezed
class FilterSortSelection with _$FilterSortSelection {
  const factory FilterSortSelection({
    required int index,
    required bool ascending,
  }) = _FilterSortSelection;
}
