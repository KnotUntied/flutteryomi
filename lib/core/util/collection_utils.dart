import 'dart:collection';

extension IterableInsertSeparators<T> on Iterable<T> {
  Iterable<R> insertSeparators<R>(R? Function(T?, T?) generator) {
    if (isEmpty) return [];
    final List<R> newList = [];
    for (int i = -1; i <= length - 1; i++) {
      final T? before = elementAtOrNull(i);
      if (before != null) newList.add(before as R);
      final T? after = elementAtOrNull(i + 1);
      final R? separator = generator(before, after);
      if (separator != null) newList.add(separator);
    }
    return newList;
  }
}

extension ListInsertSeparators<T> on List<T> {
  List<R> insertSeparators<R>(R? Function(T?, T?) generator) {
    if (isEmpty) return [];
    final newList = <R>[];
    for (int i = -1; i <= length - 1; i++) {
      final T? before = elementAtOrNull(i);
      if (before != null) newList.add(before as R);
      final T? after = elementAtOrNull(i + 1);
      final R? separator = generator(before, after);
      if (separator != null) newList.add(separator);
    }
    return newList;
  }
}

extension SetAddOrRemove<T> on Set<T> {
  void addOrRemove(T value, bool shouldAdd) {
    if (shouldAdd) {
      add(value);
    } else {
      remove(value);
    }
  }
}

extension HashSetAddOrRemove<T> on HashSet<T> {
  void addOrRemove(T value, bool shouldAdd) {
    if (shouldAdd) {
      add(value);
    } else {
      remove(value);
    }
  }
}
