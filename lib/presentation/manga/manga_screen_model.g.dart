// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'manga_screen_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$mangaScreenModelHash() => r'f71d6743960c7d047debbd9b4ab1984dffc7084f';

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

abstract class _$MangaScreenModel
    extends BuildlessAutoDisposeStreamNotifier<MangaScreenState> {
  late final int mangaId;
  late final bool isFromSource;

  Stream<MangaScreenState> build({
    required int mangaId,
    required bool isFromSource,
  });
}

/// See also [MangaScreenModel].
@ProviderFor(MangaScreenModel)
const mangaScreenModelProvider = MangaScreenModelFamily();

/// See also [MangaScreenModel].
class MangaScreenModelFamily extends Family<AsyncValue<MangaScreenState>> {
  /// See also [MangaScreenModel].
  const MangaScreenModelFamily();

  /// See also [MangaScreenModel].
  MangaScreenModelProvider call({
    required int mangaId,
    required bool isFromSource,
  }) {
    return MangaScreenModelProvider(
      mangaId: mangaId,
      isFromSource: isFromSource,
    );
  }

  @override
  MangaScreenModelProvider getProviderOverride(
    covariant MangaScreenModelProvider provider,
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
  String? get name => r'mangaScreenModelProvider';
}

/// See also [MangaScreenModel].
class MangaScreenModelProvider extends AutoDisposeStreamNotifierProviderImpl<
    MangaScreenModel, MangaScreenState> {
  /// See also [MangaScreenModel].
  MangaScreenModelProvider({
    required int mangaId,
    required bool isFromSource,
  }) : this._internal(
          () => MangaScreenModel()
            ..mangaId = mangaId
            ..isFromSource = isFromSource,
          from: mangaScreenModelProvider,
          name: r'mangaScreenModelProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$mangaScreenModelHash,
          dependencies: MangaScreenModelFamily._dependencies,
          allTransitiveDependencies:
              MangaScreenModelFamily._allTransitiveDependencies,
          mangaId: mangaId,
          isFromSource: isFromSource,
        );

  MangaScreenModelProvider._internal(
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
  Stream<MangaScreenState> runNotifierBuild(
    covariant MangaScreenModel notifier,
  ) {
    return notifier.build(
      mangaId: mangaId,
      isFromSource: isFromSource,
    );
  }

  @override
  Override overrideWith(MangaScreenModel Function() create) {
    return ProviderOverride(
      origin: this,
      override: MangaScreenModelProvider._internal(
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
  AutoDisposeStreamNotifierProviderElement<MangaScreenModel, MangaScreenState>
      createElement() {
    return _MangaScreenModelProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is MangaScreenModelProvider &&
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

mixin MangaScreenModelRef
    on AutoDisposeStreamNotifierProviderRef<MangaScreenState> {
  /// The parameter `mangaId` of this provider.
  int get mangaId;

  /// The parameter `isFromSource` of this provider.
  bool get isFromSource;
}

class _MangaScreenModelProviderElement
    extends AutoDisposeStreamNotifierProviderElement<MangaScreenModel,
        MangaScreenState> with MangaScreenModelRef {
  _MangaScreenModelProviderElement(super.provider);

  @override
  int get mangaId => (origin as MangaScreenModelProvider).mangaId;
  @override
  bool get isFromSource => (origin as MangaScreenModelProvider).isFromSource;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
