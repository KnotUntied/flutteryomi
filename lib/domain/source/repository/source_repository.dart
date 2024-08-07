import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:flutteryomi/domain/source/model/domain_source.dart';
import 'package:flutteryomi/domain/source/model/filter_list.dart';
import 'package:flutteryomi/domain/source/model/source_with_count.dart';

part 'source_repository.g.dart';

//TODO: Find equivalent or replacement for AndroidX PagingSource
//typedef SourcePagingSourceType = PagingSource<int, SManga>;
//Currently stub with Object
//Check dart:ffi
typedef SourcePagingSourceType = Object;

//TODO
abstract interface class SourceRepository {
  Stream<List<Source>> getSources();
  Stream<List<Source>> getOnlineSources();
  Stream<List<(Source, int)>> getSourcesWithFavoriteCount();
  Stream<List<SourceWithCount>> getSourcesWithNonLibraryManga();
  SourcePagingSourceType search(int sourceId, String query, FilterList filterList);
  SourcePagingSourceType getPopular(int sourceId);
  SourcePagingSourceType getLatest(int sourceId);
}

// Override this in the main method
@riverpod
SourceRepository sourceRepository(SourceRepositoryRef ref) =>
    throw UnimplementedError();
