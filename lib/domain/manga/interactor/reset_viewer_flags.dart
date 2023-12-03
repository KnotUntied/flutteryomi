import 'package:flutteryomi/domain/manga/repository/manga_repository.dart';

class ResetViewerFlags {
  final MangaRepository repository;
  ResetViewerFlags(this.repository);

  Future<bool> await_() async => await repository.resetViewerFlags();
}
