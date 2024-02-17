import 'package:freezed_annotation/freezed_annotation.dart';

part 'checkbox_state.freezed.dart';

sealed class CheckboxState<T> {
  final T value;
  const CheckboxState(this.value);
  CheckboxState<T> next();
}

@freezed
sealed class CheckboxRegularState<T>
    with _$CheckboxRegularState<T>
    implements CheckboxState<T> {
  const CheckboxRegularState._();
  const factory CheckboxRegularState.checked(T value) =
      CheckboxRegularStateChecked;
  const factory CheckboxRegularState.none(T value) = CheckboxRegularStateNone;

  bool get isChecked => this is CheckboxRegularStateChecked<T>;

  @override
  CheckboxState<T> next() => switch (this) {
        CheckboxRegularStateChecked<T>() => CheckboxRegularStateNone<T>(value),
        CheckboxRegularStateNone<T>() => CheckboxRegularStateChecked<T>(value),
      };
}

@freezed
sealed class CheckboxTriState<T>
    with _$CheckboxTriState<T>
    implements CheckboxState<T> {
  const CheckboxTriState._();
  const factory CheckboxTriState.include(T value) = CheckboxTriStateInclude;
  const factory CheckboxTriState.exclude(T value) = CheckboxTriStateExclude;
  const factory CheckboxTriState.none(T value) = CheckboxTriStateNone;

  @override
  CheckboxState<T> next() => switch (this) {
        CheckboxTriStateExclude<T>() => CheckboxTriStateNone<T>(value),
        CheckboxTriStateInclude<T>() => CheckboxTriStateExclude<T>(value),
        CheckboxTriStateNone<T>() => CheckboxTriStateInclude<T>(value),
      };

  bool? asBool() => switch (this) {
        CheckboxTriStateExclude<T>() => null,
        CheckboxTriStateInclude<T>() => true,
        CheckboxTriStateNone<T>() => false,
      };
}

extension GenericAsCheckboxState<T> on T {
  CheckboxRegularState<T> asCheckboxState(bool Function(T) condition) =>
      condition(this)
          ? CheckboxRegularStateChecked<T>(this)
          : CheckboxRegularStateNone<T>(this);
}

extension GenericMapAsCheckboxState<T> on Iterable<T> {
  Iterable<CheckboxRegularState<T>> mapAsCheckboxState(
    bool Function(T) condition,
  ) =>
      map((it) => it.asCheckboxState(condition));
}

extension ListMapAsCheckboxState<T> on List<T> {
  Iterable<CheckboxRegularState<T>> mapAsCheckboxState(
    bool Function(T) condition,
  ) =>
      map((it) => it.asCheckboxState(condition));
}
