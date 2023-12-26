import 'package:flutteryomi/data/drift/data/chapters.drift.dart' as drift;
import 'package:flutteryomi/domain/chapter/model/chapter.dart';

// Drift already generates convenient classes
// Typedef here so dependents will depend on domain instead of data
typedef ChapterUpdate = drift.ChaptersCompanion;

extension ChapterUpdateUtils on Chapter {
  ChapterUpdate toChapterUpdate() => toCompanion(false);
}
