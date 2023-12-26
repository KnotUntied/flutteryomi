import 'package:flutteryomi/data/drift/data/manga_sync.drift.dart' as drift;

// Drift already generates convenient classes
// Typedef here so dependents will depend on domain instead of data
typedef Track = drift.MangaSyncData;
