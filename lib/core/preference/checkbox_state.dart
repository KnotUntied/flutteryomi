abstract class CheckboxState<T> {
  T value;
  CheckboxState(this.value);
  CheckboxState<T> next();
}

class CheckboxRegularState<T> extends CheckboxState<T> {
  CheckboxRegularState(super.value);

  bool get isChecked => this is CheckboxRegularStateChecked<T>;

  @override
  CheckboxState<T> next() {
    if (this is CheckboxRegularStateChecked<T>) {
      return CheckboxRegularStateNone<T>(value);
    } else if (this is CheckboxRegularStateNone<T>) {
      return CheckboxRegularStateChecked<T>(value);
    } else {
      throw Exception("Invalid state");
    }
  }
}

class CheckboxRegularStateChecked<T> extends CheckboxRegularState<T> {
  CheckboxRegularStateChecked(super.value);
}

class CheckboxRegularStateNone<T> extends CheckboxRegularState<T> {
  CheckboxRegularStateNone(super.value);
}

class CheckboxTriState<T> extends CheckboxState<T> {
  CheckboxTriState(super.value);

  @override
  CheckboxState<T> next() {
    if (this is CheckboxTriStateExclude<T>) {
      return CheckboxTriStateNone<T>(value);
    } else if (this is CheckboxTriStateInclude<T>) {
      return CheckboxTriStateExclude<T>(value);
    } else if (this is CheckboxTriStateNone<T>) {
      return CheckboxTriStateInclude<T>(value);
    } else {
      throw Exception("Invalid state");
    }
  }
}

class CheckboxTriStateInclude<T> extends CheckboxTriState<T> {
  CheckboxTriStateInclude(super.value);
}

class CheckboxTriStateExclude<T> extends CheckboxTriState<T> {
  CheckboxTriStateExclude(super.value);
}

class CheckboxTriStateNone<T> extends CheckboxTriState<T> {
  CheckboxTriStateNone(super.value);
}

extension GenericAsCheckboxState<T> on T {
  CheckboxRegularState<T> asCheckboxState(bool Function(T) condition) =>
      condition(this)
          ? CheckboxRegularStateChecked<T>(this)
          : CheckboxRegularStateNone<T>(this);
}
