import 'package:flutteryomi/core/preference/tri_state.dart';

bool applyFilter(TriState filter, bool Function() predicate) => switch (filter) {
  TriState.disabled => true,
  TriState.enabledIs => predicate(),
  TriState.enabledNot => !predicate(),
};
