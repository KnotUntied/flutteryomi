import 'package:dartx/dartx.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:flutteryomi/domain/chapter/repository/chapter_repository.dart';

part 'get_available_scanlators.g.dart';

class GetAvailableScanlators {
  final ChapterRepository repository;

  GetAvailableScanlators(this.repository);

  Future<Set<String>> await_(int mangaId) async {
    final scanlators = await repository.getScanlatorsByMangaId(mangaId);
    return scanlators.cleanupAvailableScanlators();
  }

  Stream<Set<String>> subscribe(int mangaId) => repository
      .getScanlatorsByMangaIdAsStream(mangaId)
      .map((it) => it.cleanupAvailableScanlators());
}

extension _CleanupAvailableScanlators on List<String> {
  Set<String> cleanupAvailableScanlators() =>
      mapNotNull((it) => it.isBlank ? null : it).toSet();
}

@riverpod
GetAvailableScanlators getAvailableScanlators(GetAvailableScanlatorsRef ref) =>
    GetAvailableScanlators(ref.watch(chapterRepositoryProvider));
