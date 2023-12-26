import 'package:flutteryomi/data/drift/data/mangas.drift.dart' as drift;
import 'package:flutteryomi/domain/manga/model/manga.dart';

// Drift already generates convenient classes
// Typedef here so dependents will depend on domain instead of data
typedef MangaUpdate = drift.MangasCompanion;

extension MangaUpdateUtils on Manga {
  MangaUpdate toMangaUpdate() => toCompanion(false);
}
