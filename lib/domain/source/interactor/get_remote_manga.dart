import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:flutteryomi/domain/source/model/filter_list.dart';
import 'package:flutteryomi/domain/source/repository/source_repository.dart';

part 'get_remote_manga.g.dart';

class GetRemoteManga {
  final SourceRepository repository;
  GetRemoteManga({
    required this.repository,
  });

  SourcePagingSourceType subscribe(int sourceId, String query, FilterList filterList) => switch (query) {
        queryPopular => repository.getPopular(sourceId),
        queryLatest => repository.getLatest(sourceId),
        _ => repository.search(sourceId, query, filterList),
      };

  // Probably secret magic queries for the search bar, I don't know
  static const queryPopular = "eu.kanade.domain.source.interactor.POPULAR";
  static const queryLatest = "eu.kanade.domain.source.interactor.LATEST";
}

@riverpod
GetRemoteManga getRemoteManga(GetRemoteMangaRef ref) =>
    GetRemoteManga(
      repository: ref.watch(sourceRepositoryProvider),
    );
