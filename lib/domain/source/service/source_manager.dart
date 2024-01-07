import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'source_manager.g.dart';

// TODO
abstract interface class SourceManager {
  //Stream<List<CatalogueSource>> catalogueSources;
  //Source? get(int sourceKey);
  //Source getOrStub(int sourceKey);
  //List<HttpSource> getOnlineSources();
  //List<CatalogueSource> getCatalogueSources();
  //List<StubSource> getStubSources();
}

// Override this in the main method
@riverpod
SourceManager sourceManager(SourceManagerRef ref) =>
    throw UnimplementedError();
