import 'package:collection/collection.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:rxdart/rxdart.dart';

import 'package:flutteryomi/core/util/system/logger.dart';
import 'package:flutteryomi/domain/download/download_manager.dart';
import 'package:flutteryomi/domain/extension/extension_manager.dart';
import 'package:flutteryomi/domain/source/model/stub_source.dart';
import 'package:flutteryomi/domain/source/repository/stub_source_repository.dart';
import 'package:flutteryomi/domain/source/service/source_manager.dart';
import 'package:flutteryomi/source/api/catalogue_source.dart';
import 'package:flutteryomi/source/api/online/http_source.dart';
import 'package:flutteryomi/source/api/source.dart';
import 'package:flutteryomi/source/local/image/local_cover_manager.dart';
import 'package:flutteryomi/source/local/io/local_source_file_system.dart';
import 'package:flutteryomi/source/local/local_source.dart';

part 'common_source_manager.g.dart';

//TODO
@riverpod
class CommonSourceManager extends _$CommonSourceManager
    implements SourceManager {
  @override
  void build() {
    // TODO: implement build
    final extensionManager = ref.watch(extensionManagerProvider);
    final sourceRepository = ref.watch(stubSourceRepositoryProvider);

    extensionManager
        .installedExtensionsStream
        .map((extensions) {
          final mutableMap = <int, Source>{
            LocalSource.localSourceId: LocalSource(
              ref: ref,
              fileSystem: ref.read(localSourceFileSystemProvider),
              coverManager: ref.read(localCoverManagerProvider),
              logger: ref.read(loggerProvider),
            ),
          };
          for (final extension in extensions) {
            for (final source in extension.sources) {
              mutableMap[source.id] = source;
              _registerStubSource(StubSource.from(source));
            }
          }
          _sourcesMapStream.add(mutableMap);
        });

    sourceRepository.subscribeAll().map((sources) {
      for (final source in sources) {
        _stubSourcesMap[source.id] = source;
      }
    });
  }

  final _sourcesMapStream = BehaviorSubject<Map<int, Source>>();

  final _stubSourcesMap = <int, StubSource>{};

  // Not sure if this will be detrimental in the future
  @override
  late Stream<List<CatalogueSource>> catalogueSources = _sourcesMapStream
      .map((it) => it.values.whereType<CatalogueSource>().toList());

  @override
  Source? get(int sourceKey) => _sourcesMapStream.value[sourceKey];

  // Dart has no runBlocking or async-to-sync >:(
  //@override
  //Source getOrStub(int sourceKey) => _sourcesMapStream.value[sourceKey]
  //    ?? _stubSourcesMap.putIfAbsent(
  //      sourceKey,
  //      () => _createStubSource(sourceKey),
  //    );
  @override
  Future<Source> getOrStub(int sourceKey) async {
    final source = _sourcesMapStream.value[sourceKey];
    if (source != null) {
      return source;
    } else {
      final stubSource = _stubSourcesMap[sourceKey];
      if (stubSource != null) {
        return stubSource;
      } else {
        final newStubSource = await _createStubSource(sourceKey);
        _stubSourcesMap[sourceKey] = newStubSource;
        return newStubSource;
      }
    }
  }

  @override
  List<HttpSource> getOnlineSources() =>
      _sourcesMapStream.value.values.whereType<HttpSource>().toList();

  @override
  List<CatalogueSource> getCatalogueSources() =>
      _sourcesMapStream.value.values.whereType<CatalogueSource>().toList();

  @override
  List<StubSource> getStubSources() {
    final onlineSourceIds = getOnlineSources().map((it) => it.id);
    return _stubSourcesMap.values
        .whereNot((it) => onlineSourceIds.contains(it.id))
        .toList();
  }

  void _registerStubSource(StubSource source) async {
    final downloadManager = ref.watch(downloadManagerProvider);
    final sourceRepository = ref.watch(stubSourceRepositoryProvider);
    final dbSource = await sourceRepository.getStubSource(source.id);
    if (dbSource == source) return;
    await sourceRepository.upsertStubSource(source.id, source.lang, source.name);
    if (dbSource != null) downloadManager.renameSource(dbSource, source);
  }

  Future<StubSource> _createStubSource(int id) async {
    //TODO
    final extensionManager = ref.watch(extensionManagerProvider);
    final sourceRepository = ref.watch(stubSourceRepositoryProvider);
    final stubSource = await sourceRepository.getStubSource(id);
    if (stubSource != null) return stubSource;
    final sourceData = extensionManager.getSourceData(id);
    if (sourceData != null) {
      _registerStubSource(sourceData);
      return sourceData;
    }
    return StubSource(id: id, lang: "", name: "");
  }
}
