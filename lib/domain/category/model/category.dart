import 'package:flutteryomi/data/drift/data/categories.drift.dart' as drift;

// Drift already generates convenient classes
// Typedef here so dependents will depend on domain instead of data
typedef Category = drift.Category;

extension CategoryUtils on Category {
  bool get isSystemCategory => id == uncategorizedId;
  static const uncategorizedId = 0;
}
