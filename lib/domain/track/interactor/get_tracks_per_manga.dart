import 'package:collection/collection.dart';

import 'package:flutteryomi/data/drift/data/manga_sync.drift.dart';
import 'package:flutteryomi/domain/track/repository/track_repository.dart';

class GetTracksPerManga {
  GetTracksPerManga(this.repository);
  final TrackRepository repository;

  Stream<Map<int, List<MangaSyncData>>> subscribe(int mangaId) => repository
      .getTracksAsStream()
      .map((tracks) => groupBy(tracks, (it) => it.mangaId));
}
