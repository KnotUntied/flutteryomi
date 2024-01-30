import 'package:collection/collection.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:flutteryomi/domain/track/model/track.dart';
import 'package:flutteryomi/domain/track/repository/track_repository.dart';

part 'get_tracks_per_manga.g.dart';

class GetTracksPerManga {
  GetTracksPerManga(this.repository);
  final TrackRepository repository;

  Stream<Map<int, List<Track>>> subscribe() => repository
      .getTracksAsStream()
      .map((tracks) => groupBy(tracks, (it) => it.mangaId));
}

@riverpod
GetTracksPerManga getTracksPerManga(GetTracksPerMangaRef ref) =>
    GetTracksPerManga(ref.watch(trackRepositoryProvider));
