import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:flutteryomi/domain/source/model/stub_source.dart';
import 'package:flutteryomi/source/api/catalogue_source.dart';
import 'package:flutteryomi/source/api/online/http_source.dart';
import 'package:flutteryomi/source/api/source.dart';

part 'source_manager.g.dart';

abstract interface class SourceManager {
  late Stream<List<CatalogueSource>> catalogueSources;
  Source? get(int sourceKey);
  // Dart has no runBlocking >:(
  //Source getOrStub(int sourceKey);
  Future<Source> getOrStub(int sourceKey);
  List<HttpSource> getOnlineSources();
  List<CatalogueSource> getCatalogueSources();
  List<StubSource> getStubSources();
}

// Override this in the main method
@riverpod
SourceManager sourceManager(SourceManagerRef ref) =>
    throw UnimplementedError();
