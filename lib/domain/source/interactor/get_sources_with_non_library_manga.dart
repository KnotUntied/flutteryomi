import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:flutteryomi/domain/source/model/source_with_count.dart';
import 'package:flutteryomi/domain/source/repository/source_repository.dart';

part 'get_sources_with_non_library_manga.g.dart';

class GetSourcesWithNonLibraryManga {
  final SourceRepository repository;
  GetSourcesWithNonLibraryManga(this.repository);

  Stream<List<SourceWithCount>> subscribe() => repository.getSourcesWithNonLibraryManga();
}

@riverpod
GetSourcesWithNonLibraryManga getSourcesWithNonLibraryManga(GetSourcesWithNonLibraryMangaRef ref) =>
    GetSourcesWithNonLibraryManga(ref.watch(sourceRepositoryProvider));
