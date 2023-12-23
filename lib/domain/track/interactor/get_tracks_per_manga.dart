import 'package:collection/collection.dart';

import 'package:flutteryomi/domain/track/model/track.dart';
import 'package:flutteryomi/domain/track/repository/track_repository.dart';

class GetTracksPerManga {
  GetTracksPerManga(this.repository);
  final TrackRepository repository;

  Stream<Map<int, List<Track>>> subscribe(int mangaId) => repository
      .getTracksAsStream()
      .map((tracks) => groupBy(tracks, (it) => it.mangaId));
}
