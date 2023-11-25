// ignore_for_file: type=lint
import 'package:drift/drift.dart' as i0;
import 'package:drift/internal/modular.dart' as i1;

class LibraryViewDrift extends i1.ModularAccessor {
  LibraryViewDrift(i0.GeneratedDatabase db) : super(db);
  i0.Selectable<LibraryResult> library() {
    return customSelect('SELECT * FROM libraryView',
        variables: [], readsFrom: {}).map((i0.QueryRow row) => LibraryResult());
  }
}
