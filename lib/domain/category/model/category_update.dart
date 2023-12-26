import 'package:flutteryomi/data/drift/data/categories.drift.dart' as drift;

// Drift already generates convenient classes
// Typedef here so dependents will depend on domain instead of data
typedef CategoryUpdate = drift.CategoriesCompanion;
