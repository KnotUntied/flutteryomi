import 'package:logger/logger.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:flutteryomi/core/util/system/logger.dart';
import 'package:flutteryomi/domain/manga/model/manga.dart';
import 'package:flutteryomi/domain/manga/repository/manga_repository.dart';

part 'get_manga.g.dart';

class GetManga {
  final MangaRepository repository;
  final Logger logger;
  GetManga(this.repository, this.logger);

  Future<Manga?> await_(int id) async {
    try {
      return await repository.getMangaById(id);
    } catch (e) {
      logger.e(e);
      return null;
    }
  }

  Stream<Manga> subscribe(int id) => repository.getMangaByIdAsStream(id);
}

@riverpod
GetManga getManga(GetMangaRef ref) =>
    GetManga(ref.watch(mangaRepositoryProvider), ref.watch(loggerProvider));
