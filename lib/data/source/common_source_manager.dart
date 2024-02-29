import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:flutteryomi/domain/source/model/stub_source.dart';
import 'package:flutteryomi/domain/source/service/source_manager.dart';
import 'package:flutteryomi/source/api/catalogue_source.dart';
import 'package:flutteryomi/source/api/online/http_source.dart';
import 'package:flutteryomi/source/api/source.dart';

part 'common_source_manager.g.dart';

//TODO
class CommonSourceManager implements SourceManager {
  @override
  Source? get(int sourceKey) {
    // TODO: implement get
    return null;
  }

  @override
  Source getOrStub(int sourceKey) {
    // TODO: implement getOrStub
    throw UnimplementedError();
  }

  @override
  List<HttpSource> getOnlineSources() {
    // TODO: implement getOnlineSources
    throw UnimplementedError();
  }

  @override
  //TODO
  late Stream<List<CatalogueSource>> catalogueSources;

  @override
  List<CatalogueSource> getCatalogueSources() {
    // TODO: implement getCatalogueSources
    throw UnimplementedError();
  }

  @override
  List<StubSource> getStubSources() {
    // TODO: implement getStubSources
    return const [];
  }

  void _registerStubSource(StubSource source) {
    //final dbSource = sourceRepository.getStubSource(source.id);
    //if (dbSource == source) return;
    //sourceRepository.upsertStubSource(source.id, source.lang, source.name);
    //if (dbSource != null) {
    //  downloadManager.renameSource(dbSource, source);
    //}
  }

  Future<StubSource> _createStubSource(int id) async {
    //sourceRepository.getStubSource(id)?.let {
    //    return it
    //}
    //extensionManager.getSourceData(id)?.let {
    //    registerStubSource(it)
    //    return it
    //}
    return StubSource(id: id, lang: "", name: "");
  }
}

@riverpod
SourceManager commonSourceManager(CommonSourceManagerRef ref) =>
    CommonSourceManager();
