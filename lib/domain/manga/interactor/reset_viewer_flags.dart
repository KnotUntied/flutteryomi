import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:flutteryomi/domain/manga/repository/manga_repository.dart';

part 'reset_viewer_flags.g.dart';

class ResetViewerFlags {
  final MangaRepository repository;
  ResetViewerFlags(this.repository);

  Future<bool> await_() => repository.resetViewerFlags();
}

@riverpod
ResetViewerFlags resetViewerFlags(ResetViewerFlagsRef ref) =>
    ResetViewerFlags(ref.watch(mangaRepositoryProvider));
