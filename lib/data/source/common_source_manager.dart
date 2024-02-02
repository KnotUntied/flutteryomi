import 'package:flutteryomi/domain/source/model/source.dart';
import 'package:flutteryomi/domain/source/model/stub_source.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:flutteryomi/domain/source/service/source_manager.dart';

part 'common_source_manager.g.dart';

//TODO
class CommonSourceManager implements SourceManager {
  CommonSourceManager();
  @override
  Source? get(int sourceKey) {
    // TODO: implement get
    return null;
  }

  @override
  Source getOrStub(int sourceKey) {
    // TODO: implement getOrStub
    return const Source(id: -1, lang: '', name: '', supportsLatest: false, isStub: false);
  }

  @override
  List<StubSource> getStubSources() {
    // TODO: implement getStubSources
    return const [];
  }

}

@riverpod
SourceManager commonSourceManager(CommonSourceManagerRef ref) =>
    CommonSourceManager();
