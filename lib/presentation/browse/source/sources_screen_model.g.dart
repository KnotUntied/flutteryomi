// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sources_screen_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$sourcesScreenModelHash() =>
    r'9dd8a37a030cf233ee520f4c19f64221b5534170';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

abstract class _$SourcesScreenModel
    extends BuildlessAutoDisposeStreamNotifier<SourcesScreenState> {
  late final int mangaId;
  late final bool isFromSource;

  Stream<SourcesScreenState> build({
    required int mangaId,
    required bool isFromSource,
  });
}

/// See also [SourcesScreenModel].
@ProviderFor(SourcesScreenModel)
const sourcesScreenModelProvider = SourcesScreenModelFamily();

/// See also [SourcesScreenModel].
class SourcesScreenModelFamily extends Family<AsyncValue<SourcesScreenState>> {
  /// See also [SourcesScreenModel].
  const SourcesScreenModelFamily();

  /// See also [SourcesScreenModel].
  SourcesScreenModelProvider call({
    required int mangaId,
    required bool isFromSource,
  }) {
    return SourcesScreenModelProvider(
      mangaId: mangaId,
      isFromSource: isFromSource,
    );
  }

  @override
  SourcesScreenModelProvider getProviderOverride(
    covariant SourcesScreenModelProvider provider,
  ) {
    return call(
      mangaId: provider.mangaId,
      isFromSource: provider.isFromSource,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'sourcesScreenModelProvider';
}

/// See also [SourcesScreenModel].
class SourcesScreenModelProvider extends AutoDisposeStreamNotifierProviderImpl<
    SourcesScreenModel, SourcesScreenState> {
  /// See also [SourcesScreenModel].
  SourcesScreenModelProvider({
    required int mangaId,
    required bool isFromSource,
  }) : this._internal(
          () => SourcesScreenModel()
            ..mangaId = mangaId
            ..isFromSource = isFromSource,
          from: sourcesScreenModelProvider,
          name: r'sourcesScreenModelProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$sourcesScreenModelHash,
          dependencies: SourcesScreenModelFamily._dependencies,
          allTransitiveDependencies:
              SourcesScreenModelFamily._allTransitiveDependencies,
          mangaId: mangaId,
          isFromSource: isFromSource,
        );

  SourcesScreenModelProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.mangaId,
    required this.isFromSource,
  }) : super.internal();

  final int mangaId;
  final bool isFromSource;

  @override
  Stream<SourcesScreenState> runNotifierBuild(
    covariant SourcesScreenModel notifier,
  ) {
    return notifier.build(
      mangaId: mangaId,
      isFromSource: isFromSource,
    );
  }

  @override
  Override overrideWith(SourcesScreenModel Function() create) {
    return ProviderOverride(
      origin: this,
      override: SourcesScreenModelProvider._internal(
        () => create()
          ..mangaId = mangaId
          ..isFromSource = isFromSource,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        mangaId: mangaId,
        isFromSource: isFromSource,
      ),
    );
  }

  @override
  AutoDisposeStreamNotifierProviderElement<SourcesScreenModel,
      SourcesScreenState> createElement() {
    return _SourcesScreenModelProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SourcesScreenModelProvider &&
        other.mangaId == mangaId &&
        other.isFromSource == isFromSource;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, mangaId.hashCode);
    hash = _SystemHash.combine(hash, isFromSource.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin SourcesScreenModelRef
    on AutoDisposeStreamNotifierProviderRef<SourcesScreenState> {
  /// The parameter `mangaId` of this provider.
  int get mangaId;

  /// The parameter `isFromSource` of this provider.
  bool get isFromSource;
}

class _SourcesScreenModelProviderElement
    extends AutoDisposeStreamNotifierProviderElement<SourcesScreenModel,
        SourcesScreenState> with SourcesScreenModelRef {
  _SourcesScreenModelProviderElement(super.provider);

  @override
  int get mangaId => (origin as SourcesScreenModelProvider).mangaId;
  @override
  bool get isFromSource => (origin as SourcesScreenModelProvider).isFromSource;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
