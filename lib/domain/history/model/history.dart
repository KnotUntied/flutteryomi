import 'package:flutteryomi/data/drift/data/history.drift.dart' as drift;

// Drift already generates convenient classes
// Typedef here so dependents will depend on domain instead of data
typedef History = drift.HistoryData;

extension HistoryUtils on History {
  static History create() => const History(
        id: -1,
        chapterId: -1,
        readAt: null,
        readDuration: -1,
      );
}
