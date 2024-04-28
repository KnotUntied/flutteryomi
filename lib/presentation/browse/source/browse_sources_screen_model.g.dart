// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'browse_sources_screen_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$browseSourcesScreenModelHash() =>
    r'4d7f50e02d9638a57a80b27355cdd5b605e44ca2';

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

abstract class _$BrowseSourcesScreenModel
    extends BuildlessAutoDisposeStreamNotifier<BrowseSourcesScreenState> {
  late final int sourceId;

  Stream<BrowseSourcesScreenState> build(
    int sourceId,
  );
}

/// See also [BrowseSourcesScreenModel].
@ProviderFor(BrowseSourcesScreenModel)
const browseSourcesScreenModelProvider = BrowseSourcesScreenModelFamily();

/// See also [BrowseSourcesScreenModel].
class BrowseSourcesScreenModelFamily
    extends Family<AsyncValue<BrowseSourcesScreenState>> {
  /// See also [BrowseSourcesScreenModel].
  const BrowseSourcesScreenModelFamily();

  /// See also [BrowseSourcesScreenModel].
  BrowseSourcesScreenModelProvider call(
    int sourceId,
  ) {
    return BrowseSourcesScreenModelProvider(
      sourceId,
    );
  }

  @override
  BrowseSourcesScreenModelProvider getProviderOverride(
    covariant BrowseSourcesScreenModelProvider provider,
  ) {
    return call(
      provider.sourceId,
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
  String? get name => r'browseSourcesScreenModelProvider';
}

/// See also [BrowseSourcesScreenModel].
class BrowseSourcesScreenModelProvider
    extends AutoDisposeStreamNotifierProviderImpl<BrowseSourcesScreenModel,
        BrowseSourcesScreenState> {
  /// See also [BrowseSourcesScreenModel].
  BrowseSourcesScreenModelProvider(
    int sourceId,
  ) : this._internal(
          () => BrowseSourcesScreenModel()..sourceId = sourceId,
          from: browseSourcesScreenModelProvider,
          name: r'browseSourcesScreenModelProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$browseSourcesScreenModelHash,
          dependencies: BrowseSourcesScreenModelFamily._dependencies,
          allTransitiveDependencies:
              BrowseSourcesScreenModelFamily._allTransitiveDependencies,
          sourceId: sourceId,
        );

  BrowseSourcesScreenModelProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.sourceId,
  }) : super.internal();

  final int sourceId;

  @override
  Stream<BrowseSourcesScreenState> runNotifierBuild(
    covariant BrowseSourcesScreenModel notifier,
  ) {
    return notifier.build(
      sourceId,
    );
  }

  @override
  Override overrideWith(BrowseSourcesScreenModel Function() create) {
    return ProviderOverride(
      origin: this,
      override: BrowseSourcesScreenModelProvider._internal(
        () => create()..sourceId = sourceId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        sourceId: sourceId,
      ),
    );
  }

  @override
  AutoDisposeStreamNotifierProviderElement<BrowseSourcesScreenModel,
      BrowseSourcesScreenState> createElement() {
    return _BrowseSourcesScreenModelProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is BrowseSourcesScreenModelProvider &&
        other.sourceId == sourceId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, sourceId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin BrowseSourcesScreenModelRef
    on AutoDisposeStreamNotifierProviderRef<BrowseSourcesScreenState> {
  /// The parameter `sourceId` of this provider.
  int get sourceId;
}

class _BrowseSourcesScreenModelProviderElement
    extends AutoDisposeStreamNotifierProviderElement<BrowseSourcesScreenModel,
        BrowseSourcesScreenState> with BrowseSourcesScreenModelRef {
  _BrowseSourcesScreenModelProviderElement(super.provider);

  @override
  int get sourceId => (origin as BrowseSourcesScreenModelProvider).sourceId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
