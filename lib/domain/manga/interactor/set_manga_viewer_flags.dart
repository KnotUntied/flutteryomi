import 'package:drift/drift.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:flutteryomi/domain/manga/model/manga.dart';
import 'package:flutteryomi/domain/manga/model/manga_update.dart';
import 'package:flutteryomi/domain/manga/repository/manga_repository.dart';
import 'package:flutteryomi/domain/reader/setting/reader_orientation.dart';
import 'package:flutteryomi/domain/reader/setting/reading_mode.dart';

part 'set_manga_viewer_flags.g.dart';

class SetMangaViewerFlags {
  final MangaRepository repository;
  SetMangaViewerFlags(this.repository);

  Future<void> awaitSetReadingMode(int id, int flag) async {
    Manga manga = await repository.getMangaById(id);
    await repository.update(
      MangaUpdate(
        id: Value(manga.id),
        viewerFlags: Value(
          manga.viewerFlags.setFlag(flag, ReadingMode.mask),
        ),
      ),
    );
  }

  Future<void> awaitSetOrientation(int id, int flag) async {
    Manga manga = await repository.getMangaById(id);
    await repository.update(
      MangaUpdate(
        id: Value(manga.id),
        viewerFlags: Value(
          manga.viewerFlags.setFlag(flag, ReaderOrientation.mask),
        ),
      ),
    );
  }
}

@riverpod
SetMangaViewerFlags setMangaViewerFlags(SetMangaViewerFlagsRef ref) =>
    SetMangaViewerFlags(ref.watch(mangaRepositoryProvider));

extension _SetFlag on int {
  int setFlag(int flag, int mask) => this & ~mask | (flag & mask);
}
